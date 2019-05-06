SELECT
	tabCustomer.customer_name AS "Nombre:Data:150",
	`tabINVERSIONES ESPANA PAGOS`.fecha_transaccion AS "Fecha",
	`tabINVERSIONES ESPANA PAGOS`.id_desembolso AS "L19:Int:100",
	`tabInversiones Espana Facturas`.ncf AS "Factura:Data:100",
	`tabINVERSIONES ESPANA PAGOS`.monto_solicitado AS "Monto1:Data:150"
FROM
`tabINVERSIONES ESPANA PAGOS`
LEFT OUTER JOIN
-- `tabSales Invoice`
`tabInversiones Espana Facturas`
ON
-- `tabINVERSIONES ESPANA PAGOS`.id_desembolso = `tabSales Invoice`.id_de_desembolso AND
`tabINVERSIONES ESPANA PAGOS`.id_desembolso = `tabInversiones Espana Facturas`.id_desembolso AND
`tabINVERSIONES ESPANA PAGOS`.monto_solicitado = `tabInversiones Espana Facturas`.monto_facturado
LEFT JOIN
tabCustomer
ON
`tabINVERSIONES ESPANA PAGOS`.id_cliente = tabCustomer.id
WHERE
`tabINVERSIONES ESPANA PAGOS`.fecha_transaccion >= "2018-01-01" AND
`tabINVERSIONES ESPANA PAGOS`.fecha_transaccion <= "2018-01-31" AND
`tabINVERSIONES ESPANA PAGOS`.metodo_credito != "Principal" AND
`tabINVERSIONES ESPANA PAGOS`.metodo_credito != "Comision"
ORDER BY
`tabINVERSIONES ESPANA PAGOS`.nombre_cliente,
`tabINVERSIONES ESPANA PAGOS`.fecha_transaccion,
`tabInversiones Espana Facturas`.ncf