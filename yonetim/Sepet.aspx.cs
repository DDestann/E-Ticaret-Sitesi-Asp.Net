using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Media;

public partial class yonetim_Sepet : System.Web.UI.Page
{
     dbislem db = new dbislem();
     string Baslik = "Sepet";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["YoneticiId"] != null && Session["YoneticiId"] != "")
        {
            if (Session["Title"] == null)
                Response.Redirect("Default.aspx");

            Page.Title = Baslik + Session["Title"].ToString();

            SepetList();
            SepetOnayList();


            DataRow dr = db.GetDataRow("Select YOnay From SepetGetir Where YOnay=0 ");
            if (dr != null)
            {
                SoundPlayer player = new SoundPlayer();
                string path = System.Web.HttpContext.Current.Server.MapPath(@"~/Sound/Audio.wav");
                player.SoundLocation = path;
                player.Play();
            }

        }
        else
        {
            Response.Redirect("Login.aspx");
        }

       
    }

    private void SepetOnayList()
    {
        DataTable dt = db.GetDataTable("SELECT  SepetGetir.*, Kullanici.*  FROM   SepetGetir INNER JOIN " +
                      " Kullanici ON SepetGetir.KullaniciId = Kullanici.KullaniciId   Where SepetGetir.YOnay=1   ORDER BY SepetGetir.ID DESC");
        Sayfalama.DataSource = dt.DefaultView;
        Sayfalama.BindToControl = DtlOnaySepet;
        DtlOnaySepet.DataSource = Sayfalama.DataSourcePaged;
        DtlOnaySepet.DataBind();
    }
    private void SepetList()
    {
        DataTable dt = db.GetDataTable("SELECT  SepetGetir.*, Kullanici.*  FROM   SepetGetir INNER JOIN " +
                      " Kullanici ON SepetGetir.KullaniciId = Kullanici.KullaniciId  Where SepetGetir.YOnay=0 ORDER BY SepetGetir.ID DESC ");
        Dtlist.DataSource = dt;
        Dtlist.DataBind();
    }
    protected void Dtlist_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName=="btnOnay")
        {
            db.execute("Update SepetGetir Set YOnay=1 Where ID="+e.CommandArgument);
            db.execute("Update Sepet Set YOnay=1 Where ID=" + e.CommandArgument);
        }

        SepetList();
        SepetOnayList();
    }
    protected void Timer_Tick(object sender, EventArgs e)
    {

    }
}