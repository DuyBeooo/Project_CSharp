using PRF192_PE_GradeClient.model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace PRF192_PE_GradeClient.controller
{
    class Controller
    {
        Database database = new Database();
        public DataTable GetTableMark()
        {
            string sql = "select m.StudentID as[Student ID],m.RecordID as [Record ID]," +
                "m.ExamCode as[Exam Code],m.TotalMark as [Total Mark]," +
                "CONVERT (NVARCHAR, m.ExamDate, 13) as [Exam Date] from Mark m order by ExamDate desc";
            return database.GetDataBySql(sql);
        }

        //check student id exist
        public bool checkStudentID(string studentID)
        {
            string sql = "select count(*) as counts from student md where md.StudentID = '" + studentID + "'";
            DataTable table = database.GetDataBySql(sql);
            foreach (DataRow row in table.Rows)
            {
                int count = Convert.ToInt32(row["counts"].ToString());
                if (count > 0)
                    return true;// exist
            }
            return false;// not exist
        }

        //add new student
        public Student addNewStudent(string pathFile)
        {

            string[] arr = pathFile.Trim().Split('_');
            string studentID = arr[0];
            string studentName = arr[1];
            if (!checkStudentID(studentID))//chưa tồn tại thì thêm vào, tồn tại rồi thì bỏ qua
            {
                string sql = "insert into student values(@sid,@sname)";
                SqlParameter[] sqls = new SqlParameter[]
                {
                        new SqlParameter("@sid",SqlDbType.NVarChar),
                        new SqlParameter("@sname",SqlDbType.NVarChar)
                };
                sqls[0].Value = studentID;
                sqls[1].Value = studentName;
                database.ExecuteSql(sql, sqls);
            }
            return new Student(studentID, studentName);
        }




        // add new mark into database
        public void addNewMark(Student s)
        {
            string sql = "insert into mark values(@sid,@ecode,@total,@date)";
            SqlParameter[] sqls = new SqlParameter[]
            {
                        new SqlParameter("@sid",SqlDbType.NVarChar),
                        new SqlParameter("@ecode",SqlDbType.NVarChar),
                        new SqlParameter("@total",SqlDbType.Float),
                        new SqlParameter("@date",SqlDbType.DateTime)
            };
            sqls[0].Value = s.StudentID;
            sqls[1].Value = "PRN292";
            sqls[2].Value = 0;
            sqls[3].Value = DateTime.Now;
            database.ExecuteSql(sql, sqls);
        }

        //get Mark by student id
        public Mark GetMark(Student s)
        {
            Mark mark = null; ;
            // get mark cua student vua them vao
            string sql = "select top 1 * from Mark m where m.StudentID ='" + s.StudentID + "' order by ExamDate desc";
            DataTable data = database.GetDataBySql(sql);
            foreach (DataRow row in data.Rows)
            {
                mark = new Mark(row["studentid"].ToString(),
                    Convert.ToInt32(row["recordid"].ToString()),
                    row["examcode"].ToString(),
                   Convert.ToDouble(row["totalmark"].ToString()),
                   Convert.ToDateTime(row["examdate"].ToString()));
            }
            return mark;
        }

        //add mark detail
        public void AddMarkDetail(Student s, Mark m, string currentQuestion, double mark)
        {
            string sql = "insert into mark_detail values(@sid,@recordid,@question,@mark,@comment)";
            SqlParameter[] sqls = new SqlParameter[]
            {
                        new SqlParameter("@sid",SqlDbType.NVarChar),
                        new SqlParameter("@recordid",SqlDbType.Int),
                        new SqlParameter("@question",SqlDbType.NVarChar),
                        new SqlParameter("@mark",SqlDbType.Float),
                        new SqlParameter("@comment",SqlDbType.NVarChar)
            };
            sqls[0].Value = s.StudentID;
            sqls[1].Value = m.RecordID;
            sqls[2].Value = currentQuestion;
            sqls[3].Value = mark;
            sqls[4].Value = "GOOD";
            database.ExecuteSql(sql, sqls);
        }

        public void UpdateMark(Student s, Mark m)
        {
            string sql = "update Mark  set TotalMark = (select Sum(m.Mark) from Mark_Detail m " +
            "where m.StudentID = @sid and RecordID = @rid) where StudentID = @sid and RecordID = @rid";
            SqlParameter[] sqls = new SqlParameter[]
           {
                        new SqlParameter("@sid",SqlDbType.NVarChar),
                        new SqlParameter("@rid",SqlDbType.Int)                      
           };
            sqls[0].Value = s.StudentID;
            sqls[1].Value = m.RecordID;          
            database.ExecuteSql(sql, sqls);
        }
       
        // get mark detail by student id
        public DataTable GetDetailMark(string studentID)
        {
            string sql = "select md.StudentID as [Student ID],s.StudentName as [Name],md.RecordID as [Record ID]," +
                "md.QuestionID as [Question ID], md.Mark, md.Comment " +
                "from Mark_Detail md,Student s where md.StudentID = '" + studentID + "' and s.StudentID = md.StudentID";
            return database.GetDataBySql(sql);
        }

        // get full information
        public DataTable GetAllInformation()
        {
            string sql = "select m.RecordID as[Record ID], m.StudentID as[Student ID], s.StudentName as[Student Name]," +
                " m.ExamCode as[Exam code], md.QuestionID as [Question], md.Mark as[Mark], " +
                "md.Comment,m.TotalMark as[Total Mark], CONVERT (NVARCHAR,  m.ExamDate, 13) as[Exam Date] from Mark m, " +
                "Mark_Detail md, Student s where s.StudentID = m.StudentID and m.RecordID = md.RecordID " +
                "order by m.ExamDate desc";
            return database.GetDataBySql(sql);
        }

        //xuat ra file excel
        public void ToExcel(DataGridView dataGridView1, string fileName)
        {
            Microsoft.Office.Interop.Excel.Application excel;
            Microsoft.Office.Interop.Excel.Workbook workbook;
            Microsoft.Office.Interop.Excel.Worksheet worksheet;

            try
            {
                excel = new Microsoft.Office.Interop.Excel.Application();
                excel.Visible = false;
                excel.DisplayAlerts = false;

                workbook = excel.Workbooks.Add(Type.Missing);

                worksheet = (Microsoft.Office.Interop.Excel.Worksheet)workbook.Sheets["Sheet1"];
                worksheet.Name = "Grade";

                // export header
                for (int i = 0; i < dataGridView1.ColumnCount; i++)
                {
                    worksheet.Cells[1, i + 1] = dataGridView1.Columns[i].HeaderText;
                }

                // export content
                for (int i = 0; i < dataGridView1.RowCount; i++)
                {
                    for (int j = 0; j < dataGridView1.ColumnCount; j++)
                    {
                        worksheet.Cells[i + 2, j + 1] = dataGridView1.Rows[i].Cells[j].Value.ToString();
                    }
                }

                // save workbook
                workbook.SaveAs(fileName);
                workbook.Close();
                excel.Quit();
                MessageBox.Show("Export successful.!");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            finally
            {
                workbook = null;
                worksheet = null;
            }
        }

    }
}
