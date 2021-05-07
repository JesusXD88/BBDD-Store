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
?>
<!doctype html>
<html>
<head>
    <title> Mi Carrito </title>
    <link rel="stylesheet" type="text/css" href="../css/designcarrito.css"/>
</head>
<body>
    <div class="header">
        <h1> Mi Carrito </h1>
    </div>
    <div class="tab">
        <table>
            <tr>
                <th> Nombre </th>
                <th> Descripcion </th>
                <th> Fabricante </th>
                <th> Precio </th>
                <th> Cantidad </th>
                <th> Comprar </th>
                <th> Eliminar </th>
            </tr>
            <?php
                $query = mysqli_query($mysqli, "select * from `Productos del Carrito`");
                while ($row = mysqli_fetch_object($query)) {
                    $query2 = mysqli_query($mysqli, "select * from Productos where Codigo=$row->Productos_Codigo");
                    $row2 = mysqli_fetch_object($query2);
                    echo '<tr>';
                    echo '<td>';
                    printf("%s", $row2->Nombre);
                    echo '</td>';
                    echo '<td>';
                    printf("%s", $row2->Descripcion);
                    echo '</td>';
                    echo '<td>';
                    printf("%s", $row2->Fabricante);
                    echo '</td>';
                    echo '<td>';
                    printf("%d€", $row2->Precio);
                    echo '</td>';
                    echo '<td>';
                    printf("%d", $row->Cantidad);
                    echo '</td>';
                    echo '<td>';
                    echo "<form class='fr' action='comprar.php'>
                            <input type='hidden' name='username' value=$username>
                            <input type='hidden' name='producto' value=$row2->Codigo>
                            <input type='hidden' name='cantidad' value=$row->Cantidad>
                            <button type='submit'>
                                <img src='../media/images/cart-arrow-right.png'/>
                            </button>
                     </form>";
                    echo '</td>';
                    echo '<td>';
                    echo "<form class='fr' action='eliminarProdCarrito.php'>
                            <input type='hidden' name='username' value=$username>
                            <input type='hidden' name='producto' value=$row2->Codigo>
                            <button type='submit'>
                                <img src='../media/images/cart-minus.png'/>
                            </button>
                     </form>";
                    echo '</td>';
                    echo '</tr>';
                }
            ?>
            <tr>
                <th colspan="5"> Comprar / Eliminar todo --> </th>
                <td>
                    <form class='fr' action='addCarrito.php'>
                            <input type='hidden' name='username' value=$username>
                            <input type='hidden' name='producto' value=>
                            <button type='submit'>
                                <img src='../media/images/cart-arrow-right.png'/>
                            </button>
                     </form>
                </td>
            </tr>
        </table>
    </div>
</body>
</html>
