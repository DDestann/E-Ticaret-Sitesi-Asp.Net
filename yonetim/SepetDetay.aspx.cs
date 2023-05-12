using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class yonetim_SepetDetay : System.Web.UI.Page
{
    dbislem db = new dbislem();
    string Baslik = "Sepet Detay";
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["YoneticiId"] != null && Session["YoneticiId"] != "")
        {
            if (Session["Title"] == null)
                Response.Redirect("Default.aspx");

            Page.Title = Baslik + Session["Title"].ToString();

            if (Request.QueryString["ID"] != null && Request.QueryString["ID"] != "")
            {
                List();

                DataRow dr = db.GetDataRow("SELECT  Kullanici.*, SepetGetir.*, Sepet.*, AltKategori.* FROM   SepetGetir INNER JOIN " +
                             " Sepet ON SepetGetir.ID = Sepet.ID INNER JOIN " +
                             " AltKategori ON Sepet.AltKategoriId = AltKategori.AltKategoriId INNER JOIN " +
                             " Kullanici ON SepetGetir.KullaniciId = Kullanici.KullaniciId WHERE SepetGetir.ID=" + Request.QueryString["ID"]);

                lblKulAd.Text = "Ad Soyad : " + dr["AdSoyad"].ToString();
                lblKulAdres.Text = "Adres : " + dr["Adres"].ToString();
                lblKulTel.Text = "Telefon No : " + dr["Tel"].ToString();
                lblTarih.Text = "Sipariş Tarihi : " + dr["MOnayTarihi"].ToString();
                lblNot.Text = "Müşteri Notu : " + dr["MNot"].ToString();
                lblOdemeTipi.Text = "Ödeme Tipi : " + dr["OdemeTipi"].ToString();
                lblToplam.Text = "Toplam : " + dr["Tutar"].ToString();

                DataRow drAyar = db.GetDataRow("Select Adres,Logo From Ayarlar Where AyarId=1");
                imgLogo.ImageUrl = "~/images/yuklenen/Logo/buyuk/" + drAyar["Logo"].ToString();
                lblAdres.Text = drAyar["Adres"].ToString();






            }
        }
        else
        {
            Response.Redirect("Login.aspx");
        }



    }

    private void List()
    {
        DataTable dt = db.GetDataTable("SELECT  Kullanici.*, SepetGetir.*, Sepet.*, AltKategori.* FROM   SepetGetir INNER JOIN " +
                        " Sepet ON SepetGetir.ID = Sepet.ID INNER JOIN " +
                        " AltKategori ON Sepet.AltKategoriId = AltKategori.AltKategoriId INNER JOIN " +
                        " Kullanici ON SepetGetir.KullaniciId = Kullanici.KullaniciId WHERE SepetGetir.ID=" + Request.QueryString["ID"]);
        DtlLİst.DataSource = dt;
        DtlLİst.DataBind();
    }
}