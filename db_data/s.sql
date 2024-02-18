
drop table if exists weekly_sessions;
drop table if exists weekly_timetable_day;
drop table if exists weekly_timetable;
 
-- Create the updated weekly_timetable table
CREATE TABLE weekly_timetable (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    term VARCHAR(255),
    class_id INT REFERENCES class(id),
    start_time INT,
    end_time INT,
    session_interval INT,
    break_interval INT
);

CREATE TABLE weekly_timetable_day (
    id SERIAL PRIMARY KEY,
    weekly_timetable_id INT REFERENCES weekly_timetable(id),
    weekday_id INT REFERENCES weekday(id)
);

-- Create the updated weekly_sessions table
CREATE TABLE weekly_sessions (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    weekly_timetable_day_id INT REFERENCES weekly_timetable_day(id),
    instructor_assignment_id INT,
    session_number INT
);




-- Insert weekdays into weekday
INSERT INTO weekday (name, is_day_off) VALUES 
    (1,'Friday', true),
    (2,'Saturday', true),
    (3,'Sunday', false),
    (4,'Monday', false),
    (5,'Tuesday', false),
    (6,'Wednesday', false),
    (7,'Thursday', false);

-- Insert data into weekly_timetable
INSERT INTO weekly_timetable (id,name, term, class_id, start_time, end_time, session_interval, break_interval)
VALUES (1,'Sample Timetable', 'Spring 2024', 1, 8, 14, 60, 10 );

-- Insert data into weekly_timetable_day
-- This is just an example. You would need to adjust the weekly_timetable_id and weekday_id values accordingly.
INSERT INTO weekly_timetable_day (id,weekly_timetable_id, weekday_id)
VALUES (1,1, 3), -- 1,'Sample Timetable' - Sunday
       (2,1, 4), -- 1,'Sample Timetable' - Monday
       (3,1, 5), -- 1,'Sample Timetable' - Tuesday
       (4,1, 6); -- 1,'Sample Timetable' - Wednesday



-- Insert data into weekly_sessions
INSERT INTO weekly_sessions (id,name, weekly_timetable_day_id, instructor_assignment_id, session_number)
VALUES (1,'Sunday Session 1', 1, 1, 1),-- Sunday
       (2,'Sunday Session 2', 1, 2, 2),-- Sunday
       (3,'Sunday Session 3', 1, 3, 3),-- Sunday
       (4,'Monday Session 1', 2, 1, 2),-- Monday
       (5,'Monday Session 2', 2, 2, 1),-- Monday
       (6,'Monday Session 3', 2, 3, 3);-- Monday

