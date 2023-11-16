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
    public partial class FormDelete : MaterialSkin.Controls.MaterialForm
    {
        SqlDataAdapter data;
        DataTable data2;
        Connect connect = new Connect();
        SqlCommand delete;

        Thread th;

        public FormDelete()
        {
            InitializeComponent();
        }

        private void FormDelete_Load(object sender, EventArgs e)
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
            
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void button8_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(textBox1.Text);
            if (comboBox1.SelectedItem == "Carte") // carte
            {
                delete = new SqlCommand
                    ("DELETE FROM carte WHERE id_carte = " + id, connect.openConnection());
                delete.ExecuteNonQuery();
                MessageBox.Show("ID-ul cu numarul " + id + " a fost eliminat!");

                this.Close();
                th = new Thread(openNewForm);
                th.SetApartmentState(ApartmentState.STA);
                th.Start();

            } else if (comboBox1.SelectedItem == "Client") // client
            {
                delete = new SqlCommand
                    ("DELETE FROM client WHERE id_client = " + id, connect.openConnection());
                delete.ExecuteNonQuery();
                MessageBox.Show("ID-ul cu numarul " + id + " a fost eliminat!");

                this.Close();
                th = new Thread(openNewForm);
                th.SetApartmentState(ApartmentState.STA);
                th.Start();

            } else if (comboBox1.SelectedItem == "Furnizor") // furnizor
            {
                delete = new SqlCommand
                    ("DELETE FROM furnizor WHERE id_furnizor = " + id, connect.openConnection());
                delete.ExecuteNonQuery();
                MessageBox.Show("ID-ul cu numarul " + id + " a fost eliminat!");

                this.Close();
                th = new Thread(openNewForm);
                th.SetApartmentState(ApartmentState.STA);
                th.Start();

            } else if (comboBox1.SelectedItem == "Inchiriere") // inchiriere
            {
                delete = new SqlCommand
                    ("DELETE FROM inchiriere WHERE id_inchiriere = " + id, connect.openConnection());
                delete.ExecuteNonQuery();
                MessageBox.Show("ID-ul cu numarul " + id + " a fost eliminat!");

                this.Close();
                th = new Thread(openNewForm);
                th.SetApartmentState(ApartmentState.STA);
                th.Start();

            } else if (comboBox1.SelectedItem == "CarteLivrata") // carte livrata
            {
                delete = new SqlCommand
                    ("DELETE FROM carteLivrata WHERE id = " + id, connect.openConnection());
                delete.ExecuteNonQuery();
                MessageBox.Show("ID-ul cu numarul " + id + " a fost eliminat!");

                this.Close();
                th = new Thread(openNewForm);
                th.SetApartmentState(ApartmentState.STA);
                th.Start();

            }
        }
    }
}
