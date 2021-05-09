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
    $staff = $_GET['staff'];
    $idCompra = $_GET['idCompra'];
?>
<!doctype html>
<html>
<head>
    <title> Enviar Mensajes Compra </title>
    <link rel="stylesheet" type="text/css" href="../css/designenviarmensaje.css"/>
</head>
<body>
    <div class="header">
        <h1>
            <img src="../media/images/whatsapp(1).png" class="comp" /> 
            Enviar Mensajes a una Compra 
        </h1>
    </div>
    <div class="tab">
        <table>
            <tr>
                <th> idCompra </th>
                <th colspan=5> Mensaje </th>
                <th> Enviar Mensaje </th>
            </tr>
            <?php
                echo '<tr>';
                echo '<td>';
                echo $idCompra;
                echo '<td colspan=5>';
                echo "<form action='sendMsg.php'>";
                echo "<input type='hidden' name='staff' value=$staff>";
                echo "<input type='hidden' name='idCompra' value=$idCompra>";
                echo "<input type='text' name='mensaje' class='txt'>";
                echo "</td>";
                echo "<td>";
                echo "<button type='submit' class='msg'>
                        <img src='../media/images/cart-arrow-right.png'/>
                    </button>";
                echo "</form>";
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
                    <form action='dashboardTrans.php'>
                        <input type='hidden' name='staff' value=<?php echo $staff?>>
                        <button class="button button1">
                            <img src="../media/images/home-circle-outline.png"  class="im" />
                            Ir al Dashboard
                        </button>
                    </form>
                </li>
                <li class="uli">
                    <form action='visualizarCompras.php'>
                        <input type='hidden' name='staff' value=<?php echo $staff?>>
                        <button class="button button2">
                            <img src="../media/images/cart.png" class="im" />
                            Volver a View Compras
                            </button>
                    </form>
                </li>
            </ul>
        </footer> 
    </div>
</body>
</html>
