-- Create Departments table
CREATE TABLE Departments (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL
);

-- Create Employees table
CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    DepartmentID INT NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Create Attendance table
CREATE TABLE Attendance (
    AttendanceID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeID INT NOT NULL,
    AttendanceDate DATE DEFAULT CURRENT_DATE,
    Status ENUM('Present', 'Absent') NOT NULL,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Insert sample data into Departments
INSERT INTO Departments (DepartmentName) VALUES
('Human Resources'),
('Finance'),
('IT');

-- Insert sample data into Employees
INSERT INTO Employees (Name, Email, DepartmentID) VALUES
('Alice Johnson', 'alice@example.com', 1),
('Bob Smith', 'bob@example.com', 2),
('Charlie Brown', 'charlie@example.com', 3);

-- Insert sample data into Attendance
INSERT INTO Attendance (EmployeeID, Status) VALUES
(1, 'Present'),
(2, 'Absent'),
(3, 'Present');

-- Retrieve daily attendance
SELECT 
    Attendance.AttendanceID,
    Employees.Name AS EmployeeName,
    Departments.DepartmentName,
    Attendance.AttendanceDate,
    Attendance.Status
FROM Attendance
JOIN Employees ON Attendance.EmployeeID = Employees.EmployeeID
JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;
