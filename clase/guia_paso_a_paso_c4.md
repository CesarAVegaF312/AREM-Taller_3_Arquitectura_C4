# 🧭 Guía Paso a Paso: Arquitectura Actual del Sistema con el Modelo C4

Esta guía complementa el `README.md` del taller. Cubre los dos entregables de la Parte 1 y la Parte 2: la **vista de contexto (C1)** y la **vista de contenedores (C2)** del modelo C4, ambas construidas sobre el caso base de RedExpress.

Los diagramas de ejemplo de esta guía están escritos en [Mermaid](https://mermaid.js.org/) y se renderizan automáticamente al ver este archivo en GitHub. Úselos como referencia de método — el entregable final debe hacerse en draw.io o Astah UML según lo indicado en el `README.md`.

---

## Parte A — Vista de Contexto (C1)

### A.1 Leyenda de notación C1

| Elemento | Forma / color | Uso |
|---|---|---|
| Persona (actor) | Óvalo azul | Alguien que interactúa directamente con el sistema |
| Sistema en alcance | Rectángulo azul oscuro | El sistema que se está documentando (una sola caja, sin desglosar) |
| Sistema externo | Rectángulo gris de doble borde | Sistema de un tercero, fuera del control del equipo |
| Relación | Flecha etiquetada | Qué información o función se intercambia, con verbo explícito |

```mermaid
flowchart LR
    p(["🧑 Persona<br/>Ej: Usuario Final"])
    s["Sistema en alcance<br/>Ej: Plataforma RedExpress"]
    e[["Sistema externo<br/>Ej: API de Notificaciones"]]

    p -->|"Relación: verbo + qué se intercambia"| s
    s -.->|"Integración externa"| e

    classDef person fill:#1168bd,color:#fff,stroke:#0b4884;
    classDef system fill:#08427b,color:#fff,stroke:#052e56;
    classDef external fill:#8a8a8a,color:#fff,stroke:#5c5c5c;
    class p person
    class s system
    class e external
```

### A.2 Metodología en 4 pasos

1. **Identificar actores** — liste las personas o roles que interactúan directamente con el sistema.
2. **Identificar el sistema en alcance y los sistemas externos** — dibuje el sistema que se está documentando como una sola caja, y ubique aparte los sistemas de terceros con los que se conecta.
3. **Trazar relaciones** — conecte cada actor y cada sistema externo con el sistema en alcance, según quién interactúa con quién.
4. **Etiquetar relaciones y validar** — indique qué se intercambia en cada relación y confirme que ningún actor o sistema quede sin conexión.

### A.3 Ejemplo guiado: Contexto de RedExpress

#### Paso 1 — Identificar actores

Del caso base se extraen los tres actores humanos: **Usuario Final** (rastrea sus envíos), **Mensajero** (actualiza el estado de las entregas) y **Operador Logístico** (gestiona rutas y despachos).

```mermaid
flowchart LR
    usuario(["🧑 Usuario Final"])
    mensajero(["🧑 Mensajero"])
    operador(["🧑 Operador Logístico"])

    classDef person fill:#1168bd,color:#fff,stroke:#0b4884;
    class usuario,mensajero,operador person
```

#### Paso 2 — Identificar el sistema en alcance y los sistemas externos

Se dibuja **Plataforma RedExpress** como el sistema en alcance (una sola caja, sin desglosar sus módulos internos todavía) y se identifican dos sistemas externos con los que se integra: la **API de Notificaciones** y el **Proveedor de Geolocalización**, ambos servicios de terceros.

```mermaid
flowchart LR
    usuario(["🧑 Usuario Final"])
    mensajero(["🧑 Mensajero"])
    operador(["🧑 Operador Logístico"])
    redexpress["Plataforma RedExpress"]
    notif[["API de Notificaciones"]]
    geo[["Proveedor de Geolocalización"]]

    classDef person fill:#1168bd,color:#fff,stroke:#0b4884;
    classDef system fill:#08427b,color:#fff,stroke:#052e56;
    classDef external fill:#8a8a8a,color:#fff,stroke:#5c5c5c;
    class usuario,mensajero,operador person
    class redexpress system
    class notif,geo external
```

#### Paso 3 — Trazar relaciones

Se conecta cada actor con la plataforma y la plataforma con cada sistema externo. En este paso todavía no se explica qué viaja por cada relación — solo se establece quién se conecta con quién.

```mermaid
flowchart LR
    usuario(["🧑 Usuario Final"]) --> redexpress["Plataforma RedExpress"]
    mensajero(["🧑 Mensajero"]) --> redexpress
    operador(["🧑 Operador Logístico"]) --> redexpress
    redexpress -.-> notif[["API de Notificaciones"]]
    redexpress -.-> geo[["Proveedor de Geolocalización"]]

    classDef person fill:#1168bd,color:#fff,stroke:#0b4884;
    classDef system fill:#08427b,color:#fff,stroke:#052e56;
    classDef external fill:#8a8a8a,color:#fff,stroke:#5c5c5c;
    class usuario,mensajero,operador person
    class redexpress system
    class notif,geo external
```

#### Paso 4 — Etiquetar relaciones y validar

Se etiqueta cada flecha con el verbo y la información que se intercambia. El diagrama queda validado cuando cada actor y cada sistema externo tiene una relación clara con la plataforma.

```mermaid
flowchart LR
    usuario(["🧑 Usuario Final"]) -->|"Rastrea envíos y agenda recogidas"| redexpress["Plataforma RedExpress"]
    mensajero(["🧑 Mensajero"]) -->|"Actualiza estado de entregas"| redexpress
    operador(["🧑 Operador Logístico"]) -->|"Gestiona rutas y despachos"| redexpress
    redexpress -.->|"Envía alertas de estado (API REST)"| notif[["API de Notificaciones"]]
    redexpress -.->|"Consulta coordenadas y calcula rutas (API REST)"| geo[["Proveedor de Geolocalización"]]

    classDef person fill:#1168bd,color:#fff,stroke:#0b4884;
    classDef system fill:#08427b,color:#fff,stroke:#052e56;
    classDef external fill:#8a8a8a,color:#fff,stroke:#5c5c5c;
    class usuario,mensajero,operador person
    class redexpress system
    class notif,geo external
```

### A.4 Errores comunes en C1

| Error frecuente | Por qué es un problema | Cómo corregirlo |
|---|---|---|
| Dibujar los contenedores internos (apps, servicios) directamente en el C1 | Mezcla dos niveles de abstracción distintos | Deje los contenedores para el C2; en el C1 el sistema en alcance es una sola caja |
| No distinguir sistemas externos de sistemas propios | El lector no puede saber qué está bajo control del equipo y qué es de un proveedor | Use una forma/color distinto para sistemas externos (ver leyenda) |
| Relaciones sin etiqueta | No se entiende qué información o función se intercambia | Etiquete cada flecha con un verbo + qué se intercambia |
| Incluir actores sin relación directa con el sistema | Satura el diagrama con información irrelevante para este nivel | Solo incluya actores con una relación directa y relevante |

---

## Parte B — Vista de Contenedores (C2)

### B.1 Leyenda de notación C2

| Elemento | Forma / color | Uso |
|---|---|---|
| Contenedor | Rectángulo azul claro | Una aplicación o servicio desplegable dentro del sistema, con su tecnología indicada |
| Infraestructura de soporte | Rectángulo/cilindro gris | Base de datos, balanceador u otro componente que da soporte a los contenedores |
| Relación | Flecha etiquetada | Protocolo o mecanismo de comunicación entre contenedores (REST, SQL, WebSocket, etc.) |

```mermaid
flowchart LR
    c["Contenedor<br/>Ej: App Móvil - React Native"]
    d[("Infraestructura<br/>Ej: Base de Datos")]

    c -->|"Protocolo, ej. SQL"| d

    classDef container fill:#438dd5,color:#fff,stroke:#2e6295;
    classDef infra fill:#6b6b6b,color:#fff,stroke:#4a4a4a;
    class c container
    class d infra
```

### B.2 Metodología en 4 pasos

1. **Descomponer el sistema en contenedores** — divida el sistema en alcance del C1 en las aplicaciones y servicios que realmente lo componen.
2. **Ubicar la infraestructura de soporte** — agregue los componentes compartidos (bases de datos, balanceadores) de los que dependen los contenedores.
3. **Trazar relaciones** — conecte los contenedores entre sí y con los actores/sistemas externos ya identificados en el C1.
4. **Etiquetar tecnología y protocolo, y validar** — indique con qué protocolo se comunica cada relación y confirme que cada contenedor tenga una responsabilidad clara y distinta de las demás.

### B.3 Ejemplo guiado: Contenedores de RedExpress

#### Paso 1 — Descomponer el sistema en contenedores

La **Plataforma RedExpress** del C1 se descompone en sus aplicaciones y servicios: **App Móvil**, **Portal Web Operadores**, **Módulo de Gestión de Paquetes**, **Motor de Rutas**, **Seguimiento GPS** y **Sistema de Alertas**. Aún no se conectan entre sí.

```mermaid
flowchart LR
    subgraph redexpress["Plataforma RedExpress"]
        appmovil["App Móvil"]
        webop["Portal Web Operadores"]
        gestion["Módulo de Gestión de Paquetes"]
        rutas["Motor de Rutas"]
        gps["Seguimiento GPS"]
        alertas["Sistema de Alertas"]
    end

    classDef container fill:#438dd5,color:#fff,stroke:#2e6295;
    class appmovil,webop,gestion,rutas,gps,alertas container
```

#### Paso 2 — Ubicar infraestructura de soporte

Se agregan el **Balanceador de Carga**, que distribuye el tráfico entrante, y la **Base de Datos Distribuida**, donde persiste la información de paquetes, rutas y usuarios.

```mermaid
flowchart LR
    subgraph redexpress["Plataforma RedExpress"]
        appmovil["App Móvil"]
        webop["Portal Web Operadores"]
        lb["Balanceador de Carga"]
        gestion["Módulo de Gestión de Paquetes"]
        rutas["Motor de Rutas"]
        gps["Seguimiento GPS"]
        alertas["Sistema de Alertas"]
        db[("Base de Datos Distribuida")]
    end

    classDef container fill:#438dd5,color:#fff,stroke:#2e6295;
    classDef infra fill:#6b6b6b,color:#fff,stroke:#4a4a4a;
    class appmovil,webop,gestion,rutas,gps,alertas container
    class lb,db infra
```

#### Paso 3 — Trazar relaciones

Se conectan los contenedores entre sí, y se retoman los actores y sistemas externos del C1 (Usuario Final, Mensajero, Operador Logístico, API de Notificaciones, Proveedor de Geolocalización) para mostrar con qué contenedor específico interactúa cada uno.

```mermaid
flowchart LR
    usuario(["🧑 Usuario Final"])
    mensajero(["🧑 Mensajero"])
    operador(["🧑 Operador Logístico"])
    notif[["API de Notificaciones"]]
    geo[["Proveedor de Geolocalización"]]

    subgraph redexpress["Plataforma RedExpress"]
        appmovil["App Móvil"]
        webop["Portal Web Operadores"]
        lb["Balanceador de Carga"]
        gestion["Módulo de Gestión de Paquetes"]
        rutas["Motor de Rutas"]
        gps["Seguimiento GPS"]
        alertas["Sistema de Alertas"]
        db[("Base de Datos Distribuida")]
    end

    usuario --> appmovil
    mensajero --> appmovil
    operador --> webop
    appmovil --> lb
    webop --> lb
    lb --> gestion
    gestion --> db
    gestion --> rutas
    rutas --> geo
    gestion --> gps
    gps --> appmovil
    gestion --> alertas
    alertas --> notif

    classDef person fill:#1168bd,color:#fff,stroke:#0b4884;
    classDef external fill:#8a8a8a,color:#fff,stroke:#5c5c5c;
    classDef container fill:#438dd5,color:#fff,stroke:#2e6295;
    classDef infra fill:#6b6b6b,color:#fff,stroke:#4a4a4a;
    class usuario,mensajero,operador person
    class notif,geo external
    class appmovil,webop,gestion,rutas,gps,alertas container
    class lb,db infra
```

#### Paso 4 — Etiquetar tecnología/protocolo y validar

Se etiqueta cada relación con el protocolo o mecanismo de comunicación. El diagrama queda validado cuando cada contenedor tiene una responsabilidad clara y cada relación explica cómo se comunican.

```mermaid
flowchart LR
    usuario(["🧑 Usuario Final"])
    mensajero(["🧑 Mensajero"])
    operador(["🧑 Operador Logístico"])
    notif[["API de Notificaciones"]]
    geo[["Proveedor de Geolocalización"]]

    subgraph redexpress["Plataforma RedExpress"]
        appmovil["App Móvil"]
        webop["Portal Web Operadores"]
        lb["Balanceador de Carga"]
        gestion["Módulo de Gestión de Paquetes"]
        rutas["Motor de Rutas"]
        gps["Seguimiento GPS"]
        alertas["Sistema de Alertas"]
        db[("Base de Datos Distribuida")]
    end

    usuario -->|"HTTPS/JSON"| appmovil
    mensajero -->|"HTTPS/JSON"| appmovil
    operador -->|"HTTPS/JSON"| webop
    appmovil -->|"HTTPS"| lb
    webop -->|"HTTPS"| lb
    lb -->|"Enruta solicitudes"| gestion
    gestion -->|"SQL"| db
    gestion -->|"Solicita ruta óptima"| rutas
    rutas -->|"Consulta coordenadas (REST)"| geo
    gestion -->|"Solicita ubicación en tiempo real"| gps
    gps -->|"Push/WebSocket"| appmovil
    gestion -->|"Dispara evento"| alertas
    alertas -->|"Envía alerta (REST)"| notif

    classDef person fill:#1168bd,color:#fff,stroke:#0b4884;
    classDef external fill:#8a8a8a,color:#fff,stroke:#5c5c5c;
    classDef container fill:#438dd5,color:#fff,stroke:#2e6295;
    classDef infra fill:#6b6b6b,color:#fff,stroke:#4a4a4a;
    class usuario,mensajero,operador person
    class notif,geo external
    class appmovil,webop,gestion,rutas,gps,alertas container
    class lb,db infra
```

### B.4 Errores comunes en C2

| Error frecuente | Por qué es un problema | Cómo corregirlo |
|---|---|---|
| Contenedor sin tecnología indicada | El C2 pierde su propósito principal: mostrar decisiones tecnológicas | Indique la tecnología o el tipo de contenedor (ej. "SPA - React", "Servicio - Node.js") |
| Un solo contenedor gigante que hace de todo | Oculta la distribución real de responsabilidades del sistema | Divida por responsabilidad (gestión de paquetes, rutas, alertas, etc.) |
| Relaciones sin protocolo/tecnología | No se puede evaluar el diseño de comunicación entre contenedores | Etiquete cada relación con el protocolo (REST, SQL, WebSocket, etc.) |
| Mezclar actores del C1 con contenedores sin distinguirlos visualmente | Confunde el nivel de abstracción y quién es externo al sistema | Mantenga el estilo de nodo (persona/externo/contenedor) consistente con la leyenda |

---

## Checklist de autoevaluación antes de entregar

**Vista de Contexto (C1):**

- [ ] El sistema en alcance aparece como una única caja, sin contenedores internos visibles.
- [ ] Todos los actores relevantes están identificados y tienen al menos una relación.
- [ ] Los sistemas externos están visualmente diferenciados del sistema en alcance.
- [ ] Cada relación tiene una etiqueta que describe qué se intercambia.
- [ ] Ningún actor ni sistema queda sin conexión.

**Vista de Contenedores (C2):**

- [ ] Cada contenedor tiene su tecnología o tipo indicado.
- [ ] Los contenedores reflejan responsabilidades separadas — no hay un contenedor que "hace de todo".
- [ ] Los actores y sistemas externos del C1 se mantienen visibles y conectados en el C2.
- [ ] Cada relación entre contenedores indica el protocolo o mecanismo de comunicación.
- [ ] La infraestructura de soporte (balanceador, base de datos, integraciones) está representada.

---

_Esta guía hace parte del Taller 3 de Arquitectura Actual del Sistema con el Modelo C4 — curso Arquitectura Empresarial, Universidad de La Sabana._
