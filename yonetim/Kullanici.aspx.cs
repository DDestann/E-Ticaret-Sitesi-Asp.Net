using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.IO;

public partial class Kullanici : System.Web.UI.Page
{


    string Baslik = "Kullanici";
    string Link = "Kullanici.aspx";
    
   
   

    dbislem db = new dbislem();
    mesajislemleri msj = new mesajislemleri();
    


    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["YoneticiId"] != null && Session["YoneticiId"] != "")
        {
            if (Session["Title"] == null)
                Response.Redirect("Default.aspx");

            Page.Title = Baslik + Session["Title"].ToString();

            if (Request.QueryString["Onay"] != null && Request.QueryString["Onay"].ToString() != "")
            {
                db.execute("Update Kullanici Set Engel=1 Where KullaniciId='" + Request.QueryString["Onay"] + "'");
                lblBasarili.Text = msj.basarili(Baslik, " Engellendi");
                pnlBasarili.Visible = true;
                pnlHata.Visible = false;
                pnlKontrol.Visible = false;
            }
            if (Request.QueryString["Kaldir"] != null && Request.QueryString["Kaldir"].ToString() != "")
            {
                db.execute("Update Kullanici Set Engel=0 Where KullaniciId='" + Request.QueryString["Kaldir"] + "'");
                lblBasarili.Text = msj.basarili(Baslik, "Engel'i Kaldırıldı");
                pnlBasarili.Visible = true;
                pnlHata.Visible = false;
                pnlKontrol.Visible = false;
            }





            Kaldır();
            Onay();
        }
        else
        {
            Response.Redirect("Login.aspx");
        }

 
    }


    private void Kaldır()
    {
        DataTable dtKaldır = db.GetDataTable("Select * from Kullanici where Engel=1 ORDER BY KullaniciId DESC");

        Sayfalama.DataSource = dtKaldır.DefaultView;
        Sayfalama.BindToControl = DtlKaldır;
        DtlKaldır.DataSource = Sayfalama.DataSourcePaged;
        DtlKaldır.DataBind();
        pnlKaldır.Visible = true;


    }

    private void Onay()
    {

        DataTable dtOnay = db.GetDataTable("Select * from Kullanici where Engel=0  ORDER BY KullaniciId DESC");

        Sayfalama1.DataSource = dtOnay.DefaultView;
        Sayfalama1.BindToControl = DtlOnay;
        DtlOnay.DataSource = Sayfalama1.DataSourcePaged;
        DtlOnay.DataBind();
        pnlOnay.Visible = true;


    }


    protected void btnAra_Click(object sender, EventArgs e)
    {
        DataTable dtara = db.GetDataTable("SELECT * FROM  Kullanici   where  AdSoyad Like '%" + txtAra.Text + "%'  AND Engel=0 ORDER BY KullaniciId DESC ");

        Sayfalama1.DataSource = dtara.DefaultView;
        Sayfalama1.BindToControl = DtlOnay;
        DtlOnay.DataSource = Sayfalama1.DataSourcePaged;
        DtlOnay.DataBind();
        pnlOnay.Visible = true;
    }
    protected void btnArama_Click(object sender, EventArgs e)
    {
        DataTable dtarama = db.GetDataTable("SELECT * FROM  Kullanici   where  AdSoyad Like '%" + txtArama.Text + "%' AND Engel=1  ORDER BY KullaniciId DESC ");

        Sayfalama.DataSource = dtarama.DefaultView;
        Sayfalama.BindToControl = DtlKaldır;
        DtlKaldır.DataSource = Sayfalama.DataSourcePaged;
        DtlKaldır.DataBind();
        pnlKaldır.Visible = true;

    }
}