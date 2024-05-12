
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 05/11/2024 21:18:13
-- Generated from EDMX file: C:\Users\marc2\Downloads\bd\TicTom\CapaDato\Models\LicTom.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [LicoTom];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Facultades'
CREATE TABLE [dbo].[Facultades] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [User] nvarchar(max)  NOT NULL,
    [Contraseña] nvarchar(max)  NOT NULL,
    [Trabajador_Id] int  NOT NULL
);
GO

-- Creating table 'Carreras'
CREATE TABLE [dbo].[Carreras] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Apellido] nvarchar(max)  NOT NULL,
    [Telefono] nvarchar(max)  NOT NULL,
    [Rol] int  NOT NULL
);
GO

-- Creating table 'Estudiantes'
CREATE TABLE [dbo].[Estudiantes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Codigo] nvarchar(max)  NOT NULL,
    [Fecha] nvarchar(max)  NOT NULL,
    [TrabajadorId] int  NOT NULL,
    [ProveedorId] int  NOT NULL
);
GO

-- Creating table 'OperadoraTelefonos'
CREATE TABLE [dbo].[OperadoraTelefonos] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Codigo] nvarchar(max)  NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Telefono] nvarchar(max)  NOT NULL,
    [CompraId] int  NOT NULL
);
GO

-- Creating table 'DetalleEstudianteTelefonos'
CREATE TABLE [dbo].[DetalleEstudianteTelefonos] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Cantidad] nvarchar(max)  NOT NULL,
    [TipoFinanza] nvarchar(max)  NOT NULL,
    [CompraId] int  NOT NULL,
    [ProductoId] int  NOT NULL
);
GO

-- Creating table 'ProductoSet'
CREATE TABLE [dbo].[ProductoSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Cantidad] nvarchar(max)  NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Precio] nvarchar(max)  NOT NULL,
    [Exixtencias] nvarchar(max)  NOT NULL,
    [Nivel] nvarchar(max)  NOT NULL,
    [Tipo] nvarchar(max)  NOT NULL,
    [CategoriaId] int  NOT NULL
);
GO

-- Creating table 'VentaSet'
CREATE TABLE [dbo].[VentaSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Codigo] nvarchar(max)  NOT NULL,
    [Fecha] nvarchar(max)  NOT NULL,
    [ClienteId] int  NOT NULL
);
GO

-- Creating table 'DetalleVentaSet'
CREATE TABLE [dbo].[DetalleVentaSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Cantidad] nvarchar(max)  NOT NULL,
    [Precio] nvarchar(max)  NOT NULL,
    [ProductoId] int  NOT NULL,
    [VentaId] int  NOT NULL
);
GO

-- Creating table 'ClienteSet'
CREATE TABLE [dbo].[ClienteSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Apellido] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'CategoriaSet'
CREATE TABLE [dbo].[CategoriaSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Codigo] nvarchar(max)  NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Descripcion] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Facultades'
ALTER TABLE [dbo].[Facultades]
ADD CONSTRAINT [PK_Facultades]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Carreras'
ALTER TABLE [dbo].[Carreras]
ADD CONSTRAINT [PK_Carreras]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Estudiantes'
ALTER TABLE [dbo].[Estudiantes]
ADD CONSTRAINT [PK_Estudiantes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'OperadoraTelefonos'
ALTER TABLE [dbo].[OperadoraTelefonos]
ADD CONSTRAINT [PK_OperadoraTelefonos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'DetalleEstudianteTelefonos'
ALTER TABLE [dbo].[DetalleEstudianteTelefonos]
ADD CONSTRAINT [PK_DetalleEstudianteTelefonos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ProductoSet'
ALTER TABLE [dbo].[ProductoSet]
ADD CONSTRAINT [PK_ProductoSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'VentaSet'
ALTER TABLE [dbo].[VentaSet]
ADD CONSTRAINT [PK_VentaSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'DetalleVentaSet'
ALTER TABLE [dbo].[DetalleVentaSet]
ADD CONSTRAINT [PK_DetalleVentaSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ClienteSet'
ALTER TABLE [dbo].[ClienteSet]
ADD CONSTRAINT [PK_ClienteSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'CategoriaSet'
ALTER TABLE [dbo].[CategoriaSet]
ADD CONSTRAINT [PK_CategoriaSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Trabajador_Id] in table 'Facultades'
ALTER TABLE [dbo].[Facultades]
ADD CONSTRAINT [FK_UsuarioTrabajador]
    FOREIGN KEY ([Trabajador_Id])
    REFERENCES [dbo].[Carreras]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UsuarioTrabajador'
CREATE INDEX [IX_FK_UsuarioTrabajador]
ON [dbo].[Facultades]
    ([Trabajador_Id]);
GO

-- Creating foreign key on [TrabajadorId] in table 'Estudiantes'
ALTER TABLE [dbo].[Estudiantes]
ADD CONSTRAINT [FK_TrabajadorCompra]
    FOREIGN KEY ([TrabajadorId])
    REFERENCES [dbo].[Carreras]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TrabajadorCompra'
CREATE INDEX [IX_FK_TrabajadorCompra]
ON [dbo].[Estudiantes]
    ([TrabajadorId]);
GO

-- Creating foreign key on [CompraId] in table 'DetalleEstudianteTelefonos'
ALTER TABLE [dbo].[DetalleEstudianteTelefonos]
ADD CONSTRAINT [FK_CompraDetalleCompra]
    FOREIGN KEY ([CompraId])
    REFERENCES [dbo].[Estudiantes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CompraDetalleCompra'
CREATE INDEX [IX_FK_CompraDetalleCompra]
ON [dbo].[DetalleEstudianteTelefonos]
    ([CompraId]);
GO

-- Creating foreign key on [ProveedorId] in table 'Estudiantes'
ALTER TABLE [dbo].[Estudiantes]
ADD CONSTRAINT [FK_ProveedorCompra]
    FOREIGN KEY ([ProveedorId])
    REFERENCES [dbo].[OperadoraTelefonos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProveedorCompra'
CREATE INDEX [IX_FK_ProveedorCompra]
ON [dbo].[Estudiantes]
    ([ProveedorId]);
GO

-- Creating foreign key on [ProductoId] in table 'DetalleEstudianteTelefonos'
ALTER TABLE [dbo].[DetalleEstudianteTelefonos]
ADD CONSTRAINT [FK_ProductoDetalleCompra]
    FOREIGN KEY ([ProductoId])
    REFERENCES [dbo].[ProductoSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductoDetalleCompra'
CREATE INDEX [IX_FK_ProductoDetalleCompra]
ON [dbo].[DetalleEstudianteTelefonos]
    ([ProductoId]);
GO

-- Creating foreign key on [ProductoId] in table 'DetalleVentaSet'
ALTER TABLE [dbo].[DetalleVentaSet]
ADD CONSTRAINT [FK_ProductoDetalleVenta]
    FOREIGN KEY ([ProductoId])
    REFERENCES [dbo].[ProductoSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductoDetalleVenta'
CREATE INDEX [IX_FK_ProductoDetalleVenta]
ON [dbo].[DetalleVentaSet]
    ([ProductoId]);
GO

-- Creating foreign key on [CategoriaId] in table 'ProductoSet'
ALTER TABLE [dbo].[ProductoSet]
ADD CONSTRAINT [FK_CategoriaProducto]
    FOREIGN KEY ([CategoriaId])
    REFERENCES [dbo].[CategoriaSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CategoriaProducto'
CREATE INDEX [IX_FK_CategoriaProducto]
ON [dbo].[ProductoSet]
    ([CategoriaId]);
GO

-- Creating foreign key on [VentaId] in table 'DetalleVentaSet'
ALTER TABLE [dbo].[DetalleVentaSet]
ADD CONSTRAINT [FK_VentaDetalleVenta]
    FOREIGN KEY ([VentaId])
    REFERENCES [dbo].[VentaSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_VentaDetalleVenta'
CREATE INDEX [IX_FK_VentaDetalleVenta]
ON [dbo].[DetalleVentaSet]
    ([VentaId]);
GO

-- Creating foreign key on [ClienteId] in table 'VentaSet'
ALTER TABLE [dbo].[VentaSet]
ADD CONSTRAINT [FK_ClienteVenta]
    FOREIGN KEY ([ClienteId])
    REFERENCES [dbo].[ClienteSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ClienteVenta'
CREATE INDEX [IX_FK_ClienteVenta]
ON [dbo].[VentaSet]
    ([ClienteId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------