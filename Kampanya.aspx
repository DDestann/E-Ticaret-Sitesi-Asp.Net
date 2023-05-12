<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageSite.master" AutoEventWireup="true" CodeFile="Kampanya.aspx.cs" Inherits="Kampanya" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style>
        .indirim {
            height: 45px;
	width: 45px;
	background: #dd2222;
	border-radius: 50%;
	font-size: 14px;
	color: #ffffff;
	line-height: 45px;
	text-align: center;
	position: absolute;
	left: 15px;
	top: 15px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    


    <section class="featured spad">
        <div class="container">

            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>İndirimli Ürünler</h2>
                    </div>
                    
                </div>
                <div class="col-lg-12">
                                 <div class="section-title product__discount__title" style="text-align:center;">
                            <h5> <asp:Label ID="lblBilgi" runat="server" Text=""></asp:Label></h5>
                        </div>

            </div>

            </div>
                <div class="row">
                <asp:Repeater ID="rptKampanya" runat="server" OnItemCommand="rptKampanya_ItemCommand">
                <ItemTemplate>
                    <div class="col-lg-3 col-md-5 col-sm-5">
                        <div class="featured__item">

                            <div class="featured__item__pic set-bg" data-setbg="">
                                <a style="color: black;" href="<%#Detail(Eval("AltKategoriId").ToString(),Eval("AltKategoriAdi").ToString()) %>"> <img src="./images/yuklenen/Galeri/kucuk/<%#Eval("ResimYolu")%>" /></a>
                                <div class="indirim">-<%#Eval("Indirim") %>%</div>
                               <div class="featured__item__pic__hover">
                                    <asp:LinkButton ID="btnSepeteEkle" CssClass="site-btn" style="color:white;" CommandName="SepeteEkle" CommandArgument='<%#Eval("AltKategoriId") %>' runat="server">Sepete Ekle &nbsp;<i class="fa fa-shopping-cart"></i></asp:LinkButton>
                               </div>
                                 </div>

                            <div class="featured__item__text" >
                                <h6>Stok:150</h6>
                                <h6><a style="color:black; font:bold;" href="<%#Detail(Eval("AltKategoriId").ToString(),Eval("AltKategoriAdi").ToString()) %>"><%#Eval("AltKategoriAdi").ToString() %></a></h6>

                                <div class="product__item__price">
                                   <i class="fa fa-try" style="font-size:16pt; font:bold; color:black;"> <asp:Label ID="lblYeniFiyat" runat="server"  Text='<%#Eval("AltKategoriYFiyat") %>' CommandName="lblYeniFiyat" CommandArgument='<%#Eval("AltKategoriId") %>'></asp:Label></i>&nbsp;<del class="fa fa-try" style="font-size:12pt; font:bold; color:red;"><%#Eval("AltKategoriFiyat") %></del></div>
                            </div>


                        </div>
                    </div>
                </ItemTemplate>
                </asp:Repeater>
                    
                   


                    
                </div>
        </div>
    </section>

</asp:Content>

