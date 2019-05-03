SELECT
iep.nombre_cliente,
iep.fecha_transaccion,
iep.id_desembolso,
-- null as "asiento",
ief.ncf,
iep.monto_solicitado,
ied.monto_comision
FROM
`tabINVERSIONES ESPANA DESEMBOLSOS` ied
LEFT JOIN
`tabINVERSIONES ESPANA PAGOS` iep
ON
ied.desembolso = iep.id_desembolso
LEFT JOIN
`tabInversiones Espana Facturas` ief
ON
ied.desembolso = ief.id_desembolso and
-- iep.monto_solicitado = ief.monto_facturado   
ied.monto_comision = ief.monto_facturado
WHERE
iep.metodo_credito = "Comision" and
ied.tipo_comision = "Capitalizadas"
ORDER BY
iep.nombre_cliente