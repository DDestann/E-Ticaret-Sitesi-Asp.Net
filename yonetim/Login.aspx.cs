using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class yonetim_Login : System.Web.UI.Page
{

    dbislem db = new dbislem();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void BtnLogin_Click(object sender, EventArgs e)
    {
         if (txtKullaniciAdi.Text == "" && txtSifre.Text == "")
        {
            lblDurum.Text = "Kullanici adı ve şifre boş geçilemez !!!";
        }
        else if (txtKullaniciAdi.Text == "")
        {
            lblDurum.Text = "Kullanici adı boş geçilemez !!!";
        }
        else if (txtSifre.Text == "")
        {
            lblDurum.Text = "şifre boş geçilemez !!!";
        }
         else if (txtKullaniciAdi.Text.Contains("'") || txtKullaniciAdi.Text.Contains('"') || txtKullaniciAdi.Text.Contains("="))
         {
             lblDurum.Text = "Geçersiz karakter girmeyiniz !!!";
         }
         else
         {

             DataRow drMail = db.GetDataRow("Select * From Yonetim Where YoneticiMail='" + txtKullaniciAdi.Text + "'");
             if (drMail!=null)
             {
                 DataRow drSifre = db.GetDataRow("Select * From Yonetim Where Sifre='" + txtSifre.Text + "' ");
                  if (drSifre != null)
                  {
                      DataRow dr = db.GetDataRow("Select * From Yonetim Where YoneticiMail='" + txtKullaniciAdi.Text + "' AND Sifre='" + txtSifre.Text + "' ");

                      Session["YoneticiId"] = dr["YoneticiId"].ToString();
                      Session["YoneticiAdi"] = dr["YoneticiAdi"].ToString();
                      Session["YoneticiMail"] = dr["YoneticiMail"].ToString();
                      Response.Redirect("Default.aspx");


                  }
                  else
                  {
                      lblDurum.Text = "Şifreyi Hatalı Girdiniz.. ";
                  }
             }
             else
             {
                 lblDurum.Text = " Bu Mail Adresi Sitemizde Kayıtlı Değildir.. ";
             }

             


         }
    }
    protected void btnUnuttum_Click(object sender, EventArgs e)
    {
       

        try
        {
            DataRow drAyar = db.GetDataRow("Select * From Ayarlar Where AyarId=1");


            DataRow dr = db.GetDataRow("Select * From Yonetim Where YoneticiMail='" + txtMailSifre.Text + "'");

            if (dr != null)
            {
                MailMessage msg = new MailMessage();
                msg.IsBodyHtml = true;
                msg.To.Add(txtMailSifre.Text);
                msg.From = new MailAddress(drAyar["Mail"].ToString(), drAyar["Site"].ToString(), System.Text.Encoding.UTF8);

                msg.Subject = "Kullanıcı Bilgileri Maili";
                msg.Body = "Şifreniz: " + dr["Sifre"].ToString() + "";
                SmtpClient smp = new SmtpClient();
                smp.Credentials = new NetworkCredential(drAyar["Mail"].ToString(), drAyar["Sifre"].ToString());
                smp.Port = Convert.ToInt32(drAyar["Port"]);

                smp.Host = drAyar["Host"].ToString();
                smp.EnableSsl = true;
                smp.Send(msg);

                Response.Write("<script>alert('Kullanıcı Bilgileriniz Mail Adresinize Gönderilmiştir...')</script>");

            }
            else
            {
                Response.Write("<script>alert('Girmiş Olduğunuz Mail Adresi Bulunmamaktadır...')</script>");


            }
        }
        catch (Exception)
        {

            Response.Write("<script>alert('Bir Hata ile Karşılaştı Lüfen tekrar deneyin...')</script>");

        }
    }
}