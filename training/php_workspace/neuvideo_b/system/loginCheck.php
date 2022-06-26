<!-- loginCheck.php -->
<?php
session_start();
if(!isset($_SESSION["admin"]))
	header("location:index.php?msg2=您没有权限!");
?>

