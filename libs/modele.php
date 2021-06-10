<?php
include_once("maLibSQL.pdo.php"); 
// définit les fonctions SQLSelect, SQLUpdate...



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
