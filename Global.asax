<%@ Application Language="C#" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

 

<script runat="server">

    //void Application_BeginRequest(object sender, EventArgs e)
    //{
    //    //string Adres = Request.RawUrl;//Önce Adresi alıyoruz(www.aaa.com/Defaut.aspx?Id=1&baslık=Kat1)
    //    //if (System.IO.Path.GetExtension(Adres) == ".aspx")//Adres Uzantısı  
    //    //{
    //    //    string[] Parcalar = System.IO.Path.GetFileName(Adres).Split('-');//Dizi Halinde Dosya ismini alarak split ile adres Adını parçalıyoruz
    //    //    Context.RewritePath("~/Default2.aspx", "", "KategoriAdi=" + Parcalar[0] + "&Id=" + Parcalar[1], true);
    //    //}


    //}

    

    void Application_BeginRequest(Object sender, EventArgs e)
    {
        string DosyaYolu = Request.RawUrl;

        if (DosyaYolu.IndexOf("/Detay-") != -1)
        {
            if (System.IO.Path.GetExtension(DosyaYolu) == ".aspx")
            {
                string[] path = System.IO.Path.GetFileName(DosyaYolu).Split('-');
                Context.RewritePath("Detay.aspx", "", "AltKategoriId=" + path[1], true);
            }
        }
        else if (DosyaYolu.IndexOf("/Urunler-") != -1)
        {
            if (System.IO.Path.GetExtension(DosyaYolu) == ".aspx")
            {
                string[] path = System.IO.Path.GetFileName(DosyaYolu).Split('-');
                Context.RewritePath("Urunler.aspx", "", "KategoriId=" + path[1], true);
            }
        }

        else if (DosyaYolu.IndexOf("/Seiten-") != -1)
        {
            if (System.IO.Path.GetExtension(DosyaYolu) == ".aspx")
            {
                string[] path = System.IO.Path.GetFileName(DosyaYolu).Split('-');
                Context.RewritePath("Seiten.aspx", "", "SayfaId=" + path[1], true);
            }
        }

       
        
    }


    

    void Application_Start(object sender, EventArgs e) 
    {
 
       Application["online"] = 0;
        
       


    }
    
    void Application_End(object sender, EventArgs e) 
    {
        

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
        
        
       // Session["Vt"] = @"Data Source=DESTAN\SQLEXPRESS;Initial Catalog=istanbulilkyardim.com;Integrated Security=True";

        //Session["Vt"] = "Server=94.73.170.250;Database=db3203297295;Uid=user3203297295; Password=L+l+L+l6248810; Integrateg Security=false;";
       // Session["vt"] = ("Server=94.73.170.250;Database=ilkyardim;Uid=ilkyardim;Pwd=L+l+L+l6248810;Integrated Security=False;");

        dbislem db = new dbislem();

        Application["online"] = (int)Application["online"] + 1;

        DataRow tablo = db.GetDataRow("Select *  From Ziyaretci");

        if (Convert.ToDateTime(tablo["Tarih"]).Day == DateTime.Now.Day)
        {
            //Gün değişmemiş. Tüm değerleri artırıyoruz.
            //Gün içinde bu komut çalışır.
            db.execute("update Ziyaretci set Gunluk=Gunluk+1, Aylik=Aylik+1, Yillik=Yillik+1, Toplam=Toplam+1");
        }
        else
        {
            //Gün değişmiş ise kontrollerimizi yapıyoruz.
            if (Convert.ToDateTime(tablo["Tarih"]).Month == DateTime.Now.Month)
            {
                //Gün değişmiş, Ay değişmemiş ise.
                //Hergün bir defa bu komut çalışır.
                db.execute("update Ziyaretci set Tarih='" + Convert.ToString(DateTime.Now.ToString("dd.MM.yyyy")) + "', Gunluk=1, Aylik=Aylik+1, Yillik=Yillik+1, Toplam=Toplam+1");
            }
            else
            {
                //Gün, Ay değişmiş ise.
                if (Convert.ToDateTime(tablo["Tarih"]).Year == DateTime.Now.Year)
                {
                    //Gün, Ay değişmiş, ama Yıl aynı ise.
                    //Ayda bir defa bu komut çalışır.
                    db.execute("update Ziyaretci set Tarih='" + Convert.ToString(DateTime.Now.ToString("dd.MM.yyyy")) + "', Gunluk=1, Aylik=1, Yillik=Yillik+1, Toplam=Toplam+1");
                }
                else
                {
                    //Gün, Ay, Yıl değişmiş ise tüm değerleri sıfırlıyoruz.
                    //Yılda bir defa bu komut çalışır.
                    db.execute("update Ziyaretci set Tarih='" + Convert.ToString(DateTime.Now.ToString("dd.MM.yyyy")) + "', Gunluk=1, Aylik=1, Yillik=1, Toplam=Toplam+1");
                }
            }
        }
       

        Session.Timeout = 5; //5 dk veriyoruz.
        
    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

        Application["online"] = (int)Application["online"] - 1;
    }
       
</script>
