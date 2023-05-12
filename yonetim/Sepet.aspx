<%@ Page Title="" Language="C#" MasterPageFile="~/yonetim/yonetim.master" AutoEventWireup="true" CodeFile="Sepet.aspx.cs" Inherits="yonetim_Sepet" %>

<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">

        .Sekil { float:right; width:100%;
        }


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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">




    <div class="container-fluid ">
<div class="row">

<!--------  Orta Alan Üst Başlık ------------------>
<div class=" col-sm-3 col-md-2"></div>
<div class=" col-sm-9  col-md-10">
  <h2 class=" page-header Baslik slidbar_top">Sipariş Bilgileri  </h2>
</div>
<!--------  Orta Alan Üst Başlık Bitti ------------------>
<div class=" col-sm-3 col-md-2"></div>
<div class=" col-sm-9  col-md-10">
<div class="panel panel-primary">
      <div class="panel-heading panel-heading-Height"><h5 class=" AltBaslik"> <asp:Label ID="lblBaslik" runat="server" Text="Gelen Siparişler"></asp:Label> </h5></div>
      <div class="panel-body">
      
      
      <div style="margin-top:5px;">

<div class="col-md-12">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="Timer" EventName="Tick" />
        </Triggers>
        <ContentTemplate>

            <asp:DataList ID="Dtlist" Visible="true" Width="100%" runat="server" OnItemCommand="Dtlist_ItemCommand">

         <HeaderTemplate>
                <table class="table table-hover ">
 
          <thead>
       <tr class="Tablo" style="background-color:#2b78b2; color:white;" >
        <th style="width:15%;" >AdSoyad</th>
        <th style="width:35%;" >Adres</th>
        <th style="width:10%;" >Tarih</th>
        <th style="width:10%;" >Tutar</th>
        <th style="width:10%;" >Ödeme Tipi</th>
        <th style="width:10%;">Göster</th>
        <th  style="width:10%;">Onayla</th>
        
      </tr>
    </thead>
                    </table>
         </HeaderTemplate>

         <itemtemplate>
             <table class="table table-hover ">
                 <tbody>
                     <tr style="font-weight:700;">
                        <td style="width:15%;"><%#Eval("AdSoyad") %></td>
                         <td style="width:35%;"><%#Eval("Adres") %></td>
                         <td style="width:10%;"><%#Eval("MOnayTarihi") %></td>
                         <td style="width:10%;"><i class="fa fa-try"></i>&nbsp;<%#Eval("Tutar") %></td>
                         <td style="width:10%;"><%#Eval("OdemeTipi") %></td>
                         <td style="width:10%;"><a href="SepetDetay.aspx?ID=<%#Eval("ID") %>" target="_blank" class="btn btn-info" >Göster&nbsp;<i class="fa fa-eye"></i></a></td>
                         <td style="width:10%;">
                             <asp:LinkButton ID="btnSiparisOnay" CssClass="btn btn-success" style="color:white;" CommandName="btnOnay" CommandArgument='<%#Eval("ID") %>' runat="server">Onayla</asp:LinkButton></td>
                     </tr>

                 </tbody>
             </table> 
      </itemtemplate>
     
          </asp:DataList>

        </ContentTemplate>
    </asp:UpdatePanel>


     <asp:Timer ID="Timer" runat="server" Interval="7000" OnTick="Timer_Tick">
    </asp:Timer>
 </div>

         
</div>


<div class="Temizle">
   
          </div>

      </div>
    </div>

</div>


    <div class=" col-sm-3 col-md-2"></div>
    <div class=" col-sm-9  col-md-10">
<div class="panel panel-primary">
      <div class="panel-heading panel-heading-Height"><h5 class=" AltBaslik"> <asp:Label ID="Label1" runat="server" Text="Onaylanan Siparişler"></asp:Label> </h5></div>
      <div class="panel-body">
      
      
      <div style="margin-top:5px;">

<div class="col-md-12">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>

            <asp:DataList ID="DtlOnaySepet" Visible="true" Width="100%" runat="server">

         <HeaderTemplate>
                <table class="table table-hover ">
 
          <thead>
      <tr class="Tablo" style="background-color:#2b78b2; color:white;" >
        <th style="width:20%;" >AdSoyad</th>
        <th style="width:40%;" >Adres</th>
        <th style="width:10%;" >Tarih</th>
        <th style="width:10%;" >Tutar</th>
        <th style="width:10%;" >Ödeme Tipi</th>
        <th style="width:10%;">Göster</th>
        
        
      </tr>
    </thead>
                    </table>
         </HeaderTemplate>

         <itemtemplate>
             <table class="table table-hover ">
                 <tbody>
                     <tr style="font-weight:700;">
                        <td style="width:20%;"><%#Eval("AdSoyad") %></td>
                         <td style="width:40%;"><%#Eval("Adres") %></td>
                         <td style="width:10%;"><%#Eval("MOnayTarihi") %></td>
                         <td style="width:10%;"><i class="fa fa-try"></i>&nbsp;<%#Eval("Tutar") %></td>
                         <td style="width:10%;"><%#Eval("OdemeTipi") %></td>
                         <td style="width:10%;"><a href="SepetDetay.aspx?ID=<%#Eval("ID") %>" class="btn btn-info" >Göster&nbsp;<i class="fa fa-eye"></i></a></td>
                       
                     </tr>

                 </tbody>
             </table> 
      </itemtemplate>
     
          </asp:DataList>




          


        </ContentTemplate>
    </asp:UpdatePanel>
  


 </div>

             <cc1:collectionpager id="Sayfalama" runat="server" backnextdisplay="Buttons"
              backnextlinkseparator="" backnextlocation="Split" backnextstyle=""
              backtext="<" controlcssclass="Sayfalama" controlstyle=""
              firsttext="<<" hideonsinglepage="True" ignorequerystring="True"
              labelstyle="" labeltext="Sayfalar :" lasttext=">>" maxpages="100"
              nexttext=">" pagenumbersdisplay="Numbers" pagenumbersseparator="&amp;nbsp;"
              pagenumbersstyle="" pagenumberstyle="" pagesize="8" pagingmode="PostBack"
              querystringkey="Sayfa"
              resultsformat="{2} tane makaleden {0} - {1} arası gösteriliyor"
              resultslocation="None" resultsstyle="" sectionpadding="10" showfirstlast="True"
              showlabel="False" showpagenumbers="True" slidersize="15" useslider="True">
        </cc1:collectionpager>

</div>


<div class="Temizle"></div>
         
      


      </div>
    </div>

</div>
    




    


</div>
</div>













</asp:Content>

