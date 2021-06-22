<?php
include_once("maLibSQL.pdo.php"); 
// définit les fonctions SQLSelect, SQLUpdate...


// Users ///////////////////////////////////////////////////
function validerUser($pseudo, $pass){
	$SQL = "SELECT hash FROM users WHERE pseudo='$pseudo' AND pass='$pass'";
	if ($hash=SQLGetChamp($SQL))
		return $hash;
	else return false;
}

function getUser($idUser) {
	$SQL = "SELECT id, pseudo, minNutriScorePreference, allergens FROM users WHERE id='$idUser'";
	$rs = parcoursRs(SQLSelect($SQL));
	if (count($rs)) return $rs[0]; 
	else return array();
}

function getUserByPseudo($pseudo) {
	$SQL = "SELECT id, pseudo, minNutriScorePreference, allergens FROM users WHERE pseudo='$pseudo'";
	$rs = parcoursRs(SQLSelect($SQL));
	if (count($rs)) return $rs[0]; 
	else return array();
}

function mkUser($pseudo, $pass){
	$dataUser = getUserByPseudo($pseudo);
	if (count($dataUser) > 0) return false;

	$hash = mkHash($pseudo); 
	$SQL = "INSERT INTO users(pseudo,pass,hash) VALUES('$pseudo', '$pass', '$hash')";
	$idUser = SQLInsert($SQL);
	$hash = mkHash($idUser); 
	return $idUser; 
}

function mkHash($pseudo) { 
	$payload = $pseudo. date("H:i:s");
	$hash = md5($payload); 
	return $hash; 
}

function updateUser($userId, $minNutriScorePreference, $allergens) {
	$SQL = "UPDATE users SET minNutriScorePreference='$minNutriScorePreference', allergens='$allergens' WHERE id=$userId";
	SQLUpdate($SQL);
	return 1; 
}

function hash2id($hash) {
	$SQL = "SELECT id FROM users WHERE hash='$hash'";
	return SQLGetChamp($SQL); 
}

// Shops ///////////////////////////////////////////////////

function getShops(){
	$SQL = "SELECT * FROM shops";
	$array = parcoursRs(SQLSelect($SQL));
	return $array ;
}

function getShop($id){
	$SQL = "SELECT * FROM shops WHERE id='$id'";
	$rs = parcoursRs(SQLSelect($SQL));
	if (count($rs)) {
		return $rs[0];
	} else {
		return array();
	}
}


// Shops Sections ///////////////////////////////////////////////////

function getShopSections($idShop){
	$SQL = "SELECT * FROM sections WHERE idShop = '$idShop'";
	$array = parcoursRs(SQLSelect($SQL));
	for ($i = 0; $i < count($array); $i++) {
		$id = $array[$i]["id"];
		$SQL2 = "SELECT idProduct FROM `products-in-sections` WHERE idSection = '$id'";
		//$array[$i]["productList"] = parcoursRs(SQLSelect($SQL2));

		$products = parcoursRs(SQLSelect($SQL2));
		$productsList = array();
		foreach($products as $product) {
			$productsList[] = $product["idProduct"];
		}
		$array[$i]["productList"] = $productsList;

	}
	return $array ;
}


// Products //////////////////////////////////////////////////////

function getProductsCategoriesWithProducts() {
	$SQL = "SELECT * FROM `product-categories`";
	$array = parcoursRs(SQLSelect($SQL));
	for ($i = 0; $i < count($array); $i++) {
		$id = $array[$i]["id"];
		$SQL2 = "SELECT * FROM products WHERE productCategoryId = '$id'";
		$array[$i]["products"] = parcoursRs(SQLSelect($SQL2));
	}
	return $array ;
}

?>
