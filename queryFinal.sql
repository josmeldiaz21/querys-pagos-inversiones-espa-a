SELECT
c.customer_name,
	NULL AS L1,
	NULL AS L2,
	NULL AS L3,
	NULL AS L4,
	NULL AS L5,
	NULL AS L6,
	NULL AS L7,
	NULL AS L8,
	NULL AS L9,
iep.fecha_transaccion,
	NULL AS L11,
	NULL AS L12,
	NULL AS L13,
	NULL AS L14,
	NULL AS L15,
	NULL AS L16,
	NULL AS L17,
iep.tipo_comision AS L18,
iep.id_desembolso AS "L19:Int:100",
ief.ncf,
iep.fecha_transaccion AS "Fecha",
	NULL AS L22,
iep.monto_solicitado AS "Monto1:Data:150",
iep.monto_solicitado AS "Monto2:Data:150",
iep.monto_solicitado AS "Monto3:Data:150",
	NULL AS L23,
	CASE iep.monto_comision
WHEN "200-02-960-042041-8" THEN
	"110107 - BANCO DE RESERVAS / CTA AHORRO USD #9600420418 - IE"
WHEN "b-0000000111" THEN
	"110101 - CAJA GENERAL - IE"
WHEN "1-108-100-000133-5" THEN
	"110103 - BANCO SANTA CRUZ / CTA. CORRIENTE DOP #11081000001335 - IE"
WHEN "200-02-960-041947-4" THEN
	"110106 - BANCO DE RESERVAS / CTA CORRIENTE DOP #9600419474 - IE"
WHEN "2612623-0018" THEN
	"110105 - BANCO BHD / CTA. CORRIENTE DOP #26126230018 - IE"
WHEN "1-108-201-000951-3" THEN
	"110104 - BANCO SANTA CRUZ / CTA. AHORRO DOP #11082010009513 - IE"
END AS "Cuenta"
FROM
`tabINVERSIONES ESPANA DESEMBOLSOS` ied
LEFT JOIN
`tabINVERSIONES ESPANA PAGOS` iep
ON
ied.desembolso = iep.id_desembolso
RIGHT JOIN
`tabInversiones Espana Facturas` ief
ON
ied.desembolso = ief.id_desembolso and
ied.monto_comision = ief.monto_facturado
LEFT JOIN
tabCustomer c
ON
iep.id_cliente = c.id
WHERE
iep.metodo_credito = "Comision" AND
iep.fecha_transaccion >= %(from_date)s AND
iep.fecha_transaccion <= %(to_date)s
UNION
SELECT
	c.customer_name,
	NULL AS L1,
	NULL AS L2,
	NULL AS L3,
	NULL AS L4,
	NULL AS L5,
	NULL AS L6,
	NULL AS L7,
	NULL AS L8,
	NULL AS L9,
	iep.fecha_transaccion AS "Fecha",
	NULL AS L11,
	NULL AS L12,
	NULL AS L13,
	NULL AS L14,
	NULL AS L15,
	NULL AS L16,
	NULL AS L17,
	iep.tipo_comision AS L18,
	iep.id_desembolso AS "L19:Int:100",
	ief.ncf,
	iep.fecha_transaccion AS "Fecha",
	NULL AS L22,
	iep.monto_solicitado AS "Monto1:Data:150",
	iep.monto_solicitado AS "Monto2:Data:150",
	iep.monto_solicitado AS "Monto3:Data:150",
NULL AS L23,
	CASE iep.monto_comision
WHEN "200-02-960-042041-8" THEN
	"110107 - BANCO DE RESERVAS / CTA AHORRO USD #9600420418 - IE"
WHEN "b-0000000111" THEN
	"110101 - CAJA GENERAL - IE"
WHEN "1-108-100-000133-5" THEN
	"110103 - BANCO SANTA CRUZ / CTA. CORRIENTE DOP #11081000001335 - IE"
WHEN "200-02-960-041947-4" THEN
	"110106 - BANCO DE RESERVAS / CTA CORRIENTE DOP #9600419474 - IE"
WHEN "2612623-0018" THEN
	"110105 - BANCO BHD / CTA. CORRIENTE DOP #26126230018 - IE"
WHEN "1-108-201-000951-3" THEN
	"110104 - BANCO SANTA CRUZ / CTA. AHORRO DOP #11082010009513 - IE"
END AS "Cuenta"
FROM
`tabINVERSIONES ESPANA PAGOS` iep
LEFT OUTER JOIN
`tabInversiones Espana Facturas` ief
ON
iep.id_desembolso = ief.id_desembolso AND
iep.monto_solicitado = ief.monto_facturado
LEFT JOIN
tabCustomer c
ON
iep.id_cliente = c.id
WHERE
iep.fecha_transaccion >= %(from_date)s AND
iep.fecha_transaccion <= %(to_date)s AND
iep.metodo_credito != "Principal" AND
iep.metodo_credito != "Comision"
UNION
SELECT
	c.customer_name,
	NULL AS L1,
	NULL AS L2,
	NULL AS L3,
	NULL AS L4,
	NULL AS L5,
	NULL AS L6,
	NULL AS L7,
	NULL AS L8,
	NULL AS L9,
	iep.fecha_transaccion AS "Fecha",
	NULL AS L11,
	NULL AS L12,
	NULL AS L13,
	NULL AS L14,
	NULL AS L15,
	NULL AS L16,
	NULL AS L17,
iep.tipo_comision AS L18,
	iep.id_desembolso AS "L19:Int:100",
	je.`name`,
iep.fecha_transaccion AS "Fecha",
NULL AS L22,
	iep.monto_solicitado AS "Monto1",
	iep.monto_solicitado AS "Monto2",
	iep.monto_solicitado AS "Monto3",
	NULL AS L23,
	CASE iep.monto_comision
WHEN "200-02-960-042041-8" THEN
	"110107 - BANCO DE RESERVAS / CTA AHORRO USD #9600420418 - IE"
WHEN "b-0000000111" THEN
	"110101 - CAJA GENERAL - IE"
WHEN "1-108-100-000133-5" THEN
	"110103 - BANCO SANTA CRUZ / CTA. CORRIENTE DOP #11081000001335 - IE"
WHEN "200-02-960-041947-4" THEN
	"110106 - BANCO DE RESERVAS / CTA CORRIENTE DOP #9600419474 - IE"
WHEN "2612623-0018" THEN
	"110105 - BANCO BHD / CTA. CORRIENTE DOP #26126230018 - IE"
WHEN "1-108-201-000951-3" THEN
	"110104 - BANCO SANTA CRUZ / CTA. AHORRO DOP #11082010009513 - IE"
END AS "Cuenta"
FROM
	`tabINVERSIONES ESPANA PAGOS` iep
LEFT JOIN `tabJournal Entry` je
ON
iep.id_desembolso = je.id_de_desembolso
LEFT JOIN
tabCustomer c
ON
iep.id_cliente = c.id
WHERE
	iep.fecha_transaccion BETWEEN %(from_date)s AND %(to_date)s AND
	IF(iep.id_desembolso = je.id_de_desembolso,iep.metodo_credito = "Principal",iep.metodo_credito = "Comision")
UNION
SELECT
	c.customer_name,
	NULL AS L1,
	NULL AS L2,
	NULL AS L3,
	NULL AS L4,
	NULL AS L5,
	NULL AS L6,
	NULL AS L7,
	NULL AS L8,
	NULL AS L9,
	iep.fecha_transaccion AS "Fecha",
	NULL AS L11,
	NULL AS L12,
	NULL AS L13,
	NULL AS L14,
	NULL AS L15,
	NULL AS L16,
	NULL AS L17,
	iep.tipo_comision AS L18,
	iep.id_desembolso AS "L19:Int:100",
	je.`name`,
	iep.fecha_transaccion AS "Fecha",
	NULL AS L22,
	iep.monto_solicitado AS "Monto1",
	iep.monto_solicitado AS "Monto2",
	iep.monto_solicitado AS "Monto3",
	NULL AS L23,
	CASE iep.monto_comision
WHEN "200-02-960-042041-8" THEN
	"110107 - BANCO DE RESERVAS / CTA AHORRO USD #9600420418 - IE"
WHEN "b-0000000111" THEN
	"110101 - CAJA GENERAL - IE"
WHEN "1-108-100-000133-5" THEN
	"110103 - BANCO SANTA CRUZ / CTA. CORRIENTE DOP #11081000001335 - IE"
WHEN "200-02-960-041947-4" THEN
	"110106 - BANCO DE RESERVAS / CTA CORRIENTE DOP #9600419474 - IE"
WHEN "2612623-0018" THEN
	"110105 - BANCO BHD / CTA. CORRIENTE DOP #26126230018 - IE"
WHEN "1-108-201-000951-3" THEN
	"110104 - BANCO SANTA CRUZ / CTA. AHORRO DOP #11082010009513 - IE"
END AS "Cuenta"
FROM
	`tabINVERSIONES ESPANA PAGOS` iep
LEFT JOIN `tabJournal Entry` je
ON iep.id_desembolso = je.id_de_desembolso
LEFT JOIN
tabCustomer c
ON
iep.id_cliente = c.id
WHERE
	iep.fecha_transaccion BETWEEN %(from_date)s AND %(to_date)s AND
	iep.metodo_credito = "Principal"
ORDER BY
customer_name,
fecha_transaccion,
ncf