SELECT
	tabCustomer.customer_name AS "Nombre:Data:150",
	iep.fecha_transaccion AS "Fecha",
	iep.id_desembolso AS "L19:Int:100",
	ief.ncf AS "Factura:Data:100",
	iep.monto_solicitado AS "Monto1:Data:150"
FROM
`tabINVERSIONES ESPANA PAGOS` iep
LEFT OUTER JOIN
-- `tabSales Invoice`
`tabInversiones Espana Facturas` ief
ON
-- `tabINVERSIONES ESPANA PAGOS`.id_desembolso = `tabSales Invoice`.id_de_desembolso AND
iep.id_desembolso = ief.id_desembolso AND
iep.monto_solicitado = ief.monto_facturado
LEFT JOIN
tabCustomer
ON
iep.id_cliente = tabCustomer.id
WHERE
iep.fecha_transaccion >= "2018-01-01" AND
iep.fecha_transaccion <= "2018-01-31" AND
iep.metodo_credito != "Principal" AND
iep.metodo_credito != "Comision"
ORDER BY
iep.nombre_cliente,
iep.fecha_transaccion,
ief.ncf