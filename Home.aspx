<%@ Page Language="C#" MasterPageFile="~/Site2.Master"  AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="foodblog1.Home" %>

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
    .main-content .article h2 {
      margin-top: 0;
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
      background-color: #ddd;
    }
  </style>
    <div class="main-content">
        <div class="left">
            <h2 class="tittle-green">CÔNG THỨC PHỔ BIẾN</h2>
            <div class="article">
                <h2>Bài blog 1</h2>
                <p>Nội dung bài blog 1...</p>
            </div>
            <div class="article">
                <h2>Bài blog 2</h2>
                <p>Nội dung bài blog 2...</p>
            </div>
            <div class="article">
                <h2>Bài blog 3</h2>
                <p>Nội dung bài blog 3...</p>
            </div>
        </div>
        <div class="right">
            <h2 class="tittle-green">DANH MỤC</h2>
            <ul class="category-list">
                <li><a href="mchay.aspx">Món chay</a></li>
                <li><a href="#">Tráng miệng</a></li>
                <li><a href="#">Món chính</a></li>
                <li><a href="#">Ăn vặt</a></li>
            </ul>
        </div>
    </div>
</asp:Content>




