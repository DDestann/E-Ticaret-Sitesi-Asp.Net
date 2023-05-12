using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class Urunler : System.Web.UI.Page
{
    dbislem db = new dbislem();
    string Baslik = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Title"] == null)
            Response.Redirect("Default.aspx");


        if (Request.QueryString["KategoriId"] != null && Request.QueryString["KategoriId"].ToString() != "")
        {
            DataRow dr = db.GetDataRow("Select * From Kategori Where KategoriId=" + Request.QueryString["KategoriId"]);
            Baslik = dr["KategoriAdi"].ToString();
            lblBaslik.Text = dr["KategoriAdi"].ToString();
            Page.Title = Baslik + Session["Title"].ToString();

            lblBaslik.Text = Baslik;
            Page.MetaKeywords = Baslik;



        }

        UrunList();
    }

    public string Detail(string ID, string baslik)
    {

        string git = db.linkYonlendir("Detay", ID, baslik);

        return git;
    }

    private void UrunList()
    {
        DataTable dt = db.GetDataTable("Select * From AltKategori Where Kampanya=0 AND KategoriId='"+Request.QueryString["KategoriId"]+"'");
        rptUrun.DataSource = dt;
        rptUrun.DataBind();
    }
    protected void rptUrun_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

        Label lblFiyat = (Label)e.Item.FindControl("lblFiyat");

        if (e.CommandName == "SepeteEkle")
        {
            if (Session["KullaniciId"] != null)
            {
                DataRow dr = db.GetDataRow("Select * From Sepet Where KullaniciId='" + Session["KullaniciId"] + "' AND Onay=0 AND AltKategoriId='" + e.CommandArgument + "' ");
                if (dr == null)
                {
                    db.execute("insert into Sepet (KullaniciId,AltKategoriId,Onay,SiparisTarihi,Adet,YeniFiyat,YOnay,Fiyat) Values('" + Session["KullaniciId"] + "','" + e.CommandArgument + "','" + 0 + "','" + Convert.ToString(DateTime.Now.ToString("dd.MM.yyyy")) + "','" + 1 + "','" + lblFiyat.Text.Replace(",", ".") + "' , '" + 0 + "' ,'" + lblFiyat.Text.Replace(",", ".") + "' )");

                    Response.Redirect("Urunler.aspx?KategoriId=" + Request.QueryString["KategoriId"]);
                }
                else
                {
                    Response.Redirect("Urunler.aspx?KategoriId="+Request.QueryString["KategoriId"]);
                }
            }
            else
            {
                Response.Redirect("Kaydol.aspx");
            }
        }
    }
}