/*
 * Modelo C4 de RedExpress (caso base del Taller 3), escrito como código.
 * El modelo se escribe una sola vez; las vistas C1 y C2 se generan a partir de él.
 * Si una relación apunta a un elemento que no existe, Structurizr no carga el modelo
 * y muestra el error con el número de línea.
 */
workspace "RedExpress" "Plataforma de logística - caso base del Taller 3" {

    !identifiers hierarchical

    configuration {
        scope softwaresystem
    }

    model {
        # Actores (C1)
        usuario = person "Usuario Final" "Rastrea envíos y agenda recogidas."
        mensajero = person "Mensajero" "Actualiza el estado de las entregas."
        operador = person "Operador Logístico" "Gestiona rutas y despachos."

        # Sistemas externos (C1)
        notificaciones = softwareSystem "API de Notificaciones" "Envía SMS y correos." "Externo"
        geolocalizacion = softwareSystem "Proveedor de Geolocalización" "Coordenadas y cálculo de rutas." "Externo"

        # Sistema en alcance y sus contenedores (C2)
        redexpress = softwareSystem "Plataforma RedExpress" "Gestiona paquetes, rutas y rastreo de envíos." {
            appMovil = container "App Móvil" "Rastreo, recogidas y actualización de entregas." "Android / iOS"
            portalWeb = container "Portal Web Operadores" "Gestión de rutas y despachos." "Aplicación web"
            balanceador = container "Balanceador de Carga" "Reparte las solicitudes entrantes." "Nginx" "Infraestructura"
            gestion = container "Módulo de Gestión de Paquetes" "Registra paquetes y coordina los demás módulos." "API REST"
            rutas = container "Motor de Rutas" "Calcula la ruta óptima de entrega." "Servicio"
            gps = container "Seguimiento GPS" "Ubicación de mensajeros en tiempo real." "Servicio"
            alertas = container "Sistema de Alertas" "Genera alertas de cambio de estado." "Servicio"
            baseDatos = container "Base de Datos Distribuida" "Paquetes, rutas y estados." "Base de datos SQL" "Base de datos,Infraestructura"
        }

        # Relaciones del C2, copiadas del diagrama final de la guía (Parte B, Paso 4).
        # Structurizr deduce de ellas las relaciones del C1.
        usuario -> redexpress.appMovil "Rastrea envíos y agenda recogidas" "HTTPS/JSON"
        mensajero -> redexpress.appMovil "Actualiza estado de entregas" "HTTPS/JSON"
        operador -> redexpress.portalWeb "Gestiona rutas y despachos" "HTTPS/JSON"
        redexpress.appMovil -> redexpress.balanceador "Envía solicitudes" "HTTPS"
        redexpress.portalWeb -> redexpress.balanceador "Envía solicitudes" "HTTPS"
        redexpress.balanceador -> redexpress.gestion "Enruta solicitudes"
        redexpress.gestion -> redexpress.baseDatos "Lee y escribe" "SQL"
        redexpress.gestion -> redexpress.rutas "Solicita ruta óptima"
        redexpress.rutas -> geolocalizacion "Consulta coordenadas y calcula rutas" "REST"
        redexpress.gestion -> redexpress.gps "Solicita ubicación en tiempo real"
        redexpress.gps -> redexpress.appMovil "Envía ubicación" "Push/WebSocket"
        redexpress.gestion -> redexpress.alertas "Dispara evento"
        redexpress.alertas -> notificaciones "Envía alertas de estado" "REST"
    }

    views {
        systemContext redexpress "C1-Contexto" "Vista de Contexto (C1) de RedExpress" {
            include *
            autolayout lr
        }

        container redexpress "C2-Contenedores" "Vista de Contenedores (C2) de RedExpress" {
            include *
            autolayout lr
        }

        styles {
            element "Person" {
                shape Person
                background #1168bd
                color #ffffff
            }
            element "Software System" {
                background #08427b
                color #ffffff
            }
            element "Externo" {
                background #8a8a8a
                color #ffffff
            }
            element "Container" {
                background #438dd5
                color #ffffff
            }
            element "Infraestructura" {
                background #6b6b6b
            }
            element "Base de datos" {
                shape Cylinder
            }
        }
    }
}
