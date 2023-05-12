<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeFile="Login.aspx.cs" Inherits="yonetim_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   

      <style>
        .lable{margin-left:30px;}

        .modal-header, h4, .close {
      background-color: #5cb85c;
      color:white !important;
      text-align: center;
      font-size: 30px;
  }
  .modal-footer {
      background-color: #f9f9f9;
  }


    </style>
   
    
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
    <link rel="stylesheet" type="text/css" href="css/Costum.css">

    <script src="../js/jquery-1.12.2.min.js"></script>

    <script>
        $(document).ready(function () {
            $("#myMail").click(function () {
                $("#myModalMail").modal();
            });
        });
</script>

</head>
<body class="Login_bg">


    <form id="form1" runat="server">

        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-4 col-sm-4 col-md-4 "> </div>
                    <div class="col-xs-4 col-sm-4 col-md-4 Login-Top Login-Box-bg ">
                        <form class="form-signin ">
        <h2 class="form-signin-heading">Login Panel</h2>
                            <asp:Label ID="Label1" runat="server" class="sr-only" Text="Email Adresi"></asp:Label>
                            <asp:TextBox ID="txtKullaniciAdi" TextMode="Email" class="form-control" placeholder="Email address" runat="server"></asp:TextBox>
        
       <div class="Temizle"></div>
                             <label for="inputPassword" class="sr-only">Şifre</label>
                            <asp:TextBox ID="txtSifre" class="form-control" TextMode="Password" placeholder="Password" runat="server"></asp:TextBox>
                            <div class="Temizle"></div>

        <div class="checkbox lable" >

            <a id="myMail" style="float:right; color:white;" href="#">Şifremi Unuttum ?</a>
            <div class="Temizle"></div>
        </div>
                            <div>
  <!-- Trigger the modal with a button -->

                                
  <!-- Modal -->
<div class="modal fade" id="myModalMail" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    
      <div class="modal-content">
          <div class="modal-header modal-header-Login" style="padding: 35px 50px;">

              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4><span class="glyphicon glyphicon-lock"></span>Şifremi Unuttum</h4>
          </div>

          <div class="modal-body" style="padding: 40px 50px;">

              <div class="form-group">
                  <label for="usrname"><span class="glyphicon glyphicon-user"></span>e-Mail</label>
                  <asp:TextBox ID="txtMailSifre" class="form-control" TextMode="Email" placeholder="Enter email" runat="server"></asp:TextBox>
              </div>
              <asp:Button ID="btnUnuttum" CssClass="btn btn-success btn-block glyphicon glyphicon-off" runat="server" Text="Gönder" OnClick="btnUnuttum_Click" />

          </div>
          <div class="modal-footer">
              <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span>İptal</button>
              

          </div>

      </div>

                </div>
            </div>
                                <div class="Temizle"></div>
                            </div>

  <div class="checkbox ">
            <asp:Label ID="lblDurum" runat="server" Text=""></asp:Label>
            <div class="Temizle"></div>
        </div>

                           
             <asp:Button ID="BtnLogin" class="btn btn-lg btn-primary btn-block" runat="server" Text="SingIn" OnClick="BtnLogin_Click" />
      <div class="Temizle"></div>
                        </form>

                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4 "> </div>
            </div>
        </div>





    </form>



        
<script src="js/jquery-1.12.3.min.js" type="text/javascript"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>

<script src="js/script.js" type="text/javascript"></script>

</body>
</html>