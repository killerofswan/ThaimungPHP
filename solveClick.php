<?php
	$pdo = new PDO("mysql:host=127.0.0.1;dbname=thaimung;charset=utf8","root","");
	$query = "insert into Solves(p_id,id) values(".$_POST["p_id"].",".$_POST["id"].")";

	$prepare1=$pdo->prepare($query);
	$prepare1->execute();

	$rc = $pdo->query("SELECT ROW_COUNT()")->fetchColumn();
	if($rc==1){
		echo 1;
	}
	else{
		echo 0;
	}
?>