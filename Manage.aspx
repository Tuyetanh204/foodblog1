<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="foodblog1.Manage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .gridview {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
            border: none;
        }
        .gridview th, .gridview td {
            border: none;
            border-bottom: 1px solid #ddd;
            padding: 20px 8px;
            text-align: left;
            font-size: 16px;
        }
        .gridview th:nth-child(1), .gridview td:nth-child(1) { width: 9%; min-width: 50px; }
        .gridview th:nth-child(2), .gridview td:nth-child(2) { width: 50%; min-width: 200px; }
        .gridview th:nth-child(3), .gridview td:nth-child(3) { width: 21%; min-width: 100px; }
        .gridview th:nth-child(4), .gridview td:nth-child(4) { width: 20%; min-width: 150px; }
        .gridview th { background-color: #f2f2f2; }
        .gridview tr:last-child td { border-bottom: none; }
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
            margin: 20px 20px;
            cursor: pointer;
            font-size: 16px;
        }
        .tab-button.active {
            background-color: white !important;
            color: #009e9e !important;
            border: 1px solid #009e9e !important;
        }
        h2.tittle-green {
            color: #008080;
            text-align: center;
            margin: 90px 0 20px 0;
            font-size: 28px;
        }
        .tab-container {
            display: flex;
            justify-content: flex-start;
            margin-left: 70px;
            margin-bottom: 20px;
        }
        @media screen and (max-width: 768px) {
            h2.tittle-green { font-size: 20px; margin-top: 20px; }
            .tab-container { justify-content: center; margin-left: 0; flex-wrap: wrap; }
            .tab-button { padding: 8px 12px; font-size: 12px; margin: 5px; }
            .gridview { width: 100%; overflow-x: auto; display: block; }
            .gridview table { min-width: 600px; }
            .gridview th, .gridview td { padding: 10px 5px; font-size: 12px; }
            .aspButton { padding: 6px 10px; font-size: 12px; }
        }
        @media screen and (max-width: 480px) {
            h2.tittle-green { font-size: 18px; }
            .tab-button { padding: 6px 10px; font-size: 11px; }
            .gridview th, .gridview td { padding: 8px 3px; font-size: 11px; }
            .aspButton { padding: 5px 8px; font-size: 11px; }
        }
    </style>

    <h2 id="title" class="tittle-green">QUẢN LÍ BÀI VIẾT</h2>
    <asp:Button ID="btnCreateLi" style="margin-left: 70px" runat="server" CssClass="tab-button" Text="Bài viết đã tạo" OnClientClick="setActive(this); return true;" OnClick="btnCreateLi_Click" />
    <asp:Button ID="btnSaveLi" style="margin-left: 10px" runat="server" CssClass="tab-button" Text="Bài viết đã lưu" OnClientClick="setActive(this); return true;" OnClick="btnSaveLi_Click" />
    <asp:GridView ID="gvBlogs" runat="server" AutoGenerateColumns="false" CssClass="gridview" OnRowCommand="gvBlogs_RowCommand" BorderStyle="None" GridLines="None">
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
                    <asp:Button runat="server" CssClass="aspButton" Text="Sửa" PostBackUrl='<%# "new.aspx?BlogId=" + Eval("id") %>' Visible='<%# activeButton == "created" %>' />
                    <asp:Button runat="server" CssClass="aspButton" Text="Xóa" CommandName="DeleteBlog" CommandArgument='<%# Eval("id") %>' Visible='<%# activeButton == "created" %>' />
                    <asp:Button runat="server" CssClass="aspButton" Text="Bỏ lưu" CommandName="RemoveFromSaved" CommandArgument='<%# Eval("id") %>' Visible='<%# activeButton == "saved" %>' />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:HiddenField ID="hdnActiveButton" runat="server" Value="created" />
    <script>
        function setActive(button) {
            var buttons = document.getElementsByClassName("tab-button");
            for (var i = 0; i < buttons.length; i++) {
                buttons[i].classList.remove("active");
            }
            button.classList.add("active");
            document.getElementById('<%= hdnActiveButton.ClientID %>').value = button.id === '<%= btnCreateLi.ClientID %>' ? 'created' : 'saved';
        }

        function restoreActiveState() {
            var activeButton = document.getElementById('<%= hdnActiveButton.ClientID %>').value;
            var btnCreateLi = document.getElementById('<%= btnCreateLi.ClientID %>');
            var btnSaveLi = document.getElementById('<%= btnSaveLi.ClientID %>');
            if (activeButton === "created") {
                btnCreateLi.classList.add("active");
                btnSaveLi.classList.remove("active");
            } else if (activeButton === "saved") {
                btnSaveLi.classList.add("active");
                btnCreateLi.classList.remove("active");
            }
        }

        window.onload = function () {
            restoreActiveState();
        };
    </script>
</asp:Content>