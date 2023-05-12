using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class Kaydol : System.Web.UI.Page
{
    dbislem db = new dbislem();
    protected void Page_Load(object sender, EventArgs e)
    {
      
    }
    protected void btnGiris_Click(object sender, EventArgs e)
    {
        if (txtAdSoyad.Text!="")
        {
            if (txtAdres.Text!="")
            {
                if (txtTel.Text!="")
                {
                    if (txtMail.Text!="")
                    {
                         if (txtSifre.Text == txtTSifre.Text)
                         {
                              DataRow dr = db.GetDataRow("Select * From Kullanici Where Mail='" + txtMail.Text + "'");

                              if (dr == null)
                              {
                                  db.execute("insert into Kullanici(AdSoyad,Sifre,Mail,Adres,Tel,Engel) Values('" + txtAdSoyad.Text + "','" + txtSifre.Text + "','" + txtMail.Text + "','" + txtAdres.Text + "','" + txtTel.Text + "','" + 0 + "')");
                                 lblBilgi.Text = "Kayıt İşleminiz Başarıyla Gerçekleşmiştir.!!!";

                               }
                               else
                               {
                                     lblBilgi.Text = "Girmiş Olduğunuz Mail Adresi Kullanılmaktadır.!!!";
                               }

                            }
                          else
                          {
                             lblBilgi.Text = "Girmiş Olduğunuz Şifrelerin Aynı Olmasına Dikkat Edin.!!!";
                           }
                         }
                    else
                    {
                        lblBilgi.Text = "Mail Alanı Boş Bırakılamaz.!!!";
                    }
                }
                else
                {
                    lblBilgi.Text = "Telefon Alanı Boş Bırakılamaz.!!!";
                }
            }
            else
            {
                lblBilgi.Text = "Adres Alanı Boş Bırakılamaz.!!!";
            }
        }
        else
        {
            lblBilgi.Text = "Ad Soyad Alanı Boş Bırakılamaz.!!!";
        }
    }
}