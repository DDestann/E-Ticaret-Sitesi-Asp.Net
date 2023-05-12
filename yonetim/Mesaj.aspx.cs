using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net;


public partial class yonetim_ContactMessage : System.Web.UI.Page
{

    string Baslik = "iletisim ";
    string Link = "Mesaj.aspx";



    dbislem db = new dbislem();
    mesajislemleri msj = new mesajislemleri();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["YoneticiId"] != null && Session["YoneticiId"] != "")
        {
            if (Session["Title"] == null)
                Response.Redirect("Default.aspx");

            Page.Title = Baslik + Session["Title"].ToString();


            lblBaslik.Text = Baslik;



            if (!Page.IsPostBack)
            {
                if (Request.QueryString["Durum"] != null && Request.QueryString["Durum"].ToString() != "")
                {
                    if (Request.QueryString["Durum"] == "Guncelle")
                    {
                        lblBasarili.Text = msj.basarili(Baslik, "'den Gelen Mesaj Gönderildi");
                        pnlBasarili.Visible = true;
                        pnlHata.Visible = false;
                        pnlKontrol.Visible = false;

                    }
                }
                else if (Request.QueryString["Duzenle"] != null && Request.QueryString["Duzenle"].ToString() != "")
                {
                    DataRow drmsgKontrol = db.GetDataRow("Select * From Contact Where Okundu=0 And MsjId=" + Request.QueryString["Duzenle"]);
                    if (drmsgKontrol != null)
                    {
                        DataRow drDuzenle = db.GetDataRow("Select * From Contact where MsjId='" + Request.QueryString["Duzenle"] + "'");

                        txtKulAd.Text = drDuzenle["AdSoyad"].ToString();
                        txtMail.Text = drDuzenle["Mail"].ToString();

                        txtMesaj.Text = drDuzenle["Mesaj"].ToString();
                        txtCevap.Text = drDuzenle["CMesaj"].ToString();
                        lblBaslik.Text = Baslik + "'den Gelen Mesajı Gönder";
                        pnlMesaj.Visible = true;
                        btnKaydet.Text = "Gönder";
                    }
                    else
                    {
                        DataRow drDuzenle = db.GetDataRow("Select * From Contact where MsjId='" + Request.QueryString["Duzenle"] + "'");

                        txtKulAd.Text = drDuzenle["AdSoyad"].ToString();
                        txtMail.Text = drDuzenle["Mail"].ToString();

                        txtMesaj.Text = drDuzenle["Mesaj"].ToString();
                        txtCevap.Text = drDuzenle["CMesaj"].ToString();
                        lblBaslik.Text = Baslik + "'den Gelen Mesajı Gönder";
                        pnlMesaj.Visible = true;
                        btnKaydet.Visible = false;
                    }
                }

                if (Request.QueryString["Sil"] != null && Request.QueryString["Sil"].ToString() != "")
                {
                    db.execute("Delete From Contact Where MsjId='" + Request.QueryString["Sil"] + "'");
                    lblBasarili.Text = msj.basarili(Baslik, "'den Gelen Mesaj Silindi");
                    pnlBasarili.Visible = true;
                    pnlHata.Visible = false;
                    pnlKontrol.Visible = false;

                }
                Okunmadı();
                Listele();
            }
            Okunmadı();
            Listele();
        }
        else
        {
            Response.Redirect("Login.aspx");
        }

    }

    private void Listele()
    {

        DataTable dt = db.GetDataTable("Select * From Contact where okundu=1  ORDER BY MsjId DESC ");

        Sayfalama.DataSource = dt.DefaultView;
        Sayfalama.BindToControl = Dtlist;
        Dtlist.DataSource = Sayfalama.DataSourcePaged;
        Dtlist.DataBind();




    }

    private void Okunmadı()
    {

        DataTable dt = db.GetDataTable("Select * From Contact where okundu=0  ORDER BY MsjId DESC ");

        Sayfalama1.DataSource = dt.DefaultView;
        Sayfalama1.BindToControl = DtlistOku;
        DtlistOku.DataSource = Sayfalama1.DataSourcePaged;
        DtlistOku.DataBind();




    }
    


    protected void btnKaydet_Click(object sender, EventArgs e)
    {
       
             if (btnKaydet.Text == "Gönder")
         {
            db.execute("Update Contact Set  CMesaj='" + txtCevap.Text + "',Okundu=1,CTarih='"+DateTime.Now.ToString()+"'  Where MsjId='" + Request.QueryString["Duzenle"] + "'");
            


            
                DataRow drAyar = db.GetDataRow("Select * From Ayarlar Where AyarId=1");


                DataRow dr = db.GetDataRow("Select * From Contact Where MsjId='" + Request.QueryString["Duzenle"] + "'");

                if (dr != null)
                {
                    MailMessage msg = new MailMessage();
                    msg.IsBodyHtml = true;
                    msg.To.Add(txtMail.Text);
                    msg.From = new MailAddress(drAyar["Mail"].ToString(), drAyar["Site"].ToString(), System.Text.Encoding.UTF8);

                    msg.Subject = drAyar["Site"].ToString();
                    msg.Body = "Mesajınız: " + dr["Mesaj"].ToString() + "/" + dr["GTarih"].ToString() + " </br> Gelen Mesaj: " + dr["CMesaj"].ToString() + "/ " + dr["CTarih"].ToString() + "    ";
                    SmtpClient smp = new SmtpClient("");
                    smp.Credentials = new NetworkCredential(drAyar["Mail"].ToString(), drAyar["Sifre"].ToString());
                    smp.Port = Convert.ToInt32(drAyar["Port"]);

                    smp.Host = drAyar["Host"].ToString();
                    smp.EnableSsl = true;
                    smp.Send(msg);

                    pnlHata.Visible = false;
                    pnlBasarili.Visible = true;
                    lblBasarili.Text = "Email Gönderildi";

                    Response.Redirect(Link + "?Durum=Guncelle");
                    //Response.Write("<script>alert('Kullanıcı Bilgileriniz Mail Adresinize Gönderilmiştir...')</script>");

                }
               

        }
        
       
       


    }
    protected void btniptal_Click(object sender, EventArgs e)
    {
        pnlMesaj.Visible = false;
      
    }
}