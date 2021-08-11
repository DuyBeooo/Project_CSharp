using PRF192_PE_GradeClient.controller;
using PRF192_PE_GradeClient.model;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace PRF192_PE_GradeClient.view
{
    public partial class Grade : Form
    {
        Controller controller = new Controller();
        
        private string currentStudentCode = "";
        private string currentQuestion = "";
        private Student student;
        private Mark mark;
        private List<TestCase> listTestCase;
        private double totalFile;
        public Grade()
        {
            InitializeComponent();
            listTestCase = new List<TestCase>();
        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            string studentID = txtMssv.Text.Trim();
            if (studentID.Length == 0)
            {
                MessageBox.Show("Enter Student ID, please!!!");
                return;
            }
            else if (!controller.checkStudentID(studentID))
            {
                MessageBox.Show("Student ID is not exist! Enter again!");
                return;
            }
            else
            {
                controller.GetDetailMark(studentID);
                ShowDetail frmDetail = new ShowDetail(studentID);
                frmDetail.Show();
            }
        }

        private void btnDetail_Click(object sender, EventArgs e)
        {
            new ShowDetail().ShowDialog();
        }

        private void dgvGrade_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                if (dgvGrade.Rows[e.RowIndex].Cells[e.ColumnIndex].Value != null)
                {
                    txtMssv.Text = dgvGrade.Rows[e.RowIndex].Cells[0].Value.ToString();
                }
            }
            catch
            {
                return;
            }
           
        }
        public void RefreshData()
        {
            dgvGrade.DataSource = null;
            dgvGrade.DataSource = controller.GetTableMark();
        }
        private void Grade_Load(object sender, EventArgs e)
        {
            dgvGrade.AllowUserToAddRows = false;
            dgvGrade.ReadOnly = true;
            RefreshData();
        }

        private void btnInput_Click(object sender, EventArgs e)
        {
            this.folderBrowserDialog1 = new FolderBrowserDialog();
            DialogResult result = this.folderBrowserDialog1.ShowDialog();
            if (result == DialogResult.OK)
            {
                txtInput.Text = this.folderBrowserDialog1.SelectedPath;
            }
        }

        private void btnTestcase_Click(object sender, EventArgs e)
        {
            this.folderBrowserDialog1 = new FolderBrowserDialog();
            DialogResult result = this.folderBrowserDialog1.ShowDialog();
            if (result == DialogResult.OK)
            {
                txtTestcase.Text = this.folderBrowserDialog1.SelectedPath;
            }
        }

        private void btnGrade_Click(object sender, EventArgs e)
        {
            listTestCase = new List<TestCase>();
            //đọc file txt từ test case
            //chạy file exe
            //lấy giá trị trả về của file exe
            string testCasePath = txtTestcase.Text;
            string exePath = txtInput.Text;
            totalFile = Directory.GetDirectories(exePath).Length;
            if (!Directory.Exists(testCasePath) && !Directory.Exists(exePath))
            {
                MessageBox.Show("Not Exsist Directory!");
                return;
            }
            GetListTestCase(testCasePath);
            //txtExeFileName.AppendText($"{listTestQuestions.Count}{Environment.NewLine}");
            ExecuteExeFile(exePath);
            MessageBox.Show("Success!");
            RefreshData();
        }


        // xuat ra file excel
        private void btnExcelExport_Click(object sender, EventArgs e)
        {
            // ghi dữ liệu ra file excel
            if (saveFileDialog1.ShowDialog() == DialogResult.OK)
            {
                controller.ToExcel(dgvGrade, saveFileDialog1.FileName);
            }

        }

        private void folderBrowserDialog2_HelpRequest(object sender, EventArgs e)
        {

        }

        // lấy ra list chứa tất cả các test case, mỗi test case(vd: tc1.txt) là 1 phần tử
        public void GetListTestCase(string dirPath)
        {
            if (!Directory.Exists(dirPath))
            {
                MessageBox.Show("Not Exsist Directory!");
            }
            else
            {
                string[] dirEntries = Directory.GetDirectories(dirPath);
                if (dirEntries.Length > 0)
                {
                    foreach (string dirEntryPath in dirEntries)
                    {
                        GetListTestCase(dirEntryPath);
                    }
                }

                string[] fileEntries = Directory.GetFiles(dirPath);
                if (fileEntries.Length > 0)
                {
                    TestCase testquestion;

                    foreach (string fileName in fileEntries)
                    {

                        if (fileName.EndsWith(".txt"))
                        {
                            testquestion = new TestCase();
                            testquestion.QuestionName = Path.GetFileName(Path.GetDirectoryName(fileName));
                            testquestion.ListTestCase = new Dictionary<string, List<string>>();

                            List<string> lineContent = new List<string>();

                            string[] lines = File.ReadAllLines(fileName);
                            foreach (string line in lines)
                            {
                                if (line.Equals("INPUT:") || line.Equals("OUTPUT:") || line.Equals("MARK:"))
                                {
                                    switch (line)
                                    {
                                        case "INPUT:":
                                            lineContent = new List<string>();
                                            break;
                                        case "OUTPUT:":
                                            testquestion.ListTestCase.Add("input", lineContent);
                                            lineContent = new List<string>();
                                            break;
                                        case "MARK:":
                                            testquestion.ListTestCase.Add("output", lineContent);
                                            lineContent = new List<string>();
                                            break;
                                    }
                                }
                                else
                                {
                                    if (line.Trim() != "")
                                    {
                                        lineContent.Add(line);
                                    }
                                }
                            }
                            testquestion.ListTestCase.Add("mark", lineContent);
                            listTestCase.Add(testquestion);
                        }
                    }
                }

            }
        }

        // hàm chạy từng file .exe với input lấy từ list test case
        public void RunExe(string path)
        {
            try
            {
                foreach (TestCase testCase in listTestCase.Where(tc => tc.QuestionName == currentQuestion))
                {
                    ProcessStartInfo startInfo = new ProcessStartInfo();
                    startInfo.FileName = path; // file .exe
                    startInfo.UseShellExecute = false;
                    startInfo.CreateNoWindow = true;// ko hiện cửa sổ command
                    startInfo.RedirectStandardInput = true;// cho phép input đầu vào
                    startInfo.RedirectStandardOutput = true; // cho phép đọc đầu ra ouput

                    Process process = Process.Start(startInfo);// chạy file .exe
                    StreamWriter sw = process.StandardInput; // khai báo để nhập đầu vào
                    foreach (string param in testCase.ListTestCase["input"])
                    {
                        sw.WriteLine(param);
                    }
                    sw.Close(); // đóng StreamWriter

                    bool startWrite = false;
                    List<string> outputLines = new List<string>();
                    while (!process.StandardOutput.EndOfStream)
                    {
                        string line = process.StandardOutput.ReadLine();
                        if (startWrite)
                        {
                            outputLines.Add(line);
                            continue;
                        }

                        if (line.Trim().Equals("OUTPUT:"))
                        {
                            startWrite = true;
                        }

                    }

                    startWrite = false;
                    process.WaitForExit();
                    process.Close();// đóng command 

                    List<string> result = testCase.ListTestCase["output"];
                    List<string> markInTxt = testCase.ListTestCase["mark"];                   
                    if (result.Count == outputLines.Count)
                    {
                        for (int i = 0; i < result.Count; i++)
                        {
                            if (!result[i].Equals(outputLines[i]))
                            {                                
                                break;
                            }
                            else// nếu output giống với kết quả chương trình thì add vào database
                            {
                                foreach (string m in markInTxt)
                                {
                                    controller.AddMarkDetail(student, mark, currentQuestion, 
                                        Convert.ToDouble(m.Trim().ToString()));
                                }
                                
                            }
                        }
                    }
                    else
                    {                        
                    }                   

                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Exception: " + ex);
            }
        }

        // hàm chạy lần lượt tất cả các file .exe, mình sẽ truyền vào đường dẫn folder chứa tất cả các file bài làm
        public void ExecuteExeFile(string dirPath)
        {
            if (!Directory.Exists(dirPath))
            {
                MessageBox.Show("Not Exsist Directory!");
            }
            else
            {
                string[] dirEntries = Directory.GetDirectories(dirPath);
                if (dirEntries.Length > 0)
                {
                    foreach (string dirEntryPath in dirEntries)
                    {
                        string pathName = Path.GetFileName(dirEntryPath);
                        if (pathName.StartsWith("HE"))
                        {
                            currentStudentCode = pathName;
                            // thêm student vào database
                            student = controller.addNewStudent(currentStudentCode);
                            // thêm mark vào grid view, điểm tổng lúc này là 0
                            controller.addNewMark(student);
                            //lấy đối tượng mark vừa thêm vào từ database -> lấy record id
                            mark = controller.GetMark(student);
                        }
                        if (pathName.StartsWith("Q"))
                        {
                            currentQuestion = pathName;
                        }
                        ExecuteExeFile(dirEntryPath);
                    }
                }

                string[] fileEntries = Directory.GetFiles(dirPath);
                if (fileEntries.Length > 0)
                {
                    foreach (string fileName in fileEntries)
                    {
                        if (fileName.EndsWith(".exe"))
                        {
                            // thực hiện việc chấm
                            RunExe(fileName);
                            // chấm xong thì update lại điểm vào grid view
                            controller.UpdateMark(student,mark);
                        }
                    }
                }
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            GradeDetails frm = new GradeDetails();
            frm.Show();
        }
    }
}
