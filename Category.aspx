<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="foodblog1.Category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .main-content .article {
            background-color: #f2f2f2;
            padding: 20px;
            margin-bottom: 20px; /* Giữ khoảng cách giữa các bài viết */
            border-radius: 8px; /* Tùy chọn: Bo góc để giao diện đẹp hơn */
            display: flex;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1); /* Thêm bóng đổ nhẹ */
        }
        .main-content .article img {
            width: 150px;
            height: 150px;
            object-fit: cover;
            margin-right: 20px;
            border-radius: 4px; /* Bo góc cho hình ảnh */
        }
        .main-content .article .details {
            flex: 1;
        }
        .main-content .article h2 {
            margin-top: 0;
            color: #009e9e;
        }
        #categoryTitle {
            font-size: 24px;
            margin-bottom: 20px; /* Thêm khoảng cách giữa tiêu đề và bài viết */
        }
    </style>

    <div class="main-content">
        <!-- Tiêu đề sẽ tự động thay đổi -->
        <h2 id="categoryTitle" class="tittle-green" runat="server">Danh mục / </h2>
        <!-- Container cho danh sách bài viết -->
        <div id="articlesContainer" runat="server"></div>
    </div>
</asp:Content>
