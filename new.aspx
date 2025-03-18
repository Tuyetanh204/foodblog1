<%@ Page Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="new.aspx.cs" Inherits="foodblog1._new" %>
<%@ Import Namespace="foodblog1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Vì MasterPage của bạn đã có ScriptManager nên không cần thêm ở đây nếu đã có -->
    <style>
        /* Tổng thể, căn giữa nội dung */
        .main-content {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
        }
        /* Kiểu dáng của khung form */
        .article {
            background-color: #f2f2f2;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 5px;
        }
        .article h2 {
            margin-top: 0;
            font-size: 24px;
            color: #009e9e;
        }
        /* Các nhóm form, nhập liệu */
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
            font-size: 14px;
            color: #333;
        }
        .form-group input[type="text"],
        .form-group input[type="file"],
        .form-group textarea,
        .form-group select {
            width: 100%;
            padding: 10px 12px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .form-group textarea {
            resize: vertical;
            height: 80px;
        }
        /* Nút đăng bài */
        .form-group button {
            width: 100%;
            padding: 10px;
            background-color: #009e9e;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .form-group button:hover {
            background-color: #007b7b;
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

    <div class="main-content">
        <div class="article">
            <h2>Tạo bài viết mới</h2>
            <asp:Literal ID="litMessage" runat="server"></asp:Literal>

            <!-- Tiêu đề -->
            <div class="form-group">
                <label for="txtTitle">Tiêu đề:</label>
                <asp:TextBox ID="txtTitle" runat="server" placeholder="Nhập tiêu đề bài viết" />
            </div>

            <!-- Danh mục -->
            <div class="form-group">
                <label for="ddlCategory">Danh mục:</label>
                <asp:DropDownList ID="ddlCategory" runat="server">
                    <asp:ListItem Text="Chọn danh mục" Value="" />
                    <asp:ListItem Text="Tráng miệng" Value="Tráng miệng" />
                    <asp:ListItem Text="Món chính" Value="Món chính" />
                    <asp:ListItem Text="Món chay" Value="Món chay" />
                    <asp:ListItem Text="Ăn vặt" Value="Ăn vặt" />
                </asp:DropDownList>
            </div>

            <!-- Hình ảnh -->
            <div class="form-group">
                <label for="fileImage">Hình ảnh bài viết:</label>
                <asp:FileUpload ID="fileImage" runat="server" />
            </div>

            <!-- Thời gian nấu -->
            <div class="form-group">
                <label for="txtTime">Thời gian nấu (phút):</label>
                <asp:TextBox ID="txtTime" runat="server" placeholder="VD: 30" />
            </div>

            <!-- Nguyên liệu: Sử dụng input HTML và hidden field -->
            <div class="form-group">
                <label for="txtIngredientCustom">Nguyên liệu:</label>
                <!-- Input HTML thuần -->
                <input type="text" id="txtIngredientCustom" placeholder="Nhập nguyên liệu và nhấn Enter" />
                <!-- HiddenField để lưu danh sách nguyên liệu dưới dạng chuỗi -->
                <asp:HiddenField ID="hdnIngredients" runat="server" />
                <!-- Danh sách nguyên liệu hiển thị -->
                <ul id="ingredientList" class="ingredients-list"></ul>
            </div>

            <!-- Các bước thực hiện -->
            <div class="form-group">
                <label for="txtSteps">Các bước thực hiện:</label>
                <asp:TextBox ID="txtSteps" runat="server" TextMode="MultiLine" placeholder="Nhập chi tiết các bước thực hiện" />
            </div>

            <!-- Nút đăng bài -->
            <div class="form-group">
                <asp:Button ID="btnSubmit" runat="server" Text="Đăng bài" OnClick="btnSubmit_Click" />
            </div>
        </div>
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
