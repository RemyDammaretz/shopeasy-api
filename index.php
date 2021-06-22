<?php
include_once("libs/maLibUtils.php");
include_once("libs/modele.php");

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: *");
header("Access-Control-Allow-Headers: *");

$data = array("version"=>1.1);

// Routes : /api/...

$method = $_SERVER["REQUEST_METHOD"];
debug("method",$method);

if ($method == "OPTIONS") die("ok - OPTIONS");

$data["success"] = false;
$data["status"] = 400; 

// Verif autorisation : il faut un hash
// Il peut être dans le header, ou dans la chaîne de requête

$connected = false; 

if (!($hash = valider("hash"))) 
	$hash = valider("HTTP_HASH","SERVER"); 

if($hash) {
	// Il y a un hash, il doit être correct...
	if ($connectedId = hash2id($hash)) $connected = true; 
	else {
		// non connecté - peut-être est-ce POST vers /autenticate...
		$method = "error";
		$data["status"] = 403;
	}
}

if (valider("request")) {
	$requestParts = explode('/',$_REQUEST["request"]);

	debug("rewrite-request" ,$_REQUEST["request"] ); 
	debug("#parts", count($requestParts) ); 

	$entite1 = false;
	$idEntite1 = false;
	$entite2 = false; 
	$idEntite2 = false; 

	if (count($requestParts) >0) {
		$entite1 = $requestParts[0];
		debug("entite1",$entite1); 
	} 

	if (count($requestParts) >1) {	
		if (is_id($requestParts[1])) {
			$idEntite1 = intval($requestParts[1]);
			debug("idEntite1",$idEntite1); 
		} else {
			// erreur !
			$method = "error";
			$data["status"] = 400; 
		}
	}

	if (count($requestParts) >2) {
		$entite2 = $requestParts[2];
		debug("entite2",$entite2); 
	}

	if (count($requestParts) >3) {
		if (is_id($requestParts[3])) {
			$idEntite2 = intval($requestParts[3]);
			debug("idEntite2",$idEntite2); 
		} else {
			// erreur !
			$method = "error";
			$data["status"] = 400;
		}

	}  

// TODO: en cas d'erreur : changer $method pour préparer un case 'erreur'

	$action = $method; 
	if ($entite1) $action .= "_$entite1";
	if ($entite2) $action .= "_$entite2";
 
	debug("action", $action);

	switch ($action) {
		case "POST_authenticate":
			if ($user = valider("user"))
			if ($password = valider("password")) {
				if ($hash = validerUser($user, $password)) {
					$data["hash"] = $hash;
					$data["user"] = getUserByPseudo($user);
					$data["success"] = true;
					$data["status"] = 202;
				} else {
					// connexion échouée
					$data["status"] = 401;
				}
			}
			break;
		case "GET_profile":
			if ($connected) {
				$data["profile"] = getUser($connectedId);
				$data["success"] = true;
				$data["status"] = 200;
			} else {
				$data["status"] = 403;
			}
			break;
		case "POST_users":
			// User creation
			if ($pseudo = valider("user"))
			if ($pass = valider("password")) {
				if ($id = mkUser($pseudo, $pass)) {
					$data["user"] = getUser($id);
					$data["success"] = true;
					$data["status"] = 201;
				} else {
					// User already exists
					$data["success"] = false;
					$data["status"] = 403;
				}
			} else {
				$data["success"] = false;
				$data["status"] = 400;
			}
			break;
		case "PUT_users":
			// Update user
			if ($connected) {
				if ($minNutriScore = valider("minNutriScorePreference"))
				if ($allergens = valider("allergens")) {
					updateUser($connectedId, $minNutriScore, $allergens);
					$data["success"] = true;
					$data["status"] = 200;
					$data["user"] = getUser($connectedId);
				} else {
					$data["success"] = false;
					$data["status"] = 400;
				}
			} else {
				$data["success"] = false;
				$data["status"] = 403;
			}
			break;
		case "GET_shops":
			if ($idEntite1) {
				$shop = getShop($idEntite1);
				if ($shop != null) {
					$data["shop"] = $shop;
					$data["success"] = true;
					$data["status"] = 200; 
				} else {
					$data["success"] = false;
					$data["status"] = 404; 
				}
			} else {
				$data["shops"] = getShops();
				$data["success"] = true;
				$data["status"] = 200; 
			}
			break;
		case "GET_shops_sections":
			if ($idEntite1) {
				if (getShop($idEntite1) != null) {
					$data["sections"] = getShopSections($idEntite1);
					$data["success"] = true;
					$data["status"] = 200; 
				} else {
					$data["success"] = false;
					$data["status"] = 404; 
				}
			} else {
				$data["success"] = false;
				$data["status"] = 400; 
			}
			break;
		case "GET_products": 
			$data["productCategories"] = getProductsCategoriesWithProducts();
			$data["success"] = true;
			$data["status"] = 200; 
			break;
		default:
			$data["success"] = false;
			$data["status"] = 404; 
			break;
	} // switch(action)
}

switch($data["status"]) {
	case 200: header("HTTP/1.0 200 OK");	break;
	case 201: header("HTTP/1.0 201 Created");	break; 
	case 202: header("HTTP/1.0 202 Accepted");	break;
	case 204: header("HTTP/1.0 204 No Content");	break;
	case 400: header("HTTP/1.0 400 Bad Request");	break; 
	case 401: header("HTTP/1.0 401 Unauthorized");	break; 
	case 403: header("HTTP/1.0 403 Forbidden");	break; 
	case 404: header("HTTP/1.0 404 Not Found");		break;
	default: header("HTTP/1.0 200 OK");
		
}

echo json_encode($data);

?>
