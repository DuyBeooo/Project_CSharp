using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PRF192_PE_GradeClient.model
{
    class MarkDetail
    {
        private string studentID;
        private int recordID;
        private string questionID;
        private float mark;
        private string comment;

        public MarkDetail()
        {
        }

        public MarkDetail(string studentID, int recordID, string questionID, float mark, string comment)
        {
            this.studentID = studentID;
            this.recordID = recordID;
            this.questionID = questionID;
            this.mark = mark;
            this.comment = comment;
        }

        public string StudentID { get => studentID; set => studentID = value; }
        public int RecordID { get => recordID; set => recordID = value; }
        public string QuestionID { get => questionID; set => questionID = value; }
        public float Mark { get => mark; set => mark = value; }
        public string Comment { get => comment; set => comment = value; }
    }
}
