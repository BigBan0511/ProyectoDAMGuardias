# GuardiApp

Este programa es una forma eficiente y sencilla de organizar las guardias de los centros educativos

Este repositorio contiene el código fuente y la documentación del programa.

## Descripción

Este programa tiene como objetivo simplificar y automatizar la gestión de horas de guardia en los centros educativos, permitiendo a directores, profesores y personal administrativo organizarse de manera efectiva, rápida y fácil.

## Roles de Usuario

* **Administrador:** Gestiona horarios, usuarios y guardias.
* **Profesor:** Gestiona tareas en sus guardias y se asigna guardias disponibles.
* **Sala de Profesores:** Visualiza el estado de las guardias y profesores disponibles.

## Características principales

* Gestión de horarios de profesores y asignación de guardias.
* Notificaciones automáticas a profesores sobre sus guardias asignadas.
* Generación de informes y estadísticas sobre la frecuencia de ausencias y la gestión de sustituciones.
* Interfaz intuitiva y fácil de usar, tanto en la plataforma web como en la aplicación móvil.
* Integración con otros sistemas de gestión escolar (opcional).

## Características principales

* **Gestión de Horarios:**
    * Lectura de archivos XML de horarios.
    * Almacenamiento y gestión de horarios de profesores.
* **Gestión de Usuarios:**
    * Creación, edición y eliminación de usuarios.
    * Asignación automática de horarios a nuevos usuarios.
* **Gestión de Guardias:**
    * Creación, edición y eliminación de guardias.
    * Generación automática de guardias "Pendientes de asignar".
* **Estadísticas:**
    * Informes de guardias asignadas/no asignadas por día y hora.
    * Tiempo de guardia por profesor y grupo.
* **Profesor:**
    * Asignación de tareas a guardias propias.
    * Asignación de guardias "Pendientes" con restricciones.
* **Sala de Profesores:**
    * Vista de guardias del día actual y profesores disponibles.

## Requisitos

* [Lista de requisitos de software y hardware]
* [Lista de dependencias]
* Lector de archivos XML.
* Base de datos para almacenar horarios, usuarios y guardias.

## Instalación

1.  Clona el repositorio: `git clone https://github.com/cran/DELTD`
2.  Instala las dependencias: `[Comandos para instalar dependencias]`
3.  Configura la base de datos: `[Instrucciones para configurar la base de datos]`
4.  Importa los horarios desde el archivo XML: `[Comandos para importar horarios]`
5.  Ejecuta la aplicación: `[Comandos para ejecutar la aplicación]`

## Uso

### Rol Administrador

* **Gestión de Horarios:** Importa archivos XML desde la interfaz.
* **Gestión de Usuarios:** Crea, edita o elimina usuarios en la sección de administración.
* **Gestión de Guardias:** Define rangos de fechas y horas para generar guardias.
* **Estadísticas:** Genera informes desde la sección de estadísticas.

### Rol Profesor

* **Gestión de Tareas:** Asigna tareas a sus guardias desde su panel.
* **Asignación de Guardias:** Selecciona guardias "Pendientes" disponibles y confirma la asignación.

### Rol Sala de Profesores

* **Visualización de Guardias:** Consulta el panel de guardias del día actual y la lista de profesores disponibles.

## Contribución

Si deseas contribuir a este proyecto, sigue estos pasos:

1.  Haz un fork del repositorio.
2.  Crea una nueva rama con tu contribución: `git checkout -b mi-contribucion`
3.  Realiza los cambios y commitea: `git commit -m "Añade nueva funcionalidad"`
4.  Sube los cambios a tu repositorio: `git push origin mi-contribucion`
5.  Crea un pull request.

## Licencia

Este proyecto está bajo la licencia [Nombre de la licencia].

## Contacto

* [Tu nombre]
* [Tu correo electrónico]
* [Tu perfil de GitHub]

## Agradecimientos

* [Agradecimientos a colaboradores o recursos utilizados]
