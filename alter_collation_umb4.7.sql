/*****
Change COLLATION on 4.7 database from Danish_Norwegian to database_default 
Umbraco 4.7 has some columns set to Danish collation which will prevent export/backup scripts to run. 
Use this script first to change the collation to the database default
******/

ALTER TABLE [dbo].[cmsTemplate] ALTER COLUMN design ntext COLLATE database_default NOT NULL;
ALTER TABLE [dbo].[umbracoStatSession] ALTER COLUMN visitorId char(36) COLLATE database_default NULL;
ALTER TABLE [dbo].[umbracoStatSession] ALTER COLUMN browserType nvarchar(510) COLLATE database_default NULL;
ALTER TABLE [dbo].[umbracoNode] ALTER COLUMN path nvarchar(300) COLLATE database_default NOT NULL;
ALTER TABLE [dbo].[cmsPropertyType] ALTER COLUMN validationRegExp nvarchar(510) COLLATE database_default NULL;
ALTER TABLE [dbo].[cmsPropertyType] ALTER COLUMN Description nvarchar(4000) COLLATE database_default NULL;
ALTER TABLE [dbo].[cmsContentXml] ALTER COLUMN xml ntext COLLATE database_default NOT NULL;
ALTER TABLE [dbo].[cmsDataTypePreValues] ALTER COLUMN alias nvarchar(100) COLLATE database_default NULL;
ALTER TABLE [dbo].[cmsDictionary] ALTER COLUMN [key] nvarchar(2000) COLLATE database_default NOT NULL;
ALTER TABLE [dbo].[cmsLanguageText] ALTER COLUMN value nvarchar(2000) COLLATE database_default NOT NULL;
ALTER TABLE [dbo].[umbracoRelationType] ALTER COLUMN name nvarchar(510) COLLATE database_default NOT NULL;
ALTER TABLE [dbo].[umbracoRelationType] ALTER COLUMN alias nvarchar(200) COLLATE database_default NULL;
ALTER TABLE umbracoUser2NodeNotify DROP CONSTRAINT PK_umbracoUser2NodeNotify;
ALTER TABLE [dbo].[umbracoUser2NodeNotify] ALTER COLUMN action char(1) COLLATE database_default NOT NULL;
ALTER TABLE umbracoUser2NodeNotify ADD CONSTRAINT PK_umbracoUser2NodeNotify PRIMARY KEY CLUSTERED(userId, nodeId, action );
ALTER TABLE [dbo].[umbracoRelation] ALTER COLUMN comment nvarchar(2000) COLLATE database_default NOT NULL;
ALTER TABLE [dbo].[cmsDocument] ALTER COLUMN alias nvarchar(510) COLLATE database_default NULL;