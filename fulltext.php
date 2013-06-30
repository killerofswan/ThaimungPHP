<?php
	$pdo = new PDO("mysql:host=127.0.0.1;dbname=thaimung;charset=utf8","root","");
	$p_id = $_POST['p_id'];
	$id = $_POST['id'];
	
	$query = " SELECT * FROM (`Posts` NATURAL JOIN `Post-Tags`
				) NATURAL JOIN `Tags` where Posts.p_id = ".$p_id;
	
	$result = $pdo->prepare($query);
	$result->execute();
	
	if($result)
			echo json_encode($result->fetchAll(PDO::FETCH_ASSOC));
	else
			echo "[]";
?>