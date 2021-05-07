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
    include('conexion.php');
    $username = $_GET['username'];
    $producto = $_GET['producto'];
    echo $username;
    echo $producto;
    $query = mysqli_query($mysqli, "delete from `Productos del Carrito` where Cliente_Login='$username' and Productos_Codigo=$producto");
    echo mysqli_affected_rows($mysqli);
    if (mysqli_affected_rows($mysqli) == 1) {
        echo "
                <script>
                    //alert('¡Se ha añadido correctamente!');
                    var url = 'carrito.php?username=$username';
                    window.location.href=url;
                </script>
                ";
    } else {
        echo "
                <script>
                    //alert('¡No se ha podido añadir, probablemente ya haya sido añadido!');
                    var url = 'carrito.php?username=$username';
                    window.location.href=url;
                </script>
                ";
    }
?>
