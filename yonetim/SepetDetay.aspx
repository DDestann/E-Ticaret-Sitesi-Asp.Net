<%@ Page Title="" Language="C#" MasterPageFile="~/yonetim/yonetim.master" AutoEventWireup="true" CodeFile="SepetDetay.aspx.cs" Inherits="yonetim_SepetDetay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   

    <div class="container-fluid ">
<div class="row">

<!--------  Orta Alan Üst Başlık ------------------>
<div class=" col-sm-3 col-md-2"></div>
<div class=" col-sm-9  col-md-10">
  <h2 class=" page-header Baslik slidbar_top">  </h2>
</div>
<!--------  Orta Alan Üst Başlık Bitti ------------------>
<div class=" col-sm-3 col-md-2"></div>
<div class=" col-sm-6  col-md-6">
<div class="panel panel-primary">
    
      <div class="panel-body">
      
      
      <div style="margin-top:5px;">

<div class="col-md-12">
   
  
  <table class="table">
    
      <tbody>

          <tr><td style="text-align:center;"  >
              <asp:Image ID="imgLogo" runat="server" /></td></tr>

          <tr>
              <td style="font-weight:700; font-size:16px; ">
                  <asp:Label ID="lblAdres" text="" runat="server"></asp:Label>
              </td>
          </tr>

          <tr><td  style="font-weight:700; font-size:16px; ">
            <asp:Label ID="lblKulAd" runat="server" Text=""></asp:Label>  &nbsp; &nbsp; <asp:Label ID="lblKulTel" runat="server" Text=""></asp:Label></td></tr>
          <tr><td  style="font-weight:700; font-size:16px;">
              <asp:Label ID="lblKulAdres" runat="server" Text=""></asp:Label></td></tr>
          
           <tr><td  style="font-weight:700; font-size:16px;">
              <asp:Label ID="lblTarih" runat="server" Text=""></asp:Label></td></tr>



     
<asp:DataList ID="DtlLİst" style="width:100%;" runat="server">
                <ItemTemplate>
   
<table class="table">
    <tbody>

        
            <tr>
                       <td style="font-weight:700; font-size:16px; width:60%;">
                  <asp:Label ID="lblAltKategori" runat="server" Text='<%#Eval("AltKategoriAdi") %>'></asp:Label> </td>
              <td style="font-weight:700; font-size:16px; width:20%;">
                  x<asp:Label ID="lblAdet" runat="server" Text='<%#Eval("Adet") %>'></asp:Label> </td>
               <td style="font-weight:700; font-size:16px; width:20%;">
                   <asp:Label ID="lblTutar" runat="server" Text='<%#Eval("YeniFiyat") %>'></asp:Label>&nbsp;<i class="fa fa-try"></i> </td>
               
                </tr>

    </tbody>
</table>
        
 </ItemTemplate>
            </asp:DataList>

          

      </tbody>

  </table>

    <table class="table">
        <tbody>
 

          <tr> <td style="font-weight:700; font-size:16px; ">
              <asp:Label ID="lblOdemeTipi" runat="server" Text=""></asp:Label></td>
              <td style="font-weight:700; font-size:16px; float:right;">
                  <asp:Label ID="lblToplam" runat="server" Text=""></asp:Label>&nbsp;<i class="fa fa-try"></i></td>
          </tr>
              <tr><td style="font-weight:700; font-size:16px;">
                    <asp:Label ID="lblNot" runat="server" Text=""></asp:Label> </td></tr>
            <tr><td></td><td style="float:right;"><button class="btn btn-info" onclick="window.print()">Yazdır <i class="fa fa-print"></i> </button></td></tr>
        </tbody>
    </table>


 </div>


</div>


<div class="Temizle"></div>
      
      
      </div>
    </div>

</div>




</div>
</div>



</asp:Content>

