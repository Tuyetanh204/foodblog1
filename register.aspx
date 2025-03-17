<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="foodblog1.register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
            font-weight: bold;
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
            box-sizing: border-box;
        }
        button {
            background-color: #009e9e;
            border: none;
            color: white;
            font-size: 16px;
            margin-top: 20px;
            cursor: pointer;
            border-radius: 4px;
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
        <h2>Đăng Ký</h2>
            <label for="fname">Họ và tên:</label>
            <input type="text" id="fname" name="fname" placeholder="Nhập họ và tên" 
                   required pattern="^[a-zA-Z\s]+$" 
                   title="Họ và tên chỉ được chứa chữ cái và khoảng trắng." />

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" placeholder="Nhập địa chỉ email" 
                   required pattern="^\S+@\S+\.\S+$" 
                   title="Vui lòng nhập địa chỉ email hợp lệ, ví dụ: example@domain.com." />

            <label for="phone">Số điện thoại:</label>
            <input type="text" id="phone" name="phone" placeholder="Nhập số điện thoại" 
                   required pattern="^\d{10,11}$" 
                   title="Số điện thoại phải là 10 hoặc 11 chữ số." />

            <label for="username">Tên đăng nhập:</label>
            <input type="text" id="username" name="username" placeholder="Nhập tên đăng nhập" 
                   required pattern="^\w{4,20}$" 
                   title="Tên đăng nhập phải từ 4-20 ký tự và không chứa ký tự đặc biệt." />

            <label for="password">Mật khẩu:</label>
            <input type="password" id="password" name="password" placeholder="Nhập mật khẩu" 
                   required pattern="^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$" 
                   title="Mật khẩu phải có ít nhất 8 ký tự, bao gồm chữ hoa, chữ số và ký tự đặc biệt." />

            <label for="confirm-password">Xác nhận mật khẩu:</label>
            <input type="password" id="confirm-password" name="confirm-password" placeholder="Nhập lại mật khẩu" 
                   required oninput="validatePassword()" />

            <div id="errorMessage" style="color: red; margin-top: 10px;"></div>
            <button ttype="submit" value="submit">Đăng Ký</button>
        <div class="login-link">
            Đã có tài khoản? <a href="login.aspx">Đăng nhập ngay</a>
        </div>
    </div>

    <script>
        function validatePassword() {
            const password = document.getElementById("password").value;
            const confirmPassword = document.getElementById("confirm-password").value;
            const errorMessage = document.getElementById("errorMessage");

            if (password !== confirmPassword) {
                errorMessage.textContent = "Mật khẩu xác nhận không khớp.";
            } else {
                errorMessage.textContent = "";
            }
        }
    </script>
</asp:Content>
