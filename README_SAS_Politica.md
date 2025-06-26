# 🗳️ SAS_Politica

Este proyecto realiza un **Análisis de Correspondencias (CA)** sobre datos de preferencias ideológicas y fiscales de una muestra de individuos, con el fin de estudiar la relación entre la **ideología política** y la **actitud hacia los impuestos y servicios públicos**.

## 👤 Autor

**Alexandro Bazán**  
Universidad Complutense de Madrid  
Curso 2024

## 📁 Archivos incluidos

| Archivo | Descripción |
|--------|-------------|
| `Politica.sas` | Código SAS que ejecuta el análisis de correspondencias. |
| `politica.sas7bdat` | Base de datos en formato SAS con las respuestas de la muestra. |
| `DatosCorrespondencias.xlsx` | Datos fuente complementarios en formato Excel. |
| `Examen 3 Alexandro Bazán.pdf` | Informe detallado con el análisis e interpretación de resultados. |

## 📌 Objetivos del análisis

- Examinar cómo se relacionan las **preferencias sobre impuestos/servicios** con la **ideología política** (de izquierda a derecha).
- Representar gráficamente los **perfiles fila y columna**, **valores esperados**, y **contribuciones al estadístico Chi-cuadrado**.
- Identificar qué categorías están más relacionadas o explican mayor inercia en el espacio bidimensional.

## 🔍 Principales resultados

- **Chi-cuadrado = 454.86**, p-valor < 0.0001 → fuerte evidencia de dependencia entre las variables.
- **Contribuciones altas** al Chi-cuadrado en los extremos:  
  - Personas de izquierda (1) que prefieren pagar más impuestos (9).
  - Personas de derecha (9) que prefieren pagar menos impuestos (1).
- **87.7% de la inercia** explicada por las dos primeras dimensiones (autovalores: 0.36806 y 0.15907).
- La **categoría 5** (posición fiscal moderada) es la peor explicada por las dos dimensiones.

## 🗺️ Visualizaciones generadas

- Gráficos de líneas de perfiles fila y columna.
- Mapas de calor de contribuciones al Chi-cuadrado.
- Gráfico factorial conjunto (fila vs columna) interpretado políticamente.

## 🧠 Herramientas utilizadas

- SAS (`PROC CORRESP`, `ODS OUTPUT`, `ODS GRAPHICS`)
- Microsoft Excel (revisión de datos)
- PDF (informe detallado del examen)

## 📚 Notas

Este proyecto analiza la correspondencia entre dos variables categóricas ordinales: **ideología política** (1–9) y **nivel preferido de impuestos/servicios públicos** (1–9). El análisis evidencia una asociación política clara y estadísticamente significativa, alineando extremos ideológicos con posturas fiscales opuestas.