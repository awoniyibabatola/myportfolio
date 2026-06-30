CREATE TABLE [dbo].[dim_date] (

	[DateKey] int NULL, 
	[FullDate] date NULL, 
	[Year] int NULL, 
	[Month] int NULL, 
	[MonthName] varchar(8000) NULL, 
	[Quarter] int NULL, 
	[DayOfWeek] int NULL, 
	[DayName] varchar(8000) NULL
);