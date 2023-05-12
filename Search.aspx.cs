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
    string Baslik = "Arama Sonuçları";
    string Search;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Title"] == null)
            Response.Redirect("Default.aspx");

        Search = Request.QueryString["Search"].ToString();

            lblBaslik.Text = Baslik;
            Page.Title = Baslik + Session["Title"].ToString();

            lblBaslik.Text = Baslik;
            Page.MetaKeywords = Baslik;

            DataRow dr = db.GetDataRow("Select * From AltKategori Where AltKategoriAdi Like '%" + Search + "%'  AND Kampanya=0");
            if (dr!=null)
            {
                UrunList();
            }
            else
            {
                lblBilgi.Text = "Arama Yaptığınız Ürün Bulunamadı.";
            }
             
    }

    public string Detail(string ID, string baslik)
    {

        string git = db.linkYonlendir("Detay", ID, baslik);

        return git;
    }

    private void UrunList()
    {
        

        DataTable dt = db.GetDataTable("Select * From AltKategori Where AltKategoriAdi Like '%" + Search + "%'  AND Kampanya=0");
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

                    Response.Redirect("Search.aspx?Search=" + Request.QueryString["Search"]);
                }
                else
                {
                    Response.Redirect("Search.aspx?Search=" + Request.QueryString["Search"]);
                }
            }
            else
            {
                Response.Redirect("Kaydol.aspx");
            }
        }
    }
}