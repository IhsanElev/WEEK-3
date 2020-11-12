<?php
$connect = new mysqli("localhost","root","","news");

if($connect) {
	//echo "Conection Successfull";
} else {
	echo "Connection Failed";
	exit();
}