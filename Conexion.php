<?php
                        /* Inicio del Script PHP */
                        
$host = "localhost";
$username = "root";
$password = "mysql";
$database = 'Practica03';

// Creamos la conexion

$conn = mysqli_connect($host, $username, $password, $database);

// Comprobamos la conexion

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully";

?> 
