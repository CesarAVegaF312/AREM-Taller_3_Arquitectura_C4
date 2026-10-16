# Registro de Decisiones de Arquitectura

_Taller 3 - Arquitectura Actual del Sistema con el Modelo C4_

El Módulo 4 pide este archivo como entregable del taller: un diagrama sin las decisiones que lo explican es decoración, no documentación. Registre aquí **mínimo 3 decisiones** que tomaron al modelar las vistas C1 y C2 del cliente real, el glosario del dominio y los supuestos del modelo. En el Taller 9 estas decisiones se convierten en las ADR (Architecture Decision Records) del procedimiento de cambios, así que escríbalas pensando en que alguien las lea dentro de seis meses.

## Integrantes del equipo
- Nombre 1 (correo o usuario GitHub)
- Nombre 2
- Nombre 3

---

## 1. Decisiones (mínimo 3)

Una decisión de modelado también cuenta (por ejemplo, qué quedó dentro y qué quedó fuera del sistema en alcance del C1), siempre que tenga alternativas reales y una razón.

### D1. [Título corto de la decisión]

- **Decisión:** qué se decidió, en una frase.
- **Alternativas consideradas:** qué otras opciones había y por qué se descartaron.
- **Razón:** el criterio que inclinó la balanza (costo, restricción del cliente, tecnología existente, normativa, tiempo).
- **Consecuencia:** qué queda más fácil y qué queda más difícil a partir de ahora.

### D2. [Título corto de la decisión]

- **Decisión:**
- **Alternativas consideradas:**
- **Razón:**
- **Consecuencia:**

### D3. [Título corto de la decisión]

- **Decisión:**
- **Alternativas consideradas:**
- **Razón:**
- **Consecuencia:**

---

## 2. Glosario

Términos del negocio y del sistema tal como los usa el cliente, para que los diagramas y el informe hablen el mismo idioma.

| Término | Significado en este cliente | Dónde aparece (C1, C2, informe) |
|---------|-----------------------------|----------------------------------|
| Ej: Guía | Documento que identifica un envío desde que se recibe hasta que se entrega | C2 - Módulo de gestión de paquetes |
|         |                             |                                  |
|         |                             |                                  |

---

## 3. Supuestos

Lo que se dio por cierto sin poder verificarlo con el cliente. Cada supuesto es una pregunta pendiente para la siguiente reunión.

| Supuesto | Qué pasa si no se cumple | Cómo verificarlo |
|----------|--------------------------|------------------|
| Ej: La base de datos del ERP es la única fuente de clientes | Habría que agregar un contenedor y un flujo de sincronización al C2 | Preguntar al área de TI del cliente |
|          |                          |                  |
|          |                          |                  |

---

_Este documento hace parte de la entrega del Taller 3 del curso AREM (Arquitectura Empresarial) - Universidad de La Sabana._
