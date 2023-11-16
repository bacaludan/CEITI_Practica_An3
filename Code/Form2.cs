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
    public partial class Form2 : MaterialSkin.Controls.MaterialForm
    {
        Thread th;

        SqlDataAdapter data;
        DataTable data2;
        Connect connect = new Connect();
        SqlCommand delete;

        public Form2()
        {
            InitializeComponent();
        }

        private void Form2_Load(object sender, EventArgs e)
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
            Application.Run(new Form1());
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
            th = new Thread(openNewForm2);
            th.SetApartmentState(ApartmentState.STA);
            th.Start();
        }

        private void openNewForm2()
        {
            Application.Run(new Form4());
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
            th = new Thread(openNewForm3);
            th.SetApartmentState(ApartmentState.STA);
            th.Start();
        }

        private void openNewForm3()
        {
            Application.Run(new Form3());
        }

        private void button4_Click(object sender, EventArgs e)
        {
            this.Close();
            th = new Thread(openNewForm4);
            th.SetApartmentState(ApartmentState.STA);
            th.Start();
        }

        private void openNewForm4()
        {
            Application.Run(new FormDelete());
        }

        private void button5_Click(object sender, EventArgs e)
        {
            delete = new SqlCommand
                    ("DELETE FROM carte WHERE nrExemp = 0", connect.openConnection());
            delete.ExecuteNonQuery();
            
            MessageBox.Show("Cartile cu numarul de exemplare = 0 au fost eliminate!");
        }

        private void button6_Click(object sender, EventArgs e)
        {
            this.Close();
            th = new Thread(openNewForm5);
            th.SetApartmentState(ApartmentState.STA);
            th.Start();
        }

        private void openNewForm5()
        {
            Application.Run(new furnizorMAX());
        }

        private void button7_Click(object sender, EventArgs e)
        {
            this.Close();
            th = new Thread(openNewForm6);
            th.SetApartmentState(ApartmentState.STA);
            th.Start();
        }

        private void openNewForm6()
        {
            Application.Run(new nrExemp());
        }

        private void button8_Click(object sender, EventArgs e)
        {
            this.Close();
            th = new Thread(openNewForm7);
            th.SetApartmentState(ApartmentState.STA);
            th.Start();
        }

        private void openNewForm7()
        {
            Application.Run(new limbaRomana());
        }

        private void button9_Click(object sender, EventArgs e)
        {
            this.Close();
            th = new Thread(openNewForm8);
            th.SetApartmentState(ApartmentState.STA);
            th.Start();
        }

        private void openNewForm8()
        {
            Application.Run(new exportExcel());
        }

        private void button10_Click(object sender, EventArgs e)
        {
            this.Close();
            th = new Thread(openNewForm5);
            th.SetApartmentState(ApartmentState.STA);
            th.Start();
        }
    }
}
