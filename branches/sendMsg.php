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
    $mensaje = $_GET['mensaje'];
    $query = mysqli_query($mysqli, "select * from Mensajes");
    $numMsg = mysqli_affected_rows($mysqli);
    $nextIdMsg = $numMsg + 1;
    $query2 = mysqli_query($mysqli, "select * from `Empresa de Transporte` where Login='$staff'");
    $row = mysqli_fetch_object($query2);
    $nombre = $row->Nombre;
    $query3 = mysqli_query($mysqli, "insert into Mensajes values($nextIdMsg, '$mensaje', '$nombre', $idCompra)");
    $enviado = mysqli_affected_rows($mysqli);
    if ($enviado == 1) {
        echo "
            <script>
                alert('¡Se ha enviado correctamente el mensaje!');
                var url = 'dashboardTrans.php?staff=$staff';
                window.location.href=url;
            </script>
        ";
    } else {
        echo "
            <script>
                alert('¡No se ha podido enviar el mensaje! :(');
                var url = 'dashboardTrans.php?staff=$staff';
                window.location.href=url;
            </script>
        ";
    }    
?>
