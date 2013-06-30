<?php
	$pdo = new PDO("mysql:host=127.0.0.1;dbname=thaimung;charset=utf8","root","");

	$p_id = $_POST["p_id"];
	
	$query = "delete from `Posts` where p_id = $p_id";
	
	$result = $pdo->prepare($query);
	$result->execute();
	
	$count = $result->rowCount();
	if($count<>0){
		echo "Delete successful!";
	}
	else{
		echo "Delete failed";
	}
?>