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
    public partial class CarteUpdate : MaterialSkin.Controls.MaterialForm
    {

        Thread th;

        SqlDataAdapter data;
        DataTable data2;
        Connect connect = new Connect();
        SqlCommand insert;

        public CarteUpdate()
        {
            InitializeComponent();
        }

        private void AngajatiUpdate_Load(object sender, EventArgs e)
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
                string denumire = Convert.ToString(textBox1.Text);
                string autor = Convert.ToString(textBox2.Text);
                string editura = Convert.ToString(textBox3.Text);
                string anEditie = Convert.ToString(textBox4.Text);
                string domeniu = Convert.ToString(textBox5.Text);
                string limba = Convert.ToString(textBox6.Text);
                string pret = Convert.ToString(textBox7.Text);
                string nrExemp = Convert.ToString(textBox8.Text);
                string furnizor = Convert.ToString(textBox9.Text);


                insert = new SqlCommand
                        ("INSERT INTO carte VALUES ('" + denumire + "', '" +
                            autor + "', '" + editura + "', '" + anEditie + "', '" + domeniu + "', '" + limba + "', '" + pret + "', '" + nrExemp + "', '" + furnizor + "')", connect.openConnection());
                insert.ExecuteNonQuery();
                MessageBox.Show("Datele au fost salvate in baza de date cu succes!");

                this.Close();
                th = new Thread(openNewForm);
                th.SetApartmentState(ApartmentState.STA);
                th.Start();
            } catch(Exception)
            {

            }
            
            }
     }
 }