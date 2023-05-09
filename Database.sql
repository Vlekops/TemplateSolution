CREATE DATABASE [Vleko.TemplateProject];

//#if(Database=="mssql")
USE [Vleko.TemplateProject];
CREATE TABLE dbo.REPOSITORY (
	ID uniqueidentifier DEFAULT newid() NOT NULL,
	CODE varchar(100) COLLATE Latin1_General_CI_AS NOT NULL,
	MODUL varchar(150) COLLATE Latin1_General_CI_AS NOT NULL,
	FILE_NAME varchar(150) COLLATE Latin1_General_CI_AS NOT NULL,
	DESCRIPTION varchar(MAX) COLLATE Latin1_General_CI_AS NULL,
	EXTENSION varchar(20) COLLATE Latin1_General_CI_AS NOT NULL,
	MIME_TYPE nvarchar(100) COLLATE Latin1_General_CI_AS NOT NULL,
	IS_PUBLIC bit NOT NULL,
	CREATE_BY varchar(250) COLLATE Latin1_General_CI_AS NOT NULL,
	CREATE_DATE datetime DEFAULT getdate() NOT NULL,
	CONSTRAINT PK_REPOSITORY PRIMARY KEY (ID)
);

CREATE TABLE dbo.[ROLE] (
	ID varchar(50) COLLATE Latin1_General_CI_AS NOT NULL,
	NAME varchar(100) COLLATE Latin1_General_CI_AS NOT NULL,
	ACTIVE bit NOT NULL,
	CREATE_BY varchar(250) COLLATE Latin1_General_CI_AS NOT NULL,
	CREATE_DATE datetime DEFAULT getdate() NOT NULL,
	UPDATE_BY varchar(250) COLLATE Latin1_General_CI_AS NULL,
	UPDATE_DATE datetime NULL,
	CONSTRAINT PK_ROLE PRIMARY KEY (ID)
);

CREATE TABLE dbo.[USER] (
	ID uniqueidentifier DEFAULT newid() NOT NULL,
	USERNAME nvarchar(80) COLLATE Latin1_General_CI_AS NOT NULL,
	PASSWORD nvarchar(50) COLLATE Latin1_General_CI_AS NOT NULL,
	FULLNAME varchar(MAX) COLLATE Latin1_General_CI_AS NULL,
	MAIL nvarchar(150) COLLATE Latin1_General_CI_AS NOT NULL,
	PHONE_NUMBER nvarchar(50) COLLATE Latin1_General_CI_AS NULL,
	TOKEN nvarchar(250) COLLATE Latin1_General_CI_AS NULL,
	IS_LOCKOUT bit NOT NULL,
	ACCESS_FAILED_COUNT int NOT NULL,
	ACTIVE bit NOT NULL,
	CREATE_BY varchar(250) COLLATE Latin1_General_CI_AS NOT NULL,
	CREATE_DATE datetime DEFAULT getdate() NOT NULL,
	UPDATE_BY varchar(250) COLLATE Latin1_General_CI_AS NULL,
	UPDATE_DATE datetime NULL,
	CONSTRAINT PK_USER PRIMARY KEY (ID)
);

CREATE TABLE dbo.NOTIFICATION (
	ID uniqueidentifier DEFAULT newid() NOT NULL,
	ID_USER uniqueidentifier NOT NULL,
	USER_FULLNAME varchar(150) COLLATE Latin1_General_CI_AS NOT NULL,
	USER_MAIL nvarchar(150) COLLATE Latin1_General_CI_AS NULL,
	USER_PHONE nvarchar(50) COLLATE Latin1_General_CI_AS NULL,
	SUBJECT varchar(50) COLLATE Latin1_General_CI_AS NOT NULL,
	DESCRIPTION varchar(250) COLLATE Latin1_General_CI_AS NOT NULL,
	NAVIGATION varchar(250) COLLATE Latin1_General_CI_AS NOT NULL,
	IS_OPEN bit NOT NULL,
	CREATE_BY varchar(250) COLLATE Latin1_General_CI_AS NOT NULL,
	CREATE_DATE datetime DEFAULT getdate() NOT NULL,
	CONSTRAINT PK_NOTIFICATION PRIMARY KEY (ID),
	CONSTRAINT NOTIFICATION_FK FOREIGN KEY (ID_USER) REFERENCES dbo.[USER](ID) ON DELETE CASCADE
);

CREATE TABLE dbo.USER_ROLE (
	ID uniqueidentifier DEFAULT newid() NOT NULL,
	ID_USER uniqueidentifier NOT NULL,
	ID_ROLE varchar(50) COLLATE Latin1_General_CI_AS NOT NULL,
	CREATE_BY varchar(250) COLLATE Latin1_General_CI_AS NOT NULL,
	CREATE_DATE datetime DEFAULT getdate() NOT NULL,
	CONSTRAINT PK_USER_ROLE PRIMARY KEY (ID),
	CONSTRAINT FK_USER_ROLE_ROLE FOREIGN KEY (ID_ROLE) REFERENCES dbo.[ROLE](ID) ON DELETE CASCADE,
	CONSTRAINT FK_USER_ROLE_USER FOREIGN KEY (ID_USER) REFERENCES dbo.[USER](ID) ON DELETE CASCADE
);

INSERT INTO dbo.[ROLE] (ID,NAME,ACTIVE,CREATE_BY,CREATE_DATE,UPDATE_BY,UPDATE_DATE) VALUES
	 (N'ADM',N'Admin',1,N'SYSTEM',getdate(),N'SYSTEM',getdate()),
	 (N'MBR',N'Member',1,N'SYSTEM',getdate(),N'SYSTEM',getdate());

INSERT INTO dbo.[USER] (ID,USERNAME,PASSWORD,FULLNAME,MAIL,PHONE_NUMBER,TOKEN,IS_LOCKOUT,ACCESS_FAILED_COUNT,ACTIVE,CREATE_BY,CREATE_DATE,UPDATE_BY,UPDATE_DATE) VALUES
	 (N'491874CE-92C0-4CFD-83B7-F916DF7C219B',N'Admin',N'5F4DCC3B5AA765D61D8327DEB882CF99',N'Administrator',N'admin@mail.com',N'0000000',null,0,0,1,N'SYSTEM',getdate(),N'SYSTEM',getdate());

INSERT INTO dbo.USER_ROLE (ID,ID_USER,ID_ROLE,CREATE_BY,CREATE_DATE) VALUES
	 (N'2DA981E5-B0EE-4630-B755-2A10CA0F15BF',N'491874CE-92C0-4CFD-83B7-F916DF7C219B',N'ADM',N'SYSTEM',getdate());
//#endif

//#if(Database=="postgre")
CREATE TABLE public.repository (
	id uuid NOT NULL DEFAULT gen_random_uuid(),
	code varchar(100) NOT NULL,
	modul varchar(150) NOT NULL,
	file_name varchar(150) NOT NULL,
	description varchar(1000) NULL,
	"extension" varchar(20) NOT NULL,
	mime_type varchar(100) NOT NULL,
	is_public boolean NOT NULL,
	create_by varchar(250) NOT NULL DEFAULT 'SYSTEM'::character varying,
	create_date timestamp NOT NULL DEFAULT now(),
	CONSTRAINT pk_repository PRIMARY KEY (id)
);

CREATE TABLE public."role" (
	id varchar(50) NOT NULL,
	"name" varchar(100) NOT NULL,
	active boolean NOT NULL,
	create_by varchar(250) NOT NULL DEFAULT 'SYSTEM'::character varying,
	create_date timestamp NOT NULL DEFAULT now(),
	update_by varchar(250) NULL,
	update_date timestamp NULL,
	CONSTRAINT pk_role PRIMARY KEY (id)
);

CREATE TABLE public."user" (
	id uuid NOT NULL DEFAULT gen_random_uuid(),
	username varchar(80) NOT NULL,
	"password" varchar(50) NOT NULL,
	fullname varchar(250) NULL,
	mail varchar(150) NOT NULL,
	phone_number varchar(50) NULL,
	"token" varchar(250) NULL,
	is_lockout boolean NOT NULL,
	access_failed_count int NOT NULL,
	active boolean NOT NULL,
	create_by varchar(250) NOT NULL DEFAULT 'SYSTEM'::character varying,
	create_date timestamp NOT NULL DEFAULT now(),
	update_by varchar(250) NULL,
	update_date timestamp NULL,
	CONSTRAINT pk_user PRIMARY KEY (id)
);

CREATE TABLE public.notification (
	id uuid NOT NULL DEFAULT gen_random_uuid(),
	id_user uuid NOT NULL,
	user_fullname varchar(150) NOT NULL,
	user_mail varchar(150) NULL,
	user_phone varchar(50) NULL,
	subject varchar(50) NOT NULL,
	description varchar(250) NOT NULL,
	navigation varchar(250) NOT NULL,
	is_open boolean NOT NULL,
	create_by varchar(250) NOT NULL,
	create_date timestamp NOT NULL DEFAULT now(),
	CONSTRAINT pk_notification PRIMARY KEY (id),
	CONSTRAINT notification_user_fk FOREIGN KEY (id_user) REFERENCES public."user"(id) ON DELETE CASCADE ON UPDATE RESTRICT
);

CREATE TABLE public.user_role (
	id uuid NOT NULL DEFAULT gen_random_uuid(),
	id_user uuid NOT NULL,
	id_role varchar(50) NOT NULL,
	create_by varchar(250) NOT NULL,
	create_date timestamp NOT NULL DEFAULT now(),
	CONSTRAINT pk_user_role PRIMARY KEY (ID),
	CONSTRAINT user_role_role_fk FOREIGN KEY (id_role) REFERENCES public."role"(id) ON DELETE CASCADE ON UPDATE RESTRICT,
	CONSTRAINT user_role_user_fk FOREIGN KEY (id_user) REFERENCES public."user"(id) ON DELETE CASCADE ON UPDATE RESTRICT
);

INSERT INTO public."role" (id,"name",active,create_by,create_date,update_by,update_date) VALUES
	 ('ADM','Admin',true,'SYSTEM',now(),'SYSTEM',now()),
	 ('MBR','Member',true,'SYSTEM',now(),'SYSTEM',now());

INSERT INTO public."user" (id,username,"password",fullname,mail,phone_number,"token",is_lockout,access_failed_count,active,create_by,create_date,update_by,update_date) VALUES
	 ('4ef08bb2-7ecd-4402-b2d7-08f6066caf2b','Admin','5F4DCC3B5AA765D61D8327DEB882CF99','Administrator','admin@mail.com','0000000',null,false,0,true,'SYSTEM',now(),'SYSTEM',now());

INSERT INTO public."user_role" (id,id_user,id_role,create_by,create_date) VALUES
	 (gen_random_uuid(),'4ef08bb2-7ecd-4402-b2d7-08f6066caf2b','ADM','SYSTEM',now());
//#endif