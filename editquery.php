<?php
	$pdo = new PDO("mysql:host=127.0.0.1;dbname=thaimung;charset=utf8","root","");

	$description = $_POST["description"];
	$p_id = $_POST["p_id"];
	
	$query = "update `Posts` set description = '".$_POST["description"]."' where p_id = $p_id";
	$result = $pdo->prepare($query);
	$result->execute();
	$count = $result->rowCount();
	if($count<>0){
		echo "Update successful!";
	}
	else{
		echo "Update failed";
	}
?>