SELECT
	iep.nombre_cliente AS "Nombre",
	iep.fecha_transaccion AS "Fecha",
	iep.tipo_comision AS L18,
	iep.id_desembolso AS "L19:Int:100",
	je.`name` AS "Asiento",
	iep.fecha_transaccion AS "Fecha",
	iep.monto_solicitado AS "Monto1"
FROM
	`tabINVERSIONES ESPANA PAGOS` iep
INNER JOIN `tabJournal Entry` je ON iep.id_desembolso = je.id_de_desembolso
WHERE
	iep.fecha_transaccion BETWEEN "2018-01-01" AND "2018-01-31" AND
	iep.metodo_credito = "Principal"
ORDER BY
	iep.nombre_cliente,
	iep.fecha_transaccion