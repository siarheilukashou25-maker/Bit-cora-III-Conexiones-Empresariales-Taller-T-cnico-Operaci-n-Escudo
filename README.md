# **Fundamentos de Seguridad y Auditoría**
**Reto de Investigación 1**
1. *Syslog* - estandar para enviar mensajes de registro de una red informatica.
2.  *Un mensaje de registro suele tener información sobre la seguridad del sistema, aunque puede contener cualquier información.*
3. *El sistema Syslog clasifica los eventos mediante el cruce de las variables "facility" (facilidad u origen) y "severity" (severidad o nivel), las cuales se combinan para determinar la prioridad y el destino de cada mensaje.*
4.  Facility (Origen): Indica qué parte del sistema generó el mensaje. Kernel, procesos de usuario, correo y etc.
5. Severity (Severidad): Define la urgencia o importancia del evento en una escala numérica del 0 al 7 donde 0 es **Sistema inutilizable** y 7 **Información detallada para depuración**
6. *La fórmula utilizada es: PRI=(Facility×8)+Severity*  [1][2]

**Reto de Investigación 2**
Hace mas dificil atacar servidor ya que el aceso a los logs se hace mas dificil de acceder. Protege datos personales. Mejor control de acesso. Menos avisos falsos. [3]

[1] "Linux Syslog Explained: Configuration and Tips" last9.io. https://last9.io/blog/linux-syslog-explained/ (accessed 17/04/2026).
[2] "Syslog Levels Made Simple: Why They Matter for Your Logs" last9.io.  https://last9.io/blog/what-are-syslog-levels/ (accessed 17/04/2026).
[3] "Dialnet Log Management" dialnet.unirioja.es.  https://dialnet.unirioja.es/buscar/documentos?querysDismax.DOCUMENTAL_TODO=Log+Management (accessed 17/04/2026).
