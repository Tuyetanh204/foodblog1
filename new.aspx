<%@ Page Title="Tạo bài viết mới" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="new.aspx.cs" Inherits="foodblog1._new" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
       body {
        font-family: Arial, sans-serif;
        background-color: #f5f5f5;
        margin: 0;
        padding: 0;
      }
      .container {
        width: 80%;
        margin: 70px auto;
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
        font-weight: bold;
      }
      input[type="text"],
      textarea,
      select,
      input[type="file"] {
        width: 100%;
        padding: 10px;
        margin-top: 5px;
        border: 1px solid #ddd;
        border-radius: 4px;
      }
      .button-group {
        display: flex;
        justify-content: center;
        gap: 10px;
        margin-top: 20px;
      }
      button {
        background-color: #009e9e;
        border: none;
        color: white;
        padding: 10px 20px;
        text-decoration: none;
        display: inline-block;
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
      .ingredients-list {
        margin-top: 10px;
        padding: 0;
      }
      .ingredients-list li {
        list-style-type: none;
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
        transition: background-color 0.3s ease;
      }
      .ingredients-list li button:hover {
        background-color: #c82333;
      }
      @media (max-width: 768px) {
        .form-group input,
        .form-group textarea,
        .form-group select {
          font-size: 12px;
        }
        .form-group button {
          font-size: 14px;
        }
      }
    </style>

    <div class="container">
        <h2 id="pageTitle" class="tittle-green" runat="server">Tạo bài viết mới</h2>
        <asp:Literal ID="litMessage" runat="server"></asp:Literal>
        <label for="title">Tiêu đề:</label>
        <input type="text" id="title" name="title" placeholder="Nhập tiêu đề bài viết" 
               required pattern=".{5,100}" title="Tiêu đề phải từ 5 đến 100 ký tự." />

        <label for="category">Danh mục:</label>
        <select id="category" name="category" required>
          <option value="Món chay">Món chay</option>
          <option value="Tráng miệng">Tráng miệng</option>
          <option value="Món chính">Món chính</option>
          <option value="Ăn vặt">Ăn vặt</option>
        </select>

        <label for="fileImage">Hình ảnh món ăn:</label>
        <asp:FileUpload ID="fileImage" runat="server" />
        <asp:Label ID="lblCurrentImage" runat="server" Visible="false" />

        <label for="time">Thời gian nấu (giờ/phút):</label>
        <input type="text" id="time" name="time" placeholder="VD: 30 phút" 
               required pattern="^\d+\s?(phút|giờ)$" title="Vui lòng nhập thời gian hợp lệ, VD: '30 phút' hoặc '2 giờ'." />

        <label for="txtIngredientCustom">Nguyên liệu:</label>
        <input type="text" id="txtIngredientCustom" placeholder="Nhập từng nguyên liệu một rồi nhấn Enter" 
               pattern=".{2,50}" title="Nguyên liệu phải từ 2 đến 50 ký tự." />
        <asp:HiddenField ID="hdnIngredients" runat="server" />
        <ul id="ingredientList" class="ingredients-list"></ul>

        <label for="txtSteps">Các bước thực hiện:</label>
        <asp:TextBox ID="txtSteps" runat="server" TextMode="MultiLine" placeholder="Nhập chi tiết các bước thực hiện" 
                     required="required" pattern=".{20,1000}" title="Các bước thực hiện phải từ 20 đến 1000 ký tự." />

        <div class="button-group">
            <button type="reset">Làm mới</button>
            <button type="submit">Lưu</button>
        </div>
    </div>

    <script type="text/javascript">
        var ingredientsArr = [];
        <% if (!string.IsNullOrEmpty(ViewState["Ingredients"]?.ToString())) { %>
        ingredientsArr = '<%= ViewState["Ingredients"] %>'.split(', ').filter(item => item.trim() !== '');
        <% } %>

        document.getElementById("txtIngredientCustom").addEventListener("keypress", function (e) {
            if (e.key === "Enter") {
                e.preventDefault();
                var ing = this.value.trim();
                if (ing !== "" && ing.length >= 2 && ing.length <= 50) {
                    ingredientsArr.push(ing);
                    this.value = "";
                    updateIngredientDisplay();
                } else {
                    alert("Nguyên liệu phải từ 2 đến 50 ký tự.");
                }
            }
        });

        function updateIngredientDisplay() {
            var ul = document.getElementById("ingredientList");
            ul.innerHTML = "";
            for (var i = 0; i < ingredientsArr.length; i++) {
                var li = document.createElement("li");
                li.textContent = ingredientsArr[i];
                var btn = document.createElement("button");
                btn.textContent = " x";
                btn.addEventListener("click", (function (index) {
                    return function () {
                        removeIngredient(index);
                    }
                })(i));
                li.appendChild(btn);
                ul.appendChild(li);
            }
            document.getElementById("<%= hdnIngredients.ClientID %>").value = ingredientsArr.join(", ");
        }

        function removeIngredient(index) {
            ingredientsArr.splice(index, 1);
            updateIngredientDisplay();
        }

        window.onload = function () {
            updateIngredientDisplay();
        };
    </script>
</asp:Content>