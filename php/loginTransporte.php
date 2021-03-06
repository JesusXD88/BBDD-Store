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
    session_start();
    include('login.php');
?>
<!DOCTYPE html>
<html>
<head>
	<title> Login Empresa de Transporte </title>
	<link rel="stylesheet" type="text/css" href="../css/designlogintransporte.css">
	<h1> TransManager </h1>
	<br>
	<br>
	<br>
</head>
<body>
	<div>
		<p class="parrafo" charset="UTF-8">
            Transportista, por favor, inicia sesi&oacute;n con tus credenciales.            
		</p>
		<br>
		<br>
		<br>
	</div>
	<div>
		<div>
            <form action="loginTrans.php" method="post" name="signin-form" class="forma">
                <div class="form-element">
                    <label>
                        <img src="../media/images/account-circle-outline.png" class="acc"/>Staff</label>
                    <input type="text" name="staff" pattern="[a-zA-Z0-9\u00f1\u00d1]+" required class="box"/>
                </div>
                <div class="form-element">
                    <label>
                        <img src="../media/images/lock-outline.png" class="pass"/>Contraseña</label>
                    <input type="password" name="password" required class="box"/>
                </div>
                <button type="submit" name="login" value="login">
                    <img src="../media/images/arrow-right-circle-outline4.png" class="imagen"/>
                    Iniciar sesi&oacute;n
                </button>
            </form>
		</div>
	</div>
	<br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
	<div class="con_bd"> 
        <img src="../media/images/database-sync-outline.png" class="bd" />
        <?php
            echo "Estado de la conexión a la BD: $con_status";
        ?>
    </div>
</body>
