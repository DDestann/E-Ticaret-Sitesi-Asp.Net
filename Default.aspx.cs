using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class _Default : System.Web.UI.Page
{
    dbislem db = new dbislem();
    protected void Page_Load(object sender, EventArgs e)
    {
       
            DataRow drSite = db.GetDataRow("Select Site From Ayarlar Where AyarId=1");

        Session["Title"] = " | | "+ drSite["Site"].ToString();
        Page.Title = "Anasayfa" + Session["Title"].ToString();

        soneklenen();
        Kampanya();

        if (Session["KullaniciId"]!=null)
        {
            pnlFav.Visible = true;

            FavList();
        }
        else
        {
            pnlFav.Visible = false;
        }
        
        

    }

    private void FavList()
    {
        
            DataTable dt = db.GetDataTable("SELECT  Favoriler.*, dbo.AltKategori.* FROM  Favoriler INNER JOIN "+
                         " AltKategori ON Favoriler.AltKategoriId = dbo.AltKategori.AltKategoriId Where  Favoriler.KullaniciId='" + Session["KullaniciId"] + "' AND AltKategori.Kampanya=1");
        rptFav.DataSource = dt;
        rptFav.DataBind();
        

    }

    private void Kampanya()
    {
        DataTable dt = db.GetDataTable("Select top(9) * From AltKategori  where Kampanya=1 ORDER BY NEWID() ");
        rptKampanya.DataSource = dt;
        rptKampanya.DataBind();
    }

    private void soneklenen()
    {

        DataTable dt = db.GetDataTable("Select top(8) * From AltKategori where Kampanya=0 ORDER BY NEWID()");
        rptSonEklenen.DataSource = dt;
        rptSonEklenen.DataBind();
    }
    public string Detail(string ID, string baslik)
    {

        string git = db.linkYonlendir("Detay", ID, baslik);

        return git;
    }

    protected void rptSonEklenen_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        Label lblFiyat = (Label)e.Item.FindControl("lblFiyat");

        if (e.CommandName=="SepeteEkle")
        {
            if (Session["KullaniciId"]!=null)
            {
                DataRow dr = db.GetDataRow("Select * From Sepet Where KullaniciId='"+Session["KullaniciId"]+"' AND Onay=0 AND AltKategoriId='"+e.CommandArgument+"' ");
                if (dr==null)
                {
                    db.execute("insert into Sepet (KullaniciId,AltKategoriId,Onay,SiparisTarihi,Adet,YeniFiyat,YOnay,Fiyat) Values('" + Session["KullaniciId"] + "','" + e.CommandArgument + "','" + 0 + "','" + Convert.ToString(DateTime.Now.ToString("dd.MM.yyyy")) + "','" + 1 + "','" + lblFiyat.Text.Replace(",", ".") + "' , '" + 0 + "' ,'" + lblFiyat.Text.Replace(",", ".") + "' )");

                    Response.Redirect("Default.aspx");
                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
            }
            else
            {
                Response.Redirect("Kaydol.aspx");
            }
        }

        
    }

    protected void rptKampanya_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

        Label lblYeniFiyat = (Label)e.Item.FindControl("lblYeniFiyat");

        if (e.CommandName == "KampSepeteEkle")
        {
            if (Session["KullaniciId"] != null)
            {
                DataRow dr = db.GetDataRow("Select * From Sepet Where KullaniciId='" + Session["KullaniciId"] + "' AND Onay=0 AND AltKategoriId='" + e.CommandArgument + "' ");
                if (dr == null)
                {
                    db.execute("insert into Sepet (KullaniciId,AltKategoriId,Onay,SiparisTarihi,Adet,YeniFiyat,YOnay,Fiyat) Values('" + Session["KullaniciId"] + "','" + e.CommandArgument + "','" + 0 + "','" + Convert.ToString(DateTime.Now.ToString("dd.MM.yyyy")) + "','" + 1 + "','" + lblYeniFiyat.Text.Replace(",", ".") + "' , '" + 0 + "' ,'" + lblYeniFiyat.Text.Replace(",", ".") + "' )");

                    Response.Redirect("Default.aspx");
                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
            }
            else
            {
                Response.Redirect("Kaydol.aspx");
            }
        }

    }
    protected void rptFav_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        Label lblFavYeniFiyat = (Label)e.Item.FindControl("lblFavYeniFiyat");

        if (e.CommandName == "FavindirimEkle")
        {
            if (Session["KullaniciId"] != null)
            {
                DataRow dr = db.GetDataRow("Select * From Sepet Where KullaniciId='" + Session["KullaniciId"] + "' AND Onay=0 AND AltKategoriId='" + e.CommandArgument + "' ");
                if (dr == null)
                {
                    db.execute("insert into Sepet (KullaniciId,AltKategoriId,Onay,SiparisTarihi,Adet,YeniFiyat,YOnay,Fiyat) Values('" + Session["KullaniciId"] + "','" + e.CommandArgument + "','" + 0 + "','" + Convert.ToString(DateTime.Now.ToString("dd.MM.yyyy")) + "','" + 1 + "','" + lblFavYeniFiyat.Text.Replace(",", ".") + "' , '" + 0 + "' ,'" + lblFavYeniFiyat.Text.Replace(",", ".") + "' )");

                    Response.Redirect("Default.aspx");
                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
            }
            else
            {
                Response.Redirect("Kaydol.aspx");
            }
        }
    }
}



