SELECT p.nombre AS parcela, c.nombre AS cultivo, m.valor AS humedad, m.fecha
FROM mediciones m
JOIN sensores s ON m.id_sensor = s.id_sensor
JOIN tipos_sensores ts ON s.id_tipo_sensor = ts.id_tipo_sensor
JOIN parcelas p ON m.id_parcela = p.id_parcela
JOIN cultivos c ON p.id_cultivo = c.id_cultivo
WHERE ts.nombre = 'Humedad'
AND m.fecha = (
    SELECT MAX(m2.fecha)
    FROM mediciones m2
    JOIN sensores s2 ON m2.id_sensor = s2.id_sensor
    JOIN tipos_sensores ts2 ON s2.id_tipo_sensor = ts2.id_tipo_sensor
    WHERE ts2.nombre = 'Humedad'
    AND m2.id_parcela = m.id_parcela
)
ORDER BY p.id_parcela;

USE agrotech_coop;

SELECT p.nombre AS parcela, c.nombre AS cultivo, m.valor AS humedad, m.fecha
FROM mediciones m
JOIN sensores s ON m.id_sensor = s.id_sensor
JOIN tipos_sensores ts ON s.id_tipo_sensor = ts.id_tipo_sensor
JOIN parcelas p ON m.id_parcela = p.id_parcela
JOIN cultivos c ON p.id_cultivo = c.id_cultivo
WHERE ts.nombre = 'Humedad'
AND m.fecha = (
    SELECT MAX(m2.fecha)
    FROM mediciones m2
    JOIN sensores s2 ON m2.id_sensor = s2.id_sensor
    JOIN tipos_sensores ts2 ON s2.id_tipo_sensor = ts2.id_tipo_sensor
    WHERE ts2.nombre = 'Humedad'
    AND m2.id_parcela = m.id_parcela
)
ORDER BY p.id_parcela;
