using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class yonetim_Kategori : System.Web.UI.Page
{
    string Baslik = "Kategori";
    string Link = "Kategori.aspx";
    string ResimYolu = "";
    string SilinecekResim = "";


    dbislem db = new dbislem();
    mesajislemleri msj = new mesajislemleri();
    resimislemleri Resim = new resimislemleri();



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
                    DataRow drDuzenle = db.GetDataRow("Select * From Kategori where KategoriId='" + Request.QueryString["Duzenle"] + "'");
                    txtKategoriAd.Text = drDuzenle["KategoriAdi"].ToString();
                    ImageEskiResim.ImageUrl = Resim.resimGetirPanel("Galeri", "kucuk") + drDuzenle["ResimYolu"].ToString();
                    pnlEskiResim.Visible = true;



                    lblBaslik.Text = Baslik + " Güncelle";

                    btnKaydet.Text = "Güncelle";
                }

                if (Request.QueryString["Sil"] != null && Request.QueryString["Sil"].ToString() != "")
                {
                    DataTable dtkontrol = db.GetDataTable("SELECT Kategori.KategoriId, AltKategori.AltKategoriId FROM  AltKategori INNER JOIN Kategori ON AltKategori.KategoriId = Kategori.KategoriId Where AltKategori.KategoriId='" + Request.QueryString["Sil"] + "'");

                    if (dtkontrol.Rows.Count <= 0)
                    {
                        DataRow drResim = db.GetDataRow("Select ResimYolu From Kategori where KategoriId='" + Request.QueryString["Sil"] + "'");
                        SilinecekResim = drResim["ResimYolu"].ToString();

                        FileInfo fi = new FileInfo(Server.MapPath(Resim.resimGetirPanel("Galeri", "buyuk")) + SilinecekResim);
                        fi.Delete();

                        FileInfo fi2 = new FileInfo(Server.MapPath(Resim.resimGetirPanel("Galeri", "kucuk")) + SilinecekResim);
                        fi2.Delete();

                        FileInfo fi3 = new FileInfo(Server.MapPath(Resim.resimGetirPanel("Galeri", "orjinal")) + SilinecekResim);
                        fi3.Delete();

                        db.execute("Delete From Kategori Where KategoriId='" + Request.QueryString["Sil"] + "'");
                        lblBasarili.Text = msj.basarili(Baslik, "Silindi");
                        pnlBasarili.Visible = true;
                        pnlHata.Visible = false;
                        pnlKontrol.Visible = false;

                    }
                    else
                    {
                        lblKontrol.Text = msj.KategoriKontrol(Baslik);
                        pnlBasarili.Visible = false;
                        pnlHata.Visible = false;
                        pnlKontrol.Visible = true;
                    }


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
        DataTable dt = db.GetDataTable("Select * From Kategori");

        Sayfalama.DataSource = dt.DefaultView;
        Sayfalama.BindToControl = Dtlist;
        Dtlist.DataSource = Sayfalama.DataSourcePaged;
        Dtlist.DataBind();


    }



    protected void btnKaydet_Click(object sender, EventArgs e)
    {

        if (txtKategoriAd.Text != "")
        {
            if (btnKaydet.Text == "Kaydet")
            {

                DataTable dtKontrol1 = db.GetDataTable("Select * From Kategori where KategoriAdi='" + txtKategoriAd.Text + "' ");
                if (dtKontrol1.Rows.Count == 0)
                {
                    if (fluResim.HasFile)
                    {
                        ResimYolu = Resim.resimKaydet(fluResim.PostedFile, "Galeri", 270, 270);

                        db.execute(" INSERT INTO Kategori(KategoriAdi,ResimYolu) Values( '" + txtKategoriAd.Text + "', '" + ResimYolu + "')");
                        Response.Redirect(Link + "?Durum=Kaydet");

                    }
                    else
                    {
                        lblHata.Text = msj.alanBos(Baslik + " Resmi");
                        pnlHata.Visible = true;
                        pnlBasarili.Visible = false;
                        pnlKontrol.Visible = false;
                    }


                }
                else
                {
                    pnlHata.Visible = false;
                    pnlBasarili.Visible = false;

                    lblKontrol.Text = msj.Kontrol(Baslik);
                    pnlKontrol.Visible = true;
                }

            }
            else if (btnKaydet.Text == "Güncelle")
            {
                if (fluResim.HasFile)
                {
                    DataRow drResim = db.GetDataRow("Select ResimYolu From Kategori where KategoriId='" + Request.QueryString["Duzenle"] + "'");
                    SilinecekResim = drResim["ResimYolu"].ToString();

                    FileInfo fi = new FileInfo(Server.MapPath(Resim.resimGetirPanel("Galeri", "buyuk")) + SilinecekResim);
                    fi.Delete();

                    FileInfo fi2 = new FileInfo(Server.MapPath(Resim.resimGetirPanel("Galeri", "kucuk")) + SilinecekResim);
                    fi2.Delete();

                    FileInfo fi3 = new FileInfo(Server.MapPath(Resim.resimGetirPanel("Galeri", "orjinal")) + SilinecekResim);
                    fi3.Delete();


                    ResimYolu = Resim.resimKaydet(fluResim.PostedFile, "Galeri", 270, 270);

                    db.execute(" UPDATE Kategori Set KategoriAdi='" + txtKategoriAd.Text + "' , ResimYolu='" + ResimYolu + "' where KategoriId='" + Request.QueryString["Duzenle"] + "'");
                    Response.Redirect(Link + "?Durum=Guncelle");

                }
                else
                {
                    db.execute(" UPDATE Kategori Set KategoriAdi='" + txtKategoriAd.Text + "' where KategoriId='" + Request.QueryString["Duzenle"] + "'");
                    Response.Redirect(Link + "?Durum=Guncelle");
                }
            }


        }
        else
        {
            lblHata.Text = msj.alanBos(Baslik);
            pnlHata.Visible = true;
            pnlBasarili.Visible = false;
            pnlKontrol.Visible = false;
        }

    }
}