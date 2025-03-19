<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="foodblog1.Manage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        table {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
        }
        th, td {
            border-bottom: 1px solid #ddd;
            padding: 20px 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        button {
            background-color: #009e9e;
            border: 1px solid #009e9e;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
        }
        button:hover {
            background-color: white;
            color: #009e9e;
            border: 1px solid #009e9e;
        }
        .active {
            background-color: #007c7c;
            color: white;
        }
    </style>
    <h2 id="title" class="tittle-green" style="text-align: center; margin-top: 40px">QUẢN LÍ BÀI VIẾT</h2>
    <button id="btnCreateLi" runat="server" CssClass="<%= activeButton == "created" ? "active" : "" %>">Bài viết đã tạo</button>
    <button id="btnSaveLi" runat="server" CssClass="<%= activeButton == "saved" ? "active" : "" %>">Bài viết đã lưu</button>
    <table>
        <thead>
            <tr>
                <th>STT</th>
                <th>Tiêu đề</th>
                <th>Danh mục</th>
                <th>Thao tác</th>
            </tr>
        </thead>
        <tbody id="blogsContainer" runat="server">
            <%= htmlContent %>
        </tbody>
    </table>
</asp:Content>
