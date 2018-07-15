CREATE TABLE #Stock (Symbol VARCHAR(4), TradingDate DATE,        
	OpeningPrice MONEY, ClosingPrice MONEY);    
INSERT INTO #Stock(Symbol, TradingDate, OpeningPrice, ClosingPrice)    
VALUES ('A','2014/01/02',5.03,4.90),        
	('B','2014/01/02',10.99,11.25),        
	('C','2014/01/02',23.42,23.44),        
	('A','2014/01/03',4.93,5.10),        
	('B','2014/01/03',11.25,11.25),        
	('C','2014/01/03',25.15,25.06),        
	('A','2014/01/06',5.15,5.20),        
	('B','2014/01/06',11.30,11.12),        
	('C','2014/01/06',25.20,26.00); 
