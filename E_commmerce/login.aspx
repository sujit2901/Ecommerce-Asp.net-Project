<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="E_commmerce.login" %>

<!DOCTYPE html>

<html>
<head runat="server">
     <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <link rel="stylesheet" href="Admin/assets/css/admin_style.css">
    <style>

    </style>
    <title>Login Page</title>
    
</head>
<body class="primary-alt">
    <form id="form1" runat="server">
          <div>
            <div class="u-center">
        <div class="card mb-3 secondary" style="max-width: 800px;">
            <div class="row g-0">
                <div class="col-md-6">
                <img src="Admin/assets/images/login_img.jpg" style="border-radius:20px;height:100%" class="img-fluid" alt="...">
                </div>
                <div class="col-md-6 p-3">
                    <div class="card-body">
                        <h5 class="card-title">USER LOGIN </h5>
                        <form>
                            <label for="exampleFormControlInput1" class="form-label" for="name">Email:</label>
                            <br>
                            <asp:TextBox class="form-control" type="email" ID="useremail" runat="server" required="true" ></asp:TextBox>
                            <br>                            
                            <label for="exampleFormControlInput1" class="form-label" for="name">Password:</label>
                            <br>
                            <asp:TextBox class="form-control" type="password" ID="userpassword" runat="server" required="true"></asp:TextBox>
                            <br>
                            <asp:Button ID="userlogin" runat="server" type="submit" class="btn primary px-3 py-2 w-100" Text="Login" OnClick="Login_Click" />
                            
                            <br>
                            <br>
                            Don't have an account? <a class="t-decor" href="Register.aspx">Sign Up</a>
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
