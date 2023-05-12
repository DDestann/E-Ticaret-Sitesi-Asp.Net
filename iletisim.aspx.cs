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


public partial class iletisim : System.Web.UI.Page
{
    dbislem db = new dbislem();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Title"] == null)
            Response.Redirect("Default.aspx");

        Page.Title = "iletişim" + Session["Title"].ToString();


        DataRow dr = db.GetDataRow("Select * From Ayarlar Where AyarId=1");

        if (dr!=null)
        {
             lblAdres.Text=dr["Adres"].ToString();
             lblTel.Text = dr["Tel"].ToString();
             lblMail.Text = dr["Mail"].ToString();
             lblAcilis.Text = dr["Acilis"].ToString();
             lblMaps.Text = "<iframe src='" + dr["Maps"].ToString() + "' height=500 style=border:0 allowfullscreen= aria-hidden=false tabindex=0></iframe>";

        }

    }

    protected void btnGonder_Click(object sender, EventArgs e)
    {
        if (txtAdSoyad.Text != "")
        {
            if (txtMail.Text != "")
            {
                if (txtKonu.Text != "")
                {

                    db.execute("insert into Contact(AdSoyad,Mail,Mesaj,GTarih,Okundu) Values('" + txtAdSoyad.Text + "','" + txtMail.Text + "','" + txtKonu.Text + "','" + DateTime.Now + "','" + 0 + "')");



                    lblBilgi1.Visible = false;
                    lblBlgi.Visible = true;
                    lblBlgi.Text = "Mesajınız Gönderilmiştir";

                }
                else
                {

                    lblBilgi1.Visible = true;
                    lblBlgi.Visible = false;
                    lblBilgi1.Text = "Mesaj Alanı Boş Geçilemez";
                }
            }
            else
            {

                lblBilgi1.Visible = true;
                lblBlgi.Visible = false;
                lblBilgi1.Text = "Mail Alanı Boş Geçilemez";
                MailKontrol.CssClass = "alert alert-danger";
                MailKontrol.ErrorMessage = " Mail Aderesiniz Doğru Formatta Değil";
            }
        }
        else
        {

            lblBilgi1.Visible = true;
            lblBlgi.Visible = false;
            lblBilgi1.Text = "Ad Soyad Alanı Boş Geçilemez";
        }
    }
    
}