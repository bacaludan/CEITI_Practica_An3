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
    public partial class Form4 : MaterialSkin.Controls.MaterialForm
    {
        Thread th;

        public Form4()
        {
            InitializeComponent();
        }

        private void Form4_Load(object sender, EventArgs e)
        {

        }

        private void button3_Click_2(object sender, EventArgs e)
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
            th = new Thread(openNewFormCarteUpdate);
            th.SetApartmentState(ApartmentState.STA);
            th.Start();
        }

        private void openNewFormCarteUpdate()
        {
            Application.Run(new CarteUpdate());
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
            th = new Thread(openNewFormClient);
            th.SetApartmentState(ApartmentState.STA);
            th.Start();
        }

        private void openNewFormClient()
        {
            Application.Run(new ClientUpdate());
        }

        private void button4_Click(object sender, EventArgs e)
        {
            this.Close();
            th = new Thread(openNewFormFurnizor);
            th.SetApartmentState(ApartmentState.STA);
            th.Start();
        }

        private void openNewFormFurnizor()
        {
            Application.Run(new FurnizorUpdate());
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
            Application.Run(new InchiriereUpdate());
        }

        private void button6_Click(object sender, EventArgs e)
        {
            this.Close();
            th = new Thread(openNewFormCarteL);
            th.SetApartmentState(ApartmentState.STA);
            th.Start();
        }

        private void openNewFormCarteL()
        {
            Application.Run(new CarteLivrataUpdate());
        }

    }
}
