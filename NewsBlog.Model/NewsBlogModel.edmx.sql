
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 09/14/2013 11:36:58
-- Generated from EDMX file: E:\Dropbox\Telerik\7-ma Chast\TeamWork\newsblog\NewsBlogProject\NewsBlog.Model\NewsBlogModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [db82a12eaf5a7a4f81a97ca21a00829c87];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Articles_Users]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Articles] DROP CONSTRAINT [FK_Articles_Users];
GO
IF OBJECT_ID(N'[dbo].[FK_Comments_Articles]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Comments] DROP CONSTRAINT [FK_Comments_Articles];
GO
IF OBJECT_ID(N'[dbo].[FK_Comments_Users]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Comments] DROP CONSTRAINT [FK_Comments_Users];
GO
IF OBJECT_ID(N'[dbo].[FK_Images_Articles]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Images] DROP CONSTRAINT [FK_Images_Articles];
GO
IF OBJECT_ID(N'[dbo].[FK_SubComments_Comments]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SubComments] DROP CONSTRAINT [FK_SubComments_Comments];
GO
IF OBJECT_ID(N'[dbo].[FK_SubComments_Users]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SubComments] DROP CONSTRAINT [FK_SubComments_Users];
GO
IF OBJECT_ID(N'[dbo].[FK_Votes_Articles]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Votes] DROP CONSTRAINT [FK_Votes_Articles];
GO
IF OBJECT_ID(N'[dbo].[FK_Votes_Users]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Votes] DROP CONSTRAINT [FK_Votes_Users];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Articles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Articles];
GO
IF OBJECT_ID(N'[dbo].[Comments]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Comments];
GO
IF OBJECT_ID(N'[dbo].[Images]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Images];
GO
IF OBJECT_ID(N'[dbo].[SubComments]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SubComments];
GO
IF OBJECT_ID(N'[dbo].[sysdiagrams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sysdiagrams];
GO
IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO
IF OBJECT_ID(N'[dbo].[Votes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Votes];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Articles'
CREATE TABLE [dbo].[Articles] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(255)  NOT NULL,
    [Content] nvarchar(max)  NOT NULL,
    [Date] datetime  NOT NULL,
    [AuthorId] int  NOT NULL
);
GO

-- Creating table 'Comments'
CREATE TABLE [dbo].[Comments] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Content] nvarchar(max)  NOT NULL,
    [AuthorId] int  NOT NULL,
    [Date] datetime  NOT NULL,
    [ArticleId] int  NOT NULL
);
GO

-- Creating table 'SubComments'
CREATE TABLE [dbo].[SubComments] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ParentComment] int  NOT NULL,
    [Content] nvarchar(max)  NOT NULL,
    [AuthorId] int  NOT NULL,
    [Date] datetime  NOT NULL
);
GO

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Username] nvarchar(100)  NOT NULL,
    [Password] nvarchar(50)  NOT NULL,
    [SessionKey] nvarchar(40)  NULL
);
GO

-- Creating table 'Votes'
CREATE TABLE [dbo].[Votes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [AuthorId] int  NOT NULL,
    [ArticleId] int  NOT NULL,
    [Value] bit  NOT NULL
);
GO

-- Creating table 'Images'
CREATE TABLE [dbo].[Images] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ArticleId] int  NOT NULL,
    [Url] nvarchar(255)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Articles'
ALTER TABLE [dbo].[Articles]
ADD CONSTRAINT [PK_Articles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Comments'
ALTER TABLE [dbo].[Comments]
ADD CONSTRAINT [PK_Comments]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SubComments'
ALTER TABLE [dbo].[SubComments]
ADD CONSTRAINT [PK_SubComments]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- Creating primary key on [Id] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Votes'
ALTER TABLE [dbo].[Votes]
ADD CONSTRAINT [PK_Votes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Images'
ALTER TABLE [dbo].[Images]
ADD CONSTRAINT [PK_Images]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [AuthorId] in table 'Articles'
ALTER TABLE [dbo].[Articles]
ADD CONSTRAINT [FK_Articles_Users]
    FOREIGN KEY ([AuthorId])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Articles_Users'
CREATE INDEX [IX_FK_Articles_Users]
ON [dbo].[Articles]
    ([AuthorId]);
GO

-- Creating foreign key on [ArticleId] in table 'Comments'
ALTER TABLE [dbo].[Comments]
ADD CONSTRAINT [FK_Comments_Articles]
    FOREIGN KEY ([ArticleId])
    REFERENCES [dbo].[Articles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Comments_Articles'
CREATE INDEX [IX_FK_Comments_Articles]
ON [dbo].[Comments]
    ([ArticleId]);
GO

-- Creating foreign key on [ArticleId] in table 'Votes'
ALTER TABLE [dbo].[Votes]
ADD CONSTRAINT [FK_Votes_Articles]
    FOREIGN KEY ([ArticleId])
    REFERENCES [dbo].[Articles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Votes_Articles'
CREATE INDEX [IX_FK_Votes_Articles]
ON [dbo].[Votes]
    ([ArticleId]);
GO

-- Creating foreign key on [AuthorId] in table 'Comments'
ALTER TABLE [dbo].[Comments]
ADD CONSTRAINT [FK_Comments_Users]
    FOREIGN KEY ([AuthorId])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Comments_Users'
CREATE INDEX [IX_FK_Comments_Users]
ON [dbo].[Comments]
    ([AuthorId]);
GO

-- Creating foreign key on [ParentComment] in table 'SubComments'
ALTER TABLE [dbo].[SubComments]
ADD CONSTRAINT [FK_SubComments_Comments]
    FOREIGN KEY ([ParentComment])
    REFERENCES [dbo].[Comments]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SubComments_Comments'
CREATE INDEX [IX_FK_SubComments_Comments]
ON [dbo].[SubComments]
    ([ParentComment]);
GO

-- Creating foreign key on [AuthorId] in table 'SubComments'
ALTER TABLE [dbo].[SubComments]
ADD CONSTRAINT [FK_SubComments_Users]
    FOREIGN KEY ([AuthorId])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SubComments_Users'
CREATE INDEX [IX_FK_SubComments_Users]
ON [dbo].[SubComments]
    ([AuthorId]);
GO

-- Creating foreign key on [AuthorId] in table 'Votes'
ALTER TABLE [dbo].[Votes]
ADD CONSTRAINT [FK_Votes_Users]
    FOREIGN KEY ([AuthorId])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Votes_Users'
CREATE INDEX [IX_FK_Votes_Users]
ON [dbo].[Votes]
    ([AuthorId]);
GO

-- Creating foreign key on [ArticleId] in table 'Images'
ALTER TABLE [dbo].[Images]
ADD CONSTRAINT [FK_Images_Articles]
    FOREIGN KEY ([ArticleId])
    REFERENCES [dbo].[Articles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Images_Articles'
CREATE INDEX [IX_FK_Images_Articles]
ON [dbo].[Images]
    ([ArticleId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------