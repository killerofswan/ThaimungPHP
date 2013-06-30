<?php
	$pdo = new PDO("mysql:host=127.0.0.1;dbname=thaimung;charset=utf8","root","");
	
	$query = "insert into Bans(id,start_time,end_time) values($_POST["id"],'$_POST["start_time"]','DATE_ADD(now(),INTERVAL 3 DAY)')";
	$prepare1 = $pdo->prepare($query);
	$prepare1->execute();
	
	$prepare2 = $pdo->prepare("SELECT ROW_COUNT()");
	$prepare2->execute();
	$rc = $prepare2->fetchColumn();
	if($rc==1){
		echo 1;
	}
	else{
		echo 0;
	}
?>

//not done