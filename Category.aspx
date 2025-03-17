<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="foodblog1.Category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
 .main-content {
    display: flex;
    flex-wrap: wrap; /* Cho phép các bài viết xuống hàng nếu không đủ chỗ */
    justify-content: center; /* Căn giữa các bài viết */
    gap: 20px; /* Khoảng cách giữa các bài viết */
    margin-top: 70px; /* Tạo khoảng trống dưới thanh điều hướng */
    padding: 20px;
}

.main-content .article {
    flex: 1 1 calc(50% - 20px); /* Chiều rộng 50%, trừ khoảng cách */
    max-width: calc(50% - 20px); /* Đảm bảo không vượt quá 50% */
    background-color: #f2f2f2;
    padding: 20px;
    margin-bottom: 20px;
    display: flex;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Tạo hiệu ứng bóng đổ */
}

.main-content .article img {
    width: 150px;
    height: 150px;
    object-fit: cover; /* Đảm bảo hình ảnh vừa khít */
    margin-right: 20px;
    border-radius: 4px; /* Bo góc cho hình ảnh */
}

.main-content .details h2 {
    color: #008080;
    margin: 0 0 10px 0;
}

.main-content .details p {
    margin: 5px 0;
}

/* Responsive Design: 1 bài viết trên 1 hàng cho màn hình nhỏ */
@media screen and (max-width: 768px) {
    .main-content .article {
        flex: 1 1 100%; /* Chiều rộng 100% khi màn hình nhỏ */
        max-width: 100%;
    }
}
    </style>

    <div class="main-content">
        <h2 id="categoryTitle" class="tittle-green" runat="server"></h2>
        <div id="articlesContainer" runat="server"></div>
    </div>
</asp:Content>

