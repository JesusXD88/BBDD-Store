<?php
    session_start();
    include('branches/Login.php');
?>
<!DOCTYPE html>
<html>
<head>
	<title> Login </title>
	<link rel="stylesheet" type="text/css" href="css/design.css">
	<h1> BBDD Store </h1>
	<br>
	<br>
	<br>
</head>
<body>
	<div>
		<p class="parrafo" charset="UTF-8">
            Bienvenid@s a la Tienda Virtual de BBDD.
             <br> 
            Por favor, inicia sesi&oacute;n con tus credenciales.            
		</p>
		<br>
		<br>
		<br>
	</div>
	<div>
		<div>
            <form action="branches/Login.php" method="post" name="signin-form">
                <div class="form-element">
                    <label>
                        <img src="media/images/account-circle-outline.png" class="acc"/>Usuario</label>
                    <input type="text" name="username" pattern="[a-zA-Z0-9\u00f1\u00d1]+" required class="box"/>
                </div>
                <div class="form-element">
                    <label>
                        <img src="media/images/lock-outline.png" class="pass"/>Contraseña</label>
                    <input type="password" name="password" required class="box"/>
                </div>
                <button type="submit" name="login" value="login">
                    <img src="media/images/arrow-right-circle-outline4.png" class="imagen"/>
                    Iniciar sesion
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
        <img src="media/images/database-sync-outline.png" class="bd" />
        <?php
            echo "Estado de la conexión a la BD: $con_status";
        ?>
    </div>
</body>
