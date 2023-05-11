# Nombre Microservicio o API: nb-NombreMicorservicio-ms

## Descripción Microservicio o API
Escriba en esta sección una descripción de la funcionalidad del Microservicio o API que se esta Desarrollando

## Tabla de Contenidos
- [Configuración](#configuracion)
- [Operaciones](#operaciones)
- [API Specs](#api-specs)
- [Ownership](#ownership)

# Configuracion
Actualice en las secciones a continuación el detalle de la configuración del Microservicio o API que se esta Desarrollando

## Ejecución local
Para ejecutar localmente el servicio se utiliza el siguiente comando :
```bash
npm run local
```
Este comando se encarga de cargar las variables de entorno definidas en  _scripts/variables_entorno.sh_ e invocar al proceso node

### Variables de entorno

Indique en esta sección las Variables de Entorno relevantes de su Microservicio o API, escriba todas las variables necesarias y sus valores correspondientes

Las siguientes variables necesitan ser definidas:

    NODE_ENV: ______________
    PORT: ______________
    CHECK_CERTIFICATE: ______________

**Ambiente local:**
Las variables auto generadas se encuentran en el archivo _scripts/variables_entorno.sh_

## Operaciones 

En esta sección debe indicar los nombres de cada operación del Microservicio o API                                        

- **Operación**
  - nombreOperacion 1
- **Descripción Capacidad**
  - Descripción de la Operación 1
- **Sistemas Involucrados**
  - Sistemas associados a la operación 1

## API Specs

En esta sección debe indicar los detalles de como llamar a operación del Microservicio o API

- **Verbo**
  - POST - GET - PATCH - DELETE

- **PATH**
  - /servicio/v1/operacion1

- **Parametros**
  - parámetro A
  - parámetro B
  - parámetro C

- **Descripción parámetro**
  - Descripción A
  - Descripción B
  - Descripción C

## Ownership

En esta sección debe indicar la información de contacto de los miembros principales del equipo

- **Mantenedor**: 
  - Nombre y Correo de responsable Banco Microservicio o API

- **Business Owner**: 
  - Nombre responsable Comercial

- **Equipos**: 
  - Nombres Equipos de Desarrollos

Plantilla generada el 05/Oct/2022 por Arquitectura Tecnológica