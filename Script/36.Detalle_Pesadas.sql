/*
   sábado, 07 de septiembre de 201912:59:34 p.m.
   Usuario: 
   Servidor: WIN-M13RQ730J8P\SQL2014
   Base de datos: TRANSPORTE
   Aplicación: 
*/

/* Para evitar posibles problemas de pérdida de datos, debe revisar este script detalladamente antes de ejecutarlo fuera del contexto del diseñador de base de datos.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Detalle_Pesadas ADD
	IdRemisionPergamino int NULL
GO
ALTER TABLE dbo.Detalle_Pesadas SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
