# GuardiApp

Este repositorio contiene el código fuente y la documentación del programa.

## Índice

1.  Descripción
2.  Características Principales
3.  Roles de Usuario
4.  Requisitos
5.  Instalación
6.  Uso
7.  Arquitectura (si aplica)
8.  Licencia
9. Contacto
10. Bibliografía
11. Tecnologías
12. Conclusiones y Futuras Mejoras
13. Manual de Usuario

## 1. Descripción

Este programa intenta simplificar y automatizar la gestión de horas de guardia en los centros educativos, permitiendo a directores, profesores y personal administrativo organizarse de manera efectiva, rápida y fácil.

## 2. Características principales

* **Gestión de Horarios:**
    * Creación y edición de horarios de profesores por el administrador.
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

## 3. Roles de Usuario

* **Administrador:** Gestiona horarios, usuarios y guardias.
* **Profesor:** Gestiona tareas en sus guardias y se asigna guardias disponibles.
* **Sala de Profesores:** Visualiza el estado de las guardias y profesores disponibles.

## 4. Requisitos (ni puta idea jaja)

* Versión de Kotlin --> 1.8.22
* SDK mínimo --> 23
* SDK compilación --> 34
* Base de datos en la que almacenar horarios, usuarios, guardias, etc.

## 5. Instalación

1.  Descargar el [APK](https://github.com/BigBan0511/ProyectoDAMGuardias/releases/tag/Tag1)
2.  Iniciar sesión con las credenciales proporcionadas por el administrador.

## 6. Uso

### Rol Administrador

* **Gestión de Horarios:** Crea, edita o elimina horarios.
* **Gestión de Usuarios:** Crea, edita o elimina usuarios.
* **Gestión de Guardias:** Organiza las horas que cada profesor tiene de guardias y las requeridas para ello.
* **Estadísticas:** Guarda toda la información sobre las guardias y sus profesores.

### Rol Profesor

* **Gestión de Tareas:** Asigna tareas a sus guardias desde su panel.
* **Asignación de Guardias:** Selecciona guardias "Pendientes" disponibles y confirma la asignación.

### Rol Sala de Profesores

* **Visualización de Guardias:** Consulta el panel de guardias del día actual y la lista de profesores disponibles.

## 7. Arquitectura (Estructura y Diagrama)

![Diagrama de la App](DiagramaApp1.png)

![Estructura de la App](EstructuraApp1.png)

## 8. Licencia

Este proyecto está bajo la licencia de código abierto.

## 9. Contacto

* Daniel Trillo Palacios, danitrillopa@gmail.com, BigBan0511  

* Sergio Oyola Márquez, sergioyola147@gmail.com, SOyola33

* Héctor Aparicio Sánchez, hectoraparicio2005@outlook.es, HectorAS2005

## 10. Bibliografía

* Flutterflow (Dart, Flutter...)
* Flutterflow Docs
* Supabase
* GitHub
* Google Suite
* Discord (Comunicación entre miembros del equipo)

## 11. Tecnologías

**Control de versiones**
<br>
![Versiones](Versiones.png)

**Tests**

**Base de Datos**
![BD](BD.png)

**Ficheros**
La app contiene ficheros de imágen como asset y buckets en Supabase donde guardar la imagen de perfil.

**Despliege o Publicación**
Despliegue en Github



## 12. Conclusiones y Futuras Mejoras 
**Conclusiones**
<br>
El desarrollo de GuardiApp ha permitido la creación de una herramienta eficiente para la gestión de guardias en el instituto, optimizando la comunicación entre profesores y mejorando la organización interna.
Entre los principales logros del proyecto, destacamos:

* Automatización de la asignación de guardias, reduciendo la carga administrativa.
* Mejora en la accesibilidad de la información, permitiendo a los profesores consultar horarios y guardias en tiempo real.
* Interfaz intuitiva, facilitando su uso sin necesidad de formación adicional.
* Flexibilidad y personalización, con opciones de configuración como cambio de idioma, modo oscuro y ajustes de perfil.

**Futuras mejoras**
* Notificaciones en tiempo real para avisar cambios en las guardias.
* Versión para iOS.
* Planos de las aulas del centro donde salgan las clases ocupadas.
* Integración con plataformas educativas como Google Classroom o Moodle.

## 13. Manual de Usuario

* [Descargar el Manual de Usuario](https://github.com/BigBan0511/ProyectoDAMGuardias/blob/main/Manual%20de%20Usuario%20-%20GuardiApp.pdf)
