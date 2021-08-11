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
    public partial class GradeDetails : Form
    {
        Controller c = new Controller();
        public GradeDetails()
        {
            InitializeComponent();
        }

        private void GradeDetails_Load(object sender, EventArgs e)
        {
            dgvAllDetails.DataSource = null;
            dgvAllDetails.AllowUserToAddRows = false;
            dgvAllDetails.ReadOnly = true;
            dgvAllDetails.DataSource = c.GetAllInformation();
        }

        private void btnExcel_Click(object sender, EventArgs e)
        {
            // ghi dữ liệu ra file excel
            if (saveFileDialog1.ShowDialog() == DialogResult.OK)
            {
                c.ToExcel(dgvAllDetails, saveFileDialog1.FileName);
            }
        }

        private void saveFileDialog1_FileOk(object sender, CancelEventArgs e)
        {

        }
    }
}
