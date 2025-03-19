<%@ Page Title="Chi tiết công thức" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Blog.aspx.cs" Inherits="foodblog1.Blog1" %>
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
        margin: 0 auto;
        padding: 20px;
        background-color: white;
        border-radius: 8px;
        margin-top: 50px;
      }
      h2 {
        text-align: center;
        color: #009e9e;
      }
      .post-meta {
        font-size: 14px;
        color: #666;
        margin-bottom: 20px;
      }
      .post-meta a {
        color: #78aeae;
        text-decoration: none;
      }
      .post-meta a:hover {
        text-decoration: underline;
      }
      .post-content {
        line-height: 1.6;
      }
      .post-content img {
        width: 100%;
        height: auto;
        border-radius: 8px;
        margin-top: 20px;
      }
      .related-posts {
        margin-top: 50px;
      }
      .related-posts h3 {
        color: #009e9e;
      }
      .related-posts .related-item {
        margin-bottom: 20px;
      }
      .related-item a {
        text-decoration: none;
        color: #009e9e;
      }
      .related-item a:hover {
        text-decoration: underline;
      }
    </style>




    <div class="container">
      <h1 id="blogTitle" class="tittle-green" runat="server"></h1>
      <div class="post-meta">
        <p id="blogAuthor" runat="server">Tác giả: Tên người tạo</p>
        <p id="blogDate" runat="server">Ngày tạo: 8/8/2024</p>
        <p id="blogCategory" runat="server">Danh mục: <a href="Category.aspx?category=Tráng miệng">Tráng miệng</a></p>
      </div>
      <div class="post-content">
        <asp:Image ID="blogImage" runat="server" />
        <p>Nguyên liệu cần chuẩn bị: baking soda, muối, bột mì, trứng, nho khô</p>
        <p id="blogContent" runat="server"></p>
      </div>
      <div class="related-posts">
        <h3>Công thức tương tự</h3>
        <div class="related-item">
          <a href="related1.html">Tiêu đề bài viết liên quan 1</a>
        </div>
        <div class="related-item">
          <a href="related2.html">Tiêu đề bài viết liên quan 2</a>
        </div>
        <div class="related-item">
          <a href="related3.html">Tiêu đề bài viết liên quan 3</a>
        </div>
      </div>
    </div>


</asp:Content>
