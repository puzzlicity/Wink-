-- 1. Таблица целей
CREATE TABLE Goals (
    id SERIAL PRIMARY KEY,
    goal_description TEXT NOT NULL,
    deadline DATE,
    expected_results TEXT,
    key_tasks TEXT,
    actual_deadline DATE
);

-- 2. Таблица самооценок
CREATE TABLE SelfEvaluations (
    id SERIAL PRIMARY KEY,
    employee_id INT REFERENCES Employees(id),
    task_name TEXT,
    achieved_results TEXT,
    personal_contribution TEXT,
    workspace_link VARCHAR(255),
    acquired_skills TEXT,
    improvement_plan TEXT,
    interaction_score INT CHECK (interaction_score >= 0 AND interaction_score <= 10),
    satisfaction_score INT CHECK (satisfaction_score >= 0 AND satisfaction_score <= 10),
    total_score INT
);

-- 3. Таблица оценок коллег
CREATE TABLE PeerReviews (
    id SERIAL PRIMARY KEY,
    reviewer_id INT REFERENCES Employees(id),
    employee_id INT REFERENCES Employees(id),
    task_name TEXT,
    result_achievement INT CHECK (result_achievement >= 0 AND result_achievement <= 10),
    personal_qualities_comment TEXT,
    interaction_quality INT CHECK (interaction_quality >= 0 AND interaction_quality <= 10),
    improvement_recommendations TEXT,
    result_score INT
);

-- 4. Таблица оценок руководителя
CREATE TABLE ManagerEvaluations (
    id SERIAL PRIMARY KEY,
    employee_id INT REFERENCES Employees(id),
    manager_id INT REFERENCES Employees(id),
    result_achievement INT CHECK (result_achievement >= 0 AND result_achievement <= 10),
    personal_qualities_comment TEXT,
    personal_contribution TEXT,
    interaction_quality INT CHECK (interaction_quality >= 0 AND interaction_quality <= 10),
    improvement_recommendations TEXT,
    overall_rating INT CHECK (overall_rating >= 0 AND overall_rating <= 10),
    result_category VARCHAR(50),
    total_score INT
);

-- 5. Адресная книга
CREATE TABLE Employees (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    position VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    address TEXT
);

-- 6. Таблица итогов оценки
CREATE TABLE PerformanceResults (
    id SERIAL PRIMARY KEY,
    employee_id INT REFERENCES Employees(id),
    professional_qualities_score INT,
    personal_qualities_score INT,
    one_on_one_meetings BOOLEAN,
    communication_issues BOOLEAN,
    development_willingness DECIMAL(2,1),
    successor_potential BOOLEAN,
    successor_readiness VARCHAR(20),
    departure_risk INT CHECK (departure_risk >= 0 AND departure_risk <= 10),
    priority_1 VARCHAR(100),
    priority_2 VARCHAR(100),
    summary TEXT,
    resultivity_score INT,
    potential_score INT,
    total_score INT
);
