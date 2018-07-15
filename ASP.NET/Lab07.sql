--script to create work tables
IF OBJECT_ID('dbo.demoCustomer','U') IS NOT NULL BEGIN        
	DROP TABLE dbo.demoCustomer;    
END;    
CREATE TABLE dbo.demoCustomer(
        CustomerID INT NOT NULL,        
	FirstName NVARCHAR(50) NOT NULL, 
        MiddleName NVARCHAR(50) NULL,        
	LastName NVARCHAR(50) NOT NULL        
	CONSTRAINT PK_demoCustomer PRIMARY KEY (CustomerID));     

IF  EXISTS (SELECT * FROM sys.objects                
	WHERE object_id = OBJECT_ID(N'[dbo].[demoProduct]')                   
	AND type in (N'U'))
	DROP TABLE [dbo].[demoProduct]    
GO       
CREATE TABLE [dbo].[demoProduct](        
	[ProductID] [INT] NOT NULL PRIMARY KEY,           
	[Name] [dbo].[Name] NOT NULL,        
	[Color] [NVARCHAR](15) NULL,        
	[StandardCost] [MONEY] NOT NULL,        
	[ListPrice] [MONEY] NOT NULL,        
	[Size] [NVARCHAR](5) NULL,        
	[Weight] [DECIMAL](8, 2) NULL,    
	);    
IF  EXISTS (SELECT * FROM sys.objects                
	WHERE object_id = OBJECT_ID(N'[dbo].[demoSalesOrderHeader]')                    
		AND type in (N'U'))    
	DROP TABLE [dbo].[demoSalesOrderHeader]    
GO       
CREATE TABLE [dbo].[demoSalesOrderHeader](        
	[SalesOrderID] [INT] NOT NULL PRIMARY KEY,        
	[SalesID] [INT] NOT NULL IDENTITY,        
	[OrderDate] [DATETIME] NOT NULL,        
	[CustomerID] [INT] NOT NULL,        
	[SubTotal] [MONEY] NOT NULL,        
	[TaxAmt] [MONEY] NOT NULL,        
	[Freight] [MONEY] NOT NULL,        
	[DateEntered] [DATETIME],        
	[TotalDue]  AS (ISNULL(([SubTotal]+[TaxAmt])+[Freight],(0))),        
	[RV] ROWVERSION NOT NULL);    
GO       
ALTER TABLE [dbo].[demoSalesOrderHeader] ADD  CONSTRAINT        
	[DF_demoSalesOrderHeader_DateEntered]    
	DEFAULT (getdate()) FOR [DateEntered];          
GO    