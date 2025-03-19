<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="foodblog1.Manage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        table {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
        }
        th, td {
            border-bottom: 1px solid #ddd;
            padding: 20px 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        button {
            background-color: #009e9e;
            border: 1px solid #009e9e;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
        }
        button:hover {
            background-color: white;
            color: #009e9e;
            border: 1px solid #009e9e;
        }
        .tab-button {
    background-color: #009e9e;
    border: none;
    color: white;
    padding: 10px 20px;
    cursor: pointer;
}

.tab-button.active {
    background-color: #007c7c; /* Màu đậm hơn cho trạng thái active */
}

.tab-button:hover {
    background-color: white;
    color: #009e9e;
    border: 1px solid #009e9e;
}

    </style>
    <h2 id="title" class="tittle-green" style="text-align: center; margin-top: 40px">QUẢN LÍ BÀI VIẾT</h2>
    <button id="btnCreateLi" class="tab-button active" onclick="setActive(this)">Bài viết đã tạo</button>
<button id="btnSaveLi" class="tab-button" onclick="setActive(this)">Bài viết đã lưu</button>
    <table>
        <thead>
            <tr>
                <th>STT</th>
                <th>Tiêu đề</th>
                <th>Danh mục</th>
                <th>Thao tác</th>
            </tr>
        </thead>
        <tbody id="blogsContainer" runat="server">
            <%= htmlContent %>
        </tbody>
    </table>t>
    <script>
        function setActive(button) {
            // Xóa lớp "active" khỏi tất cả các nút
            var buttons = document.getElementsByClassName("tab-button");
            for (var i = 0; i < buttons.length; i++) {
                buttons[i].classList.remove("active");
            }

            // Thêm lớp "active" cho nút được click
            button.classList.add("active");
        }
    </script>

</asp:Content>
