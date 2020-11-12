<?php

require "../project_news/connect.php";
	
	$response = array();

	$sql = mysqli_query($connect,"SELECT * FROM tbl_kamus");
  
    while ($data= mysqli_fetch_array($sql)) {
        # code...
       $a['id']=$data['id'];
        $a['isi'] = $data['isi'];
        $a['arti'] = $data['arti'];
        array_push($response, $a);
    
    }
        echo json_encode($response);
 
?>