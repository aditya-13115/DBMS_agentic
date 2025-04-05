CREATE DATABASE LegalDB;
USE LegalDB;

-- Party Table
CREATE TABLE Party (
    Party_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL
);

-- User Table
CREATE TABLE User (
    User_ID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(100) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL,
    Role VARCHAR(50) NOT NULL
);

-- Legal Document Table with PDF Storage
CREATE TABLE Legal_Document (
    Document_ID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Content TEXT NOT NULL,
    Creation_Date DATE NOT NULL,
    Word_Count INT,
    PDF_File LONGBLOB  -- BLOB storage for PDF files
);

-- Clause Table
CREATE TABLE Clause (
    Clause_ID INT AUTO_INCREMENT PRIMARY KEY,
    Document_ID INT,
    Clause_Text TEXT NOT NULL,
    FOREIGN KEY (Document_ID) REFERENCES Legal_Document(Document_ID) ON DELETE CASCADE
);

-- Associative Table: Linking Legal Documents & Parties
CREATE TABLE Legal_Document_Party (
    Document_ID INT,
    Party_ID INT,
    PRIMARY KEY (Document_ID, Party_ID),
    FOREIGN KEY (Document_ID) REFERENCES Legal_Document(Document_ID) ON DELETE CASCADE,
    FOREIGN KEY (Party_ID) REFERENCES Party(Party_ID) ON DELETE CASCADE
);



-- Subquery: Get documents with more than 2 parties
SELECT Title, Document_ID
FROM Legal_Document
WHERE Document_ID IN (
    SELECT Document_ID
    FROM Legal_Document_Party
    GROUP BY Document_ID
    HAVING COUNT(Party_ID) > 2
);


-- Built-In Functions

-- 1. LENGTH
SELECT Clause_ID, LENGTH(Clause_Text) AS ClauseLength FROM Clause;
-- 2. UPPER
SELECT User_ID, UPPER(Username) AS UppercaseUsername FROM User;
-- 3. NOW
SELECT NOW() AS CurrentDateTime;
-- 4. DATEDIFF
SELECT Title, DATEDIFF(NOW(), Creation_Date) AS DaysSinceCreation FROM Legal_Document;
-- 5. CONCAT
SELECT CONCAT(Title, ' has ', Word_Count, ' words') AS Description FROM Legal_Document;




-- ⚙️ PL/SQL Block: Procedure to count clauses for a document

DELIMITER //

CREATE PROCEDURE CountClausesForDoc(IN doc_id INT)
BEGIN
    DECLARE clause_count INT;

    SELECT COUNT(*) INTO clause_count
    FROM Clause
    WHERE Document_ID = doc_id;

    SELECT CONCAT('Document ID ', doc_id, ' has ', clause_count, ' clauses.') AS Result;
END //
DELIMITER ;

-- Call the procedure
CALL CountClausesForDoc(1);




--  Cursor to loop through document titles and word counts

DELIMITER //

CREATE PROCEDURE ShowAllDocuments()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE doc_title VARCHAR(255);
    DECLARE doc_words INT;

    DECLARE doc_cursor CURSOR FOR 
        SELECT Title, Word_Count FROM Legal_Document;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN doc_cursor;

    read_loop: LOOP
        FETCH doc_cursor INTO doc_title, doc_words;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT CONCAT('Title: ', doc_title, ' | Word Count: ', doc_words) AS DocumentInfo;
    END LOOP;

    CLOSE doc_cursor;
END //

DELIMITER ;

CALL ShowAllDocuments();



-- Trigger: Automatically set word count before insert

DELIMITER //

CREATE TRIGGER SetWordCountBeforeInsert
BEFORE INSERT ON Legal_Document
FOR EACH ROW
BEGIN
    SET NEW.Word_Count = LENGTH(NEW.Content) - LENGTH(REPLACE(NEW.Content, ' ', '')) + 1;
END //

DELIMITER ;
