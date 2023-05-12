using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class yonetim_AltKategori : System.Web.UI.Page
{

    string Baslik = "Alt Kategori";
    string Link = "AltKategori.aspx";
    string ResimYolu = "";
    string SilinecekResim = "";

  



    dbislem db = new dbislem();
    mesajislemleri mesaj = new mesajislemleri();
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
                        lblBasarili.Text = mesaj.basarili(Baslik, "Kaydedildi");
                        pnlBasarili.Visible = true;
                        pnlHata.Visible = false;
                        pnlKontrol.Visible = false;


                    }
                    else if (Request.QueryString["Durum"] == "Guncelle")
                    {
                        lblBasarili.Text = mesaj.basarili(Baslik, "Güncellendi");
                        pnlBasarili.Visible = true;
                        pnlHata.Visible = false;
                        pnlKontrol.Visible = false;

                    }
                }
                else if (Request.QueryString["Duzenle"] != null && Request.QueryString["Duzenle"].ToString() != "")
                {
                    DataRow drDuzenle = db.GetDataRow("SELECT AltKategori.*, dbo.Kategori.*FROM" +
                   " AltKategori INNER JOIN Kategori ON AltKategori.KategoriId = Kategori.KategoriId" +
                         " where AltKategoriId='" + Request.QueryString["Duzenle"] + "'");
                    drpKat.SelectedValue = drDuzenle["KategoriId"].ToString();
                    txtAltKatAd.Text = drDuzenle["AltKategoriAdi"].ToString();
                    txtAltKatFiyat.Text = drDuzenle["AltKategoriFiyat"].ToString();
                    txtYfiyat.Text = drDuzenle["AltKategoriYFiyat"].ToString();

                    txtYuzde.Text = drDuzenle["Indirim"].ToString();

                    CKicerik.Text = drDuzenle["AltKategoriIcerik"].ToString();
                    ImageEskiResim.ImageUrl = Resim.resimGetirPanel("Galeri", "kucuk") + drDuzenle["ResimYolu"].ToString();
                    pnlEskiResim.Visible = true;

                    lblBaslik.Text = Baslik + " Güncelle";
                    btnKaydet.Text = "Guncelle";

                }
                if (Request.QueryString["Sil"] != null && Request.QueryString["Sil"].ToString() != "")
                {
                    DataRow drSil = db.GetDataRow("Select ResimYolu From AltKategori Where AltKategoriId='" + Request.QueryString["Sil"].ToString() + "'");
                    SilinecekResim = drSil["ResimYolu"].ToString();

                    FileInfo Buyuk = new FileInfo(Server.MapPath(Resim.resimGetirPanel("Galeri", "buyuk") + SilinecekResim));
                    Buyuk.Delete();

                    FileInfo kucuk = new FileInfo(Server.MapPath(Resim.resimGetirPanel("Galeri", "kucuk") + SilinecekResim));
                    kucuk.Delete();

                    FileInfo orjinal = new FileInfo(Server.MapPath(Resim.resimGetirPanel("Galeri", "orjinal") + SilinecekResim));
                    orjinal.Delete();

                    db.execute("Delete From AltKategori Where AltKategoriId='" + Request.QueryString["Sil"].ToString() + "'");
                    lblBasarili.Text = mesaj.basarili(Baslik, " Silindi");
                    pnlBasarili.Visible = true;
                    pnlHata.Visible = false;
                    pnlKontrol.Visible = false;


                }



                Listele();
                DrpKatListele();


            }





            Listele();
        }
        else
        {
            Response.Redirect("Login.aspx");
        }


    }

    private void DrpKatListele()
    {

        DataTable DtKat = db.GetDataTable("Select * From Kategori ");
        drpKat.DataTextField = "KategoriAdi";
        drpKat.DataValueField = "KategoriId";
        drpKat.DataSource = DtKat;
        drpKat.DataBind();
        drpKat.Items.Insert(0, new ListItem("Kategori Seçiniz...", "0"));


    }





    private void Listele()
    {
        if (btnAra.Text != "Ara")
        {

            DataTable dt = db.GetDataTable("SELECT AltKategori.*, Kategori.* FROM  AltKategori INNER JOIN Kategori ON AltKategori.KategoriId = Kategori.KategoriId ORDER BY AltKategori.AltKategoriId DESC");
            Sayfalama.DataSource = dt.DefaultView;
            Sayfalama.BindToControl = Dtlist;
            Dtlist.DataSource = Sayfalama.DataSourcePaged;
            Dtlist.DataBind();

        }
        else
        {
            DataTable dtara = db.GetDataTable("SELECT AltKategori.*, Kategori.* FROM  AltKategori INNER JOIN Kategori ON AltKategori.KategoriId = Kategori.KategoriId   where  AltKategori.AltKategoriAdi Like '%" + txtAra.Text + "%' OR Kategori.KategoriAdi Like '%" + txtAra.Text + "%'  ORDER BY AltKategori.AltKategoriId DESC ");

            Sayfalama.DataSource = dtara.DefaultView;
            Sayfalama.BindToControl = Dtlist;
            Dtlist.DataSource = Sayfalama.DataSourcePaged;
            Dtlist.DataBind();


        }

        


    }

    



    protected void drpKat_SelectedIndexChanged(object sender, EventArgs e)
    {

    }



    protected void btnKaydet_Click(object sender, EventArgs e)
    {




        if (drpKat.SelectedValue != "0")
        {
            if (drpKat.SelectedValue != "0" && txtAltKatAd.Text != "" && txtAltKatFiyat.Text != "" && txtYuzde.Text != "")
            {


                decimal Sonuc = 0;

                Sonuc = db.YuzdeHesap(Convert.ToDecimal(txtAltKatFiyat.Text), Convert.ToDecimal(txtYuzde.Text));


                if (btnKaydet.Text == "Kaydet")
                {
                    DataTable dtKontrol = db.GetDataTable("Select * From AltKategori where AltKategoriAdi='" + txtAltKatAd.Text + "' ");
                    if (dtKontrol.Rows.Count == 0)
                    {

                            if (fluResim.HasFile)
                            {
                                ResimYolu = Resim.resimKaydet(fluResim.PostedFile, "Galeri", 540, 560);


                                db.execute(" INSERT INTO AltKategori(KategoriId,AltKategoriAdi,AltKategoriIcerik,AltKategoriFiyat,ResimYolu,AltKategoriYFiyat,Indirim) Values('" + drpKat.SelectedValue + "','" + txtAltKatAd.Text + "','" + CKicerik.Text + "','" + Convert.ToDecimal(txtAltKatFiyat.Text.ToString().Replace(",", ".") )+ "','" + ResimYolu + "','" + Sonuc.ToString().Replace(",",".") + "','" + Convert.ToDecimal(txtYuzde.Text.ToString().Replace(",", ".")) + "' )");
                                Response.Redirect(Link + "?Durum=Kaydet");

                            }
                            else
                            {
                                lblHata.Text = mesaj.alanBos(Baslik + " Resmi");
                                pnlHata.Visible = true;
                                pnlBasarili.Visible = false;
                                pnlKontrol.Visible = false;
                            }
                        
                    }
                    else
                    {
                        pnlHata.Visible = false;
                        pnlBasarili.Visible = false;

                        lblKontrol.Text = mesaj.Kontrol(Baslik);
                        pnlKontrol.Visible = true;
                    }
                }
                else if (btnKaydet.Text == "Guncelle")
                {
                    if (fluResim.HasFile)
                    {
                        DataRow drResim = db.GetDataRow("Select ResimYolu From AltKategori where AltKategoriId='" + Request.QueryString["Duzenle"] + "'");
                        SilinecekResim = drResim["ResimYolu"].ToString();

                        FileInfo fi = new FileInfo(Server.MapPath(Resim.resimGetirPanel("Galeri", "buyuk")) + SilinecekResim);
                        fi.Delete();

                        FileInfo fi2 = new FileInfo(Server.MapPath(Resim.resimGetirPanel("Galeri", "kucuk")) + SilinecekResim);
                        fi2.Delete();

                        FileInfo fi3 = new FileInfo(Server.MapPath(Resim.resimGetirPanel("Galeri", "orjinal")) + SilinecekResim);
                        fi3.Delete();


                        ResimYolu = Resim.resimKaydet(fluResim.PostedFile, "Galeri", 640, 160);

                        db.execute("Update AltKategori Set   KategoriId='" + drpKat.SelectedValue + "' , AltKategoriAdi='" + txtAltKatAd.Text + "', AltKategoriIcerik='" + CKicerik.Text + "', AltKategoriFiyat='" + Convert.ToDecimal(txtAltKatFiyat.Text.ToString().Replace(",", ".")) + "', ResimYolu='" + ResimYolu + "', AltKategoriYFiyat='" + Sonuc.ToString().Replace(",",".") + "', Indirim='" + Convert.ToDecimal(txtYuzde.Text.ToString().Replace(",", ".")) + "'  Where AltKategoriId='" + Request.QueryString["Duzenle"] + "'");
                        Response.Redirect(Link + "?Durum=Guncelle");

                    }

                    else
                    {
                        db.execute("Update AltKategori Set   KategoriId='" + drpKat.SelectedValue + "' , AltKategoriAdi='" + txtAltKatAd.Text + "', AltKategoriIcerik='" + CKicerik.Text + "', AltKategoriFiyat='" + Convert.ToDecimal(txtAltKatFiyat.Text.ToString().Replace(",", ".")) + "', AltKategoriYFiyat='" + Sonuc.ToString().Replace(",",".") + "', Indirim='" + Convert.ToDecimal(txtYuzde.Text.ToString().Replace(",", ".")) + "'  Where AltKategoriId='" + Request.QueryString["Duzenle"] + "'");
                        Response.Redirect(Link + "?Durum=Guncelle");
                    }

                }


            }
            else
            {
                lblHata.Text = mesaj.alanBos(Baslik);
                pnlHata.Visible = true;
                pnlBasarili.Visible = false;
                pnlKontrol.Visible = false;
            }
        }
        else
        {
            lblHata.Text = mesaj.alanBos(Baslik);
            pnlHata.Visible = true;
            pnlBasarili.Visible = false;
            pnlKontrol.Visible = false;
        }
    }


    protected void btnAra_Click(object sender, EventArgs e)
    {

    }
}