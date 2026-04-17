#!/bin/bash
# --- CONFIGURACIÓN DE VARIABLES ---
# Definimos el archivo de salida y el rango de tiempo (ej: 3 hours ago)
REPORTE="alertas.txt"
TIEMPO="3 hours ago"
AHORA=$(date "+%Y-%m-%d %H:%M:%S")
# 1. GENERAR EL ENCABEZADO
# Sobrescribimos el archivo (>) con la fecha actual
echo "--------------------------------------------------" > $REPORTE
echo "REPORTE DE INTENTOS FALLIDOS - $AHORA" >> $REPORTE
echo "Rango analizado: Últimas $TIEMPO" >> $REPORTE
echo "--------------------------------------------------" >> $REPORTE

# 2. FILTRAR Y PROCESAR DATOS
# Extraemos los logs de SSH, filtramos fallos y limpiamos el texto
# - journalctl: Extrae logs del servicio ssh desde el tiempo indicado
# - grep: Se queda solo con las líneas de "Failed password"
# - awk: Extrae la columna 1, 2, 3 (fecha), 9 (usuario) y 11 (IP)
LOGS_LIMPIOS=$(sudo journalctl -u ssh --since "$TIEMPO" | grep "Failed password" | awk '{print $1, $2, $3, "- Usuario:", $9, "- IP:", $11}')

# 3. CONTAR ERRORES
# Usamos 'wc -l' para contar cuántas líneas (intentos) resultaron del filtrado
# Redirigimos el error a /dev/null por si la variable está vacía
TOTAL_ERRORES=$(echo "$LOGS_LIMPIOS" | grep -c "Usuario")

# 4. ESCRIBIR RESULTADOS AL ARCHIVO
echo "Total de intentos detectados: $TOTAL_ERRORES" >> $REPORTE
echo "" >> $REPORTE
echo "Detalle de los intentos:" >> $REPORTE
echo "$LOGS_LIMPIOS" >> $REPORTE

# Mensaje de confirmación en consola
echo "Análisis completado. Se han detectado $TOTAL_ERRORES fallos. Reporte guardado en $REPORTE."
