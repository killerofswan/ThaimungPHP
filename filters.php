<?php
$pdo = new PDO("mysql:host=127.0.0.1;dbname=thaimung;charset=utf8","root","");
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$id = $_POST['id'];
$time = $_POST['time'];
$status = $_POST['status'];

$temp = $_POST['tag_id'];
$tag_id = explode (",", $temp); 

$query = "UPDATE Filters SET status=".$status.",time='".$time."'WHERE Filters.id = ".$id;

$prepare1 = $pdo->prepare($query);
$prepare1->execute();
$result = $prepare1->rowCount();

if($result)
{
	$query2 = "DELETE FROM `Filter-Tags` WHERE `Filter-Tags`.`id` = ".$id;
	$prepare2 = $pdo->prepare($query2);
	$prepare2->execute();
	
	$result2 = $prepare2->rowCount();
	if($result2)
	{
		foreach($tag_id as $x){
			$query3 ="INSERT INTO `Filter-Tags` ( id, tag_id) VALUES ($id,$x)";
			$prepare3 = $pdo->prepare($query3);
			$prepare3->execute();
		}	
		echo "Success";
	}
	else{
		echo "error";
		}

}
else{
	echo "error";
}
?>