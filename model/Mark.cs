using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PRF192_PE_GradeClient.model
{
    class Mark
    {
        private string studentID;
        private int recordID;
        private string examCode;
        private double totalMark;
        private DateTime examDate;

        public Mark(string studentID, int recordID, string examCode, double totalMark, DateTime examDate)
        {
            this.studentID = studentID;
            this.recordID = recordID;
            this.examCode = examCode;
            this.totalMark = totalMark;
            this.examDate = examDate;
        }
        public Mark(string studentID, string examCode, double totalMark, DateTime examDate)
        {
            this.studentID = studentID;           
            this.examCode = examCode;
            this.totalMark = totalMark;
            this.examDate = examDate;
        }
        public Mark()
        {
        }

        public string StudentID { get => studentID; set => studentID = value; }
        public int RecordID { get => recordID; set => recordID = value; }
        public string ExamCode { get => examCode; set => examCode = value; }
        public double TotalMark { get => totalMark; set => totalMark = value; }
        public DateTime ExamDate { get => examDate; set => examDate = value; }
    }
}
