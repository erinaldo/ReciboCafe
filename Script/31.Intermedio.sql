/*
   martes, 30 de julio de 201910:37:21 a.m.
   Usuario: 
   Servidor: JUANBERMUDEZ\SQL2014
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
ALTER TABLE dbo.Intermedio ADD
	ConfirmadoIntermedio bit NULL
GO
ALTER TABLE dbo.Intermedio ADD CONSTRAINT
	DF_Intermedio_ConfirmadoIntermedio DEFAULT 0 FOR ConfirmadoIntermedio
GO
ALTER TABLE dbo.Intermedio SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
