<?php
		$pdo = new PDO("mysql:host=192.168.0.1;dbname=team8_test;charset=utf8","team8","1234");
		$result = $pdo->query("SELECT * FROM `team8_users`");
		
		/*while($row = $result->fetch()){
			echo $row['user']."<br>";
			echo $row['password']."<br>";
			echo $row['email']."<br>";
		}*/
		
		echo json_encode($result->fetchAll(PDO::FETCH_ASSOC));
?>