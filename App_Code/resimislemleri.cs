using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;

public class resimislemleri
{



    string siteAdi = "";

    public resimislemleri()
    {
        
    }

    public string resimKaydet(HttpPostedFile dosya, string klasorAdi, int buyukGenislik, int kucukGenislik)
    {
        string resimAdi = "";
        
       // if (HttpContext.Current.Session["yoneticiID"] != null && HttpContext.Current.Session["yoneticiID"].ToString() != "")
       // {
         //   siteAdi = HttpContext.Current.Session["yoneticiAdi"].ToString() + "//";

            string dosyaAdlandir = Guid.NewGuid().ToString();
            string uzanti = System.IO.Path.GetExtension(dosya.FileName);

            string sunucuYolu = AppDomain.CurrentDomain.BaseDirectory.ToString();
            string sabitResimYolu = "images/yuklenen/";
            resimAdi = dosyaAdlandir + uzanti;


            Bitmap buyukResim = null;
            Bitmap kucukResim = null;

            if (uzanti == ".jpg" || uzanti == ".JPG" || uzanti == ".jpeg" || uzanti == ".JPEG" || uzanti == ".png" || uzanti == ".PNG" || uzanti == ".bmp" || uzanti == ".BMP" || uzanti == ".gif" || uzanti == ".GIF")
            {

                // ------- KLASÖRLERİN OLUŞTURULMASI ------- //

                if (!Directory.Exists(sunucuYolu + sabitResimYolu + siteAdi + klasorAdi + ""))
                {
                    Directory.CreateDirectory(sunucuYolu + sabitResimYolu + siteAdi + klasorAdi);
                    Directory.CreateDirectory(sunucuYolu + sabitResimYolu + siteAdi + klasorAdi + "\\" + "orjinal");
                    Directory.CreateDirectory(sunucuYolu + sabitResimYolu + siteAdi + klasorAdi + "\\" + "buyuk");
                    Directory.CreateDirectory(sunucuYolu + sabitResimYolu + siteAdi + klasorAdi + "\\" + "kucuk");
                }

                // ------- KLASÖRLERİN OLUŞTURULMASI ------- //
                // ----------------------------------------- //



                // ------- ORJİNAL RESMİN KAYDEDİLMESİ ------- //

                dosya.SaveAs(sunucuYolu + sabitResimYolu + siteAdi + klasorAdi + "/orjinal/" + resimAdi);

                // ------- ORJİNAL RESMİN KAYDEDİLMESİ ------- //
                // ------------------------------------------- //



                // ------- ORJİNAL RESMİN BİLGİLERİNİ ALMA ------- //

                Bitmap orjinal = new Bitmap(sunucuYolu + sabitResimYolu + siteAdi + klasorAdi + "/orjinal/" + resimAdi);

                ImageFormat format = orjinal.RawFormat;

                // ------- ORJİNAL RESMİN BİLGİLERİNİ ALMA ------- //
                // ----------------------------------------------- //



                // ------- BÜYÜK RESMİN KAYDEDİLMESİ ------- //

                if (buyukGenislik > 0)
                {
                    Int32 buyukResimGenislik = buyukGenislik;
                    if (orjinal.Width > buyukResimGenislik)
                    {
                        Int32 buyukResimYukseklik = (Int32)((float)buyukResimGenislik / orjinal.Width * orjinal.Height);
                        buyukResim = new Bitmap(buyukResimGenislik, buyukResimYukseklik);
                        Graphics gBuyukResim = Graphics.FromImage(buyukResim);

                        gBuyukResim.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic;
                        gBuyukResim.DrawImage(orjinal, 0, 0, buyukResimGenislik, buyukResimYukseklik);

                        buyukResim.Save(sunucuYolu + sabitResimYolu + siteAdi + klasorAdi + "/buyuk/" + dosyaAdlandir + uzanti);

                        buyukResim.Dispose();
                    }
                    else
                    {
                        orjinal.Save(sunucuYolu + sabitResimYolu + siteAdi + klasorAdi + "/buyuk/" + dosyaAdlandir + uzanti);
                    }
                }
                else
                {
                    orjinal.Save(sunucuYolu + sabitResimYolu + siteAdi + klasorAdi + "/buyuk/" + dosyaAdlandir + uzanti);
                }

                // ------- BÜYÜK RESMİN KAYDEDİLMESİ ------- //
                // ----------------------------------------- //



                // ------- KUÇÜK RESMİN KAYDEDİLMESİ ------- //

                if (kucukGenislik > 0)
                {
                    Int32 kucukResimGenislik = kucukGenislik;
                    if (orjinal.Width > kucukResimGenislik)
                    {
                        Int32 kucukResimYukseklik = (Int32)((float)kucukResimGenislik / orjinal.Width * orjinal.Height);
                        kucukResim = new Bitmap(kucukResimGenislik, kucukResimYukseklik);
                        Graphics gKucukResim = Graphics.FromImage(kucukResim);

                        gKucukResim.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic;
                        gKucukResim.DrawImage(orjinal, 0, 0, kucukResimGenislik, kucukResimYukseklik);

                        kucukResim.Save(sunucuYolu + sabitResimYolu + siteAdi + klasorAdi + "/kucuk/" + dosyaAdlandir + uzanti);

                        kucukResim.Dispose();
                    }
                    else
                    {
                        orjinal.Save(sunucuYolu + sabitResimYolu + siteAdi + klasorAdi + "/kucuk/" + dosyaAdlandir + uzanti);
                    }
                }
                else
                {
                    orjinal.Save(sunucuYolu + sabitResimYolu + siteAdi + klasorAdi + "/kucuk/" + dosyaAdlandir + uzanti);
                }

                // ------- KUÇÜK RESMİN KAYDEDİLMESİ ------- //
                // ----------------------------------------- //



                // ------- İŞLEMLERİ BİTİRİP RESİMLERİ KAPATMA ------- //

                orjinal.Dispose();

                // ------- İŞLEMLERİ BİTİRİP RESİMLERİ KAPATMA ------- //
                // --------------------------------------------------- //

            }
      //  } 
        
        return resimAdi;

    }

    public string resimGetirPanel(string klasorAdi, string boyutAdi)
    {
        // SAYFA URL'SİNİ DÜZENLEME //

       // siteAdi = HttpContext.Current.Session["yoneticiAdi"].ToString() + "//";

        // SAYFA URL'SİNİ DÜZENLEME //

        string resimAdi = "../images/yuklenen" + siteAdi + "/" + klasorAdi + "/" + boyutAdi + "/";

        return resimAdi;
    }


    public string resimGetirPanel2(string klasorAdi, string boyutAdi)
    {
        // SAYFA URL'SİNİ DÜZENLEME //

        // siteAdi = HttpContext.Current.Session["yoneticiAdi"].ToString() + "//";

        // SAYFA URL'SİNİ DÜZENLEME //

        string resimAdi = "../images/yuklenen/" + siteAdi + "/" + klasorAdi + "/" + boyutAdi + "/";

        return resimAdi;
    }

    public string resimGetir(string klasorAdi, string boyutAdi)
    {
        // SAYFA URL'SİNİ DÜZENLEME //

        string gelenSayfa = HttpContext.Current.Request.Url.ToString();

        string[] urlParcala = gelenSayfa.Split("/".ToCharArray());

        string siteAdi = urlParcala[2];

        if (!siteAdi.Contains("www."))
        {
            siteAdi = "www." + siteAdi;
        }
        
        // SAYFA URL'SİNİ DÜZENLEME //
        
        string sunucuYolu = "http://www.SiteAdi.com/";
        
        string resimAdi = sunucuYolu + "images/yuklenen/" + siteAdi + "/" + klasorAdi + "/" + boyutAdi + "/";

        return resimAdi;
    }

}
