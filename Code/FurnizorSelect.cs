using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Threading;
using System.Data.SqlClient;

namespace Program
{
    public partial class FurnizorSelect : MaterialSkin.Controls.MaterialForm
    {
        Connect con = new Connect();
        SqlDataAdapter dtAp;
        DataTable dt;
        Thread th;

        public FurnizorSelect()
        {
            InitializeComponent();
        }

        private void DepartamenteSelect_Load(object sender, EventArgs e)
        {
            dtAp = new SqlDataAdapter("SELECT * FROM furnizor", con.openConnection());
            dt = new DataTable();
            dtAp.Fill(dt);
            dataGridView1.DataSource = dt;
            con.CloseConnection();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            this.Close();
            th = new Thread(openNewForm);
            th.SetApartmentState(ApartmentState.STA);
            th.Start();
        }

        private void openNewForm()
        {
            Application.Run(new Form3());
        }
    }
}
