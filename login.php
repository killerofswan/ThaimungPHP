<?php
		$pdo = new PDO("mysql:host=127.0.0.1;dbname=thaimung;charset=utf8","root","");
		//$email = $_GET['email'];
		//$pass = $_GET['password'];
		
		$email = mysql_real_escape_string($_POST['email']);
		$pass = mysql_real_escape_string($_POST['password']);
		$passMD = md5($pass);
		//print_r($passMD);
		$query = "SELECT * FROM `Users` WHERE `email` = '$email' AND `password` = '$passMD'";
		//echo $query;
		$result = $pdo->prepare($query);
		$result->execute();
		
		/*while($row = $result->fetch()){
			echo $row['user']."<br>";
			echo $row['password']."<br>";
			echo $row['email']."<br>";
		}*/
		if($result)
			echo json_encode($result->fetchAll(PDO::FETCH_ASSOC));
		else
			echo "Invalid Email Or Password";
?>