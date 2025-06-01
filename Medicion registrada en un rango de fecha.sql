SELECT p.nombre AS parcela, c.nombre AS cultivo, ts.nombre AS tipo_sensor, m.valor, m.fecha
FROM mediciones m
JOIN parcelas p ON m.id_parcela = p.id_parcela
JOIN cultivos c ON p.id_cultivo = c.id_cultivo
JOIN sensores s ON m.id_sensor = s.id_sensor
JOIN tipos_sensores ts ON s.id_tipo_sensor = ts.id_tipo_sensor
WHERE m.fecha BETWEEN '2025-06-01 09:00:00' AND '2025-06-01 11:00:00'
ORDER BY m.fecha;