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
using System.Data;

namespace Program
{
    public partial class CarteSelect : MaterialSkin.Controls.MaterialForm
    {
        Connect con = new Connect();
        SqlDataAdapter dtAp;
        DataTable dt;


        Thread th;

        public CarteSelect()
        {
            InitializeComponent();
        }

        private void AngajatiSelect_Load(object sender, EventArgs e)
        {
            dtAp = new SqlDataAdapter("SELECT * FROM carte", con.openConnection());
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

        private void panel2_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
