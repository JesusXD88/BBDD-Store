# BBDD-Store

Desarrollado por JesusXD88.

Versión Final.

## Descripcion

Este proyecto consiste en el desarrollo de una página web diseñada en PHP, HTML y CSS para el desarrollo de una práctica de una asignatura de la universidad.

La implementación de este proyecto ha sido diseñada totalmente desde cero por mí y gracias a la información que ido pudiendo encontrar por internet.

Práctica calificada con un **9.3/10**.

## Uso

1. Cargar e importar la base de datos almacenada en la carpeta db. Importar con cualquier sistema basado en MySQL / MariaDB como MySQL Workbench o PHPMyAdmin.
2. Situar la carpeta del proyecto en una carpeta accesible por el servidor PHP como puede ser Apache (clonar el repo o descomprimir el zip descargado en dicha carpeta, normalmente suele ser htdocs). Todos los archivos de la raíz del proyecto han de estar bajo el mismo directorio.
3. Encender el servidor PHP como por ejemplo Apache.
4. Configurar en el archivo conexion.php dentro de la carpeta php el username y el password del server MySQL. Por defecto es usuario='root' y contraseña='', pero a la hora de realizar la entrega había que configurarlo como contraseña='root'.
5. Abrir a un navegador web y acceder a una ruta parecida a la siguiente: localhost/BBDD-Store.
6. Iniciar sesión con unas credenciales válidas almacenadas en la Base de Datos.
7. Enjoy!

## Capturas de pantalla

![alt text](https://github.com/JesusXD88/BBDD-Store/blob/main/media/screenshots/Captura%20de%20pantalla-20210709150106-1920x1080.png?raw=true "Login como un cliente de la página")

![alt text](https://github.com/JesusXD88/BBDD-Store/blob/main/media/screenshots/Captura%20de%20pantalla-20210709150106-1920x1080.png?raw=true "Dashboard")

![alt text](https://github.com/JesusXD88/BBDD-Store/blob/main/media/screenshots/Captura%20de%20pantalla-20210709145755-1920x1080.png?raw=true "Catálogo")

![alt text](https://github.com/JesusXD88/BBDD-Store/blob/main/media/screenshots/Captura%20de%20pantalla-20210709150455-1920x1080.png?raw=true "Login como el personal de una empresa")

![alt text](https://github.com/JesusXD88/BBDD-Store/blob/main/media/screenshots/Captura%20de%20pantalla-20210709145952-1920x1080.png?raw=true "Visualización de las compras por parte de una empresa")


## Explicación de las estructura de archivos

El archivo index.php es el archivo principal del proyecto (es el primero que se debe de acceder).
En el se efectúa el inicio de sesión del usuario o el acceso a la plataforma de gestión de la Empresa de Transporte.

Por lo que respecta a las carpetas:

* php: Es la carpeta dónde se encuentran todos los códigos php para el funcionamiento del proyecto.
* css: Aquí se encuentran todos los códigos CSS para el estilo de cada una de las páginas PHP/HTML.
* media: Donde están almacenados todos los recursos visuales del proyecto.
* db: Aquí se encuentra un script SQL con la Base de Datos necesaria para que el proyecto funcione.

## Disclaimer

Este proyecto se distribuye bajo la licencia GPLv3 (GNU General Public License) de código libre (FOSS). Por tanto, con respecto a los aspectos legales / de licencia de este proyecto:

* Cualquier persona puede copiar, modificar y distribuir este software.
* Necesitas incluir la licencia y su respectivo copyright en cada distribución de este software.
* Puedes usarlo privadamente.
* Puedes usarlo con fines comerciales.
* Si pretendes lucrarte económicamente de este software, tienes que hacerlo también de código libre / abierto (has de publicar el código).
* Si modificas este código, has de indicar los cambios hechos a dicho código.
* Cualquier modificación de este código ha de ser distribuido bajo la misma licencia (GPLv3).
* Este software se proporciona sin ninguna garantía.
* El autor de este software o esta licencia no se hace responsable de cualquier daño causado por este software.
