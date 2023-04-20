# SQLite for SQL code 
# Merging 12 datasets in one
INSERT INTO February
SELECT * FROM January;

INSERT INTO February
SELECT * FROM December;

INSERT INTO February
SELECT * FROM November;

INSERT INTO February
SELECT * FROM October;

INSERT INTO February
SELECT * FROM September;

INSERT INTO February
SELECT * FROM August;

INSERT INTO February
SELECT * FROM July;

INSERT INTO February
SELECT * FROM June;

INSERT INTO February
SELECT * FROM May;

INSERT INTO February
SELECT * FROM April;

INSERT INTO February
SELECT * FROM March

#Rename final table with 12 months data
ALTER TABLE February
RENAME TO All_months 

