<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="foodblog1.register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
      body {
        font-family: Arial, sans-serif;
        background-color: #f5f5f5;
        margin: 0;
        padding: 0;
      }
      .container {
        width: 40%;
        margin: 0 auto;
        padding: 20px;
        background-color: white;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        margin-top: 70px;
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
      input[type="email"],
      input[type="password"],
      button {
        width: 100%;
        padding: 10px;
        margin-top: 5px;
        border: 1px solid #ddd;
        border-radius: 4px;
        box-sizing: border-box; /* Đảm bảo padding không ảnh hưởng đến chiều rộng tổng */
      }
      button {
        background-color: #009e9e;
        border: none;
        color: white;
        font-size: 16px;
        margin-top: 20px;
        cursor: pointer;
      }
      button:hover {
        background-color: white;
        color: #009e9e;
        border: 1px solid #009e9e;
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
    </style>
    <div class="container">
      <h2 class="tittle-green">ĐĂNG KÝ</h2>
      <form id="registerForm">
        <label for="username">Họ và tên:</label>
        <input type="text" id="fname" name="fname" required />

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required />

          <label for="phone">Số điện thoại:</label>
        <input type="text" id="phone" name="phone" required />

                <label for="username">Tên đăng nhập:</label>
        <input type="text" id="username" name="username" required />

        <label for="password">Mật khẩu:</label>
        <input type="password" id="password" name="password" required />

        <label for="confirm-password">Xác nhận mật khẩu:</label>
        <input
          type="password"
          id="confirm-password"
          name="confirm-password"
          required
        />
        <button type="submit">Đăng Ký</button>
      </form>
      <div class="login-link">
        Đã có tài khoản? <a href="login.aspx">Đăng nhập ngay</a>
      </div>
    </div>
</asp:Content>