using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class yonetim_Default : System.Web.UI.Page
{
    dbislem db = new dbislem();

    decimal TToplam = 0, GTutar = 0, ATutar = 0, YTutar;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["YoneticiId"] != null && Session["YoneticiId"] != "")
        {

            Session["Title"] = " || Site Adı";

            Page.Title = "Anasayfa" + Session["Title"].ToString();

            lblonline.Text = Application["online"].ToString();



            Ziyaretci();
            KategoriList();
            AltKategoriList();
            YoneticiList();
            KulList();
            ToplamSatisList();

            ToplamAdetList();
            SatisList();

            
        }
        else
        {
            Response.Redirect("Login.aspx");
        }




    }

    private void ToplamAdetList()
    {

        DataTable dtkontrol = db.GetDataTable("Select AltKategoriId From AltKategori");
        for (int i = 0; i < dtkontrol.Rows.Count; i++)
        {
            DataRow dr = db.GetDataRow("Select AltKategoriId From Rapor where AltKategoriId=" + dtkontrol.Rows[i]["AltKategoriId"]);
            if (dr == null)
            {
              db.execute("insert into Rapor(AltKategoriId) values('" + dtkontrol.Rows[i]["AltKategoriId"] + "')");

            }

         }

        

        DataTable dtll = db.GetDataTable("Select AltKategoriId From AltKategori");
        for (int i = 0; i < dtll.Rows.Count; i++)
        {

            int Adet = 0;

            DataTable dtl = db.GetDataTable("SELECT Sepet.*, AltKategori.* FROM   Sepet INNER JOIN " +
                         " AltKategori ON Sepet.AltKategoriId = dbo.AltKategori.AltKategoriId Where Sepet.AltKategoriId=" + dtll.Rows[i]["AltKategoriId"]);

            for (int a = 0; a < dtl.Rows.Count; a++)
            {
                Adet += Convert.ToInt32(dtl.Rows[a]["Adet"]);
                db.execute("Update Rapor Set Adet='" + Adet + "' Where AltKategoriId=" + dtll.Rows[i]["AltKategoriId"]);
            }
            db.execute("Update Rapor Set Adet='" + Adet + "' Where AltKategoriId=" + dtll.Rows[i]["AltKategoriId"]);

        }


    }



    private void SatisList()
    {


        DataTable dt = db.GetDataTable("SELECT  Rapor.*, AltKategori.* FROM   Rapor INNER JOIN " +
                         " AltKategori ON Rapor.AltKategoriId = dbo.AltKategori.AltKategoriId");
        DtlKatAdet.DataSource = dt;
        DtlKatAdet.DataBind();
    }




    private void ToplamSatisList()
    {
        DataTable dtTutar = db.GetDataTable("Select * From SepetGetir");

        for (int a = 0; a < dtTutar.Rows.Count; a++)
        {
            if (Convert.ToDateTime(dtTutar.Rows[a]["MOnayTarihi"]).Day == DateTime.Now.Day)
            {
                GTutar += Convert.ToDecimal(dtTutar.Rows[a]["Tutar"]);
                lblGTutar.CssClass = "fa fa-try";
                lblGTutar.Text = " " + GTutar.ToString();
            }
            else
            {
                lblGTutar.Text = " " + "0";

                if (Convert.ToDateTime(dtTutar.Rows[a]["MOnayTarihi"]).Month == DateTime.Now.Month)
                {
                    ATutar += Convert.ToDecimal(dtTutar.Rows[a]["Tutar"]);
                    lblATutar.CssClass = "fa fa-try";
                    lblATutar.Text = " " + ATutar.ToString();
                }
                else
                {
                    lblATutar.Text = " " + "0";

                    if (Convert.ToDateTime(dtTutar.Rows[a]["MOnayTarihi"]).Year == DateTime.Now.Year)
                    {
                        YTutar += Convert.ToDecimal(dtTutar.Rows[a]["Tutar"]);
                        lblYTutar.CssClass = "fa fa-try";
                        lblYTutar.Text = " " + YTutar.ToString();
                    }
                    else
                    {
                        lblYTutar.Text = " " + "0";
                    }
                }

            }

            

            TToplam += Convert.ToDecimal(dtTutar.Rows[a]["Tutar"]);

            lblTToplam.CssClass = "fa fa-try";
            lblTToplam.Text = " " + TToplam.ToString();

        }


    }



    private void KulList()
    {
        DataTable dt = db.GetDataTable("Select * From Kullanici");
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            lblKul.Text = dt.Rows.Count.ToString();
        }
    }

    private void YoneticiList()
    {
        DataTable dt = db.GetDataTable("Select * From Yonetim");
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            lblYonetici.Text = dt.Rows.Count.ToString();
        }
    }

    private void AltKategoriList()
    {
        DataTable dt = db.GetDataTable("Select * From ALtKategori");
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            lblAltKategori.Text = dt.Rows.Count.ToString();
            lblResim.Text = Convert.ToInt32(dt.Rows.Count * 3).ToString();
        }
    }

    private void KategoriList()
    {
        DataTable dt = db.GetDataTable("Select * From Kategori");
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            lblKategori.Text = dt.Rows.Count.ToString();
        }
    }

    private void Ziyaretci()
    {
        DataRow dr = db.GetDataRow("Select * From Ziyaretci");
        lblGunluk.Text = dr["Gunluk"].ToString();
        lblAylik.Text = dr["Aylik"].ToString();
        lblYillik.Text = dr["Yillik"].ToString();
        lblToplam.Text = dr["Toplam"].ToString();
    }








}