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
	<div id="id2">
		<div class="collapsible-menu">
			<input type="checkbox" id="Jesussify">
			<label for="Jesussify"> Usuario </label>
			<div class="menu-content">
				<ul>
					<li>
						<a href="branches/jesussify.html" target="new"> USER
						</a>
					</li>
				</ul>
			</div>
		</div>
		<br>
		<div class="collapsible-menu">
			<input type="checkbox" id="Minijuegos_jesus">
			<label for="Minijuegos_jesus"> Contraseña </label>
			<div class="menu-content">
				<ul>
					<li>
						<a href="branches/minjuegos_jesus.html" target="new"> PASSS
						</a>
					</li>
				</ul>
			</div>
		</div>
		<br>
	</div>
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
