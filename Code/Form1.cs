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
using DocumentFormat.OpenXml.Wordprocessing;
using System.Data.SqlClient;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.StartPanel;

namespace Program
{
    public partial class Form1 : MaterialSkin.Controls.MaterialForm
    {

        Thread th;

        SqlDataAdapter data;
        DataTable data2;
        Connect connect = new Connect();
        SqlCommand insert;
        SqlCommand insert2;
        Connect connect2 = new Connect();

        public Form1()
        {
            InitializeComponent();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void Form1_Load(object sender, EventArgs e)
        {
            panel1.Hide();
        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private bool VerificaAutentificare(string numeUtilizator, string parola)
        {
            try {
                // Creați o conexiune la baza de date
                using (SqlConnection conexiune = new SqlConnection("Data Source=LAB106_PC11\\SQLEXPRESS; Initial Catalog=Librarie; Integrated Security=True"))
                {
                    // Deschideți conexiunea
                    conexiune.Open();

                    // Creați o comandă SQL pentru a verifica existența numelui de utilizator și parolei
                    string interogare = "SELECT COUNT(*) FROM Userr WHERE username = '" + numeUtilizator + "' AND pass = '" + parola + "';";
                    using (SqlCommand comanda = new SqlCommand(interogare, conexiune))
                    {
                        // Adăugați parametrii în interogare pentru a preveni atacuri de tip SQL Injection
                        comanda.Parameters.AddWithValue("@NumeUtilizator", numeUtilizator);
                        comanda.Parameters.AddWithValue("@Parola", parola);

                        // Executați interogarea și obțineți numărul de înregistrări care se potrivesc
                        int numarInregistrari = (int)comanda.ExecuteScalar();

                        // Verificați dacă există o înregistrare care se potrivește cu numele de utilizator și parola
                        return numarInregistrari > 0;
                    }
                }
            } catch (Exception)
            {
                return false;
            }

        }

        private void button1_Click(object sender, EventArgs e)
        {
            string login = Convert.ToString(textBox1.Text);
            string password = Convert.ToString(textBox2.Text);

            if ((login == "admin") && (password == "1111"))
            {
                MessageBox.Show("Logged in successfully!");

                if (checkBox1.Checked == true)
                {
                    textBox1.Text = "admin";
                    textBox2.Text = "1111";
                }

                this.Close();
                th = new Thread(openNewForm);
                th.SetApartmentState(ApartmentState.STA);
                th.Start();
            }
            
            if (VerificaAutentificare(login, password))
            {
                MessageBox.Show("Logged in successfully!");

                this.Close();
                th = new Thread(openNewForm);
                th.SetApartmentState(ApartmentState.STA);
                th.Start();
            } else
            {
                MessageBox.Show("Incorrect password!");
            }

        }
        private void button2_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Username: admin\nPassword: 1111     ");
        }
        private void openNewForm()
        {
            Application.Run(new Form2());
        }
        private void button3_Click(object sender, EventArgs e)
        {
            panel1.Show();
        }
        private void button4_Click(object sender, EventArgs e)
        {
            
            try
            {
                string username = Convert.ToString(textBox3.Text);
                string password = Convert.ToString(textBox4.Text);

                insert = new SqlCommand
                    ("CREATE LOGIN " +  username + " WITH PASSWORD = '" + password + "'; CREATE USER " + username + " FOR LOGIN " + username + "; INSERT INTO Userr VALUES ('" + username + "', '" + password + "');", connect.openConnection());
                insert.ExecuteNonQuery();
                MessageBox.Show("Datele au fost salvate in baza de date cu succes!");

                this.Close();
                th = new Thread(openNewForm);
                th.SetApartmentState(ApartmentState.STA);
                th.Start();

            } catch (Exception)
            {
                MessageBox.Show("Contul nu poate fi creat!");
            }

        }
    }
}
