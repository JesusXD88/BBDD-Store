<?php
    session_start();
    include('branches/Login.php');
?>
<!DOCTYPE html>
<html>
<head>
	<title> BBDD Store </title>
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
            <form action="" method="post" name="signin-form">
                <div class="form-element">
                    <label>Usuario</label>
                    <input type="text" name="username" pattern="[a-zA-Z0-9]+" required />
                </div>
                <div class="form-element">
                    <label>Contraseña</label>
                    <input type="password" name="password" required />
                </div>
                <button type="submit" name="login" value="login">Iniciar sesion
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
        
        <br>
    </div>
</body>
