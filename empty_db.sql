-- Note: Before reinitialization, remove all tables in the database manually.
-- Create DB
CREATE TABLE Fact_Data(
	RIC 	TEXT NOT NULL,
	Units 	TEXT NOT NULL,
	Description TEXT NOT NULL,
	Source Text NOT NULL,
	Dependent_Variable TEXT,
	
	PRIMARY KEY (RIC)
);

CREATE TABLE Dim_Data(
	RIC 		TEXT NOT NULL,
	RIC_Date	TEXT NOT NULL,
	RIC_Value 	REAL NOT NULL,
	
	PRIMARY KEY (RIC, RIC_Date),
	FOREIGN KEY (RIC) REFERENCES Fact_Data (RIC) ON DELETE CASCADE ON UPDATE NO ACTION
);

CREATE TABLE Dim_Results(
	Dependent_Variable	TEXT NOT NULL,
	Model		 TEXT NOT NULL,
	Result_Type	 TEXT NOT NULL,
	Result_Date  TEXT NOT NULL,
	Result_Value REAL NOT NULL,
	
	PRIMARY KEY (Dependent_Variable, Model, Result_Type, Result_Date),
	FOREIGN KEY (Dependent_Variable) REFERENCES Fact_Data (Dependent_Variable) ON DELETE CASCADE ON UPDATE NO ACTION
);

CREATE TABLE Dim_Analysis(
	Dependent_Variable	TEXT NOT NULL,
	Model		 TEXT NOT NULL,
	Result_Type	 TEXT NOT NULL,
	Analysis_Type  TEXT NOT NULL,
	Analysis_Value REAL NOT NULL,
	
	PRIMARY KEY (Dependent_Variable, Model, Result_Type, Analysis_Type),
	FOREIGN KEY (Dependent_Variable, Model, Result_Type) REFERENCES Dim_Results (Dependent_Variable, Model, Result_Type) ON DELETE CASCADE ON UPDATE NO ACTION
);

-- Insert values in table Fact_Data

-- FX spot rates
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("EUR=", "USD", "FX spot rate", "Refinitiv", "EUR");
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("JPY=", "USD", "FX spot rate", "Refinitiv", "JPY");
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("GBP=", "USD", "FX spot rate", "Refinitiv", "GBP");
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("CHF=", "USD", "FX spot rate", "Refinitiv", "CHF");
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("AUD=", "USD", "FX spot rate", "Refinitiv", "AUD");

-- 1 year benchmark yield
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("US1YT=RR", "pct", "1 year benchmark yield", "Refinitiv", NULL);
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("EU1YT=RR", "pct", "1 year benchmark yield", "Refinitiv", "EUR");
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("JP1YT=RR", "pct", "1 year benchmark yield", "Refinitiv", "JPY");
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("GB1YT=RR", "pct", "1 year benchmark yield", "Refinitiv", "GBP");
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("CH1YT=RR", "pct", "1 year benchmark yield", "Refinitiv", "CHF");
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("AU1YT=RR", "pct", "1 year benchmark yield", "Refinitiv", "AUD");

-- 10 year benchmark yield
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("US10YT=RR", "pct", "10 year benchmark yield", "Refinitiv", NULL);
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("EU10YT=RR", "pct", "10 year benchmark yield", "Refinitiv", "EUR");
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("JP10YT=RR", "pct", "10 year benchmark yield", "Refinitiv", "JPY");
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("GB10YT=RR", "pct", "10 year benchmark yield", "Refinitiv", "GBP");
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("CH10YT=RR", "pct", "10 year benchmark yield", "Refinitiv", "CHF");
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("AU10YT=RR", "pct", "10 year benchmark yield", "Refinitiv", "AUD");

-- Price index stocks, bonds and funds
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("aUSSHRPRCF", "Index", "Price index stocks, bonds and funds", "S&P Down Jones Indices", NULL);
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("aFRSHRPRCF/C", "Index", "Price index stocks, bonds and funds", "OECD, Main Economic Indicators", "EUR");
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("aJPSHRPRCF", "Index", "Price index stocks, bonds and funds", "JPX - Japan Exchange Group", "JPY");
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("aGBSHRPRCF", "Index", "Price index stocks, bonds and funds", "FTSE International Limited", "GBP");
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("aCHSHRPRCF/C", "Index", "Price index stocks, bonds and funds", "SNB - Swiss National Bank", "CHF");
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("aAUSHRPRCF/C", "Index", "Price index stocks, bonds and funds", "S&P Down Jones Indices", "AUD");

-- CPI, Standardized, SA, Index																
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("aUSCCPIE/CA", "Index", "CPI, Standardized, SA, Index", "U.S. Department of Labor/Refinitiv", NULL);
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("aXZCCPIE/CA", "Index", "CPI, Standardized, SA, Index", "Eurostat/Refinitiv", "EUR");
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("aJPCCPIE/CA", "Index", "CPI, Standardized, SA, Index", "Japan Statistics Bureau/Refinitiv", "JPY");																
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("aGBCCPIE/CA", "Index", "CPI, Standardized, SA, Index", "UK Office for National Statistics/Refinitiv", "GBP");																
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("aCHCCPIE/CA", "Index", "CPI, Standardized, SA, Index", "CH Federal Statistical Office/Refinitiv", "CHF");																	
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("aAUCCPIE/CA", "Index", "CPI, Standardized, SA, Index", "Australian Bureau of Statistics/Refinitiv", "AUD");
															
-- PPI, Standardized, SA, Index 													
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("aUSCPPIE/CA", "Index", "PPI, Standardized, SA, Index ", "U.S. Department of Labor/Refinitiv", NULL);																
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("aXZCPPIE/CA", "Index", "PPI, Standardized, SA, Index ", "Eurostat/Refinitiv", "EUR");																
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("aJPCPPIE/CA", "Index", "PPI, Standardized, SA, Index ", "Japan Statistics Bureau/Refinitiv", "JPY");																
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("aGBCPPIE/CA", "Index", "PPI, Standardized, SA, Index ", "UK Office for National Statistics/Refinitiv", "GBP");	
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("aCHCPPIE/CA", "Index", "PPI, Standardized, SA, Index ", "CH Federal Statistical Office/Refinitiv", "CHF");	
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("aAUCPPIE/CA", "Index", "PPI, Standardized, SA, Index ", "Australian Bureau of Statistics/Refinitiv", "AUD");

-- Consumer confidence, SA 
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("aUSOCS005Q/A", "Index", "Consumer confidence, SA", "OECD, Main Economic Indicators", NULL);	
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("aEKOCS005Q/A", "Index", "Consumer confidence, SA", "OECD, Main Economic Indicators", "EUR/CHF");	
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("aJPCONCF/A", "Index", "Consumer confidence, SA", "Japan Cabinet Office", "JPY");
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("aGBOCS005Q/A", "Index", "Consumer confidence, SA", "OECD, Main Economic Indicators", "GBP");
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("aAURMCONFR", "Index", "Consumer confidence, SA", "ANZ/Roy Morgan", "AUD");

-- Retail Sales, SA
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("aUSRSLS/A", "Index", "Retail Sales, SA", "U.S. Census Bureau", NULL);	
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("aXZRSLS/A", "Index", "Retail Sales, SA", "Eurostat", "EUR");	
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("aJPRSLS/A", "Index", "Retail Sales, SA", "Japan Ministry of Economy", "JPY");
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("aGBRSLS/A", "Index", "Retail Sales, SA", "UK Office for National Statistics", "GBP");
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("aCHRSLS/CA", "Index", "Retail Sales, SA", "CH Federal Statistical Office", "CHF");
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("aAURSLSM/A", "Index", "Retail Sales, SA", "Australian Bureau of Statistics", "AUD");	
																
-- 	US Trade Balance
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("aUSTBALEU", "USD", "US Trade Balance", "U.S. Census Bureau", "EUR");	
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("aUSTBALJP", "USD", "US Trade Balance", "U.S. Census Bureau", "JPY");	
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("aUSTBALWEU", "USD", "US Trade Balance", "U.S. Census Bureau", "GBP/CHF");	
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("aUSBTPCASA", "USD", "US Trade Balance", "U.S. Census Bureau", "AUD");	

-- Gold Spot Price
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("XAU=", "USD", "Gold Spot Price", "Refinitiv", NULL);	

-- Money Supply M1, Standardized, SA
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("aUSCMS1B/A", "USD", "Money Supply M1, Standardized, SA", "U.S. Department of Labor/Refinitiv", NULL);	
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("aXZCMS1B/A", "USD", "Money Supply M1, Standardized, SA", "Eurostat/Refinitiv", "EUR");
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("aJPCMS1B/A", "USD", "Money Supply M1, Standardized, SA", "Japan Statistics Bureau/Refinitiv", "JPY");
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("aGBCMS1B/A", "USD", "Money Supply M1, Standardized, SA", "UK Office for National Statistics/Refinitiv", "GBP");																
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("aCHCMS1B/A", "USD", "Money Supply M1, Standardized, SA", "CH Federal Statistical Office/Refinitiv", "CHF");	
INSERT INTO Fact_Data (RIC, Units, Description, Source, Dependent_Variable) VALUES ("aAUCMS1B/A", "USD", "Money Supply M1, Standardized, SA", "Australia DOFA", "AUD");																	
																