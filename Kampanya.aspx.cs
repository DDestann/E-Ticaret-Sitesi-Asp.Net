using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class Kampanya : System.Web.UI.Page
{
    dbislem db = new dbislem();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Title"] == null)
            Response.Redirect("Default.aspx");
       
        Page.Title = "Kampanya" + Session["Title"].ToString();

        Kampanyalist();
    }

    private void Kampanyalist()
    {

        DataRow dr = db.GetDataRow("Select * From AltKategori Where Kampanya=1 ");
        
        if (dr!=null)
        {
            DataTable dt = db.GetDataTable("Select * From AltKategori Where Kampanya=1 ");
            rptKampanya.DataSource = dt;
            rptKampanya.DataBind();
        }
        else
        {
            lblBilgi.Text = "Indirimde Olan Ürün Bulunamadı";
        }
        
    }

    public string Detail(string ID, string baslik)
    {

        string git = db.linkYonlendir("Detay", ID, baslik);

        return git;
    }


    protected void rptKampanya_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        Label lblYeniFiyat = (Label)e.Item.FindControl("lblYeniFiyat");

        if (e.CommandName == "SepeteEkle")
        {
            if (Session["KullaniciId"] != null)
            {
                DataRow dr = db.GetDataRow("Select * From Sepet Where KullaniciId='" + Session["KullaniciId"] + "' AND Onay=0 AND AltKategoriId='" + e.CommandArgument + "' ");
                if (dr == null)
                {
                    db.execute("insert into Sepet (KullaniciId,AltKategoriId,Onay,SiparisTarihi,Adet,YeniFiyat,YOnay,Fiyat) Values('" + Session["KullaniciId"] + "','" + e.CommandArgument + "','" + 0 + "','" + Convert.ToString(DateTime.Now.ToString("dd.MM.yyyy")) + "','" + 1 + "','" + lblYeniFiyat.Text.Replace(",", ".") + "' , '" + 0 + "' ,'" + lblYeniFiyat.Text.Replace(",", ".") + "' )");

                    Response.Redirect("Kampanya.aspx");
                }
                else
                {
                    Response.Redirect("Kampanya.aspx");
                }
            }
            else
            {
                Response.Redirect("Kaydol.aspx");
            }
        }

    }
   
}