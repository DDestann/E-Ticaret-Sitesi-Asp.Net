using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Net.Mail;
using System.Net;


public partial class Kullanici : System.Web.UI.Page
{
    dbislem db = new dbislem();
    decimal Toplam = 0;
    decimal TutarSepet = 0;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["Title"] == null)
            Response.Redirect("Default.aspx");

        Page.Title = "Profilim" + Session["Title"].ToString();


       


        if (!Page.IsPostBack)
        {   

            if (Session["KullaniciId"] != "" && Session["KullaniciId"] != null)
            {
                if (Session["Engel"] != "1")
                {
                    Listele();
                    
                    
                }
                else
                {
                    Response.Write("<script>alert('Lütfen Giriş Yapınız.!!! ')</script>");
                }



            }
            else
            {
                Response.Redirect("Default.aspx");
            }
          
            FavCount();
            FavList();
            EskiSiparisList();
            ToplamTutar();
            SiparisList();
            ToplamTutarSepet();
        }


      
        FavCount();
        FavList();
        EskiSiparisList();
        ToplamTutar();
        SiparisList();
        ToplamTutarSepet();
       

    }



    private void ToplamTutar()
    {
        DataTable dtToplamTutar = db.GetDataTable("SELECT  Sepet.*, Kullanici.*, AltKategori.* FROM  Sepet INNER JOIN Kullanici ON Sepet.KullaniciId = Kullanici.KullaniciId INNER JOIN AltKategori ON Sepet.AltKategoriId = AltKategori.AltKategoriId  Where Sepet.Onay=1 AND Sepet.YOnay=1 AND Sepet.KullaniciId='" + Session["KullaniciId"] + "' ");
        for (int i = 0; i < dtToplamTutar.Rows.Count; i++)
        {
            
            Toplam += Convert.ToDecimal(dtToplamTutar.Rows[i]["YeniFiyat"].ToString());
         
            lblTutar.Text = " " +Toplam.ToString();
           
        }
        lblTutar.Text = " " + Toplam.ToString();
    }
    private void ToplamTutarSepet()
    {
        DataTable dtToplamSepet = db.GetDataTable("SELECT  Sepet.*, Kullanici.*, AltKategori.* FROM  Sepet INNER JOIN Kullanici ON Sepet.KullaniciId = Kullanici.KullaniciId INNER JOIN AltKategori ON Sepet.AltKategoriId = AltKategori.AltKategoriId  Where Sepet.KullaniciId='" + Session["KullaniciId"] + "' AND Sepet.Onay=1 AND Sepet.YOnay=0   ");
        for (int i = 0; i < dtToplamSepet.Rows.Count; i++)
        {
                TutarSepet += Convert.ToDecimal(dtToplamSepet.Rows[i]["YeniFiyat"]);
                lblTutarSepet.Text = " " + TutarSepet.ToString();
        }
        lblTutarSepet.Text = " " + TutarSepet.ToString();
    }
    

    private void FavList()
    {
        DataTable dtFavList = db.GetDataTable("SELECT  Favoriler.*, AltKategori.*, Kullanici.* FROM   Favoriler INNER JOIN AltKategori ON Favoriler.AltKategoriId = AltKategori.AltKategoriId INNER JOIN Kullanici ON Favoriler.KullaniciId = Kullanici.KullaniciId Where Favoriler.KullaniciId='" + Session["KullaniciId"].ToString() + "'");
        DtlFav.DataSource=dtFavList;
        DtlFav.DataBind();

    }

    private void EskiSiparisList()
    {


        DataTable dtEskiSiparisList = db.GetDataTable("SELECT  Sepet.*, Kullanici.*, AltKategori.* FROM  Sepet INNER JOIN Kullanici ON Sepet.KullaniciId = Kullanici.KullaniciId INNER JOIN AltKategori ON Sepet.AltKategoriId = AltKategori.AltKategoriId  Where Sepet.Onay=1 AND Sepet.YOnay=1 AND Sepet.KullaniciId='" + Session["KullaniciId"] + "' ");
            DtlEskiSiparis.DataSource = dtEskiSiparisList;
            DtlEskiSiparis.DataBind();
    }

    private void SiparisList()
    {

        DataTable DltSiparisList = db.GetDataTable("SELECT  Sepet.*, Kullanici.*, AltKategori.* FROM  Sepet INNER JOIN Kullanici ON Sepet.KullaniciId = Kullanici.KullaniciId INNER JOIN AltKategori ON Sepet.AltKategoriId = AltKategori.AltKategoriId  Where Sepet.KullaniciId='" + Session["KullaniciId"] + "' AND Sepet.Onay=1  AND Sepet.YOnay=0   ");
        DtlSiparis.DataSource = DltSiparisList;
        DtlSiparis.DataBind();
    }

    private void Listele()
    {
        DataRow dr = db.GetDataRow("Select * from Kullanici Where KullaniciId='"+Session["KullaniciId"].ToString()+"' AND Engel=0 ");
        lblKulAd.Text = dr["AdSoyad"].ToString();
        txtAdSoyad.Text = dr["AdSoyad"].ToString();
        txtAdres.Text = dr["Adres"].ToString();
        txtMail.Text = dr["Mail"].ToString();
        txtTel.Text = dr["Tel"].ToString();
       
    }
    protected void btnAdresSifre_Click(object sender, EventArgs e)
    {
        pnlAdresSifre.Visible = true;
        pnlFavori.Visible = false;
        pnlESiparis.Visible = false;
    
        pnlSiparis.Visible = false;
    }
    protected void btnKulMsj_Click(object sender, EventArgs e)
    {
       
        
 
        pnlAdresSifre.Visible = false;
        pnlFavori.Visible = false;
        pnlESiparis.Visible = false;
        pnlSiparis.Visible = false;
    }
    protected void btnSiparis_Click(object sender, EventArgs e)
    {
        pnlAdresSifre.Visible = false;
        pnlFavori.Visible = false;
        pnlESiparis.Visible = false;
    
        pnlSiparis.Visible = true;
    }
    protected void btnESiparis_Click(object sender, EventArgs e)
    {
        pnlAdresSifre.Visible = false;
        pnlFavori.Visible = false;
        pnlESiparis.Visible = true;
    
        pnlSiparis.Visible = false;
    }
    protected void btnFafori_Click(object sender, EventArgs e)
    {
        pnlAdresSifre.Visible = false;
        pnlFavori.Visible = true;
        pnlESiparis.Visible = false;
     
        pnlSiparis.Visible = false;
    }
    protected void btnGuncelle_Click(object sender, EventArgs e)
    {
        if (txtAdSoyad.Text != "")
        {
            if (txtAdres.Text != "")
            {
                if (txtMail.Text != "")
                {
                    if (txtTel.Text != "")
                    {
                        if (txtSifre.Text != "" && txtTSifre.Text != "")
                        {
                            if (txtSifre.Text == txtTSifre.Text)
                            {
                                db.execute("Update Kullanici Set AdSoyad='"+txtAdSoyad.Text+"', Adres='"+txtAdres.Text+"',Tel='"+txtTel.Text+"', Mail='"+txtMail.Text+"',Sifre='"+txtSifre.Text+"' Where KullaniciId="+Session["KullaniciId"].ToString());


                                lblGuncelle.Text = "Bigileriniz Güncellenmiştir.";
                            }
                            else
                            {
                                lblGuncelle.Text = "Girmiş Olduğunuz Şifrelerin Aynı Olmasına Dikkat Edin.!!!";
                            }
                        }
                        else
                        {
                            lblGuncelle.Text = "Şifre Alanı Boş Geçilemez!!!";
                        }
                    }
                    else
                    {
                        lblGuncelle.Text = "Telefon Alanı Boş Geçilemez!!!";
                    }
                }
                else
                {
                    lblGuncelle.Text = "Mail Alanı Boş Geçilemez!!!";
                }
            }
            else
            {
                lblGuncelle.Text = "Adres Alanı Boş Geçilemez!!!";
            }
        }
        else
        {
            lblGuncelle.Text = "Kullanıcı Adı Boş Geçilemez!!!";
        }
    }

    public string Detail(string ID, string baslik)
    {

        string git = db.linkYonlendir("Detay", ID, baslik);

        return git;
    }
    private void FavCount()
    {
        DataTable dtFav = db.GetDataTable("Select * From Favoriler Where KullaniciId='" + Session["KullaniciId"].ToString() + "' ");

        if (dtFav.Rows.Count > 0)
        {
            lblFav.Text = " (" + dtFav.Rows.Count.ToString() + ")";
        }
       
    }
 
   
    protected void DtlFav_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName=="FavKaldir")
        {
            db.execute("Delete From Favoriler Where FavoriId="+e.CommandArgument);
            FavCount();
            FavList();
        }
    }
   
}