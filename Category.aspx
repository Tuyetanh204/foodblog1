﻿<%@ Page Title="Danh mục" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="foodblog1.Category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .main-content {
            margin-top: 70px; /* Đồng bộ với navbar từ MasterPage */
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center; /* Nội dung căn giữa */
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
        
<asp:TextBox ID="searchTextBox" runat="server" placeholder="Nhập tiêu đề cần tìm"></asp:TextBox>
<asp:DropDownList ID="categoryDropDown" runat="server">
    <asp:ListItem Text="Tất cả" Value="" />
    <asp:ListItem Text="Món chay" Value="Món chay" />
    <asp:ListItem Text="Tráng miệng" Value="Tráng miệng" />
    <asp:ListItem Text="Món chính" Value="Món chính" />
    <asp:ListItem Text="Ăn vặt" Value="Ăn vặt" />
</asp:DropDownList>
<asp:Button ID="searchButton" runat="server" Text="Tìm kiếm" OnClick="SearchButton_Click" />


        <h2 id="categoryTitle" class="tittle-green" runat="server"></h2>
        <div id="articlesContainer" runat="server"></div>
    </div>
</asp:Content>
