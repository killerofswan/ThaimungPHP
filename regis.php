<?php
	$pdo = new PDO("mysql:host=127.0.0.1;dbname=thaimung;charset=utf8","root","");
	if(($_POST["password"]<>"")and($_POST["name"]<>"")and($_POST["lastname"]<>"")and($_POST["phone"]<>"")and($_POST["email"]<>"")){
		$query = "insert into Users(password,name,lastname,phone,email)VALUES('".md5($_POST["password"])."','".$_POST["name"]."','".$_POST["lastname"]."','".$_POST["phone"]."','".$_POST["email"]."')";
		$result = $pdo->prepare($query);
		$result->execute();
		
		if ($result){
			
			$query_sel = "select * from Users where email='".$_POST["email"]."'";
			$prepare1 = $pdo->query($query_sel);
			$prepare1->execute();
			$row = $prepare1->fetch();
			$query2 = "insert into Filters(id,time) values(".$row["id"].",'3 HOUR')";
			$result2 = $pdo->prepare($query2);
			$result2->execute();
			if($result2){
				$query3 = "INSERT INTO `Filter-Tags`(id,tag_id) values(".$row["id"].",0)";
				$result3 = $pdo->prepare($query3);
				$result3->execute();
				if($result3){
					echo ("Registration succesfull!");
				}
				else{
					echo ("Tag-Filter error");
				}
			}
			else{
				echo "Filter error";
			}
		}
		else {
			$q = "SELECT * FROM Users WHERE email='".$_POST["email"]."'";
			$ok = $pdo->prepare($q);
			$ok->execute();
			if($ok){
				echo ("this e-mail has already taken");
			}
			else{
				echo ("There was an error with some information");
			}
		}
	}
	else{
		echo ("Please fill all information");
	}
?>