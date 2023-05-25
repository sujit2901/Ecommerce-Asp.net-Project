<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="E_commmerce.profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-fluid">
        <div class="row">
            <div class="col-sm-3"></div>
            <div class="col-sm-6">
                <div class="card card mb-3 secondary p-4 my-4">

               
                        <label for="name" class="form-label">Name:</label>
                        <br />
                        
                        <asp:TextBox type="text" class="form-control w-100" Id="Prof_Name" runat="server"></asp:TextBox>

                        <br />
                        <label for="email" class="form-label">Email</label>
                        <br />
                        <asp:TextBox runat="server" type="email" class="form-control w-100" Id="Prof_email"></asp:TextBox>

                        <br />
                        <label for="phone" class="form-label">Phone Number:</label>
                        <br />
                        <asp:TextBox runat="server" type="number" class="form-control w-100" Id="Prof_phone"></asp:TextBox>

                        <br />
                        <label for="password" class="form-label">Change Password:</label>
                        <br />
                        <asp:TextBox runat="server" type="password" class="form-control w-100" Id="Profs_password"></asp:TextBox>

                        <br />
                        <div style="text-align: center;">
                            <asp:Button Id="Prof_update" runat="server" type="submit" style="border-radius: 10px;" class="primary px-4 py-2" Text="Update" OnClick="Prof_update_Click" />
                            &nbsp;&nbsp;&nbsp;
                            <asp:Button runat="server" style="border-radius: 10px;" Id="Prof_logout" class="primary px-4 py-2" Text="Logout" OnClick="Prof_logout_Click" />

                        </div>

                
                </div>

            </div>

        </div>
        
    </div>
</asp:Content>
