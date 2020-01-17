/*
   viernes, 17 de enero de 202009:34:28 a.m.
   Usuario: 
   Servidor: JUANBERMUDEZ-PC\SQL2014
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
ALTER TABLE dbo.LiquidacionPergamino
	DROP CONSTRAINT DF_LiquidacionPergamino_TotalDeducciones
GO
ALTER TABLE dbo.LiquidacionPergamino
	DROP CONSTRAINT DF_LiquidacionPergamino_ChkRentDef
GO
ALTER TABLE dbo.LiquidacionPergamino
	DROP CONSTRAINT DF_LiquidacionPergamino_ChkRent2
GO
ALTER TABLE dbo.LiquidacionPergamino
	DROP CONSTRAINT DF_LiquidacionPergamino_ChkRent3
GO
ALTER TABLE dbo.LiquidacionPergamino
	DROP CONSTRAINT DF_LiquidacionPergamino_ChkMuncImp
GO
CREATE TABLE dbo.Tmp_LiquidacionPergamino
	(
	IdLiquidacionPergamino int NOT NULL IDENTITY (1, 1) NOT FOR REPLICATION,
	Codigo varchar(30) NULL,
	Fecha datetime NULL,
	Precio decimal(38, 20) NULL,
	IdEstadoFisico int NULL,
	IdCategoriaImperfeccion int NULL,
	IdEstadoDocumento int NULL,
	IdMoneda int NULL,
	IdMonedaPreecio int NULL,
	IdMunicipio int NULL,
	SincronizadoESC bit NULL,
	NumeroReembolso varchar(10) NULL,
	IdTipoIngreso int NULL,
	IdCosecha int NULL,
	IdLocalidad int NULL,
	Cod_Proveedor nvarchar(50) NULL,
	IdTipoCompra int NULL,
	PrecioAutoriza float(53) NULL,
	TotalDeducciones float(53) NULL,
	ChkRentDef bit NULL,
	ChkRent2 bit NULL,
	ChkRent3 bit NULL,
	ChkMuncipal bit NULL,
	IdTipoCambio int NULL,
	Serie nvarchar(50) NULL,
	FechaSincronizacion datetime NULL,
	Serie2 nvarchar(5) NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_LiquidacionPergamino SET (LOCK_ESCALATION = TABLE)
GO
ALTER TABLE dbo.Tmp_LiquidacionPergamino ADD CONSTRAINT
	DF_LiquidacionPergamino_TotalDeducciones DEFAULT ((0)) FOR TotalDeducciones
GO
ALTER TABLE dbo.Tmp_LiquidacionPergamino ADD CONSTRAINT
	DF_LiquidacionPergamino_ChkRentDef DEFAULT ((0)) FOR ChkRentDef
GO
ALTER TABLE dbo.Tmp_LiquidacionPergamino ADD CONSTRAINT
	DF_LiquidacionPergamino_ChkRent2 DEFAULT ((0)) FOR ChkRent2
GO
ALTER TABLE dbo.Tmp_LiquidacionPergamino ADD CONSTRAINT
	DF_LiquidacionPergamino_ChkRent3 DEFAULT ((0)) FOR ChkRent3
GO
ALTER TABLE dbo.Tmp_LiquidacionPergamino ADD CONSTRAINT
	DF_LiquidacionPergamino_ChkMuncImp DEFAULT ((0)) FOR ChkMuncipal
GO
SET IDENTITY_INSERT dbo.Tmp_LiquidacionPergamino ON
GO
IF EXISTS(SELECT * FROM dbo.LiquidacionPergamino)
	 EXEC('INSERT INTO dbo.Tmp_LiquidacionPergamino (IdLiquidacionPergamino, Codigo, Fecha, Precio, IdEstadoFisico, IdCategoriaImperfeccion, IdEstadoDocumento, IdMoneda, IdMonedaPreecio, IdMunicipio, SincronizadoESC, NumeroReembolso, IdTipoIngreso, IdCosecha, IdLocalidad, Cod_Proveedor, IdTipoCompra, PrecioAutoriza, TotalDeducciones, ChkRentDef, ChkRent2, ChkRent3, ChkMuncipal, IdTipoCambio, Serie, FechaSincronizacion, Serie2)
		SELECT IdLiquidacionPergamino, Codigo, Fecha, Precio, IdEstadoFisico, IdCategoriaImperfeccion, IdEstadoDocumento, IdMoneda, IdMonedaPreecio, IdMunicipio, SincronizadoESC, NumeroReembolso, IdTipoIngreso, IdCosecha, IdLocalidad, Cod_Proveedor, IdTipoCompra, PrecioAutoriza, TotalDeducciones, ChkRentDef, ChkRent2, ChkRent3, ChkMuncipal, IdTipoCambio, Serie, FechaSincronizacion, CONVERT(nvarchar(5), Ser) FROM dbo.LiquidacionPergamino WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_LiquidacionPergamino OFF
GO
DROP TABLE dbo.LiquidacionPergamino
GO
EXECUTE sp_rename N'dbo.Tmp_LiquidacionPergamino', N'LiquidacionPergamino', 'OBJECT' 
GO
ALTER TABLE dbo.LiquidacionPergamino ADD CONSTRAINT
	PK_LiquidacionPergamino PRIMARY KEY CLUSTERED 
	(
	IdLiquidacionPergamino
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
COMMIT
