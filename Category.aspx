<%@ Page Title="Danh mục" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="foodblog1.Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <link rel="stylesheet" href="navbar.css" />
    <style>
        .main-content {
            margin-top: 70px;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

      .main-content .article {
      background-color: #f2f2f2;
      padding: 20px;
      margin-bottom: 20px;
    }

.search {
    display: flex;
    align-items: center;
    gap: 10px; /* Khoảng cách giữa các phần tử */
    margin-bottom: 20px; /* Khoảng cách với phần bên dưới */
}

.search input[type="text"] {
    padding: 8px;
    font-size: 16px;
}

.search select {
    padding: 8px;
    font-size: 16px;
}
    </style>

    <div class="main-content">
        <div class="search">
<asp:TextBox ID="searchTextBox" runat="server" placeholder="Nhập tiêu đề cần tìm"></asp:TextBox>
<asp:DropDownList ID="categoryDropDown" runat="server">
    <asp:ListItem Text="Tất cả" Value="" />
    <asp:ListItem Text="Món chay" Value="Món chay" />
    <asp:ListItem Text="Tráng miệng" Value="Tráng miệng" />
    <asp:ListItem Text="Món chính" Value="Món chính" />
    <asp:ListItem Text="Ăn vặt" Value="Ăn vặt" />
</asp:DropDownList>
<asp:Button ID="searchButton" runat="server" Text="Tìm kiếm" OnClick="SearchButton_Click" CssClass="aspButton" />
            </div>

        <h2 id="categoryTitle" class="tittle-green" runat="server"></h2>
        <div id="articlesContainer" runat="server"></div>
    </div>
</asp:Content>
