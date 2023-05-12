<%@ Page Title="" Language="C#" MasterPageFile="~/yonetim/yonetim.master" AutoEventWireup="true" CodeFile="Mesaj.aspx.cs" Inherits="yonetim_ContactMessage" %>

<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

   

    <style type="text/css">

        .Sekil { float:right; width:100%;
        }

        .btn_left{ margin:5px;}

   .Sayfalama a:link, .Sayfalama a:visited, .Sayfalama a:active
{

    color: #6999e6;
   padding: 10px 12px 10px 12px;
    text-decoration: none;
    transition: background-color .3s;
    border: 1px solid #ddd;
    text-align:center;
    
}

        .Sayfalama a:hover
{
     background-color: #eee;
    padding: 10px 12px 10px 12px;
    text-decoration: none;
    transition: background-color .3s;
    border: 1px solid #ddd;
    
}

.Sayfalama INPUT
{
    background-color:white;
 color:#6999e6;
    padding: 8px 12px 8px 12px;
    text-decoration: none;
    transition: background-color .3s;
    border: 1px solid #ddd;
text-align:center;
}

.Sayfalama INPUT:hover
{
   background-color: #eee;
 color:#6999e6;
    padding: 8px 12px 8px 12px;
    text-decoration: none;
    transition: background-color .3s;
    border: 1px solid #ddd;
text-align:center;
}

.Sayfalama B
{

    background-color: #6999e6;
    color: white;
    padding: 10px 12px 10px 12px;
    text-decoration: none;
    transition: background-color .3s;
    border: 1px solid #ddd;
}




    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <!--------  Orta Alan  ------------------>
<div class="container-fluid">
<div class="row">

<!--------  Orta Alan Üst Başlık ------------------>
<div class=" col-sm-3 col-md-2"></div>
<div class=" col-sm-9  col-md-10">
  <h2 class=" page-header Baslik slidbar_top"> İletişimden Gelen Mesajlar </h2>
</div>
<!--------  Orta Alan Üst Başlık Bitti ------------------>
<div class=" col-sm-3 col-md-2"></div>
<div class=" col-sm-9  col-md-4">
<div class="panel panel-primary">
      <div class="panel-heading panel-heading-Height"><h5 class=" AltBaslik"> <asp:Label ID="lblBaslik" runat="server" Text=""></asp:Label> </h5></div>
      <div class="panel-body">
      
      
      <div style="margin-top:5px;">

<div class="col-md-12">
    <asp:Panel ID="pnlBasarili" Visible="false" runat="server">
<div class="alert alert-success fade in">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong>Başarılı! </strong><asp:Label ID="lblBasarili" runat="server" Text=""></asp:Label> 
  </div>
</asp:Panel>
 <!-------- <div class="alert alert-info fade in">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong>Info!</strong> This alert box could indicate a neutral informative change or action.
  </div>------>

    <asp:Panel ID="pnlKontrol" Visible="false" runat="server">
         <div class="alert alert-warning fade in">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong>Uyarı!</strong> <asp:Label ID="lblKontrol" runat="server" Text=""></asp:Label>
  </div>
    </asp:Panel>

    <asp:Panel ID="pnlHata" Visible="false" runat="server">
  <div class="alert alert-danger fade in">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong>Hatalı! </strong> <asp:Label ID="lblHata" runat="server" Text=""></asp:Label> .
  </div>
</asp:Panel>
 </div>
</div>


<div class="Temizle"></div>
      
<!-----<div style="margin-top:5px;">
<div class="col-md-4 lable_Center">Kategori Adı:</div>
<div class="col-md-8"> <input type="text" class="form-control" placeholder="Search..."> </div>
</div>------->
<asp:Panel ID="pnlMesaj" Visible="false" runat="server">
          <div class="form-horizontal">

              
                   <div class="form-group">
      <asp:Label  ID="Label1" runat="server" class="col-sm-3 lable_Color">Kullanıcı&nbsp;Adı</asp:Label>
    <div class="col-sm-9 ">
        <asp:TextBox ID="txtKulAd" class="form-control"  placeholder="Kullanıcı Adı" runat="server"></asp:TextBox>
    </div>
  </div>
               <div class="form-group">
      <asp:Label  ID="Label2" runat="server" class="col-sm-3 lable_Color">Mail</asp:Label>
    <div class="col-sm-9 ">
        <asp:TextBox ID="txtMail" class="form-control"  placeholder="Mail" runat="server"></asp:TextBox>
    </div>
  </div>

    

               <div class="form-group">
      <asp:Label  ID="Label5" runat="server" class="col-sm-3 lable_Color">Mesaj</asp:Label>
    <div class="col-sm-9 ">
        <asp:TextBox ID="txtMesaj" class="form-control"  placeholder="Mesaj" TextMode="MultiLine"  runat="server"></asp:TextBox>
    </div>
  </div>


              <div class="form-group">
      <asp:Label  ID="Label3" runat="server" class="col-sm-3 lable_Color">Mesaj&nbsp;Cevap</asp:Label>
    <div class="col-sm-9 ">
        <asp:TextBox ID="txtCevap" class="form-control" TextMode="MultiLine" placeholder="Cevap" runat="server"></asp:TextBox>
    </div>
  </div>


              <br/>
              <br />
              <div class="form-group">
                  <div class="col-sm-offset-2 col-sm-10">
                      <asp:Button ID="btnKaydet" Text="Kaydet" runat="server" class="btn btn-primary Button-Right btn_left btn-sm Button-Top" OnClick="btnKaydet_Click" />
                    <asp:Button ID="btniptal" Text="İptal" runat="server" class="btn btn-primary Button-Right btn-sm Button-Top" OnClick="btniptal_Click" /> 
                  </div>

                 


              </div>
             

          </div>
 </asp:Panel>
      
      </div>
    </div>

</div>
<!--------  Orta Alan Sağ ------------------>
<div class=" col-sm-3 col-md-2"></div>
<div class=" col-sm-9 col-md-6">


<div class="panel panel-primary">
     <div class="panel-heading panel-heading-Height"><h5 class=" AltBaslik"> Gelen Mesajlar</h5></div>
      <div class=" panel panel-body">
      <div class=" col-sm-6 col-md-12">
      

     <asp:DataList ID="DtlistOku" Visible="true" Width="100%" runat="server">

         <HeaderTemplate>
                <table class="table table-hover ">
 
          <thead >
      <tr class="Tablo-bg Sekil">
        
          <th style="width:30%;" >Kullanici Adi</th>
        <th style="width:35%;" >Mail</th>
        <th style="width:25%;" >Tarih</th>
        <th style="width:5%;">Düzenle</th>
        <th  style="width:5%;">Sil</th>
        
      </tr>
    </thead>
                    </table>
         </HeaderTemplate>

         <itemtemplate>
             <table class="table table-hover ">
                 <tbody>
                     <tr>
                         <td style="width:30%;"><%#Eval("AdSoyad") %></td>
                         <td style="width:35%;"><%#Eval("Mail") %></td>
                        <td style="width:30%;"><%#Eval("GTarih") %></td>

                         <td style="width:5%;"><a href='Mesaj.aspx?Duzenle=<%#Eval("MsjId") %>'>
                             <img src="images/user_edit.png"></a></td>
                         <td style="width:5%;"><a href='Mesaj.aspx?Sil=<%#Eval("MsjId") %>' onclick='return confirm("Silmek istediğinizden emin misiniz?");'>
                             <img src="images/trash.png"></a></td>
                     </tr>

                 </tbody>
             </table> 
      </itemtemplate>
     
          </asp:DataList>
 
         
  
  <!---- page ------>

        
      <cc1:CollectionPager ID="Sayfalama1" runat="server" BackNextDisplay="Buttons"
BackNextLinkSeparator="" BackNextLocation="Split" BackNextStyle=""
BackText="<" ControlCssClass="Sayfalama" ControlStyle=""
FirstText="<<" HideOnSinglePage="True" IgnoreQueryString="True"
LabelStyle="" LabelText="Sayfalar :" LastText=">>" MaxPages="100"
NextText=">" PageNumbersDisplay="Numbers" PageNumbersSeparator="&amp;nbsp;"
PageNumbersStyle="" PageNumberStyle="" PageSize="8" PagingMode="PostBack"
QueryStringKey="Sayfa"
ResultsFormat="{2} tane makaleden {0} - {1} arası gösteriliyor"
ResultsLocation="None" ResultsStyle="" SectionPadding="10" ShowFirstLast="True"
ShowLabel="False" ShowPageNumbers="True" SliderSize="15"  UseSlider="True">
        </cc1:CollectionPager>






  

<!---- page ------>
</div>
      </div>
    </div>



   <div class="panel panel-primary">
     <div class="panel-heading panel-heading-Height"><h5 class=" AltBaslik"> Okunan Mesajlar</h5></div>
      <div class=" panel panel-body">
      <div class=" col-sm-6 col-md-12">
      

     <asp:DataList ID="Dtlist" Visible="true" Width="100%" runat="server">

         <HeaderTemplate>
                <table class="table table-hover ">
 
          <thead >
      <tr class="Tablo-bg Sekil">
        
          <th style="width:30%;" >Kullanici Adi</th>
        <th style="width:35%;" >Mail</th>
        <th style="width:25%;" >Tarih</th>
        <th style="width:5%;">Göster</th>
        <th  style="width:5%;">Sil</th>
        
      </tr>
    </thead>
                    </table>
         </HeaderTemplate>

         <itemtemplate>
             <table class="table table-hover ">
                 <tbody>
                     <tr>
                         <td style="width:30%;"><%#Eval("AdSoyad") %></td>
                         <td style="width:35%;"><%#Eval("Mail") %></td>
                        <td style="width:30%;"><%#Eval("GTarih") %></td>

                         <td style="width:5%;"><a href='Mesaj.aspx?Duzenle=<%#Eval("MsjId") %>'>
                             <i class="fa fa-eye"></i></a></td>
                         <td style="width:5%;"><a href='Mesaj.aspx?Sil=<%#Eval("MsjId") %>' onclick='return confirm("Silmek istediğinizden emin misiniz?");'>
                             <img src="images/trash.png"></a></td>
                     </tr>

                 </tbody>
             </table> 
      </itemtemplate>
     
          </asp:DataList>
 
         
  
  <!---- page ------>

        
      <cc1:CollectionPager ID="Sayfalama" runat="server" BackNextDisplay="Buttons"
BackNextLinkSeparator="" BackNextLocation="Split" BackNextStyle=""
BackText="<" ControlCssClass="Sayfalama" ControlStyle=""
FirstText="<<" HideOnSinglePage="True" IgnoreQueryString="True"
LabelStyle="" LabelText="Sayfalar :" LastText=">>" MaxPages="100"
NextText=">" PageNumbersDisplay="Numbers" PageNumbersSeparator="&amp;nbsp;"
PageNumbersStyle="" PageNumberStyle="" PageSize="8" PagingMode="PostBack"
QueryStringKey="Sayfa"
ResultsFormat="{2} tane makaleden {0} - {1} arası gösteriliyor"
ResultsLocation="None" ResultsStyle="" SectionPadding="10" ShowFirstLast="True"
ShowLabel="False" ShowPageNumbers="True" SliderSize="15"  UseSlider="True">
        </cc1:CollectionPager>






  

<!---- page ------>
</div>
      </div>
    </div>







</div>
<!--------  Orta Alan Sağ Bitti ------------------>

</div>
</div>

</asp:Content>
