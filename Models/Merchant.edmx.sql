
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 06/04/2015 16:41:38
-- Generated from EDMX file: C:\Users\Haseeb\documents\visual studio 2013\Projects\The Merchant\The Merchant\Models\Merchant.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [merchantDb];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Cart_Item]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Cart] DROP CONSTRAINT [FK_Cart_Item];
GO
IF OBJECT_ID(N'[dbo].[FK_Cart_User]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Cart] DROP CONSTRAINT [FK_Cart_User];
GO
IF OBJECT_ID(N'[dbo].[FK_Item_Dealer]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Item] DROP CONSTRAINT [FK_Item_Dealer];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Cart]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Cart];
GO
IF OBJECT_ID(N'[dbo].[Dealer]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Dealer];
GO
IF OBJECT_ID(N'[dbo].[Item]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Item];
GO
IF OBJECT_ID(N'[dbo].[User]', 'U') IS NOT NULL
    DROP TABLE [dbo].[User];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Carts'
CREATE TABLE [dbo].[Carts] (
    [CartId] int IDENTITY(1,1) NOT NULL,
    [UserId] int  NOT NULL,
    [ItemId] int  NOT NULL,
    [Quantity] int  NOT NULL,
    [SubTotal] float  NOT NULL
);
GO

-- Creating table 'Dealers'
CREATE TABLE [dbo].[Dealers] (
    [DId] int IDENTITY(1,1) NOT NULL,
    [DName] varchar(50)  NOT NULL,
    [Company] varchar(50)  NOT NULL
);
GO

-- Creating table 'Items'
CREATE TABLE [dbo].[Items] (
    [ItemId] int IDENTITY(1,1) NOT NULL,
    [DealerId] int  NOT NULL,
    [Path] varchar(50)  NOT NULL,
    [Description] varchar(50)  NOT NULL,
    [Price] int  NOT NULL,
    [ItemName] varchar(50)  NOT NULL,
    [Quantity] int  NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [UId] int IDENTITY(1,1) NOT NULL,
    [FName] varchar(50)  NOT NULL,
    [LName] varchar(50)  NULL,
    [Password] varchar(50)  NOT NULL,
    [Email] varchar(50)  NOT NULL,
    [Type] varchar(50)  NOT NULL,
    [Address] varchar(50)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [CartId] in table 'Carts'
ALTER TABLE [dbo].[Carts]
ADD CONSTRAINT [PK_Carts]
    PRIMARY KEY CLUSTERED ([CartId] ASC);
GO

-- Creating primary key on [DId] in table 'Dealers'
ALTER TABLE [dbo].[Dealers]
ADD CONSTRAINT [PK_Dealers]
    PRIMARY KEY CLUSTERED ([DId] ASC);
GO

-- Creating primary key on [ItemId] in table 'Items'
ALTER TABLE [dbo].[Items]
ADD CONSTRAINT [PK_Items]
    PRIMARY KEY CLUSTERED ([ItemId] ASC);
GO

-- Creating primary key on [UId] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([UId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [ItemId] in table 'Carts'
ALTER TABLE [dbo].[Carts]
ADD CONSTRAINT [FK_Cart_Item]
    FOREIGN KEY ([ItemId])
    REFERENCES [dbo].[Items]
        ([ItemId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Cart_Item'
CREATE INDEX [IX_FK_Cart_Item]
ON [dbo].[Carts]
    ([ItemId]);
GO

-- Creating foreign key on [UserId] in table 'Carts'
ALTER TABLE [dbo].[Carts]
ADD CONSTRAINT [FK_Cart_User]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Users]
        ([UId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Cart_User'
CREATE INDEX [IX_FK_Cart_User]
ON [dbo].[Carts]
    ([UserId]);
GO

-- Creating foreign key on [DealerId] in table 'Items'
ALTER TABLE [dbo].[Items]
ADD CONSTRAINT [FK_Item_Dealer]
    FOREIGN KEY ([DealerId])
    REFERENCES [dbo].[Dealers]
        ([DId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Item_Dealer'
CREATE INDEX [IX_FK_Item_Dealer]
ON [dbo].[Items]
    ([DealerId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------