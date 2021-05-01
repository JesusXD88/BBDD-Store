<?php
   include('Conexion.php');
   session_start();
   
   $user_check = $_SESSION['login_user'];
   
   $ses_sql = mysqli_query($mysqli,"select Login from Cliente where Login = '$user_check' ");
   
   $result = mysqli_fetch_array($ses_sql,MYSQLI_ASSOC);
   
   $login_session = $result['Login'];
   
   if(!isset($_SESSION['login_user'])){
      header("location:../index.php");
      die();
   }
?>
