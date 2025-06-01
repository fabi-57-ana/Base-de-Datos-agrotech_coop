SELECT s.id_sensor, s.nombre AS sensor, s.estado
FROM sensores s
JOIN tipos_sensores ts ON s.id_tipo_sensor = ts.id_tipo_sensor
WHERE ts.nombre = 'Temperatura'
ORDER BY s.id_sensor;