<%@ Page Language="C#" AutoEventWireup="true" CodeFile="jsMenu.aspx.cs" Inherits="jsMenu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>



    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>


    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


    <script>
        $(document).ready(function () {
            $("#myLoginin").click(function () {
                $("#myModalLogin").modal();
            });
        });
    </script>




</head>
<body>
    <form id="form1" runat="server">



        <!--------Login --------->
        <!-- Trigger the modal with a button -->


        <!-- Modal -->
        <a id="myLoginin" title="Üye Girişi"><span class="glyphicon glyphicon-log-in btn btn-success hidden-xs "></span></a>

        <div class="modal fade " id="myModalLogin" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->

                <div class="modal-content">
                    <div class="modal-header modal-header-Login" style="padding: 35px 50px;">

                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4><span class="glyphicon glyphicon-lock"></span>Giriş Yap</h4>
                    </div>

                    <div class="modal-body" style="padding: 40px 50px;">


                        <div class="form-group">
                            <label for="usrname"><span class="glyphicon glyphicon-user"></span>e-Mail</label>
                            <asp:TextBox ID="txtMail" class="form-control" TextMode="Email" placeholder="Enter email" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="psw"><span class="glyphicon glyphicon-eye-open"></span>Şifre</label>
                            <asp:TextBox ID="txtSifre" class="form-control" TextMode="Password" placeholder="Enter Şifre" runat="server"></asp:TextBox>
                        </div>
                        <div class="checkbox">
                            <asp:CheckBox ID="chHatirla" Text="Beni Hatırla" runat="server" />
                        </div>
                        <asp:Button ID="BtnGiris" CssClass="btn btn-success btn-block glyphicon glyphicon-off" runat="server" Text="GirişYap" />

                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span>İptal</button>
                        <p><a href="KayitOl.aspx">Üye Ol</a></p>
                        <p><a id="myMail" href="#">Şifremi Unuttum?</a></p>
                    </div>

                </div>

            </div>
        </div>
        <!--------Login Bitiş --------->



        <div>

            <asp:LinkButton ID="btnSiparisTamam" runat="server" OnClick="btnSiparisTamam_Click">Siparişi Tamamla</asp:LinkButton>

        </div>






        <div class="container mt-3">
            <h2>Filterable Table</h2>
            <p>Type something in the input field to search the table for first names, last names or emails:</p>
            <input class="form-control" id="myInput" type="text" placeholder="Search..">
            <br>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Firstname</th>
                        <th>Lastname</th>
                        <th>Email</th>
                    </tr>
                </thead>
                <tbody id="myTable">
                   
                            <tr>
                                 <asp:DataList ID="DataList1" runat="server">
                        <ItemTemplate>
                                <td><%#Eval("AdSoyad") %></td>
                                <td>Doe</td>
                                <td>john@example.com</td>
                             </ItemTemplate>
                    </asp:DataList>
                            </tr>
                       


                </tbody>
            </table>

            <p>Note that we start the search in tbody, to prevent filtering the table headers.</p>
        </div>

        <script>
            $(document).ready(function () {
                $("#myInput").on("keyup", function () {
                    var value = $(this).val().toLowerCase();
                    $("#DataList1 tr").filter(function () {
                        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                    });
                });
            });
        </script>






    </form>

</body>
</html>
