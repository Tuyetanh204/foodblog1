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
        button, .aspButton {
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
        button:hover, .aspButton:hover {
            background-color: white;
            color: #009e9e;
            border: 1px solid #009e9e;
        }
        .tab-button {
            background-color: #009e9e;
            border: none;
            color: white;
            padding: 10px 20px;
            cursor: pointer;
        }
        .tab-button.active {
            background-color: #007c7c;
        }
        .tab-button:hover {
            background-color: white;
            color: #009e9e;
            border: 1px solid #009e9e;
        }
    </style>
    <h2 id="title" class="tittle-green" style="text-align: center; margin-top: 40px">QUẢN LÍ BÀI VIẾT</h2>
    <asp:Button ID="btnCreateLi" runat="server" CssClass="tab-button active" Text="Bài viết đã tạo" OnClientClick="setActive(this); return true;" OnClick="btnCreateLi_Click" />
    <asp:Button ID="btnSaveLi" runat="server" CssClass="tab-button" Text="Bài viết đã lưu" OnClientClick="setActive(this); return true;" OnClick="btnSaveLi_Click" />
    <asp:GridView ID="gvBlogs" runat="server" AutoGenerateColumns="false" CssClass="table" OnRowCommand="gvBlogs_RowCommand">
        <Columns>
            <asp:TemplateField HeaderText="STT">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1 %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="title" HeaderText="Tiêu đề" />
            <asp:BoundField DataField="category" HeaderText="Danh mục" />
            <asp:TemplateField HeaderText="Thao tác">
                <ItemTemplate>
                    <asp:Button runat="server" CssClass="aspButton" Text="Sửa" PostBackUrl='<%# "Edit.aspx?BlogId=" + Eval("id") %>' Visible='<%# activeButton == "created" %>' />
                    <asp:Button runat="server" CssClass="aspButton" Text="Xóa" CommandName="DeleteBlog" CommandArgument='<%# Eval("id") %>' Visible='<%# activeButton == "created" %>' />
                    <asp:Button runat="server" CssClass="aspButton" Text="Bỏ lưu" CommandName="RemoveFromSaved" CommandArgument='<%# Eval("id") %>' Visible='<%# activeButton == "saved" %>' />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <script>
        function setActive(button) {
            var buttons = document.getElementsByClassName("tab-button");
            for (var i = 0; i < buttons.length; i++) {
                buttons[i].classList.remove("active");
            }
            button.classList.add("active");
        }
    </script>
</asp:Content>