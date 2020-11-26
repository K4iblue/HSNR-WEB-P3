CREATE TABLE IF NOT EXISTS trainings (
    id INT PRIMARY KEY,
    title TEXT NOT NULL,
    from_date TEXT NOT NULL,
    to_date TEXT NOT NULL,
    desc TEXT NOT NULL,
    max_participants INT NOT NULL,
    min_participants INT NOT NULL
)