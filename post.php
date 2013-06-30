<?php
	$pdo = new PDO("mysql:host=127.0.0.1;dbname=thaimung;charset=utf8","root","");

	$sql_head = "select * from Posts where ";
	$math_pow = "pow(latitude-".$_POST["latitude"].",2)"."+pow(longtitude-".$_POST["longtitude"].",2)";
	$math_sqrt = "sqrt(".$math_pow.")";
	$sql = $sql_head.$math_sqrt."<0.005 and HOUR(TIMEDIFF(date_time, '".$_POST["date_time"]."'))<2";
	$prepare = $pdo->prepare($sql);
	$prepare->execute();
	$result = $prepare->fetchAll(PDO::FETCH_ASSOC);
	$tag_id = explode("," , $_POST["tag_id"]);
	
	if(!$result){
		$query2="insert into Posts(latitude,longtitude,date_time,id,description) VALUES(".$_POST["latitude"].",".$_POST["longtitude"].",'".$_POST["date_time"]."',".$_POST["id"].",'".$_POST["description"]."')";
		$result2 = $pdo->prepare($query2);
		$result2->execute();
		
		$prepare1 = $pdo->prepare("select max(p_id) as max_p_id from Posts");
		$prepare1->execute();
		$p_id_ins = $prepare1->fetch(PDO::FETCH_ASSOC);
		$p_max = $p_id_ins["max_p_id"];
		
		foreach($tag_id as $tagid){
			$query3="insert into `Post-Tags`(p_id,tag_id) VALUES($p_max,$tagid)";
			$status = $pdo->prepare($query3);
			$status->execute();
		}
		if($result2){
			echo "Post succesful!";
		}
		else{
			echo "Post error";
		}
	}
	
	else if($result){
		$row = $result[0];
		foreach($tag_id as $tagid){
			$query4 = "select * from `Post-Tags` where p_id = ".$row["p_id"]." and tag_id=".$tagid;
			$prepare2 = $pdo->prepare($query4);
			$prepare2->execute();
			if(!$prepare2->fetch(PDO::FETCH_ASSOC)){
				$query5 = "insert into `Post-Tags`(p_id,tag_id) values(".$row["p_id"].",$tagid)";
				$prepare3 = $pdo->prepare($query5);
				$prepare3->execute();
			}
		}
		$query_name = "select * from `Users` where id = ".$_POST["id"];
		$prepare4 = $pdo->prepare($query_name);
		$prepare4->execute();
		$result_name = $prepare4->fetch(PDO::FETCH_ASSOC);
		$description_update=$row["description"]."\n\n".$_POST["description"]."\n-".$result_name["name"]." ".$result_name["lastname"];
		$query_update = "UPDATE `Posts` SET description = '".$description_update."' where p_id = ".$row["p_id"];
		$prepare5 = $pdo->prepare($query_update);
		$prepare5->execute();
		
		echo "Post merged";
	}
?>