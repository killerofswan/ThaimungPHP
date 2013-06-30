<?php
	$pdo = new PDO("mysql:host=127.0.0.1;dbname=thaimung;charset=utf8","root","");
	$p_id = $_POST['p_id'];
	$id = $_POST['id'];
	
	$querySolve = "SELECT count(*) From Solves where p_id = ".$p_id." AND id = ".$id;
	$querySeen = "SELECT count(*) From Seens where p_id = ".$p_id." AND id = ".$id;
	$querySpam = "SELECT count(*) From Spams where p_id = ".$p_id." AND id = ".$id;
	
	$querySolveNum = "SELECT count(*) From Solves where p_id = ".$p_id;
	$querySeenNum = "SELECT count(*) From Seens where p_id = ".$p_id;
	$querySpamNum = "SELECT count(*) From Spams where p_id = ".$p_id;
	
	$query_post_user = "select * from Posts where p_id= $p_id";
	$row = $pdo->query($query_post_user)->fetch(PDO::FETCH_ASSOC);
	$checkEditDel=false;
	$checkBan=false;
	if($id==$row["id"]){
		$checkEditDel=true;
	}
	else{
		$queryEditDel = "SELECT * From Users where status=1";
		$q=$pdo->query($queryEditDel);
		while($result = $q->fetch()){
			if($id==$result["id"]){
				$checkEditDel=true;
				$checkBan=true;
			}
		}
	}
	
	if($checkEditDel==true){
		$check4 = 1;
	}
	else{
		$check4 = 0;
	}
	
	if($checkBan==true){
		$check5 = 1;
	}
	else{
		$check5 = 0;
	}
	
	$resultSolve = $pdo->query($querySolve)->fetch();
	$check1 = ($resultSolve["count(*)"]);
	
	$resultSeen = $pdo->query($querySeen)->fetch();
	$check2 = ($resultSeen["count(*)"]);
	
	$resultSpam = $pdo->query($querySpam)->fetch();
	$check3 = ($resultSpam["count(*)"]);
	
	$resultSolveNum = $pdo->query($querySolveNum)->fetch();
	$check6 = ($resultSolveNum["count(*)"]);
	
	$resultSeenNum = $pdo->query($querySeenNum)->fetch();
	$check7 = ($resultSeenNum["count(*)"]);
	
	$resultSpamNum = $pdo->query($querySpamNum)->fetch();
	$check8 = ($resultSpamNum["count(*)"]);
	
	
	$send = $check1.",".$check2.",".$check3.",".$check4.",".$check5.",".$check6.",".$check7.",".$check8;
	echo $send;
?>