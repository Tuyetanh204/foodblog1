<%@ Page Title="Trang chủ" Language="C#" MasterPageFile="~/Site2.Master"  AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="foodblog1.Home" %>
<%@ Import Namespace="foodblog1"%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <style>

    .main-content .left {
      flex: 4;
      margin-right: 20px;
    }
    .main-content .right {
      flex: 1;
    }
    .main-content .article {
      background-color: #f2f2f2;
      padding: 20px;
      margin-bottom: 20px;
    }

.main-content .article {
            background-color: #f2f2f2;
            padding: 20px;
            margin-bottom: 20px;
            display: flex;
        }
        .main-content .article img {
            width: 150px;
            height: 150px;
            object-fit: cover;
            margin-right: 20px;
        }
        .main-content .article .details {
            flex: 1;
        }
        .main-content .article h2 {
            margin-top: 0;
            color: #009e9e;
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

    /*Nhấn vào mỗi bài viết*/
    .article-link {
    text-decoration: none;
    color: inherit;
    display: block;
}
.article-link:hover .article {
    background-color: #b6e0e0; /* Hiệu ứng hover khi di chuột vào */
}
  </style>
    <div class="main-content">
        <div class="left">
            <h2 class="tittle-green">CÔNG THỨC PHỔ BIẾN</h2>
      <% 
    // Lấy danh sách blog từ Application
    var blogList = (List<Blog>)Application["BlogList"];
    if (blogList != null)
    {
        foreach (var blog in blogList)
        {
%>
<a href="Blog.aspx?BlogId=<%= blog.id %>" class="article-link">
    <div class="article">
        <img src="<%= blog.img %>" alt="<%= blog.title %>" />
        <div class="details">
            <h2><%= blog.title %></h2>
            <p><strong>Danh mục:</strong> <%= blog.category %></p>
            <p><strong>Thời gian nấu:</strong> <%= blog.time %></p>
            <p><strong>Nguyên liệu:</strong> <% 
                var summary = blog.ingredient.Length > 70 ? blog.ingredient.Substring(0, 70) + "..." : blog.ingredient;
                Response.Write(summary); 
            %></p>
            <p><strong>Tác giả:</strong> <%= blog.author %></p>
        </div>
    </div>
</a>
<% 
        }
        
    }
%>

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
