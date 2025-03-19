<%@ Page Title="Đăng ký" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="new.aspx.cs" Inherits="foodblog1._new" %>
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
    display: flex; /* Sử dụng flexbox để điều chỉnh */
    justify-content: center; /* Căn giữa theo chiều ngang */
    gap: 10px; /* Khoảng cách giữa các nút */
    margin-top: 20px; /* Khoảng cách từ nút đến các phần trên */
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
        /* Danh sách nguyên liệu */
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
        /* Responsive cho thiết bị nhỏ */
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
            <h2 class="tittle-green">Tạo bài viết mới</h2>
            <asp:Literal ID="litMessage" runat="server"></asp:Literal>
            <!-- Tiêu đề -->
                <form id="createForm" runat="server" method="post">
                <label for="title">Tiêu đề:</label>
                <input type="text" id="title" name="title" placeholder="Nhập tiêu đề bài viết" required/>

            <!-- Danh mục -->
                <label for="category">Danh mục:</label>
        <select id="category" name="category" required>
          <option value="Món chay">Món chay</option>
          <option value="Tráng miệng">Tráng miệng</option>
          <option value="Món chính">Món chính</option>
          <option value="Ăn vặt">Ăn vặt</option>
        </select>
            <!-- Hình ảnh -->

                <label for="fileImage">Hình ảnh món ăn:</label>
                <asp:FileUpload ID="fileImage" runat="server" />

            <!-- Thời gian nấu -->

                <label for="time">Thời gian nấu (giờ/phút):</label>
                    <input type="text" id="time" name="time" placeholder="VD: 30 phút" required/>

            <!-- Nguyên liệu: Sử dụng input HTML và hidden field -->

                <label for="txtIngredientCustom">Nguyên liệu:</label>
                <!-- Input HTML thuần -->
                <input type="text" id="txtIngredientCustom" placeholder="Nhập nguyên liệu và nhấn Enter" />
                <!-- HiddenField để lưu danh sách nguyên liệu dưới dạng chuỗi -->
                <asp:HiddenField ID="hdnIngredients" runat="server" />
                <!-- Danh sách nguyên liệu hiển thị -->
                <ul id="ingredientList" class="ingredients-list"></ul>


            <!-- Các bước thực hiện -->

                <label for="txtSteps">Các bước thực hiện:</label>
                <asp:TextBox ID="txtSteps" runat="server" TextMode="MultiLine" placeholder="Nhập chi tiết các bước thực hiện" />

            <!-- Nút -->
                    <div class="button-group">
                        <button type="reset">Làm mới</button>
                        <button type="submit">Lưu</button>
                    </div>

    </form>
    </div>

    <script type="text/javascript">
        // Mảng lưu trữ nguyên liệu bên phía client
        var ingredientsArr = [];

        // Gắn sự kiện khi nhấn Enter trong input nguyên liệu
        document.getElementById("txtIngredientCustom").addEventListener("keypress", function (e) {
            if (e.key === "Enter") {
                e.preventDefault();
                var ing = this.value.trim();
                if (ing !== "") {
                    ingredientsArr.push(ing);
                    this.value = "";
                    updateIngredientDisplay();
                }
            }
        });

        // Cập nhật danh sách nguyên liệu hiển thị trên giao diện và hidden field
        function updateIngredientDisplay() {
            var ul = document.getElementById("ingredientList");
            ul.innerHTML = "";
            for (var i = 0; i < ingredientsArr.length; i++) {
                var li = document.createElement("li");
                li.textContent = ingredientsArr[i];

                // Tạo nút xóa
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
            // Cập nhật giá trị của hidden field; sử dụng dấu phẩy làm delimiter
            var hdn = document.getElementById("<%= hdnIngredients.ClientID %>");
            hdn.value = ingredientsArr.join(",");
        }

        // Hàm xóa 1 nguyên liệu khỏi mảng và cập nhật lại giao diện
        function removeIngredient(index) {
            ingredientsArr.splice(index, 1);
            updateIngredientDisplay();
        }
    </script>
</asp:Content>
