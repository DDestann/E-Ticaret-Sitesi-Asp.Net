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


public partial class MasterPageSite : System.Web.UI.MasterPage
{

    dbislem db = new dbislem();

    decimal Toplamm = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (Session["KullaniciId"] != null && Session["Engel"] != "1")
        {
           //lblSepet.Text = "<a style=color:black; href=Sepetim.aspx></a>";
           lblMail.Text = "<a style=color:black; href=Profil.aspx>" + Session["Mail"].ToString() + "</a>";
           lblKul.Text = Session["AdSoyad"].ToString();
           lblMail1.Text = "<a style=color:black; href=Profil.aspx>" + Session["Mail"].ToString() + "</a>";
           lblKul1.Text = Session["AdSoyad"].ToString();
           pnlwinac.Visible = false;
           pnlmobilac.Visible = false;
           pnlwinkapat.Visible = true;
           pnlmobilkapat.Visible = true;
            
        }
        else
        {
            lblMail.Text = "Merhaba Ziyaretçi";
            lblKul.Text = "Hoş Geldin";
            lblMail1.Text = "Merhaba Ziyaretçi";
            lblKul1.Text = "Hoş Geldin";
            pnlwinac.Visible = true;
            pnlmobilac.Visible = true;
            pnlwinkapat.Visible = false;
            pnlmobilkapat.Visible = false;
        }


        Menulist();
        slaytmenulist();
        Ayarlar();
        FavList();
        SepetList();
        TutaList();
    }

    private void TutaList()
    {
        if (Session["KullaniciId"] != null)
        {
            DataTable dtTutar = db.GetDataTable("Select * From Sepet Where Onay=0 AND KullaniciId=" + Session["KullaniciId"]);

            for (int i = 0; i < dtTutar.Rows.Count; i++)
            {
                Toplamm += Convert.ToDecimal(dtTutar.Rows[i]["YeniFiyat"].ToString());
                lblTutar.Visible = true;
                lblTutar.CssClass = "fa fa-try";
                lblTutar.Text =" "+Toplamm.ToString();
            }

        }
        else
        {
            lblTutar.Visible = false;
        }
    }

    private void SepetList()
    {
        if (Session["KullaniciId"] != null)
        {
            DataTable dtSepet = db.GetDataTable("Select * From Sepet Where  Onay=0 AND KullaniciId=" + Session["KullaniciId"]);

            if (dtSepet.Rows.Count > 0)
            {
                lblSepet.Text = dtSepet.Rows.Count.ToString();
                lblSepet.Visible = true;
            }
            else
            {
                lblSepet.Text = "0";
                lblSepet.Visible = true;
            }

        }
        else
        {
            lblSepet.Visible = false;
        }

    }

    private void FavList()
    {
        if (Session["KullaniciId"] != null)
        {
            DataTable dtFav = db.GetDataTable("Select * From Favoriler Where KullaniciId="+Session["KullaniciId"]);

            if (dtFav.Rows.Count > 0)
            {
                lblFav.Text = dtFav.Rows.Count.ToString();
                lblFav.Visible = true;
            }
            else
            {
                lblFav.Text = "0";
                lblFav.Visible = true;
            }

        }
        else
        {
            lblFav.Visible = false;
        }

    }

    public string Urunler(string ID, string baslik)
    {

        string git = db.linkYonlendir("Urunler", ID, baslik);

        return git;
    }

    private void slaytmenulist()
    {
        DataTable dt = db.GetDataTable("Select * From Kategori");
        rptSlaytMenu.DataSource = dt;
        rptSlaytMenu.DataBind();
    }
    private void Menulist()
    {
        DataTable dt = db.GetDataTable("Select * From Kategori");
        rptMenu.DataSource = dt;
        rptMenu.DataBind();
    }

     private void Ayarlar()
    {
       
           DataRow drAyarlar = db.GetDataRow("SELECT * FROM  Ayarlar  Where AyarId=1");

           if (drAyarlar != null)
           {

               LogoWin.ImageUrl = "images/yuklenen/Logo/buyuk/" + drAyarlar["Logo"].ToString();
               LogoMobil.ImageUrl = "images/yuklenen/Logo/buyuk/" + drAyarlar["Logo"].ToString();
               FootLogo.ImageUrl = "images/yuklenen/Logo/buyuk/" + drAyarlar["Logo"].ToString();

               FootFace.HRef = drAyarlar["Facebook"].ToString();
               MobilFace.HRef = drAyarlar["Facebook"].ToString();
               WinFace.HRef = drAyarlar["Facebook"].ToString();

               FootYoutube.HRef = drAyarlar["Youtube"].ToString();
               MobilYoutube.HRef = drAyarlar["Youtube"].ToString();
               WinYoutube.HRef = drAyarlar["Youtube"].ToString();

               Wininst.HRef = drAyarlar["instegram"].ToString();
               Footinst.HRef = drAyarlar["instegram"].ToString();
               Mobilinst.HRef = drAyarlar["instegram"].ToString();

               lblFootMail.Text = drAyarlar["Mail"].ToString();
               lblFootiletisim.Text = drAyarlar["Tel"].ToString();
               lblFootAdres.Text = drAyarlar["Adres"].ToString();

               
               lblAcilis.Text = drAyarlar["Acilis"].ToString();
               HTel.InnerText = drAyarlar["Tel"].ToString();

               lblAltHak.Text = "© " + drAyarlar["YasalHak"].ToString()+", "+ drAyarlar["Firma"].ToString();

              FootLink.HRef = drAyarlar["Site"].ToString();
              lblFootlink.Text = drAyarlar["Site"].ToString();

               Page.MetaKeywords = drAyarlar["MetaKey"].ToString();
               Page.MetaDescription = drAyarlar["MetaDesc"].ToString();

           }
       }

    protected void btnGiris_Click(object sender, EventArgs e)
    {
      
        DataRow drMail = db.GetDataRow("Select * From Kullanici Where Mail='"+txtMail.Text+"' ");

        if (drMail!=null)
        {
            Session["Engel"] = drMail["Engel"].ToString();
            if (Session["Engel"].ToString() != "1")
            {
                DataRow dr = db.GetDataRow("Select * From Kullanici Where Sifre='" + txtSifre.Text + "' AND Mail='" + txtMail.Text + "' ");
                if (dr!=null)
                {
                   
                    Session["KullaniciId"] = dr["KullaniciId"].ToString();
                    Session["AdSoyad"] = dr["AdSoyad"].ToString();
                    Session["Mail"] = dr["Mail"].ToString();
                    Session["Adres"] = dr["Adres"].ToString();
                    Session["Sifre"] = dr["Sifre"].ToString();
                    Session["Tel"] = dr["Tel"].ToString();

                    Session.Timeout = 30;

                    Response.Redirect("Profil.aspx");


                }
                else
                {
                    Response.Write("<script>alert('Girmiş olduğunuz Mail veya Sifre Hatalı')</script>");
                  
                }
            }
            else
            {
                Response.Write("<script>alert('Girmiş olduğunuz Mail Adresi Engellenmiştir.!!!')</script>");
               
            }
        }
        else
        {
            Response.Write("<script>alert('Girmiş olduğunuz Mail Adresi Bulunamadı.!!! ')</script>");
           
        }
    }


    protected void btnGonder_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtUMail.Text!="")
            {
                 DataRow drAyar = db.GetDataRow("Select * From Ayarlar Where AyarId=1");


                DataRow dr = db.GetDataRow("Select * From Kullanici Where Mail='" + txtUMail.Text + "'");

                if (dr != null)
                {
                    if (dr["Engel"].ToString() == "0")
                    {
                        MailMessage msg = new MailMessage();
                        msg.IsBodyHtml = true;
                        msg.To.Add(txtUMail.Text);
                        msg.From = new MailAddress(drAyar["Mail"].ToString(), drAyar["Site"].ToString(), System.Text.Encoding.UTF8);

                        msg.Subject = "Kullanıcı Bilgilendirme Maili";
                        msg.Body = "Şifreniz: " + dr["Sifre"].ToString() + "";
                        SmtpClient smp = new SmtpClient("");
                        smp.Credentials = new NetworkCredential(drAyar["Mail"].ToString(), drAyar["Sifre"].ToString());
                        smp.Port = Convert.ToInt32(drAyar["Port"]);

                        smp.Host = drAyar["Host"].ToString();
                        smp.EnableSsl = true;
                        smp.Send(msg);

                        Response.Write("<script>alert('Kullanıcı Bilgileriniz Mail Adresinize Gönderilmiştir...')</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Girmiş Olduğunuz Mail Adresi Engellenmiştir...')</script>");
                    }

                }
                else
                {
                    Response.Write("<script>alert('Girmiş Olduğunuz Mail Adresi Bulunmamaktadır...')</script>");

                }
            }
            else
            {
                Response.Write("<script>alert('Mail Adresinizi Giriniz...')</script>");
            }
        }
        catch (Exception)
        {
            Response.Write("<script>alert('Bir Hata ile Karşılaştı Lüfen tekrar deneyin...')</script>");
        }
    }
    protected void btnCikis_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Default.aspx");
        
    }
    protected void btnAra_Click(object sender, EventArgs e)
    {
        string Search = txtAra.Text.Trim();
        string Url = string.Format("~/Search.aspx?Search={0}", Search);
        Response.Redirect(Url);
    }
}





