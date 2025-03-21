<%@ Page Title="Thao tác với bài viết" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="new.aspx.cs" Inherits="foodblog1._new" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .container {
            width: 80%;
            margin: 70px auto;
            border-radius: 8px;
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

        input[type="text"], textarea, select, input[type="file"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .button-group {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 20px;
        }

        .ingredients-list {
            margin-top: 10px;
            padding: 0;
        }

        .ingredients-list li {
            list-style: none;
            background-color: #f5f5f5;
            border: 1px solid #ccc;
            padding: 8px;
            margin-bottom: 5px;
            border-radius: 5px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 14px;
        }

        .ingredients-list li button {
            background-color: #dc3545;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 12px;
        }

        .ingredients-list li button:hover {
            background-color: #c82333;
        }

        @media (max-width: 768px) {
            input[type="text"], textarea, select {
                font-size: 12px;
            }
            .button-group button {
                font-size: 14px;
            }
        }
    </style>

    <div class="container">
        <h2 id="pageTitle" class="tittle-green" runat="server">Tạo bài viết mới</h2>
        <asp:Literal ID="litMessage" runat="server" />
        <label for="title">Tiêu đề:</label>
        <input type="text" id="title" name="title" placeholder="Nhập tiêu đề bài viết" required />

        <label for="category">Danh mục:</label>
        <select id="category" name="category" required>
            <option value="Món chay">Món chay</option>
            <option value="Tráng miệng">Tráng miệng</option>
            <option value="Món chính">Món chính</option>
            <option value="Ăn vặt">Ăn vặt</option>
        </select>

        <label for="fileImage">Hình ảnh món ăn:</label>
        <asp:FileUpload ID="fileImage" runat="server" CssClass="form-control" />
        <asp:Label ID="lblCurrentImage" runat="server" Visible="false" />

        <label for="time">Thời gian nấu (giờ/phút):</label>
        <input type="text" id="time" name="time" placeholder="VD: 30 phút" required />

        <label for="txtIngredientCustom">Nguyên liệu:</label>
        <input type="text" id="txtIngredientCustom" placeholder="Nhập từng nguyên liệu một rồi nhấn Enter" />
        <asp:HiddenField ID="hdnIngredients" runat="server" />
        <ul id="ingredientList" class="ingredients-list" data-ingredients="<%= ViewState["Ingredients"]?.ToString() ?? "" %>"></ul>

        <label for="<%= txtSteps.ClientID %>">Các bước thực hiện:</label>
        <asp:TextBox ID="txtSteps" runat="server" TextMode="MultiLine" CssClass="form-control" 
                     placeholder="Nhập chi tiết các bước thực hiện" required />

        <div class="button-group">
            <button type="reset" class="aspButton">Làm mới</button>
            <button type="submit" class="aspButton">Lưu</button>
        </div>
    </div>

    <script type="text/javascript">
        const ingredientInput = document.getElementById("txtIngredientCustom");
        const ingredientList = document.getElementById("ingredientList");
        const hiddenField = document.getElementById("<%= hdnIngredients.ClientID %>");
        let ingredients = ingredientList.dataset.ingredients.split(", ").filter(i => i);

        function updateDisplay() {
            ingredientList.innerHTML = ingredients.map((item, i) => `
                <li>${item} <button onclick="removeIngredient(${i})">x</button></li>
            `).join("");
            hiddenField.value = ingredients.join(", ");
        }

        function removeIngredient(index) {
            ingredients.splice(index, 1);
            updateDisplay();
        }

        ingredientInput.addEventListener("keypress", (e) => {
            if (e.key === "Enter") {
                e.preventDefault();
                const value = ingredientInput.value.trim();
                if (value.length >= 2 && value.length <= 50) {
                    ingredients.push(value);
                    ingredientInput.value = "";
                    updateDisplay();
                } else {
                    alert("Nguyên liệu phải từ 2 đến 50 ký tự.");
                }
            }
        });

        window.onload = updateDisplay;
    </script>
</asp:Content>