using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Data.OleDb;
using System.Data.Sql;

/// <summary>
/// Summary description for dbislem
/// </summary>
public class dbislem
{
    public dbislem()
    {

    }

    //SqlConnection connection = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True");
    SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-R9KRKE3;Initial Catalog=db;Integrated Security=True");

    //MySqlConnection con = new MySqlConnection("Server=94.73.170.250;Database=ilkyardim;Uid=ilkyardim;Pwd=L+l+L+l6248810;Integrated Security=False;");
    public int execute(string sqlcumle)
    {
        //MySqlCommand cmd = new MySqlCommand(sqlcumle, con);
         SqlCommand cmd = new SqlCommand(sqlcumle, con);
        int kacsatirdegismis = 0;
        try
        {
            cmd.Connection.Open();
            kacsatirdegismis = cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {

            StreamWriter Write = new StreamWriter(AppDomain.CurrentDomain.BaseDirectory + "ErrorLogs/Log.txt", true);
            Write.WriteLine("Hata oluştu: " + ex.Message + " (" + sqlcumle + ")");
            Write.Close();
        }
        con.Close();
        return kacsatirdegismis;

    }


    public DataTable GetDataTable(string sqlcumle)
    {
        DataTable dt = new DataTable();

        //MySqlDataAdapter dap = new MySqlDataAdapter(sqlcumle, con);
        
        SqlDataAdapter dap = new SqlDataAdapter(sqlcumle, con);

        try
        {
            con.Open();
            dap.Fill(dt);


        }
        catch (Exception ex)
        {

            StreamWriter Write = new StreamWriter(AppDomain.CurrentDomain.BaseDirectory + "ErrorLogs/Log.txt", true);
            Write.WriteLine("Hata Oluştu: " + ex.Message + " (" + sqlcumle + ")");
            Write.Close();
            dt = null;
        }
        con.Close();
        return dt;

    }


    public DataRow GetDataRow(string sqlcumle)
    {
        DataTable dt = GetDataTable(sqlcumle);
        if (dt.Rows.Count == 0) return null;
        return dt.Rows[0];

    }


    public string seo(string baslik)
    {

        string Temp = baslik;
        Temp = Temp.Replace("-", ""); Temp = Temp.Replace(" ", "-");
        Temp = Temp.Replace("ç", "c"); Temp = Temp.Replace("ğ", "g");
        Temp = Temp.Replace("ı", "i"); Temp = Temp.Replace("ö", "o");
        Temp = Temp.Replace("ş", "s"); Temp = Temp.Replace("ü", "u");
        Temp = Temp.Replace("\"", ""); Temp = Temp.Replace("/", "");
        Temp = Temp.Replace("(", ""); Temp = Temp.Replace(")", "");
        Temp = Temp.Replace("{", ""); Temp = Temp.Replace("}", "");
        Temp = Temp.Replace("%", ""); Temp = Temp.Replace("&", "");
        Temp = Temp.Replace("+", ""); Temp = Temp.Replace(".", "-");
        Temp = Temp.Replace("?", ""); Temp = Temp.Replace(",", "");
        Temp = Temp.Replace(":", "--"); Temp = Temp.Replace("'", " ");
        return Temp;
    }

    public string seoo(string baslik)
    {

        string Temp = baslik;

        Temp = Temp.Replace("\"", ""); Temp = Temp.Replace("/", "");
        
        Temp = Temp.Replace("{", ""); Temp = Temp.Replace("}", "");
        Temp = Temp.Replace("&", "");
        Temp = Temp.Replace("'", " ");
        return Temp;
    }


    public string linkYonlendir(string linkBaslik, string KatID, string ID, string baslik)
    {
        string Temp = "";
        Temp = baslik.ToLower();
        Temp = Temp.Replace("-", ""); Temp = Temp.Replace(" ", "-");
        Temp = Temp.Replace("ç", "c"); Temp = Temp.Replace("ğ", "g");
        Temp = Temp.Replace("ı", "i"); Temp = Temp.Replace("ö", "o");
        Temp = Temp.Replace("ş", "s"); Temp = Temp.Replace("ü", "u");
        Temp = Temp.Replace("\"", ""); Temp = Temp.Replace("/", "");
        Temp = Temp.Replace("(", ""); Temp = Temp.Replace(")", "");
        Temp = Temp.Replace("{", ""); Temp = Temp.Replace("}", "");
        Temp = Temp.Replace("%", ""); Temp = Temp.Replace("&", "");
        Temp = Temp.Replace("+", ""); Temp = Temp.Replace(".", "-");
        Temp = Temp.Replace("?", ""); Temp = Temp.Replace(",", "");
        Temp = Temp.Replace(":", "--");
        return linkBaslik + "-" + KatID + "-" + ID + "-" + Temp + ".aspx";
    }


    public string linkYonlendir(string linkBaslik, string ID, string baslik)
    {
        string Temp = "";
        Temp = baslik.ToLower();
        Temp = Temp.Replace("-", ""); Temp = Temp.Replace(" ", "-");
        Temp = Temp.Replace("ç", "c"); Temp = Temp.Replace("ğ", "g");
        Temp = Temp.Replace("ı", "i"); Temp = Temp.Replace("ö", "o");
        Temp = Temp.Replace("ş", "s"); Temp = Temp.Replace("ü", "u");
        Temp = Temp.Replace("\"", ""); Temp = Temp.Replace("/", "");
        Temp = Temp.Replace("(", ""); Temp = Temp.Replace(")", "");
        Temp = Temp.Replace("{", ""); Temp = Temp.Replace("}", "");
        Temp = Temp.Replace("%", ""); Temp = Temp.Replace("&", "");
        Temp = Temp.Replace("+", ""); Temp = Temp.Replace(".", "-");
        Temp = Temp.Replace("?", ""); Temp = Temp.Replace(",", "");
        Temp = Temp.Replace(":", "--");
        return linkBaslik + "-" + ID + "-" + Temp + ".aspx";
    }



    public decimal YuzdeHesap(decimal Sayi1, decimal Sayi2)
    {
        decimal Sonuc = 0;
        decimal Yuzde = (Sayi1 * Sayi2) / 100;

        Sonuc = Sayi1 - Yuzde;

        return Sonuc;
    }



}