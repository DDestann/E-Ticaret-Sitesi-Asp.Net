<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageSite.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Urunler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


  <!-- Featured Section Begin -->

    <section class="featured spad">
        <div class="container">

            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2><asp:Label ID="lblBaslik" runat="server" Text=""></asp:Label></h2>
                    </div>
                    <div class="text-center">
                        <asp:Label ID="lblBilgi" style="color:black; font-weight:500;" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
                <div class="row">
                <asp:Repeater ID="rptUrun" runat="server" OnItemCommand="rptUrun_ItemCommand">
                <ItemTemplate>
                    <div class="col-lg-3 col-md-5 col-sm-5">
                        <div class="featured__item">
                            <div class="featured__item__pic set-bg" data-setbg="">
                                <a style="color: black;" href="<%#Detail(Eval("AltKategoriId").ToString(),Eval("AltKategoriAdi").ToString()) %>"> <img src="./images/yuklenen/Galeri/kucuk/<%#Eval("ResimYolu")%>" /></a>
                               <div class="featured__item__pic__hover">
                                    <asp:LinkButton ID="btnSepeteEkle" CssClass="site-btn" style="color:white;" CommandName="SepeteEkle" CommandArgument='<%#Eval("AltKategoriId").ToString() %>' runat="server">Sepete Ekle &nbsp;<i class="fa fa-shopping-cart"></i></asp:LinkButton>
                               </div>
                               <%--  <ul class="featured__item__pic__hover">
                                    <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                    <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                    <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                </ul>--%>
                           
                                 </div>
                            <div class="featured__item__text">
                                <h6>Stok:150</h6>
                                <h6><a style="color:black; font:bold;" href="<%#Detail(Eval("AltKategoriId").ToString(),Eval("AltKategoriAdi").ToString()) %>"><%#Eval("AltKategoriAdi").ToString() %></a></h6>
                                <h5><i class="fa fa-try">
                                    <asp:Label ID="lblFiyat" runat="server" Text='<%#Eval("AltKategoriFiyat") %>'></asp:Label></i></h5>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
                </asp:Repeater>
                    
                   


                    
                </div>
        </div>
    </section>

    <!-- Featured Section End -->


</asp:Content>

