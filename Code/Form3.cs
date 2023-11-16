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

namespace Program
{
    public partial class Form3 : MaterialSkin.Controls.MaterialForm
    {
        Thread th;

        public Form3()
        {
            InitializeComponent();
        }

        private void Form3_Load(object sender, EventArgs e)
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
            this.Close();
            th = new Thread(openNewFormCarteSelect);
            th.SetApartmentState(ApartmentState.STA);
            th.Start();
        }

        private void openNewFormCarteSelect()
        {
            Application.Run(new CarteSelect());
        }

        private void panel2_Paint(object sender, PaintEventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
            th = new Thread(openNewFormClientSelect);
            th.SetApartmentState(ApartmentState.STA);
            th.Start();
        }

        private void openNewFormClientSelect()
        {
            Application.Run(new ClientSelect());
        }

        private void button4_Click(object sender, EventArgs e)
        {
            this.Close();
            th = new Thread(openNewFormFurnizorSelect);
            th.SetApartmentState(ApartmentState.STA);
            th.Start();
        }

        private void openNewFormFurnizorSelect()
        {
            Application.Run(new FurnizorSelect());
        }

        private void button5_Click(object sender, EventArgs e)
        {
            this.Close();
            th = new Thread(openNewFormInchiriere);
            th.SetApartmentState(ApartmentState.STA);
            th.Start();
        }

        private void openNewFormInchiriere()
        {
            Application.Run(new InchiriereSelect());
        }

        private void button6_Click(object sender, EventArgs e)
        {
            this.Close();
            th = new Thread(openNewFormCarteLivrataSelect);
            th.SetApartmentState(ApartmentState.STA);
            th.Start();
        }

        private void openNewFormCarteLivrataSelect()
        {
            Application.Run(new CarteLivrataSelect());
        }

    }
}
