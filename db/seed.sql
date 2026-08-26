INSERT INTO teachers (teacher_code, full_name, email, phone, subject_specialty, join_date) VALUES
('teacher01', 'Aisha Rahman', 'aisha@sunrise.edu', '+65 8123 1001', 'English', '2024-01-08'),
('teacher02', 'Daniel Lim', 'daniel@sunrise.edu', '+65 8123 1002', 'Mathematics', '2023-06-12'),
('teacher03', 'Mei Chen', 'mei@sunrise.edu', '+65 8123 1003', 'Science', '2024-02-01'),
('teacher04', 'Noah Tan', 'noah@sunrise.edu', '+65 8123 1004', 'Chinese', '2022-08-15'),
('teacher05', 'Priya Nair', 'priya@sunrise.edu', '+65 8123 1005', 'Mathematics', '2023-01-09'),
('teacher06', 'Samuel Wong', 'samuel@sunrise.edu', '+65 8123 1006', 'English', '2024-04-22')
ON CONFLICT DO NOTHING;
INSERT INTO classes (class_code, class_name, subjects, schedule_days, schedule_time, room, teacher_id) VALUES
('primary1', 'Primary 1', 'English, Mathematics', 'Mon, Wed', '16:00 - 18:00', 'Room 01', (SELECT teacher_id FROM teachers WHERE teacher_code = 'teacher01')),
('primary2', 'Primary 2', 'English, Mathematics, Science', 'Tue, Thu', '16:00 - 18:00', 'Room 02', (SELECT teacher_id FROM teachers WHERE teacher_code = 'teacher02')),
('primary3', 'Primary 3', 'Mathematics, Science', 'Mon, Fri', '16:00 - 18:00', 'Room 03', (SELECT teacher_id FROM teachers WHERE teacher_code = 'teacher03')),
('primary4', 'Primary 4', 'English, Chinese', 'Tue, Thu', '18:00 - 20:00', 'Room 04', (SELECT teacher_id FROM teachers WHERE teacher_code = 'teacher04')),
('primary5', 'Primary 5', 'Mathematics, Science', 'Wed, Fri', '18:00 - 20:00', 'Room 05', (SELECT teacher_id FROM teachers WHERE teacher_code = 'teacher05')),
('primary6', 'Primary 6', 'English, Mathematics, Science', 'Mon, Thu', '18:00 - 20:00', 'Room 06', (SELECT teacher_id FROM teachers WHERE teacher_code = 'teacher06'))
ON CONFLICT DO NOTHING;
INSERT INTO students (student_code, full_name, gender, age, class_id, guardian_name, guardian_phone, guardian_email, enrolment_date) VALUES
('primary1-student01','Aiden Tan','Male',7,(SELECT class_id FROM classes WHERE class_code='primary1'),'Grace Tan','+65 9000 1001','grace@example.com','2025-01-06'),
('primary1-student02','Chloe Lim','Female',7,(SELECT class_id FROM classes WHERE class_code='primary1'),'Jason Lim','+65 9000 1002','jason@example.com','2025-01-06'),
('primary1-student03','Ethan Lee','Male',7,(SELECT class_id FROM classes WHERE class_code='primary1'),'Mina Lee','+65 9000 1003','mina@example.com','2025-01-06'),
('primary1-student04','Sofia Ng','Female',7,(SELECT class_id FROM classes WHERE class_code='primary1'),'Ben Ng','+65 9000 1004','ben@example.com','2025-01-06'),
('primary2-student01','Lucas Koh','Male',8,(SELECT class_id FROM classes WHERE class_code='primary2'),'Amy Koh','+65 9000 2001','amy@example.com','2025-01-06'),
('primary2-student02','Emma Goh','Female',8,(SELECT class_id FROM classes WHERE class_code='primary2'),'David Goh','+65 9000 2002','david@example.com','2025-01-06'),
('primary2-student03','Oliver Ho','Male',8,(SELECT class_id FROM classes WHERE class_code='primary2'),'Sarah Ho','+65 9000 2003','sarah@example.com','2025-01-06'),
('primary2-student04','Mia Yeo','Female',8,(SELECT class_id FROM classes WHERE class_code='primary2'),'Ken Yeo','+65 9000 2004','ken@example.com','2025-01-06'),
('primary2-student05','Kai Wong','Male',8,(SELECT class_id FROM classes WHERE class_code='primary2'),'Lily Wong','+65 9000 2005','lily@example.com','2025-01-06'),
('primary3-student01','James Chua','Male',9,(SELECT class_id FROM classes WHERE class_code='primary3'),'Ivy Chua','+65 9000 3001','ivy@example.com','2025-01-06'),
('primary3-student02','Isla Seah','Female',9,(SELECT class_id FROM classes WHERE class_code='primary3'),'Mark Seah','+65 9000 3002','mark@example.com','2025-01-06'),
('primary3-student03','Henry Sim','Male',9,(SELECT class_id FROM classes WHERE class_code='primary3'),'June Sim','+65 9000 3003','june@example.com','2025-01-06'),
('primary3-student04','Ella Low','Female',9,(SELECT class_id FROM classes WHERE class_code='primary3'),'Ray Low','+65 9000 3004','ray@example.com','2025-01-06'),
('primary4-student01','Leo Toh','Male',10,(SELECT class_id FROM classes WHERE class_code='primary4'),'Nora Toh','+65 9000 4001','nora@example.com','2025-01-06'),
('primary4-student02','Amelia Quek','Female',10,(SELECT class_id FROM classes WHERE class_code='primary4'),'Ian Quek','+65 9000 4002','ian@example.com','2025-01-06'),
('primary4-student03','Ryan Foo','Male',10,(SELECT class_id FROM classes WHERE class_code='primary4'),'Jo Foo','+65 9000 4003','jo@example.com','2025-01-06'),
('primary4-student04','Zoe Teo','Female',10,(SELECT class_id FROM classes WHERE class_code='primary4'),'Tim Teo','+65 9000 4004','tim@example.com','2025-01-06'),
('primary5-student01','Evan Ho','Male',11,(SELECT class_id FROM classes WHERE class_code='primary5'),'Wendy Ho','+65 9000 5001','wendy@example.com','2025-01-06'),
('primary5-student02','Aria Lam','Female',11,(SELECT class_id FROM classes WHERE class_code='primary5'),'Peter Lam','+65 9000 5002','peter@example.com','2025-01-06'),
('primary5-student03','Max Ang','Male',11,(SELECT class_id FROM classes WHERE class_code='primary5'),'Fiona Ang','+65 9000 5003','fiona@example.com','2025-01-06'),
('primary5-student04','Nina Poh','Female',11,(SELECT class_id FROM classes WHERE class_code='primary5'),'Owen Poh','+65 9000 5004','owen@example.com','2025-01-06'),
('primary6-student01','Theo Lim','Male',12,(SELECT class_id FROM classes WHERE class_code='primary6'),'Alice Lim','+65 9000 6001','alice@example.com','2025-01-06'),
('primary6-student02','Layla Tan','Female',12,(SELECT class_id FROM classes WHERE class_code='primary6'),'Chris Tan','+65 9000 6002','chris@example.com','2025-01-06'),
('primary6-student03','Adam Ong','Male',12,(SELECT class_id FROM classes WHERE class_code='primary6'),'Ruth Ong','+65 9000 6003','ruth@example.com','2025-01-06'),
('primary6-student04','Hana Lee','Female',12,(SELECT class_id FROM classes WHERE class_code='primary6'),'Eric Lee','+65 9000 6004','eric@example.com','2025-01-06')
ON CONFLICT DO NOTHING;
