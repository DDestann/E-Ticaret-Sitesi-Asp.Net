using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using CKFinder;


public partial class yonetim_Sayfalar : System.Web.UI.Page
{
    string Baslik = "Sayfalar";
    string Link = "Sayfalar.aspx";



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
                FileBrowser file = new FileBrowser();
                file.BasePath = "../ckfinder/";
                file.SetupCKEditor(txticerik);



                if (Request.QueryString["Durum"] != null && Request.QueryString["Durum"].ToString() != "")
                {
                    if (Request.QueryString["Durum"] == "Kaydet")
                    {
                        lblBasarili.Text = msj.basarili(Baslik, "Kaydedildi");
                        pnlBasarili.Visible = true;
                        pnlHata.Visible = false;
                        pnlKontrol.Visible = false;
                    }
                    else if (Request.QueryString["Durum"] == "Guncelle")
                    {
                        lblBasarili.Text = msj.basarili(Baslik, "Güncellendi");
                        pnlBasarili.Visible = true;
                        pnlHata.Visible = false;
                        pnlKontrol.Visible = false;

                    }
                }
                else if (Request.QueryString["Duzenle"] != null && Request.QueryString["Duzenle"].ToString() != "")
                {
                    DataRow drDuzenle = db.GetDataRow("Select * From Sayfa where SayfaId='" + Request.QueryString["Duzenle"] + "'");
                    txtBaslik.Text = drDuzenle["SayfaAdi"].ToString();
                    txticerik.Text = drDuzenle["Icerik"].ToString();


                    lblBaslik.Text = Baslik + " Güncelle";

                    btnKaydet.Text = "Güncelle";
                }

                if (Request.QueryString["Sil"] != null && Request.QueryString["Sil"].ToString() != "")
                {
                    db.execute("Delete From Sayfa Where SayfaId='" + Request.QueryString["Sil"] + "'");
                    lblBasarili.Text = msj.basarili(Baslik, "Silindi");
                    pnlBasarili.Visible = true;
                    pnlHata.Visible = false;
                    pnlKontrol.Visible = false;

                }

                Listele();
            }

            Listele();
        }
        else
        {
            Response.Redirect("Login.aspx");
        }

    }

    private void Listele()
    {


        DataTable dt = db.GetDataTable("Select * From Sayfa ORDER BY SayfaId DESC");

        Sayfalama.DataSource = dt.DefaultView;
        Sayfalama.BindToControl = Dtlist;
        Dtlist.DataSource = Sayfalama.DataSourcePaged;
        Dtlist.DataBind();

    }
    protected void btnKaydet_Click(object sender, EventArgs e)
    {

        if (btnKaydet.Text == "Kaydet")
        {

            db.execute(" INSERT INTO Sayfa(SayfaAdi,Icerik) Values( '" + txtBaslik.Text + "','" + txticerik.Text + "'  )");
            Response.Redirect(Link + "?Durum=Kaydet");

        }
        else if (btnKaydet.Text == "Güncelle")
        {
            db.execute("Update Sayfa Set  SayfaAdi='" + txtBaslik.Text + "' , Icerik='" + txticerik.Text + "'  Where SayfaId='" + Request.QueryString["Duzenle"] + "'");
            Response.Redirect(Link + "?Durum=Guncelle");
        }

    }

    public string metin_kisalt_yan(string metin)
    {

        metin = Regex.Replace(metin, @"<(.\n)*?>", string.Empty);

        if (metin.Length > 250) metin = metin.Substring(0, 250);

        metin = metin + "...";

        return metin;

    } 
}