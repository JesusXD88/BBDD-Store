<?php
                        /* Inicio del Script PHP */
                        
$host = 'localhost:3306';
$username = 'root';
$password = '';
$database = 'Practica03';

// Creamos la conexion

$mysqli = mysqli_connect($host, $username, $password, $database);

// Comprobamos la conexion

if ($mysqli -> connect_errno) {
    $con_status = "No se ha podido conectar a la DB (" .$mysqli -> connect_errno . ")" . $mysqli -> connect_error . "<br/>";
} else {
    $con_status = "Conectado con exito (". $mysqli -> host_info . ")";
}
#echo "Conectado" . $mysqli -> host_info . "br/";


?> 
