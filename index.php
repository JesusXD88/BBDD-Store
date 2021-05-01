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
            <form action="" method="post" name="login">
                <div class="form-element">
                    <label>Usuario</label>
                    <input type="text" name="login_user" pattern="[a-zA-Z0-9]+" required />
                </div>
                <div class="form-element">
                    <label>Contraseña</label>
                    <input type="password" name="login_password" required />
                </div>
                <button type="submit" name="login_submit" value="login">Iniciar sesion</button>
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
        <?php
            include 'Conexion.php';
            echo "Estado conexion a Base de Datos: $con";
        ?>
        <br>
    </div>
</body>
