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
    public partial class furnizorMAX : MaterialSkin.Controls.MaterialForm
    {
        Thread th;

        Connect con = new Connect();
        SqlDataAdapter dtAp;
        DataTable dt;

        Connect con2 = new Connect();
        SqlDataAdapter dtAp2;
        DataTable dt2;

        SqlDataAdapter data;
        DataTable data2;
        Connect connect = new Connect();
        SqlCommand sum;

        public furnizorMAX()
        {
            InitializeComponent();

        }

        private void furnizorMAX_Load(object sender, EventArgs e)
        {
            dtAp = new SqlDataAdapter("SELECT TOP 1 furnizor.nume, furnizor.adresa, COUNT(carte.nrExemp) AS NrExemp FROM furnizor, carte WHERE furnizor.id_furnizor = carte.furnizor GROUP BY furnizor.nume,furnizor.adresa ORDER BY COUNT(carte.nrExemp) DESC;", con.openConnection());
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
            Application.Run(new Form2());
        }

        private void button1_Click(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            int an = Convert.ToInt32(textBox1.Text);
            dtAp2 = new SqlDataAdapter("SELECT SUM(carte.pret) AS SumaCartilor FROM carte WHERE anul_editiei = " + an, con2.openConnection());
            dt2 = new DataTable();
            dtAp2.Fill(dt2);
            dataGridView2.DataSource = dt2;
            con2.CloseConnection();

        }
    }
}
