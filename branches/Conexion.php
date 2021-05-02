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
    echo "No se ha podido conectar a la DB (" .$mysqli -> connect_errno . ")" . $mysqli -> connect_error . "<br/>";
}

#echo "Conectado" . $mysqli -> host_info . "br/";


?> 
