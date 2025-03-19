<%@ Page Title="Chi tiết công thức" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Blog.aspx.cs" Inherits="foodblog1.Blog1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
       <style>
                 body {
        font-family: Arial, sans-serif;
        background-color: #f5f5f5;
        margin: 0;
        padding: 0;
      }
           .container { width: 60%; margin: 0 auto; padding: 30px; background-color: white; border-radius: 8px; margin-top: 80px; }
.upper-section {
  display: flex;
  margin-bottom: 20px;
}
a {
  text-decoration: none;
  color: #009e9e;
}

a:hover {
  text-decoration: underline;
}
.left-side {
  flex: 1;
  padding-right: 20px;
}

.blog-image {
  width: 100%;
  border-radius: 8px;
}

.right-side {
  flex: 2;
}

.right-side h1 {
  color: #009e9e;
  margin-top: 0;
}

.right-side p {
  margin: 5px 0;
}

.lower-section {
  margin-top: 20px;
  line-height: 1.6;
}

.related-posts {
  margin-top: 50px;
}

h3 {
  color: #009e9e;
}

.related-item a {
  text-decoration: none;
  color: #009e9e;
}

.related-item a:hover {
  text-decoration: underline;
}
.ingredient-list {
  list-style-type: disc; /* Chấm tròn */
  margin-left: 20px; /* Thụt vào để căn chỉnh đẹp hơn */
  padding-left: 10px;
}

.ingredient-list li {
  margin-bottom: 5px; /* Tạo khoảng cách giữa các nguyên liệu */
}

    </style>


    <div class="container">
  <!-- Phần nửa trên -->
  <div class="upper-section">
    <div class="left-side">
      <asp:Image ID="blogImage" runat="server" CssClass="blog-image" />
    </div>
    <div class="right-side">
      <h1 id="blogTitle" class="tittle-green" runat="server"></h1>

       <a id="categoryLink" runat="server" href="#">Danh mục mặc định</a>

 <p>&#128100; <!-- Icon người --> <span id="blogAuthor" runat="server"></span></p>
<p>&#128197; <!-- Icon lịch --> <span id="blogDate" runat="server"></span></p>
<p>&#9200; <!-- Icon đồng hồ --> <span id="blogTime" runat="server"></span></p>

    </div>
  </div>

  <!-- Phần nửa dưới -->
  <div class="lower-section">
    <h3>Nguyên liệu</h3>
    <ul id="ingredientList" runat="server" class="ingredient-list"></ul>
    <h3>Các bước nấu</h3>
    <p id="blogContent" runat="server"></p>
</div>


  <!-- Công thức tương tự -->
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
