<?php
	//print_r($_POST);
	$latitude = $_POST['latitude'];
	$longtitude = $_POST['longtitude'];
	$u_id = $_POST['uid'];	
	
	$pdo = new PDO("mysql:host=127.0.0.1;dbname=thaimung;charset=utf8","root","");
	
	$queryFilter = "SELECT id,status,time,tag_id from Filters natural join `Filter-Tags` where id = ".$u_id;
	//echo $queryFilter;
	$tmp = $pdo->query($queryFilter);
	$i = 0;
	$tag_id = array();
	while($row = $tmp->fetch()){		
			$id = $row['id'];
			//echo "hello world";
			$status = $row['status'];
			$time =  $row['time'];
			$tag_id[$i] = $row['tag_id'];
			$i++;
	}
	
	
	$tag_list = "";
	
	if(count($tag_id) != 0){
		$tag_list = "(";
		foreach($tag_id as $list){
			$tag_list = $tag_list . "tag_id = " . $list .  " OR ";
		}
		$tag_list = substr($tag_list,0,-4) . ")";
		//echo $tag_list;
	}
	
	if($status == 2 && count($tag_id)== 1 && $tag_id[0] == 0){
			$query = "SELECT * FROM (`Posts` NATURAL JOIN `Post-Tags`
				) NATURAL JOIN `Tags` 
				WHERE DATE_SUB(now(),INTERVAL ".$time.") AND count_spam <= 10";		
	}
	else if($status == 2){
			$query = 	"SELECT * FROM (`Posts` NATURAL JOIN `Post-Tags`
				) NATURAL JOIN `Tags` 
				WHERE DATE_SUB(now(),INTERVAL ".$time.") AND ".$tag_list." AND count_spam <= 10";
	
	}
	else if((count($tag_id) == 1 && $tag_id[0] == 0)||count($tag_id) == 0){
		$query = 	"SELECT * FROM (`Posts` NATURAL JOIN `Post-Tags`
				) NATURAL JOIN `Tags` 
				WHERE  status = ".$status." AND DATE_SUB(now(),INTERVAL ".$time.") AND count_spam <= 10";
	
	}
	else{
		$query = 	"SELECT * FROM (`Posts` NATURAL JOIN `Post-Tags`
				) NATURAL JOIN `Tags` 
				WHERE status = ".$status." AND DATE_SUB(now(),INTERVAL ".$time.") AND ".$tag_list." AND count_spam <= 10";
	}
	//echo $query;
	$result = $pdo->query($query);
        
        if($result)
			echo json_encode($result->fetchAll(PDO::FETCH_ASSOC));
	else
			echo "[]";	
?>