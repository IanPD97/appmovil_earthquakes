# appmovil_earthquakes
_Aplicación móvil que cuenta con un login, en el cual sólo se puede acceder mediante credenciales UTEM, esta aplicación captura los datos de la API_REST desarrollada anteriormente, los lista, y muestra su ubicación en el mapa, usando la API de Google Maps._

### Pre-requisitos 📋

```
Android Studio
Flutter
Servidor REST desarrollado anteriormente
Opcional: VSCode
```

### Instalación 🔧

_1. Clonar el repositorio del proyecto_

  _Se puede descargar directamente desde GitHub o clonar el repositorio_

```
git clone https://github.com/IanPD97/appmovil_earthquakes.git
```

_2. Iniciar el servidor REST_

  _En una terminal, se debe realizar la conexión mediante SSH con el siguiente comando_

```
ssh -p 22 grupo-w@api.jkd.cl
```
  _Posteriormente se debe ingresar el siguiente password_
  
```
4AuXJAjd
```
  _Con esto se generará una conexión remota mediante SSH, Posteriormente en la máquina virtual, se debe escribir el siguiente comando_
```
node ./backend/APIRESTPARALELAS2021/index.js
```
  _Con esto iniciará el servidor REST_
  
_3. Ejecutar el proyecto_

  _Para ejecutar el proyecto, se debe iniciar Android Studio, seleccionar la opción de New Flutter Project, y seleccionar la ubicación el proyecto clonado anteriormente_
  _Luego se debe seleccionar una maquina virtual (si no existe, se debe crear) de android, y se debe ejecutar el proyecto con el icono de "play" en Android Studio_
  _Con esto, se iniciará la aplicación en la máquina virtual, y se podrá acceder a ella._


## Construido con 🛠️

* [Flutter/Dart] - El lenguaje de programacion usado
* [AndroidStudio] - Software y editor de texto utilizado

## Autores ✒️

* **Nicolas Ipinza** - [Viakure](https://github.com/Viakure)
* **Ian Poveda** - [IanPD97](https://github.com/IanPD97)
