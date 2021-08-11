using PRF192_PE_GradeClient.controller;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace PRF192_PE_GradeClient.view
{
    public partial class ShowDetail : Form
    {
        Controller controller = new Controller();
        private string studentId;
        public ShowDetail()
        {
            InitializeComponent();
        }
        public ShowDetail(string studentId)
        {
            this.studentId = studentId;
            InitializeComponent();

        }

        private void ShowDetail_Load(object sender, EventArgs e)
        {
            dgvDetail.DataSource = null;
            dgvDetail.AllowUserToAddRows = false;
            dgvDetail.ReadOnly = true;
            txtMssv.Text = studentId;
            txtMssv.ReadOnly = true;
            dgvDetail.DataSource = controller.GetDetailMark(studentId);           
        }

        private void btnExcel2_Click(object sender, EventArgs e)
        {
            // ghi dữ liệu ra file excel
            if (saveFileDialog1.ShowDialog() == DialogResult.OK)
            {
                controller.ToExcel(dgvDetail, saveFileDialog1.FileName);
            }
        }

        private void saveFileDialog1_FileOk(object sender, CancelEventArgs e)
        {

        }
    }
}
