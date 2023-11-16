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
    public partial class FurnizorUpdate : MaterialSkin.Controls.MaterialForm
    {

        Thread th;

        SqlDataAdapter data;
        DataTable data2;
        Connect connect = new Connect();
        SqlCommand insert;

        public FurnizorUpdate()
        {
            InitializeComponent();
        }

        private void DepartamenteUpdate_Load(object sender, EventArgs e)
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
            Application.Run(new Form4());
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                string nume = Convert.ToString(textBox1.Text);
                string adresa = Convert.ToString(textBox2.Text);

                insert = new SqlCommand
                        ("INSERT INTO furnizor VALUES ('" + nume + "', '" + adresa + "')", connect.openConnection());
                insert.ExecuteNonQuery();
                MessageBox.Show("Datele au fost salvate in baza de date cu succes!");

                this.Close();
                th = new Thread(openNewForm);
                th.SetApartmentState(ApartmentState.STA);
                th.Start();
            } catch (Exception)
            {
                MessageBox.Show("Eroare! Datele nu au fost salvate!");
            }
        }
    }
}
