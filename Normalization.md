# Normalization
## 1NF
|StudentID|StudentName|StudentMajor|CourseID|CourseName|InstructorID|InstructorName|Grade|
|-|-|-|-|-|-|-|-|
|1|Rohman|Teknik Industri|MAT1012|Kalkulus 02|INS002|Ira B|B|
|1|Rohman|Teknik Industri|MAT1013|Kalkulus 03|INS002|Ira B|C|

## 2NF
- Bergantung pada composite key
    |StudentID|CourseID|Grade|
    |-|-|-|
    |1|MAT1012|B|
    |1|MAT1013|C|
- Bergantung pada singular key
    - Student
        |StudentID|StudentName|StudentMajor|
        |-|-|-|
        |1|Rohman|Teknik Industri|
    - Course
        |CourseID|CourseName|InstructorID|InstructorName|
        |-|-|-|-|
        |MAT1012|Kalkulus 02|INS002|Ira B|
        |MAT1013|Kalkulus 03|INS002|Ira B|

## 3NF
- Karena InstructorName bergantung pada InstructorID (keduanya merupakan non-primary key pada tabel course)
    - Course
        |CourseID|CourseName|InstructorID|
        |-|-|-|
        |MAT1012|Kalkulus 02|INS002|
        |MAT1013|Kalkulus 03|INS002|
    - Instructor
        |InstructorID|InstructorName|
        |-|-|
        |INS002|Ira B|