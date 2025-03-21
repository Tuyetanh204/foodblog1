<%@ Page Title="Đăng nhập" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="foodblog1.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
      body {
        background-color: #f5f5f5;
      }
      .container {
        width: 40%;
        margin: 150px auto;
        padding: 20px;
        background-color: white;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
      }
      h2 {
        text-align: center;
        color: #009e9e;
      }
      label {
        display: block;
        margin-top: 10px;
      }
      input[type="text"],
           button {
        width: 100%;
        padding: 10px;
        margin-top: 5px;
        border: 1px solid #ddd;
        border-radius: 4px;
        box-sizing: border-box; /* Đảm bảo padding không ảnh hưởng đến chiều rộng tổng */
      }

      .login-link {
        text-align: center;
        margin-top: 20px;
      }
      .login-link a {
        color: #009e9e;
        text-decoration: none;
      }
      .login-link a:hover {
        text-decoration: underline;
      }
      .checkbox-container {
    display: flex;
    align-items: center; /* Căn giữa checkbox và chữ theo chiều dọc */
    margin-top: 10px;
}

.checkbox-container input[type="checkbox"] {
    margin-right: 5px; /* Khoảng cách giữa checkbox và chữ */
}

    </style>
        <div class="container">
            <h2 class="tittle-green">ĐĂNG NHẬP</h2>
         <label>Tên đăng nhập:</label>
        <input type="text" id="username" name="username" runat="server" required />

        <label>Mật khẩu:</label>
        <input type="text" id="password" name="password" runat="server" required />

<div class="checkbox-container">
    <asp:CheckBox ID="chkRememberMe" runat="server" Text="Ghi nhớ đăng nhập" />
</div>


        <button type="submit" value="submit" >Đăng Nhập</button>
      <div class="login-link">
        Chưa có tài khoản? <a href="register.aspx">Đăng ký ngay</a>
        </div>
    </div>
</asp:Content>
