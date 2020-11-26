CREATE TABLE IF NOT EXISTS certificates (
    id INT PRIMARY KEY,
    title TEXT NOT NULL,
    desc TEXT NOT NULL,
    qualifies_for TEXT NOT NULL
)