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
    $query = mysqli_query($mysqli, "select * from Productos where Codigo=$producto");
    $row = mysqli_fetch_object($query);
    if (!empty($_GET['cantidad'])) {
        $cantidad = $_GET['cantidad'];
        $queryI = mysqli_query($mysqli, "insert into `Productos del Carrito` values($cantidad,'$username',$producto)");
        if (mysqli_affected_rows($mysqli) == 1) {
            echo "
                    <script>
                        alert('¡Se ha añadido correctamente al Carrito!');
                        var url = 'catalogo.php?username=$username&categoria=$row->Categorias_idCategoria';
                        window.location.href=url;
                    </script>
                    ";
        } else {
            echo "
                    <script>
                        alert('¡No se ha podido añadir, probablemente ya haya sido añadido!');
                        var url = 'catalogo.php?username=$username&categoria=$row->Categorias_idCategoria';
                        window.location.href=url;
                    </script>
                ";
        }
    } else {
        echo "
                <script>
                    alert('¡Tienes que introducir una cantidad válida, no puedes dejarlo en blanco!');
                    var url = 'catalogo.php?username=$username&categoria=$row->Categorias_idCategoria';
                    window.location.href=url;
                </script>
            ";
    }
?>
