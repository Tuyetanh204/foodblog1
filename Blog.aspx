<%@ Page Title="Chi tiết công thức" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Blog.aspx.cs" Inherits="foodblog1.Blog1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<style>
        .main-content .left {
      flex: 5;
    }
    .main-content .right {
      flex: 1;
    }


    /* Phần danh mục */
    .category-list {
      padding: 0;
      margin: 0;
    }
    .category-list li {
      list-style: none;
      margin: 10px 0;
    }
    .category-list a {
      display: block;
      color: #333;
      padding: 15px;
      background-color: #f5f5f5;
      text-decoration: none;
    }
    .category-list a:hover {
      background-color: #b6e0e0;
    }

    /*Bài blog*/
    .container {
        width: 70%;
        margin: 20px auto;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .upper-section {
        display: flex;
        margin-bottom: 30px;
    }

    .left-side {
        flex: 1;
        padding-right: 20px;
    }

    .blog-image {
        width: 100%;
        max-width: 300px;
        height: auto;
        object-fit: cover;
        border-radius: 8px;
    }

    .right-side {
        flex: 2;
    }

    .right-side p {
        font-size: 14px;
        margin: 8px 0;
        color: #333;
    }

    .lower-section {
        margin-top: 20px;
        line-height: 1.6;
        font-size: 16px;
    }

    h3 {
        color: #009e9e;
        font-size: 20px;
        margin: 20px 0 10px;
    }

    .ingredient-list {
        list-style-type: disc;
        margin-left: 20px;
        padding-left: 10px;
        font-size: 16px;
    }

    .ingredient-list li {
        margin-bottom: 8px;
    }

    .ingredient-list li::marker {
        font-size: 18px;
        color: #009e9e;
    }

    .related-posts {
        margin-top: 40px;
    }

    .save-button.unsave {
        background-color: #e74c3c;
        border: none;
        color: white;
    }

    .save-button.unsave:hover {
        background-color: white;
        color: #e74c3c;
        border: 1px solid #e74c3c;
    }

    /* Responsive */
    @media screen and (max-width: 768px) {
        .container {
            width: 90%;
            padding: 15px;
        }

        .upper-section {
            display: flex;
            margin-bottom: 20px;
        }

        .left-side {
            flex: 1;
            padding-right: 10px;
        }

        .blog-image {
            max-width: 190px;
            width: 100%;
            height: auto;
        }

        .right-side {
            flex: 2;
        }

        .right-side p {
            font-size: 11px;
        }
        .right-side .tittle-green {
            margin: 8px 0; /* Sửa từ .green-tittle thành .tittle-green */
        }
        .lower-section {
            font-size: 13px;
        }

        h3 {
            font-size: 16px;
        }


        .ingredient-list {
            font-size: 13px;
            margin-left: 15px;
        }

        .ingredient-list li::marker {
            font-size: 16px;
        }

        .related-posts {
            margin-top: 10px;
        }
    }

    @media screen and (max-width: 480px) {
        .container {
            width: 95%;
            padding: 10px;
        }

        .upper-section {
            display: flex;
            margin-bottom: 15px;
        }

        .left-side {
            flex: 1;
            padding-right: 8px;
        }

        .blog-image {
            max-width: 90px;
            width: 100%;
            height: auto;
        }

        .right-side {
            flex: 2;
        }

        .right-side p {
            font-size: 10px;
        }

        .lower-section {
            font-size: 12px;
        }

        h3 {
            font-size: 14px;
        }

        .ingredient-list {
            font-size: 12px;
            margin-left: 10px;
        }

        .ingredient-list li::marker {
            font-size: 14px;
        }

        .related-posts {
            margin-top: 20px;
        }
    }
</style>

        <div class="main-content">
                    <div class="left">
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
<div id="blogContent" runat="server"></div>
</div>


  <!-- Công thức tương tự -->
  <div class="related-posts">
    <h3>Công thức tương tự</h3>
          <div id="relatedPostsDiv" runat="server">
        </div>
  </div>
</div>
                        </div>
             <div class="right">
            <h2 class="tittle-green">DANH MỤC</h2>
            <ul class="category-list">
    <li><a href="Category.aspx?category=Món chay">Món chay</a></li>
    <li><a href="Category.aspx?category=Tráng miệng">Tráng miệng</a></li>
    <li><a href="Category.aspx?category=Món chính">Món chính</a></li>
    <li><a href="Category.aspx?category=Ăn vặt">Ăn vặt</a></li>
</ul>
            </div>
            </div>
</asp:Content>
