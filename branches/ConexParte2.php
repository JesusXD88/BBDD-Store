<?php

include_once('ConexParte1.php');

$mysqli = mysqli_connect($host, $user, $password, $database);

if ($mysqli -> connect_errno) {
    echo "Cagaste we (" .$mysqli -> connect_errno . ")" . $mysqli -> connect_error . "<br/>";
}

echo "Conectado" . $mysqli -> host_info . "br/";

?>