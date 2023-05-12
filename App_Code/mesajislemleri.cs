using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

public class mesajislemleri
{

	public mesajislemleri()
	{
	}
   

    public string basarili(string gelenBaslik,string tur)
    {
        string donenDeger = gelenBaslik + " Başarıyla " + tur + " ...";

        return donenDeger;
    }

    public string alanBos(string gelenBaslik)
    {
        string donenDeger = "Lütfen " + " " + gelenBaslik + " Alanını Doldurunuz !!! ";

        return donenDeger;
    }


    public string alanBos(string Baslik, string tur)
    {
        string donenDeger = Baslik + " " + tur + " Alanını Doldurunuz !!!";

        return donenDeger;
    }

    public string hatali(string gelenBaslik,string tur)
    {
        string donenDeger = gelenBaslik + " " + tur + " esnasında bir problem oluştu !!! <br/> Lütfen Tekrar Deneyiniz ... ";

        return donenDeger;
    }

    public string hataliSifre(string gelenBaslik)
    {
        string donenDeger = gelenBaslik + " Şifre Uyuşmazlığı !!! <br/> Lütfen Tekrar Deneyiniz ... ";

        return donenDeger;
    }


    public string Kontrol(string gelenBaslik)
    {
        string donenDeger ="Eklemek istediğiniz "+gelenBaslik+" Bulunmaktadır...";

        return donenDeger;
    }

    public string KategoriKontrol(string gelenBaslik)
    {
        string donenDeger = "Silmek istediğiniz " + gelenBaslik + "'nin AltKategorisi Bulunmaktadır...";

        return donenDeger;
    }


}
