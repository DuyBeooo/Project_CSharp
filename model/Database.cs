using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace PRF192_PE_GradeClient.model
{
    class Database
    {
        public SqlConnection GetConnection()
        {
            string str = ConfigurationManager.ConnectionStrings["PRN292"].ToString();
            return new SqlConnection(str);
        }

        public DataTable GetDataBySql(string sql)
        {
            SqlCommand cmd = new SqlCommand(sql, GetConnection());
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds.Tables[0];
        }

        public int ExecuteSql(string sql, params SqlParameter[] parameters)
        {
            SqlCommand cmd = new SqlCommand(sql, GetConnection());
            cmd.Parameters.AddRange(parameters);
            cmd.Connection.Open();
            int numberRow = cmd.ExecuteNonQuery();
            cmd.Clone();
            return numberRow;
        }
    }
}
