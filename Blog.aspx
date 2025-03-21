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
        width: 60%;
        margin: 80px auto 0;
        padding: 30px;
        background-color: white;
        border-radius: 8px;
    }
.upper-section {
  display: flex;
  margin-bottom: 50px;
}
.left-side {
  flex: 1;
  padding-right: 20px;
}

.blog-image {
  width: 300px;
  height: 250px;
  object-fit: cover;
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

.ingredient-list {
  list-style-type: disc; /* Chấm tròn */
  margin-left: 20px; /* Thụt vào để căn chỉnh đẹp hơn */
  padding-left: 10px;
}

.ingredient-list li {
  margin-bottom: 2px; /* Tạo khoảng cách giữa các nguyên liệu */
}
.ingredient-list li::marker {
  font-size: 20px; /* Tăng kích thước chấm tròn */
  color: #009e9e; /* Đổi màu chấm tròn */
}
/* Nút Lưu - màu xanh */
.save-button.save {
    background-color: #009e9e; /* Màu nền xanh */
    border: none;
    color: white; /* Màu chữ trắng */
    font-size: 16px;
    margin-top: 20px;
    cursor: pointer;
    padding: 10px 20px;
    border-radius: 5px;
}

.save-button.save:hover {
    background-color: white; /* Đổi màu nền khi hover */
    color: #009e9e; /* Màu chữ xanh */
    border: 1px solid #009e9e;
}

/* Nút Bỏ Lưu - màu đỏ */
.save-button.unsave {
    background-color: #e74c3c; /* Màu nền đỏ */
    border: none;
    color: white; /* Màu chữ trắng */
    font-size: 16px;
    margin-top: 20px;
    cursor: pointer;
    padding: 10px 20px;
    border-radius: 5px;
}

.save-button.unsave:hover {
    background-color: white; /* Đổi màu nền khi hover */
    color: #e74c3c; /* Màu chữ đỏ */
    border: 1px solid #e74c3c;
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
       <a class="greenlink" id="categoryLink" runat="server" href="#">Danh mục mặc định</a>

 <p>&#128100; <!-- Icon người --> <span id="blogAuthor" runat="server"></span></p>
<p>&#128197; <!-- Icon lịch --> <span id="blogDate" runat="server"></span></p>
<p>&#9200; <!-- Icon đồng hồ --> <span id="blogTime" runat="server"></span></p>

        <asp:Button ID="btnSave" runat="server" Text="Lưu" OnClick="ToggleSaveStatus" Visible="false" CssClass="save-button" />

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
      <a class="greenlink" href="related1.html">Tiêu đề bài viết liên quan 1</a>
    </div>
    <div class="related-item">
      <a class="greenlink" href="related2.html">Tiêu đề bài viết liên quan 2</a>
    </div>
    <div class="related-item">
      <a class="greenlink" href="related3.html">Tiêu đề bài viết liên quan 3</a>
    </div>
  </div>
</div>
</asp:Content>
