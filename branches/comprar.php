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
    $cantidad = $_GET['cantidad'];
?>
<!doctype html>
<html>
<head>
    <title> Comprar </title>
    <link rel="stylesheet" type="text/css" href="../css/designcomprar.css"/>
</head>
<body>
    <div class="header">
        <h1>
            <img src="../media/images/basket-outline(1).png" class="comp" /> 
            Comprar 
        </h1>
    </div>
    <div class="tab">
        <table>
            <tr>
                <th> Nombre </th>
                <th> Descripcion </th>
                <th> Fabricante </th>
                <th> Precio </th>
                <th> Cantidad </th>
                <th> Direcci&oacute;n de Env&iacute;o </th>
                <th> Transportista </th>
                <th> Proceder al Pago </th>
            </tr>
            <?php
                $query = mysqli_query($mysqli, "select * from Productos where Codigo=$producto");
                $row = mysqli_fetch_object($query);
                echo '<tr>';
                echo '<td>';
                printf("%s", $row->Nombre);
                echo '</td>';
                echo '<td>';
                printf("%s", $row->Descripcion);
                echo '</td>';
                echo '<td>';
                printf("%s", $row->Fabricante);
                echo '</td>';
                echo '<td>';
                printf("%d€", $row->Precio);
                echo '</td>';
                echo '<td>';
                printf("%d", $cantidad);
                echo '</td>';
                echo '<td>';
                $query2 = mysqli_query($mysqli, "select * from Direccion where Cliente_Login='$username'");
                echo "<form action='efectuarCompra.php'> <select name='direccion'>";
                while ($row2 = mysqli_fetch_object($query2)) {
                    echo "<option value=$row2->idDireccion>";
                    printf("%s", $row2->Calle);
                    echo " ";
                    printf("%d", $row2->Numero);
                    echo ", ";
                    printf("%s", $row2->Ciudad);
                    echo "</option>";
                }
                echo "</select> ";
                
                echo '</td>';
                echo '<td>';
                $query3 = mysqli_query($mysqli, "select * from `Empresa de Transporte`");
                echo "<select name='transporte'>";
                while ($row3 = mysqli_fetch_object($query3)) {
                    echo "<option value='$row3->Nombre'>";
                    printf("%s", $row3->Nombre);
                    echo "</option>";
                }
                echo "</select>";
                echo '</td>';
                echo '<td>';
                echo "<input type='hidden' name='username' value=$username>
                        <input type='hidden' name='producto' value=$producto>
                        <input type='hidden' name='cantidad' value=$cantidad>
                        <button type='submit'>
                            <img src='../media/images/cart-arrow-right.png'/>
                        </button>
                     </form>";
                echo '</td>';
                echo '</tr>';
            ?>
            <tr> 
                <td colspan="8" class="relleno"> </td>
            </tr>
        </table>
    </div>
    <div>
        <br>
        <br>
        <footer>
            <ul class="ulu">
                <li class="uli">
                    <form action='dashboard.php'>
                        <input type='hidden' name='username' value=<?php echo $username?>>
                        <button class="button button1">
                            <img src="../media/images/home-circle-outline.png"  class="im" />
                            Ir al Dashboard
                        </button>
                    </form>
                </li>
                <li class="uli">
                    <form action='carrito.php'>
                        <input type='hidden' name='username' value=<?php echo $username?>>
                        <button class="button button2">
                            <img src="../media/images/cart.png" class="im" />
                            Volver al Carrito
                            </button>
                    </form>
                </li>
            </ul>
        </footer> 
    </div>
</body>
</html>
