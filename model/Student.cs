using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PRF192_PE_GradeClient.model
{
    class Student
    {
        private string studentID;
        private string studentName;

        public Student()
        {
        }

        public string StudentID { get => studentID; set => studentID = value; }
        public string StudentName { get => studentName; set => studentName = value; }

        public Student(string studentID, string studentName)
        {
            this.studentID = studentID;
            this.studentName = studentName;
        }
    }
}
