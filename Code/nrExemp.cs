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
    public partial class nrExemp : MaterialSkin.Controls.MaterialForm
    {
        Connect con = new Connect();
        SqlDataAdapter dtAp;
        DataTable dt;

        Connect con2 = new Connect();
        SqlDataAdapter dtAp2;
        DataTable dt2;

        Thread th;

        public nrExemp()
        {
            InitializeComponent();
        }

        private void nrExemp_Load(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

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
            Application.Run(new Form2());
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string limba = Convert.ToString(textBox1.Text);

            dtAp = new SqlDataAdapter("SELECT * FROM carte WHERE carte.limba = '" + limba + "';", con.openConnection());
            dt = new DataTable();
            dtAp.Fill(dt);
            dataGridView1.DataSource = dt;
            con.CloseConnection();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            string autor = Convert.ToString(textBox2.Text);

            dtAp2 = new SqlDataAdapter("SELECT * FROM carte WHERE carte.autor LIKE '%" + autor + "%'", con2.openConnection());
            dt2 = new DataTable();
            dtAp2.Fill(dt2);
            dataGridView2.DataSource = dt2;
            con2.CloseConnection();

        }
    }
}
