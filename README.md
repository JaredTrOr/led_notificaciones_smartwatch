# Aplicación de Smartwatch para Recepción de Notificaciones

## Descripción

Esta aplicación de smartwatch recibe notificaciones desde Firebase Messaging cuando el LED controlado por la aplicación móvil se enciende o apaga. La aplicación muestra mensajes y animaciones para indicar el estado del LED, y guarda las notificaciones en MongoDB Atlas para su visualización posterior.

## Funcionalidades

- Recepción de notificaciones desde Firebase Messaging.
- Visualización de mensajes y animaciones sobre el estado del LED.
- Almacenamiento de notificaciones en MongoDB Atlas.

## Requisitos

- Smartwatch con WearOS.
- Conexión a internet para recibir notificaciones de Firebase.
- Cuenta en MongoDB Atlas para almacenar las notificaciones.

## Configuración

1. **Configuración de Firebase:**
   - Crear un proyecto en Firebase.
   - Configurar Firebase Cloud Messaging (FCM).
   - Integrar Firebase en la aplicación de smartwatch siguiendo la documentación oficial.

2. **Configuración de MongoDB Atlas:**
   - Crear una cuenta en MongoDB Atlas.
   - Configurar una base de datos y una colección para almacenar las notificaciones.
   - Integrar MongoDB en la aplicación de smartwatch.

3. **Interfaz de Usuario:**
   - Implementar la recepción de notificaciones y la visualización de mensajes.
   - Crear animaciones para simular el encendido del LED.

## Uso

1. Instala la aplicación en el smartwatch.
2. Asegúrate de que el smartwatch esté conectado a internet.
3. Recibe notificaciones cuando el LED se encienda o apague desde la aplicación móvil.
4. Observa los mensajes y animaciones en el smartwatch.
5. Consulta las notificaciones guardadas en MongoDB Atlas.

<p align="center">
  <img src="https://github.com/JaredTrOr/led_notificaciones_smartwatch/assets/115369767/9acc87d4-94a3-48ee-80ba-900e9655ef1e" alt="Captura de pantalla 2024-07-05 115316" width="30%">
  <img src="https://github.com/JaredTrOr/led_notificaciones_smartwatch/assets/115369767/4b29c969-1c78-42bb-a790-646f66ef16ab" alt="Captura de pantalla 2024-07-05 115230" width="30%">
  <img src="https://github.com/JaredTrOr/led_notificaciones_smartwatch/assets/115369767/9a446866-9a29-4d4f-8d46-e93c787ca225" alt="Captura de pantalla 2024-07-05 115427" width="30%">
</p>

