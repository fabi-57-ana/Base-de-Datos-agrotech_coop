SELECT s.id_sensor, s.nombre AS sensor, ts.nombre AS tipo_sensor, s.estado
FROM sensores s
JOIN tipos_sensores ts ON s.id_tipo_sensor = ts.id_tipo_sensor
JOIN mediciones m ON m.id_sensor = s.id_sensor
WHERE m.id_parcela = 1
ORDER BY s.id_sensor;
