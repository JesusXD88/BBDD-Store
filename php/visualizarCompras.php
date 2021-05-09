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
?>
<!doctype html>
<html>
<head>
    <title> Visualizar Compras </title>
    <link rel="stylesheet" type="text/css" href="../css/designvisualizarcompras.css"/>
</head>
<body>
    <div class="header">
        <h1> 
            <img src="../media/images/cart-outline(1).png" class="car"/> 
            Visualizar Compras 
        </h1>
    </div>
    <div class="tab">
        <table>
            <tr>
                <th> idCompra </th>
                <th> Fecha Realizaci&oacute;n </th>
                <th> Cantidad </th>
                <th> Estado Actual </th>
                <th colspan=2> Establecer Estado </th>
                <th> Enviar Mensaje </th>
            </tr>
            <?php
                $query3 = mysqli_query($mysqli, "select * from `Empresa de Transporte` where Login='$staff'");
                $row3 = mysqli_fetch_object($query3);
                $empresa = $row3->Nombre;
                $query = mysqli_query($mysqli, "select * from Compras where `Empresa de Transporte_Nombre`='$empresa'");
                while ($row = mysqli_fetch_object($query)) {
                    $query2 = mysqli_query($mysqli, "select * from `Productos de la Compra` where Compras_idCompra=$row->idCompra");
                    $row2 = mysqli_fetch_object($query2);
                    echo '<tr>';
                    echo '<td>';
                    printf("%d", $row->idCompra);
                    echo '</td>';
                    echo '<td>';
                    printf("%s", $row->fechaRealizacion);
                    echo '</td>';
                    echo '<td>';
                    printf("%d", $row2->Cantidad);
                    echo '</td>';
                    echo '<td>';
                    printf("%s", $row->estadoCompra);
                    echo '</td>';
                    echo '<td>';
                    echo "<form class='sele' action='establecerEstado.php'>
                            <input type='hidden' name='staff' value=$staff>
                             <input type='hidden' name='idCompra' value=$row->idCompra>
                            <select name='estado'>";
                    $estadoC = array('enviadas','recibidas');
                    echo "<option value=$estadoC[0]>";
                    printf("%s", $estadoC[0]);
                    echo "</option>";
                    echo "<option value=$estadoC[1]>";
                    printf("%s", $estadoC[1]);
                    echo "</option>";
                    echo '</td>';
                    echo '<td>';
                    echo "
                            <button type='submit'>
                                <img src='../media/images/playlist-check.png'/>
                            </button>
                     </form>";
                    echo '</td>';
                    echo '<td>';
                    echo "<form class='msg' action='enviarMensajeCompra.php'>
                            <input type='hidden' name='staff' value=$staff>
                            <input type='hidden' name='idCompra' value=$row->idCompra>
                            <button type='submit'>
                                <img src='../media/images/whatsapp.png'/>
                            </button>
                     </form>";
                    echo '</td>';
                    echo '</tr>';
                }
            ?>
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
                            Volver al Dashboard
                        </button>
                    </form>
                </li>
            </ul>
        </footer> 
    </div>
</body>
</html>
