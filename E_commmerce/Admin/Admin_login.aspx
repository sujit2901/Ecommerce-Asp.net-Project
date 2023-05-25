<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_login.aspx.cs" Inherits="E_commmerce.Admin.Admin_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="assets/css/admin_style.css">
    <style>

    </style>
    <title>Login Page</title>
</head>
<body class="primary-alt" runat="server">

    <div class="p-3" id="notify" runat="server"></div>
 
    <form id="form1" runat="server">
        <div>
            <div class="u-center">
        <div class="card mb-3 secondary" style="max-width: 800px;">
            <div class="row g-0">
                <div class="col-md-6">
                <img src="assets/images/login_img.jpg" style="border-radius:20px;height:100%" class="img-fluid" alt="...">
                </div>
                <div class="col-md-6 p-3">
                    <div class="card-body">
                        <h5 class="card-title">LOGIN </h5>
                        <form>
                            <label for="exampleFormControlInput1" class="form-label" for="name">Username:</label>
                            <br>
                            <asp:TextBox class="form-control" type="email" ID="username" runat="server" required="true" ></asp:TextBox>
                            <br>                            
                            <label for="exampleFormControlInput1" class="form-label" for="name">Password:</label>
                            <br>
                            <asp:TextBox class="form-control" type="password" ID="password" runat="server" required="true"></asp:TextBox>
                            <br>
                            <asp:Button ID="Login" runat="server" type="submit" class="btn primary px-3 py-2 w-100" Text="Login" OnClick="Login_Click" />
                            
                            <br>
                            <br>
                            Don't Remember Password? <a class="t-decor" href="sign-up.html">Forget Password</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>

   </div>
    
    

        </div>
    </form>
   
</body>
</html>
