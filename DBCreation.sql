﻿IF OBJECT_ID(N'dbo.TaskUpdate','U') IS NOT NULL BEGIN
    DROP TABLE dbo.TaskUpdate
END

IF OBJECT_ID(N'dbo.Task','U') IS NOT NULL BEGIN
    DROP TABLE dbo.Task
END

IF OBJECT_ID(N'dbo.ChangeRequest','U') IS NOT NULL BEGIN
    DROP TABLE dbo.ChangeRequest
END

IF OBJECT_ID(N'dbo.Test','U') IS NOT NULL BEGIN
    DROP TABLE dbo.Test
END


IF OBJECT_ID(N'dbo.BacklogItem','U') IS NOT NULL BEGIN
    DROP TABLE dbo.BacklogItem
END


IF OBJECT_ID(N'dbo.TeamMember','U') IS NOT NULL BEGIN
    DROP TABLE dbo.TeamMember
END

IF OBJECT_ID(N'dbo.Team','U') IS NOT NULL BEGIN
    DROP TABLE dbo.Team
END

IF OBJECT_ID(N'dbo.Sprint','U') IS NOT NULL BEGIN
    DROP TABLE dbo.Sprint
END

IF OBJECT_ID(N'dbo.Project','U') IS NOT NULL BEGIN
    DROP TABLE dbo.Project
END

IF OBJECT_ID(N'dbo.[User]','U') IS NOT NULL BEGIN
    DROP TABLE dbo.[User]
END

IF OBJECT_ID(N'dbo.Company','U') IS NOT NULL BEGIN
    DROP TABLE dbo.Company
END

IF OBJECT_ID(N'dbo.Approval','U') IS NOT NULL BEGIN
    DROP TABLE dbo.Approval
END

IF OBJECT_ID(N'dbo.Impact','U') IS NOT NULL BEGIN
    DROP TABLE dbo.Impact
END

IF OBJECT_ID(N'dbo.ChangeType','U') IS NOT NULL BEGIN
    DROP TABLE dbo.ChangeType
END

IF OBJECT_ID(N'dbo.TaskState','U') IS NOT NULL BEGIN
    DROP TABLE dbo.TaskState
END

IF OBJECT_ID(N'dbo.[Priority]','U') IS NOT NULL BEGIN
    DROP TABLE dbo.[Priority]
END

IF OBJECT_ID(N'dbo.TestOutcome','U') IS NOT NULL BEGIN
    DROP TABLE dbo.TestOutcome
END

IF OBJECT_ID(N'dbo.VersionOrigin','U') IS NOT NULL BEGIN
    DROP TABLE dbo.VersionOrigin
END


CREATE TABLE Approval(
	Id INT PRIMARY KEY,
	Name NVARCHAR(100) NOT NULL,
	Erased BIT NOT NULL DEFAULT 0,
)	

CREATE TABLE Impact(
	Id INT PRIMARY KEY,
	Name NVARCHAR(100) NOT NULL,
	Erased BIT NOT NULL DEFAULT 0,
)	

CREATE TABLE ChangeType(
	Id INT PRIMARY KEY,
	Name NVARCHAR(100) NOT NULL,
	Erased BIT NOT NULL DEFAULT 0,
)	

CREATE TABLE [Priority](
	Id INT PRIMARY KEY,
	Name NVARCHAR(100) NOT NULL,
	Erased BIT NOT NULL DEFAULT 0,
)	

CREATE TABLE TestOutcome(
	Id INT PRIMARY KEY,
	Name NVARCHAR(100) NOT NULL,
	Erased BIT NOT NULL DEFAULT 0,
)	

CREATE TABLE VersionOrigin(
	Id INT PRIMARY KEY,
	Name NVARCHAR(100) NOT NULL,
	Erased BIT NOT NULL DEFAULT 0,
)	

CREATE TABLE TaskState(
	Id INT PRIMARY KEY,
	Name NVARCHAR(100) NOT NULL,
	Erased BIT NOT NULL DEFAULT 0,
)

CREATE TABLE Company(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Name NVARCHAR(100) NOT NULL,
	Description NVARCHAR(255) NULL,
	Erased BIT NOT NULL DEFAULT 0,
	Domain NVARCHAR(50) NOT NULL,
)

CREATE TABLE [User](
	Id INT PRIMARY KEY IDENTITY,
	Email NVARCHAR(50) NOT NULL,
	FirstName NVARCHAR(25) NOT NULL,
	LastName NVARCHAR(25) NOT NULL,
	[Password] NVARCHAR(50) NOT NULL,
	Erased BIT NOT NULL DEFAULT 0,
	CompanyId INT NOT NULL FOREIGN KEY REFERENCES Company(Id),
)

CREATE TABLE Project(
	Id INT PRIMARY KEY IDENTITY,
	Name NVARCHAR(100) NOT NULL,
	Description NVARCHAR(500) NULL,
	Erased BIT NOT NULL DEFAULT 0,
	CompanyId INT NOT NULL FOREIGN KEY REFERENCES Company(Id),
)

CREATE TABLE Sprint(
	Id INT PRIMARY KEY IDENTITY,
	Name NVARCHAR(100) NOT NULL,
	StartDate DateTime NOT NULL,
	EndDate DateTime NOT NULL,
	Erased BIT NOT NULL DEFAULT 0,
	ProjectId INT NOT NULL FOREIGN KEY REFERENCES Project(Id),
)

CREATE TABLE Team(
	Id INT PRIMARY KEY IDENTITY,
	Name NVARCHAR(100) NOT NULL,
	Erased BIT NOT NULL DEFAULT 0,
	ProjectId INT NOT NULL FOREIGN KEY REFERENCES Project(Id),
)

CREATE TABLE TeamMember(
	Id INT PRIMARY KEY IDENTITY,
	Capacity INT NOT NULL DEFAULT 0,
	Erased BIT NOT NULL DEFAULT 0,
	UserId INT NOT NULL FOREIGN KEY REFERENCES [User](Id),
	TeamId INT NOT NULL FOREIGN KEY REFERENCES Team(Id),
)

CREATE TABLE BacklogItem(
	Id INT PRIMARY KEY IDENTITY,
	Title NVARCHAR(100) NOT NULL,
	[Description] NVARCHAR(MAX) NULL,
	CreationDate DateTime NOT NULL,
	Erased BIT NOT NULL DEFAULT 0,
	ProjectId INT NOT NULL FOREIGN KEY REFERENCES Project(Id),
)

CREATE TABLE ChangeRequest(
	Id INT PRIMARY KEY FOREIGN KEY REFERENCES BacklogItem(Id),
	ApprovalId INT NOT NULL FOREIGN KEY REFERENCES Approval(Id),
	ChangeTypeId INT NOT NULL FOREIGN KEY REFERENCES ChangeType(Id),
	ImpactId INT NOT NULL FOREIGN KEY REFERENCES Impact(Id),
	PriorityId INT NOT NULL FOREIGN KEY REFERENCES [Priority](Id),
)

CREATE TABLE Test(
	Id INT PRIMARY KEY FOREIGN KEY REFERENCES BacklogItem(Id),
	Steps NVARCHAR(MAX) NOT NULL,
	VersionOriginId INT NOT NULL FOREIGN KEY REFERENCES VersionOrigin(Id),
	TestOutcomeId INT NOT NULL FOREIGN KEY REFERENCES TestOutcome(Id),
)

CREATE TABLE Task(
	Id INT PRIMARY KEY IDENTITY,
	Title NVARCHAR(100) NOT NULL,
	[Description] NVARCHAR(MAX) NULL,
	CreationDate DateTime NOT NULL,
	Erased BIT NOT NULL DEFAULT 0,
	EstimatedTime INT NOT NULL,
	RemainingTime INT NOT NULL,
	TaskStateId INT NOT NULL FOREIGN KEY REFERENCES TaskState(Id),
	SprintId INT NULL FOREIGN KEY REFERENCES Sprint(Id),
	BacklogItemId INT NOT NULL FOREIGN KEY REFERENCES BacklogItem(Id),
	UserId INT NULL FOREIGN KEY REFERENCES [User](Id),
)

CREATE TABLE TaskUpdate(
	Id INT PRIMARY KEY IDENTITY,
	Comment NVARCHAR(MAX) NULL,
	EventDate DateTime NOT NULL,
	Erased BIT NOT NULL DEFAULT 0,
	ElapsedTime INT NOT NULL,
	TaskId INT NULL FOREIGN KEY REFERENCES Task(Id),
	PreviousTaskStateId INT NOT NULL FOREIGN KEY REFERENCES TaskState(Id),
	TaskStateId INT NOT NULL FOREIGN KEY REFERENCES TaskState(Id),
)


--DEFAULT VALUES
--Version Origin
INSERT INTO VersionOrigin(Id, Name) VALUES (1,'Si');
INSERT INTO VersionOrigin(Id, Name) VALUES (2,'No');

--TestOutcome
INSERT INTO TestOutcome(Id, Name) VALUES (1,'Si');
INSERT INTO TestOutcome(Id, Name) VALUES (2,'No');

--Approval
INSERT INTO Approval(Id, Name) VALUES (1,'Si');
INSERT INTO Approval(Id, Name) VALUES (2,'No');

--Impact
INSERT INTO Impact(Id, Name) VALUES (1,'Riesgo nivel 1');
INSERT INTO Impact(Id, Name) VALUES (2,'Riesgo nivel 2');
INSERT INTO Impact(Id, Name) VALUES (3,'Riesgo nivel 3');
INSERT INTO Impact(Id, Name) VALUES (4,'Riesgo nivel 4');

--ChangeType
INSERT INTO ChangeType(Id, Name) VALUES (1,'Normal');
INSERT INTO ChangeType(Id, Name) VALUES (2,'Estandar');
INSERT INTO ChangeType(Id, Name) VALUES (3,'De emergencia');

--Priority
INSERT INTO [Priority](Id, Name) VALUES (1,'Inmediata');
INSERT INTO [Priority](Id, Name) VALUES (2,'Alta');
INSERT INTO [Priority](Id, Name) VALUES (3,'Media');
INSERT INTO [Priority](Id, Name) VALUES (4,'Baja');

--TaskState
INSERT INTO TaskState(Id, Name) VALUES (1,'Por hacer');
INSERT INTO TaskState(Id, Name) VALUES (2,'En ejecución');
INSERT INTO TaskState(Id, Name) VALUES (3,'Hecho');

--Indices
CREATE NONCLUSTERED INDEX NCI_User_Name_Company
    ON [User] (Erased,Email,CompanyId); 

CREATE NONCLUSTERED INDEX NCI_Project
    ON Project (CompanyId);

CREATE NONCLUSTERED INDEX NCI_BackLogItem
    ON BackLogItem (CreationDate,Erased,ProjectId);

CREATE NONCLUSTERED INDEX NCI_Change
    ON ChangeRequest (ApprovalId,ChangeTypeId,ImpactId,PriorityId);

CREATE NONCLUSTERED INDEX NCI_Test
    ON Test (VersionOriginId,TestOutcomeId);

CREATE NONCLUSTERED INDEX NCI_Sprint
    ON Sprint (Erased,ProjectId);

CREATE NONCLUSTERED INDEX NCI_Task_General
    ON Task (Erased,BacklogItemId,SprintId,CreationDate);

CREATE NONCLUSTERED INDEX NCI_Task_StateId
    ON Task (TaskStateId);

CREATE NONCLUSTERED INDEX NCI_TaskUpdate
    ON TaskUpdate (Erased,TaskId,EventDate);

CREATE NONCLUSTERED INDEX NCI_Team
    ON Team (Erased,ProjectId);

CREATE NONCLUSTERED INDEX NCI_TeamMember
    ON TeamMember (Erased,TeamId,UserId);