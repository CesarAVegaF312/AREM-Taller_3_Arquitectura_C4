# 🛠️ Taller 3: Arquitectura Actual del Sistema con el Modelo C4

## 🎯 Objetivo

Representar la arquitectura actual del sistema del cliente utilizando las vistas C1 (Contexto) y C2 (Contenedores) del modelo C4, para entender cómo interactúan los actores con el sistema y cómo se distribuyen los componentes principales.

---

## 📘 Guía paso a paso

Antes de empezar a modelar, revise la [**Guía Paso a Paso: Arquitectura Actual del Sistema con el Modelo C4**](clase/guia_paso_a_paso_c4.md). Incluye la leyenda de notación de C1 y C2, la metodología de 4 pasos para cada vista, un ejemplo completo construido paso a paso sobre el propio caso de RedExpress, y una comparación de errores comunes vs. modelo corregido para cada vista.

## 🚚 Caso base de referencia: RedExpress (Plataforma de Logística)

RedExpress es una empresa nacional de logística y envíos que ha digitalizado la mayoría de sus operaciones. Ofrece una app móvil para usuarios finales, un sistema de gestión de rutas para operadores logísticos, y un dashboard de seguimiento para clientes corporativos. Su arquitectura actual integra servicios en la nube con bases de datos distribuidas, motores de cálculo de rutas y APIs de terceros para notificaciones. Comprender la estructura de sus sistemas y cómo los actores interactúan con ellos es clave para mejorar la eficiencia operativa y escalar a nuevas regiones.

**Contexto:**
- RedExpress es una empresa nacional de logística y transporte que ofrece rastreo en tiempo real de paquetes desde una app móvil y un portal web.
- Cuenta con centros de distribución físicos, sistemas de monitoreo, y servicios de notificación a usuarios y mensajeros.

**Elementos esperados:**

- **C1 (Vista de Contexto):**
  - Actores: Usuario final, Mensajero, Operador logístico
  - Sistemas: App de cliente, Sistema central de logística, API de notificaciones, Web para operadores

- **C2 (Vista de Contenedores):**
  - Contenedores internos: Módulo de gestión de paquetes, Seguimiento GPS, Motor de rutas, Sistema de alertas
  - Infraestructura: Balanceador de carga, base de datos distribuida, integración con proveedores de geolocalización

---

## 🧪 Parte 1: Trabajo en Clase

Durante la clase se espera que el equipo:

Siga la metodología de 4 pasos por vista de la [guía paso a paso](clase/guia_paso_a_paso_c4.md) para modelar el sistema de RedExpress:

1. Identifique los actores del C1 y trace la vista de contexto (Parte A de la guía).
2. Descomponga el sistema en contenedores y trace la vista de contenedores (Parte B de la guía).
3. Identifique puntos críticos de comunicación e interacción entre contenedores.
4. Valide ambos diagramas con la [checklist de autoevaluación](clase/guia_paso_a_paso_c4.md#checklist-de-autoevaluación-antes-de-entregar).

- Use draw.io o Astah UML.
- Reciba retroalimentación del docente y registre avances en `clase/notas.md` (use la [plantilla de notas](plantillas/plantilla_notas.md)).

---

## 🧠 Parte 2: Aplicación al Cliente Real

Después de la clase, el equipo debe:

- Modelar las vistas C1 y C2 aplicadas al sistema del cliente real, siguiendo los mismos 4 pasos de cada metodología.
- Documentar componentes clave, flujos, roles y debilidades actuales.
- Redactar el informe en `entrega/informe.md` usando la [plantilla de informe del taller](plantillas/plantilla_informe_taller.md); explicar la estructura actual, las diferencias con el caso base y las justificaciones de cada decisión de modelado.
- Investigar ejemplos reales de arquitecturas C4 en el sector del cliente, y registrar las fuentes en `entrega/referencias.md` con la [plantilla de referencias](plantillas/plantilla_referencias.md).

---

## 📁 Estructura esperada del repositorio

```text
taller-03-arquitectura-c4/
├── README.md
├── clase/
│   ├── guia_paso_a_paso_c4.md      # Notación, metodología de 4 pasos y ejemplo guiado (C1 + C2)
│   ├── c1-contexto-borrador.drawio
│   ├── c2-contenedores-borrador.drawio
│   └── notas.md                    # Ver plantillas/plantilla_notas.md
├── entrega/
│   ├── c1-contexto-final.drawio
│   ├── c2-contenedores-final.drawio
│   ├── informe.md                  # Ver plantillas/plantilla_informe_taller.md
│   └── referencias.md              # Ver plantillas/plantilla_referencias.md
└── plantillas/
    ├── plantilla_informe_taller.md
    ├── plantilla_notas.md
    └── plantilla_referencias.md
```

---

## ⚠️ Errores comunes

Antes de entregar, compare sus dos vistas contra los errores más frecuentes (contenedores dibujados en el C1, sistemas externos sin distinguir, relaciones sin etiqueta ni protocolo) documentados en las secciones [A.4](clase/guia_paso_a_paso_c4.md#a4-errores-comunes-en-c1) y [B.4](clase/guia_paso_a_paso_c4.md#b4-errores-comunes-en-c2) de la guía paso a paso.

## 📤 Entregables

- Diagrama C1 y C2 del sistema real del cliente
- Informe técnico explicativo (`informe.md`)
- Referencias técnicas e investigación complementaria (`referencias.md`)

---

## 📊 Rúbrica de Evaluación

| Criterio                            | Excelente (5)                                                         | Aceptable (3) / Insuficiente (1–2)                       |
|-------------------------------------|------------------------------------------------------------------------|-----------------------------------------------------------|
| Vista de contexto (C1)              | Muestra claramente actores, límites del sistema y relaciones externas | Faltan actores o relaciones clave                        |
| Vista de contenedores (C2)          | Módulos definidos, conectados y etiquetados claramente                 | Diagramas confusos o con contenedores mal estructurados  |
| Aplicación al cliente real          | Adaptación clara con explicación de decisiones                        | Copiado o genérico sin relación al cliente               |
| Documentación e investigación       | Informe estructurado y referencias relevantes                         | Informe superficial o sin sustento técnico               |

---

## ✅ Licencia

Este taller hace parte del curso de Arquitectura Empresarial - Universidad de La Sabana. Uso académico bajo licencia MIT.
