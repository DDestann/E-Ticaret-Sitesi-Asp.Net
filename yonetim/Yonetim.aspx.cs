using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class yonetim_Yonetim : System.Web.UI.Page
{

    string Baslik = "Yönetici";
    string Link = "Yonetim.aspx";



    dbislem db = new dbislem();
    mesajislemleri msj = new mesajislemleri();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["YoneticiId"] != null && Session["YoneticiId"] != "")
        {
            if (Session["Title"] == null)
                Response.Redirect("Default.aspx");

            Page.Title = Baslik + Session["Title"].ToString();


            lblBaslik.Text = Baslik + " Ekle";



            if (!Page.IsPostBack)
            {
                if (Request.QueryString["Durum"] != null && Request.QueryString["Durum"].ToString() != "")
                {
                    if (Request.QueryString["Durum"] == "Kaydet")
                    {
                        lblBasarili.Text = msj.basarili(Baslik, "Kaydedildi");
                        pnlBasarili.Visible = true;
                        pnlHata.Visible = false;
                    }
                    else if (Request.QueryString["Durum"] == "Guncelle")
                    {
                        lblBasarili.Text = msj.basarili(Baslik, "Güncellendi");
                        pnlBasarili.Visible = true;
                        pnlHata.Visible = false;

                    }
                }
                else if (Request.QueryString["Duzenle"] != null && Request.QueryString["Duzenle"].ToString() != "")
                {
                    DataRow drDuzenle = db.GetDataRow("Select * From Yonetim where YoneticiId='" + Request.QueryString["Duzenle"] + "'");
                    txtAd.Text = drDuzenle["YoneticiAdi"].ToString();
                    txtMail.Text = drDuzenle["YoneticiMail"].ToString();
                    txtSifre.Text = drDuzenle["Sifre"].ToString();

                    lblBaslik.Text = Baslik + " Güncelle";

                    btnKaydet.Text = "Güncelle";
                }

                if (Request.QueryString["Sil"] != null && Request.QueryString["Sil"].ToString() != "")
                {
                    db.execute("Delete From Yonetim Where YoneticiId='" + Request.QueryString["Sil"] + "'");
                    lblBasarili.Text = msj.basarili(Baslik, "Silindi");
                    pnlBasarili.Visible = true;
                    pnlHata.Visible = false;

                }

                Listele();
            }


        }
        else
        {
            Response.Redirect("Login.aspx");
        }

    }
    private void Listele()
    {
        DataTable dt = db.GetDataTable("Select * From Yonetim");
        Dtlist.DataSource = dt;
        Dtlist.DataBind();
    }
    protected void btnKaydet_Click(object sender, EventArgs e)
    {
        
            if (txtAd.Text != "")
            {
                if (txtAd.Text != "" && txtMail.Text != "")
                {
                    if (txtAd.Text != "" && txtMail.Text != "" && txtSifre.Text != "")
                    {
                        if (btnKaydet.Text == "Kaydet")
                        {
                            db.execute(" INSERT INTO Yonetim(YoneticiAdi,YoneticiMail,Sifre) Values('" + txtAd.Text + "' , '" + txtMail.Text + "' ,'" + txtSifre.Text + "' )");
                            Response.Redirect(Link + "?Durum=Kaydet");
                        }
                        else if (btnKaydet.Text == "Güncelle")
                        {
                            db.execute("Update Yonetim Set   YoneticiAdi='" + txtAd.Text + "' , YoneticiMail='" + txtMail.Text + "', Sifre='" + txtSifre.Text + "'  Where YoneticiId='" + Request.QueryString["Duzenle"] + "'");
                            Response.Redirect(Link + "?Durum=Guncelle");
                        }


                    }
                    else
                    {
                        lblHata.Text = msj.alanBos(Baslik);
                        pnlHata.Visible = true;
                        pnlBasarili.Visible = false;
                    }
                }
                else
                {
                    lblHata.Text = msj.alanBos(Baslik);
                    pnlHata.Visible = true;
                    pnlBasarili.Visible = false;
                }
            }
            else
            {
                lblHata.Text = msj.alanBos(Baslik);
                pnlHata.Visible = true;
                pnlBasarili.Visible = false;
            }
       

    }

}