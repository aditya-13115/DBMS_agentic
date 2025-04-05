USE LegalDB;

-- 🧑‍⚖️ Insert More Real Indian Parties
INSERT INTO Party (Name) VALUES 
('Aruna Shanbaug'),
('Ratan Tata'),
('Tata Sons'),
('Greenpeace India'),
('Indian Express Newspapers'),
('Union Carbide Corporation'),
('M.C. Mehta'),
('Union of India'),
('State of Maharashtra'),
('K.S. Puttaswamy'),
('State of Rajasthan');

-- 👤 Insert Users
INSERT INTO User (Username, Password, Role) VALUES 
('admin11', 'passadmin', 'Admin'),
('lawyer12', 'securelaw', 'Lawyer'),
('paralegal13', 'para123', 'Paralegal'),
('client14', 'clientpass1', 'Client'),
('judge15', 'judgepass1', 'Judge');

-- 📄 Insert More Legal Documents
INSERT INTO Legal_Document (Title, Content, Creation_Date, Word_Count, PDF_File) VALUES
('Aruna Shanbaug vs Union of India', 'A crucial case on euthanasia and the right to die with dignity.', '2011-03-07', 4200, NULL),
('Tata Sons vs Greenpeace India', 'Defamation suit over satirical content targeting Tata''s involvement in endangered turtle controversy.', '2010-05-15', 3100, NULL),
('Indian Express Newspapers vs Union of India', 'Focused on freedom of press and independence from governmental interference.', '1985-06-03', 3700, NULL),
('Union Carbide Corporation vs Union of India', 'Addressed issues of corporate liability in the Bhopal Gas Tragedy.', '1989-02-14', 4700, NULL),
('M.C. Mehta vs Union of India', 'A series of landmark environmental protection judgments.', '1991-12-12', 5000, NULL);

-- 📜 Insert More Clauses
INSERT INTO Clause (Document_ID, Clause_Text) VALUES
(11, 'Clause 1: Passive euthanasia guidelines by Supreme Court'),
(11, 'Clause 2: Right to die with dignity under Article 21'),
(12, 'Clause 1: Defamation laws in relation to satire and public interest'),
(12, 'Clause 2: Protection of artistic freedom under Article 19(1)(a)'),
(13, 'Clause 1: Importance of freedom of the press'),
(13, 'Clause 2: Independence of media from executive control'),
(14, 'Clause 1: Liability of multinational corporations in industrial disasters'),
(14, 'Clause 2: Compensation mechanism for affected victims'),
(15, 'Clause 1: Right to clean and healthy environment'),
(15, 'Clause 2: Role of judiciary in enforcing environmental laws');

-- 🔗 Insert Party Associations with New Documents
INSERT INTO Legal_Document_Party (Document_ID, Party_ID) VALUES
(11, 1),  -- Aruna Shanbaug
(11, 8),  -- Union of India
(12, 2),  -- Ratan Tata
(12, 3),  -- Tata Sons
(12, 4),  -- Greenpeace India
(13, 5),  -- Indian Express Newspapers
(13, 8),  -- Union of India
(14, 6),  -- Union Carbide Corporation
(14, 8),  -- Union of India
(15, 7),  -- M.C. Mehta
(15, 8);  -- Union of India


-- 📜 Insert More Clauses using subqueries for accurate Document_IDs
INSERT INTO Clause (Document_ID, Clause_Text) VALUES
((SELECT Document_ID FROM Legal_Document WHERE Title = 'Aruna Shanbaug vs Union of India'), 'Clause 1: Passive euthanasia guidelines by Supreme Court'),
((SELECT Document_ID FROM Legal_Document WHERE Title = 'Aruna Shanbaug vs Union of India'), 'Clause 2: Right to die with dignity under Article 21'),
((SELECT Document_ID FROM Legal_Document WHERE Title = 'Tata Sons vs Greenpeace India'), 'Clause 1: Defamation laws in relation to satire and public interest'),
((SELECT Document_ID FROM Legal_Document WHERE Title = 'Tata Sons vs Greenpeace India'), 'Clause 2: Protection of artistic freedom under Article 19(1)(a)'),
((SELECT Document_ID FROM Legal_Document WHERE Title = 'Indian Express Newspapers vs Union of India'), 'Clause 1: Importance of freedom of the press'),
((SELECT Document_ID FROM Legal_Document WHERE Title = 'Indian Express Newspapers vs Union of India'), 'Clause 2: Independence of media from executive control'),
((SELECT Document_ID FROM Legal_Document WHERE Title = 'Union Carbide Corporation vs Union of India'), 'Clause 1: Liability of multinational corporations in industrial disasters'),
((SELECT Document_ID FROM Legal_Document WHERE Title = 'Union Carbide Corporation vs Union of India'), 'Clause 2: Compensation mechanism for affected victims'),
((SELECT Document_ID FROM Legal_Document WHERE Title = 'M.C. Mehta vs Union of India'), 'Clause 1: Right to clean and healthy environment'),
((SELECT Document_ID FROM Legal_Document WHERE Title = 'M.C. Mehta vs Union of India'), 'Clause 2: Role of judiciary in enforcing environmental laws');

-- 🔗 Insert Party Associations with New Documents using subqueries for accurate IDs
INSERT INTO Legal_Document_Party (Document_ID, Party_ID) VALUES
((SELECT Document_ID FROM Legal_Document WHERE Title = 'Aruna Shanbaug vs Union of India'), (SELECT Party_ID FROM Party WHERE Name = 'Aruna Shanbaug')),
((SELECT Document_ID FROM Legal_Document WHERE Title = 'Aruna Shanbaug vs Union of India'), (SELECT Party_ID FROM Party WHERE Name = 'Union of India')),
((SELECT Document_ID FROM Legal_Document WHERE Title = 'Tata Sons vs Greenpeace India'), (SELECT Party_ID FROM Party WHERE Name = 'Ratan Tata')),
((SELECT Document_ID FROM Legal_Document WHERE Title = 'Tata Sons vs Greenpeace India'), (SELECT Party_ID FROM Party WHERE Name = 'Tata Sons')),
((SELECT Document_ID FROM Legal_Document WHERE Title = 'Tata Sons vs Greenpeace India'), (SELECT Party_ID FROM Party WHERE Name = 'Greenpeace India')),
((SELECT Document_ID FROM Legal_Document WHERE Title = 'Indian Express Newspapers vs Union of India'), (SELECT Party_ID FROM Party WHERE Name = 'Indian Express Newspapers')),
((SELECT Document_ID FROM Legal_Document WHERE Title = 'Indian Express Newspapers vs Union of India'), (SELECT Party_ID FROM Party WHERE Name = 'Union of India')),
((SELECT Document_ID FROM Legal_Document WHERE Title = 'Union Carbide Corporation vs Union of India'), (SELECT Party_ID FROM Party WHERE Name = 'Union Carbide Corporation')),
((SELECT Document_ID FROM Legal_Document WHERE Title = 'Union Carbide Corporation vs Union of India'), (SELECT Party_ID FROM Party WHERE Name = 'Union of India')),
((SELECT Document_ID FROM Legal_Document WHERE Title = 'M.C. Mehta vs Union of India'), (SELECT Party_ID FROM Party WHERE Name = 'M.C. Mehta')),
((SELECT Document_ID FROM Legal_Document WHERE Title = 'M.C. Mehta vs Union of India'), (SELECT Party_ID FROM Party WHERE Name = 'Union of India'));




-- 📝 Update PDF_File paths for each Legal Document
UPDATE Legal_Document
SET PDF_File = '/mnt/data/Aruna_Shanbaug_vs_Union_of_India.pdf'
WHERE Title = 'Aruna Shanbaug vs Union of India';

UPDATE Legal_Document
SET PDF_File = '/mnt/data/Tata_Sons_vs_Greenpeace_India.pdf'
WHERE Title = 'Tata Sons vs Greenpeace India';

UPDATE Legal_Document
SET PDF_File = '/mnt/data/Indian_Express_Newspapers_vs_Union_of_India.pdf'
WHERE Title = 'Indian Express Newspapers vs Union of India';

UPDATE Legal_Document
SET PDF_File = '/mnt/data/Union_Carbide_Corporation_vs_Union_of_India.pdf'
WHERE Title = 'Union Carbide Corporation vs Union of India';

UPDATE Legal_Document
SET PDF_File = '/mnt/data/MC_Mehta_vs_Union_of_India.pdf'
WHERE Title = 'M.C. Mehta vs Union of India';




SHOW TABLES;
SELECT * FROM User;
SELECT * FROM Party;
SELECT * FROM Legal_Document;
SELECT * FROM Clause;
SELECT * FROM Legal_Document_Party;

-- Disable foreign key checks temporarily
SET FOREIGN_KEY_CHECKS = 0;

DELETE FROM Legal_Document_Party;
DELETE FROM Clause;
DELETE FROM Legal_Document;
DELETE FROM Party;
DELETE FROM User;

-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;


