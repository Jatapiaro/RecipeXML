# RecipeXML

Este es un lenguaje en XML para la creación de recetas de cocina. El proyecto contiene dos versiones, una donde la validación se realiza mediante DTD y otra mediante XML Schema.

## Como descargar el proyecto
Hay dos opciones:
1. Utilizar el botón `Clone or download` en este mismo sitio, es un botón verde. Al darle clic, debemos seleccionar después la opción `Download ZIP`
2. Utilizar git para clonar el proyecto. `git clone https://github.com/Jatapiaro/RecipeXML`

## Importante
Debido a que XML copy editor tiene identación de 2 espacios por defecto y no pueden ser cambiados a 4, utilice Sublime Text para todo y solo XML copy editor unicamente para validar. Por lo tanto, se ven más líneas de identación en XML copy editor al abrir los archivos. Pero es unicamente por editar todo por fuera para estar con 4 espacios de identación.

## Versión de DTD
La versión con DTD esta dentro del folder `dtd`. Ahí mismo, encontrará el archivo `.xml` de prueba y el `.dtd` correspondiente. El XSLT dentro de `dtd` no aplica ningún sorting a los elementos.

## Versión XML Schema
Dentro del folder `xml_schema` se encuentra el archivo `.xml` de prueba así como todos los archivos `.xsd` para la validación del mismo. El XSLT dentro de `xml_schema` no aplica sorting a las recteas, ingredientes y utensilios.




