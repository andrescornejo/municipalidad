<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addUsersFromAdmin.aspx.cs" Inherits="Muni.Pages.addUsersFromAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Agregar usuarios</title>
</head>
<body style="background-color:#2c3d63">
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="backBtn" runat="server" Text="Back" Width="200px" BorderWidth="0px" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="40px" ForeColor="White" style="margin-top:5px ;background-color:#ff6f5e" OnClick="backBtn_Click"/>
        </div>
        <div style="text-align:center">
            <asp:Label ID="catergoryLbl" runat="server" Font-Names="Bahnschrift" Font-Size="75px" ForeColor="White" Text="Agregar un usuario"></asp:Label>       
        </div>
        <div style="text-align:center">
            <asp:Label ID="userLabel" runat="server" Font-Names="Bahnschrift" Font-Size="35px" ForeColor="White" Text="Nombre de usuario"></asp:Label>
            <br/>
            <asp:TextBox ID="usernameTxtBox" runat="server" style="margin-top:10px;margin-bottom:10px" Font-Names="Bahnschrift" Width="250px" Font-Size="30px"></asp:TextBox>
            <br/>
            <asp:Label ID="passwdLabel" runat="server" Font-Names="Bahnschrift" Font-Size="35px" ForeColor="White" Text="Contraseña"></asp:Label>
            <br/>
            <asp:TextBox ID="passwdTxtBox" runat="server" style="margin-top:10px;margin-bottom:10px" Font-Names="Bahnschrift" Width="250px" Font-Size="30px"></asp:TextBox>
            <br/>
            <asp:Label ID="isAdminLabel" runat="server" Font-Names="Bahnschrift" Font-Size="35px" ForeColor="White" Text="Administrador"></asp:Label>
            <br/>
            <asp:CheckBox ID="isAdminCheckbox" runat="server" Text=" " TextAlign="Left"/>
            <br/>
        </div>
        <div style="text-align:center">
            <asp:Button ID="addUserBtn" runat="server" Text="Agregar usuario" Width="500px" BorderWidth="0px" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="40px" ForeColor="White" style="margin-top:10px ;background-color:#addcca" OnClick="addUserBtn_Click"/>
        </div>
    </form>
</body>
</html>
