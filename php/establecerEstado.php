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
    $estado = $_GET['estado'];
    $query = mysqli_query($mysqli, "update Compras set estadoCompra='$estado' where idCompra=$idCompra");
    $estadoExito = mysqli_affected_rows($mysqli);
    if ($estadoExito == 1) {
        echo "
            <script>
                alert('¡Se ha establecido correctamente el estado!');
                var url = 'visualizarCompras.php?staff=$staff';
                window.location.href=url;
            </script>
        ";
    } else {
        echo "
            <script>
                alert('¡No se ha podido establecer el estado! :(');
                var url = 'visualizarCompras.php?staff=$staff';
                window.location.href=url;
            </script>
        ";
    }    
?>
