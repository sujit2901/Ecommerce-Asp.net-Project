<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="E_commmerce.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <link rel="stylesheet" href="Admin/assets/css/admin_style.css">
    <style>

    </style>
    <title>Register Page</title>
</head>
<body class="primary-alt" runat="server">
    <form id="form1" runat="server">
        <div>
             <div class="u-center">
        <div class="card mb-3 secondary" style="max-width: 1000px;">
            <div class="row g-0">
                <div class="col-md-6">
                <img src="assets/images/signup.jpg" style="border-radius:20px;height:100%" class="img-fluid" alt="...">
                </div>
                <div class="col-md-6 p-3">
                    <div class="card-body">
                        <h5 class="card-title">USER SIGN UP</h5>
                        <form>
                            <label for="name" class="form-label">Name:</label>
                            <br />
                            <asp:TextBox class="form-control" type="text" ID="name" runat="server" required="true" ></asp:TextBox>
                            <br />
                            <label for="exampleFormControlInput1" class="form-label" for="name">Email:</label>
                            <br>
                            <asp:TextBox class="form-control" type="email" ID="useremail" runat="server" required="true" ></asp:TextBox>
                            <br>  
                            <label for="phone" class="form-label">Phone:</label>
                            <br />
                            <asp:TextBox type="number" class="form-control" ID="phone" runat="server" required="true"></asp:TextBox>
                            <br />
                            <label for="exampleFormControlInput1" class="form-label" for="name">Password:</label>
                            <br>
                            <asp:TextBox class="form-control" type="password" ID="userpassword" runat="server" required="true"></asp:TextBox>
                            <br>
                            <label for="exampleFormControlInput1" class="form-label" for="cpassword">Confirm Password:</label>
                            <br>
                            <asp:TextBox class="form-control" type="password" ID="confirmPassword" runat="server" required="true"></asp:TextBox>
                            <br>
                            <asp:Button ID="userregister" runat="server" type="submit" class="btn primary px-3 py-2 w-100" Text="Sign Up" OnClick="userregister_Click" />
                            
                            <br>
                            <br>
                            Already have an account? <a class="t-decor" href="login.aspx">Login</a>
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
