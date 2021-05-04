<!--
	BBDD-Store
    Copyright (C) 2021  JesusXD88
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
-->

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
