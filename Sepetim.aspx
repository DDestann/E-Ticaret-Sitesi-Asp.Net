<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageSite.master" AutoEventWireup="true" CodeFile="Sepetim.aspx.cs" Inherits="Sepetim" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style>
        .Sepet {
            width: 140px;
	height: 50px;
	display: inline-block;
	position: relative;
	text-align: center;
	background: #f5f5f5;
	margin-bottom: 5px;
        }
        .Sepet input {
	height: 100%;
	width: 100%;
	font-size: 16px;
	color: #6f6f6f;
    font-weight:500;
	width: 50px;
	border: none;
	background: #f5f5f5;
	text-align: center;
}
        .btnguncel {
      width:35px;
	height: 30px;
	display: inline-block;
	position: relative;
	text-align: center;
	background: #f5f5f5;
	float:right;
        }





    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 <!-- Shoping Cart Section Begin -->
    <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product" style="width:53%;">Ürünler</th>
                                    <th style="width:15%;">Fiyat</th>
                                    <th style="width:15%;">Adet</th>
                                    <th style="width:15%;">Tutar</th>
                                    <th ></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                      
                                    <asp:DataList ID="DtlSiparisOnay" runat="server" OnItemCommand="DtlSiparisOnay_ItemCommand">
                                        <ItemTemplate>
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                <ContentTemplate>
                                                    
                                             <td class="shoping__cart__item" style="width:53%;">
                                        <img style="width:100px; height:100px;" src="images/yuklenen/Galeri/kucuk/<%#Eval("ResimYolu") %>" alt="" />
                                        <h5><%#Eval("AltKategoriAdi") %></h5>
                                    </td>
                                    <td class="shoping__cart__price" style="width:15%;">
                                       <i class="fa fa-try"></i>
                                        <asp:Label ID="lblFiyat" runat="server" CommandArgument='<%#Eval("SepetId") %>' Text='<%#Eval("Fiyat") %>'></asp:Label>
                                    </td>
                                  
                                    
                                              <td class="shoping__cart__quantity" style="width:15%;">
                                        <div class="quantity">
                                            <div class="Sepet">
                                                <asp:LinkButton CssClass="btn btn-dark;" style="font-weight:700;  font-size:12px; color:black;" ID="btnEksi" CommandName="btnEksi" CommandArgument='<%#Eval("SepetId") %>' runat="server"><i class="fa fa-minus"></i></asp:LinkButton>
                                               <asp:TextBox ID="txtAdet" min="1" Value='<%#Eval("Adet") %>' runat="server" TextMode="Number"></asp:TextBox>
                                                <asp:LinkButton CssClass="btn btn-dark;" style="font-weight:700;  font-size:12px; color:black;" ID="btnArti" CommandName="btnArti" CommandArgument='<%#Eval("SepetId") %>' runat="server"><i class="fa fa-plus"></i></asp:LinkButton>
                                            </div >
                                           <%--<asp:LinkButton ID="btnSepetGuncelle" CommandName="btnGuncelle" CommandArgument='<%#Eval("SepetId") %>' CssClass="btn" style="background:#f5f5f5; display: inline-block; margin-top:-10px; margin-left:-6px;" ToolTip="Adet Güncelle"  runat="server"  ><i class="fa fa-refresh" aria-hidden="true"></i></asp:LinkButton>--%>
                                       
                                            </div>
                                    </td>

                                            <td class="shoping__cart__total" style="width:15%;"><i class="fa fa-try"></i>
                                                <asp:Label ID="lblYeniFiyat" runat="server" Text='<%#Eval("YeniFiyat") %>'></asp:Label>
                                            </td>
                                       
                                    <td class="shoping__cart__item__close" >
                                        <asp:LinkButton ID="btnSepetSil" CommandName="btnSepetSil" CommandArgument='<%#Eval("SepetId") %>' runat="server"><h4><i class="icon_close" ></i></h4></asp:LinkButton>
                                    </td>
                                              
                                             </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </ItemTemplate>
                                    </asp:DataList>
                                     
                                </tr>
                                
                            </tbody>
                        </table>

                         <div class="input-group form-group-lg" style="margin-top:2px;">
    <span class="input-group-addon" style="background:#f5f5f5; text-align:center; color:black; font-weight:700;"> &nbsp;Müşteri Notu &nbsp; </span>
     <asp:TextBox ID="txtMNot" class="form-control input-lg" pleaceholder="Müşteri Notu" runat="server"></asp:TextBox>
  </div>

                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="Default.aspx" class="primary-btn  site-btn" style="color:white;">Alışverişe Devam Et</a>
                  
                        


                      <%-- <h4 class="btn btn-info" style="float:right; margin-right:-3px; height:46px; "> Ödeme Tipi:</h4>--%>
                           
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__continue">
                        <%--<div class="shoping__discount">
                            <h5>Discount Codes</h5>
                            <form action="#">
                                <input type="text" placeholder="Enter your coupon code">
                                <button type="submit" class="site-btn">APPLY COUPON</button>
                            </form>
                        </div>--%>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__checkout">
                        <h5>Ödenecek Tutar</h5>
                        <ul>
                            <li>Ara Toplam <span><i class="fa fa-try"></i>
                                <asp:Label ID="lblAraToplam" runat="server" Text=""></asp:Label></span></li>
                            <li>Tutar <span><i class="fa fa-try"></i> <asp:Label ID="lblToplam" runat="server" Text=""></asp:Label></span></li>
                            <li> Ödeme Tipi 
                 <span><label class="radio-inline" style="color:black; font-weight:500;">&nbsp;&nbsp;&nbsp; <asp:RadioButton ID="rdbKredi"   Text="" runat="server" Checked="True" GroupName="rdbTip" /> Kredi Kartı</label></span>
               <span> <label class="radio-inline" style="color:black; font-weight:500;"><asp:RadioButton ID="rdbNakit"  Text="" runat="server" GroupName="rdbTip" /> Nakit</label></span>
                                
                                           

                            </li>
                        </ul>
                        <asp:LinkButton ID="btnSiparisTamam" class="primary-btn" runat="server" OnClick="btnSiparisTamam_Click">Siparişi Tamamla</asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shoping Cart Section End -->
</asp:Content>

