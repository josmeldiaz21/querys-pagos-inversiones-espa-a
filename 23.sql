SELECT
	`tabINVERSIONES ESPANA PAGOS`.nombre_cliente AS "Nombre",
	`tabINVERSIONES ESPANA PAGOS`.fecha_transaccion AS "Fecha",
	`tabINVERSIONES ESPANA PAGOS`.tipo_comision AS L18,
	`tabINVERSIONES ESPANA PAGOS`.id_desembolso AS "L19:Int:100",
	`tabJournal Entry`.`name` AS "Asiento",
	`tabINVERSIONES ESPANA PAGOS`.fecha_transaccion AS "Fecha",
	`tabINVERSIONES ESPANA PAGOS`.monto_solicitado AS "Monto1"
FROM
	`tabINVERSIONES ESPANA PAGOS`
INNER JOIN `tabJournal Entry` ON `tabINVERSIONES ESPANA PAGOS`.id_desembolso = `tabJournal Entry`.id_de_desembolso
WHERE
	`tabINVERSIONES ESPANA PAGOS`.fecha_transaccion BETWEEN "2018-01-01" AND "2018-01-31" AND
	`tabINVERSIONES ESPANA PAGOS`.metodo_credito = "Principal"
ORDER BY
	`tabINVERSIONES ESPANA PAGOS`.nombre_cliente,
	`tabINVERSIONES ESPANA PAGOS`.fecha_transaccion