
# marvel_app

# Autor Shanexon Ortiz

Documentación del proyecto Marvel App
Descripción general
Marvel App es una aplicación de Flutter que utiliza la API de Marvel para mostrar información sobre los personajes de cómics de Marvel. La aplicación incluye una lista de personajes en forma de tarjetas en una cuadrícula, una barra de búsqueda para filtrar personajes por nombre y una vista detallada de cada personaje, que muestra información adicional sobre el personaje, así como sus cómics y series asociados.

#  Uso de la aplicación

Asegúrese de tener instalado Flutter y un emulador o dispositivo conectado.
Clone el repositorio del proyecto en su computadora.

Ejecute flutter pub get para instalar las dependencias del proyecto.

Reemplace las variables PUBLIC_KEY y PRIVATE_KEY en lib/services/api_service.dart con sus propias claves de la API de Marvel.

Ejecute flutter run para iniciar la aplicación en su emulador o dispositivo.

# Pruebas unitarias 

Se incluyeron pruebas unitarias para probar el funcionamiento perfecto de la respuesta de la api y sus errores.

# Principios de arquitectura 
En el código proporcionado, se utilizan varios patrones de diseño y principios de arquitectura limpia:

Model-View-Controller (MVC): La aplicación sigue el patrón de diseño MVC. Los modelos, vistas y controladores están separados en diferentes archivos y carpetas. Los modelos (Character) representan los objetos de negocio, las vistas (CharactersList y CharacterDetails) se encargan de la presentación y la interacción con el usuario, y el controlador (CharactersController) coordina las acciones entre las vistas y los modelos.

Dependency Inversion Principle (DIP): La aplicación sigue el principio de inversión de dependencias de SOLID. Esto se logra utilizando el paquete GetX para inyectar las dependencias. Por ejemplo, el controlador CharactersController se inyecta en la vista CharactersList utilizando Get.put(CharactersController()). Esto facilita la sustitución de implementaciones y mejora la modularidad del código.

Service Layer Pattern: La clase ApiService se encarga de la comunicación con la API de Marvel, lo que separa la lógica de negocio de la lógica de acceso a datos. Esto permite cambiar la fuente de datos fácilmente sin afectar a otras partes de la aplicación.

Repository Pattern: Aunque no se ha implementado explícitamente un repositorio en el código proporcionado, el patrón de repositorio se puede aplicar fácilmente para mejorar la abstracción de la capa de datos. Esto consistiría en crear una interfaz para el repositorio y una implementación concreta que utilice ApiService para obtener datos de la API de Marvel.

Factory Method Pattern: En el modelo Character, se utiliza el método de fábrica fromJson para crear una instancia de Character a partir de un objeto JSON. Esto simplifica la creación de objetos Character y encapsula la lógica de construcción en la propia clase.

Estos patrones de diseño y principios de arquitectura trabajan juntos para crear una aplicación mantenible, escalable y fácil de entender.

# Dependencias
El proyecto utiliza las siguientes dependencias externas:

http: Para realizar solicitudes HTTP a la API de Marvel.
get: Para implementar la arquitectura GetX y manejar la navegación y el estado de la aplicación.
crypto: Para firmar las solicitudes a la API de Marvel con una clave privada y una clave pública.
Flujo de la aplicación
Al iniciar la aplicación, CharactersController solicita la lista inicial de personajes a través de CharacterRepository.
CharacterRepository utiliza ApiService para realizar la solicitud a la API de Marvel y devuelve los datos en forma de una lista de objetos Character.
La lista de personajes se muestra en la pantalla CharactersList en forma de tarjetas en una cuadrícula.
El usuario puede buscar personajes utilizando la barra de búsqueda en la parte superior de la pantalla CharactersList.
Al seleccionar un personaje, el usuario es llevado a la pantalla CharacterDetails, que muestra información adicional sobre el personaje, así como sus cómics y series asociados.

La aplicación admite la carga de más personajes al darle click en ver más y desplazarse hacia abajo en la lista.

>>>>>>> 74aaa2e (firt commit)
