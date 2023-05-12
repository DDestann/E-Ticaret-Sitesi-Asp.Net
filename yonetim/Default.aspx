<%@ Page Title="" Language="C#" MasterPageFile="~/yonetim/yonetim.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="yonetim_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



       <!--------  Orta Alan  ------------------>
<div class="container-fluid ">
<div class="row">

<!--------  Orta Alan Üst Başlık ------------------>
<div class=" col-sm-3 col-md-2"></div>
<div class=" col-sm-9  col-md-10">
  <h2 class=" page-header Baslik slidbar_top">Sistem Bilgileri  </h2>
</div>
<!--------  Orta Alan Üst Başlık Bitti ------------------>
<div class=" col-sm-3 col-md-2"></div>
<div class=" col-sm-5  col-md-5">
<div class="panel panel-primary">
      <div class="panel-heading panel-heading-Height"><h5 class=" AltBaslik"> <asp:Label ID="lblBaslik" runat="server" Text="Sistem Kayıtları"></asp:Label> </h5></div>
      <div class="panel-body">
      
      
      <div style="margin-top:5px;">

<div class="col-md-12">
   
  
  <table class="table table-hover ">
    
      <tbody>

          <tr>
              <td style="font-weight:700; font-size:16px;">Yönetici Sayısı </td>
              <td style="font-weight:700; font-size:16px;">
                  <asp:Label ID="lblYonetici" style="float:right;" runat="server"></asp:Label>
              </td>
          </tr>

           <tr>
              <td style="font-weight:700; font-size:16px;">Kullanıcı Sayısı </td>
              <td style="font-weight:700; font-size:16px;">
                  <asp:Label ID="lblKul" style="float:right;" runat="server"></asp:Label>
              </td>
          </tr>

           <tr>
              <td style="font-weight:700; font-size:16px;">Kategori Sayısı </td>
              <td style="font-weight:700; font-size:16px;">
                  <asp:Label ID="lblKategori" style="float:right;" runat="server"></asp:Label>
              </td>
          </tr>


           <tr>
              <td style="font-weight:700; font-size:16px;">AltKategori Sayısı </td>
              <td style="font-weight:700; font-size:16px;">
                  <asp:Label ID="lblAltKategori" style="float:right;" runat="server"></asp:Label>
              </td>
          </tr>

          <tr>
              <td style="font-weight:700; font-size:16px;">Resim Sayısı </td>
              <td style="font-weight:700; font-size:16px;">
                  <asp:Label ID="lblResim" style="float:right;" runat="server"></asp:Label>
              </td>
          </tr>




      </tbody>

  </table>



 </div>


</div>


<div class="Temizle"></div>
      
      
      </div>
    </div>

</div>




    <div class=" col-sm-4  col-md-5">
<div class="panel panel-primary">
      <div class="panel-heading panel-heading-Height"><h5 class=" AltBaslik"> <asp:Label ID="Label1" runat="server" Text="Ziyaretçi Sayısı"></asp:Label> </h5></div>
      <div class="panel-body">
      
      
      <div style="margin-top:5px;">

<div class="col-md-12">
   

  
  <table class="table table-hover ">
    
      <tbody>

            
          <tr>
              <td style="font-weight:700; font-size:16px; ">Online </td>
              <td style="font-weight:700; font-size:16px;">
                  <asp:Label ID="lblonline" style="float:right;" runat="server"></asp:Label>
              </td>
          </tr>

          <tr>
              <td style="font-weight:700; font-size:16px;">Günlük </td>
              <td style="font-weight:700; font-size:16px;">
                  <asp:Label ID="lblGunluk" style="float:right;" runat="server"></asp:Label>
              </td>
          </tr>

          
          <tr>
              <td style="font-weight:700; font-size:16px;">Aylık </td>
              <td style="font-weight:700; font-size:16px;">
                  <asp:Label ID="lblAylik" style="float:right;" runat="server"></asp:Label>
              </td>
          </tr>


            
          <tr>
              <td style="font-weight:700; font-size:16px;">Yıllık </td>
              <td style="font-weight:700; font-size:16px;">
                  <asp:Label ID="lblYillik" style="float:right;"  runat="server"></asp:Label>
              </td>
          </tr>

          <tr>
              <td style="font-weight:700; font-size:16px;">Toplam </td>
              <td style="font-weight:700; font-size:16px;">
                  <asp:Label ID="lblToplam" style="float:right;" runat="server"></asp:Label>
              </td>
          </tr>


      </tbody>

  </table>



 </div>


</div>


<div class="Temizle"></div>
      
      
      </div>
    </div>

</div>





    
    <!------------------------------------->
    <div class=" col-sm-3 col-md-2"></div>

    <div class=" col-sm-5  col-md-5">
<div class="panel panel-primary">
      <div class="panel-heading panel-heading-Height"><h5 class=" AltBaslik"> <asp:Label ID="Label2" runat="server" Text="Sistem Satış Adeti"></asp:Label> </h5></div>
      <div class="panel-body">
      
      
      <div style="margin-top:5px;">

<div class="col-md-12">
   
  
     <asp:DataList ID="DtlKatAdet" style="width:100%;" runat="server">
        <ItemTemplate>
            <table class="table table-hover ">
              <thead>
                  
              </thead>
      <tbody>
          <tr>
              <td style="font-weight:700; font-size:16px;"><%#Eval("AltKategoriAdi") %></td>
              <td style="font-weight:700; font-size:16px;">
                 <asp:Label ID="Label5" style="float:right;" runat="server" Text="Adet"></asp:Label> <asp:Label ID="Label4" style="float:right;" runat="server" Text='  <%#Eval("Adet") %>  '></asp:Label></td>
          </tr>
      </tbody>
  </table>
        </ItemTemplate>
    </asp:DataList>



 </div>


</div>


<div class="Temizle"></div>
      
      
      </div>
    </div>

</div>


    <!--------------------------------------------->


    <div class=" col-sm-4  col-md-5">
<div class="panel panel-primary">
      <div class="panel-heading panel-heading-Height"><h5 class=" AltBaslik"> <asp:Label ID="Label3" runat="server" Text="Toplam Tutar"></asp:Label> </h5></div>
      <div class="panel-body">
      
      
      <div style="margin-top:5px;">

<div class="col-md-12">
   

  
  <table class="table table-hover ">
    
      <tbody>


          <tr>
              <td style="font-weight:700; font-size:16px;">Günlük </td>
              <td style="font-weight:700; font-size:16px;">
                  <asp:Label ID="lblGTutar" style="float:right;" runat="server"></asp:Label>
              </td>
          </tr>

          
          <tr>
              <td style="font-weight:700; font-size:16px;">Aylık </td>
              <td style="font-weight:700; font-size:16px;">
                  <asp:Label ID="lblATutar" style="float:right;" runat="server"></asp:Label>
              </td>
          </tr>


            
          <tr>
              <td style="font-weight:700; font-size:16px;">Yıllık </td>
              <td style="font-weight:700; font-size:16px;">
                  <asp:Label ID="lblYTutar" style="float:right;"  runat="server"></asp:Label>
              </td>
          </tr>

          <tr>
              <td style="font-weight:700; font-size:16px;">Toplam </td>
              <td style="font-weight:700; font-size:16px;">
                  <asp:Label ID="lblTToplam" style="float:right;" runat="server"></asp:Label>
              </td>
          </tr>


      </tbody>

  </table>



 </div>


</div>


<div class="Temizle"></div>
      
      
      </div>
    </div>

</div>



    <!-------------------------------------------------->

</div>
</div>


</asp:Content>

