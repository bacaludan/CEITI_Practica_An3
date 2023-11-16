using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace Program
{
    class Connect
    {
        SqlConnection connect;

        public Connect()
        {
            connect = new SqlConnection("Data Source=LAB106_PC11\\SQLEXPRESS; Initial Catalog=Librarie; Integrated Security=True");
        }

        public SqlConnection openConnection()
        {
            try
            {
                connect.Open();
            } catch(Exception)
            {

            }

            return connect;
        }

        public void CloseConnection()
        {
            try
            {
                connect.Close();
            } catch(Exception)
            {

            }
        }
    }
}
