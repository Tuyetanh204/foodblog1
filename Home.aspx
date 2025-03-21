<%@ Page Title="Trang chủ" Language="C#" MasterPageFile="~/Site2.Master"  AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="foodblog1.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <style>

    .main-content .left {
      flex: 4;
      margin-right: 20px;
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
  </style>
    <div class="main-content">
        <div class="left">
            <h2 class="tittle-green">CÔNG THỨC PHỔ BIẾN</h2>
            <div id="articlesContainer" runat="server"></div>
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
