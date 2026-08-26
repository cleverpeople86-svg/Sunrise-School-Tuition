CREATE TABLE IF NOT EXISTS teachers (
  teacher_id SERIAL PRIMARY KEY,
  teacher_code TEXT NOT NULL UNIQUE,
  full_name TEXT NOT NULL,
  email TEXT NOT NULL UNIQUE,
  phone TEXT,
  subject_specialty TEXT,
  join_date DATE,
  status TEXT NOT NULL DEFAULT 'Active' CHECK (status IN ('Active', 'On Leave', 'Inactive'))
);
CREATE TABLE IF NOT EXISTS classes (
  class_id SERIAL PRIMARY KEY,
  class_code TEXT NOT NULL UNIQUE,
  class_name TEXT NOT NULL,
  subjects TEXT,
  schedule_days TEXT,
  schedule_time TEXT,
  room TEXT,
  teacher_id INTEGER REFERENCES teachers(teacher_id) ON DELETE SET NULL,
  status TEXT NOT NULL DEFAULT 'Active' CHECK (status IN ('Active', 'Inactive'))
);
CREATE TABLE IF NOT EXISTS students (
  student_id SERIAL PRIMARY KEY,
  student_code TEXT NOT NULL UNIQUE,
  full_name TEXT NOT NULL,
  gender TEXT,
  age INTEGER CHECK (age IS NULL OR age BETWEEN 3 AND 25),
  class_id INTEGER NOT NULL REFERENCES classes(class_id),
  guardian_name TEXT NOT NULL,
  guardian_phone TEXT,
  guardian_email TEXT,
  enrolment_date DATE,
  status TEXT NOT NULL DEFAULT 'Active' CHECK (status IN ('Active', 'Withdrawn'))
);
CREATE INDEX IF NOT EXISTS students_class_id_idx ON students(class_id);
