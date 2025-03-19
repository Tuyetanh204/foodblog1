<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="foodblog1.Manage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .gridview {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
            border: none; /* Loại bỏ viền xung quanh bảng */
        }
        .gridview th, .gridview td {
            border: none; /* Loại bỏ viền mặc định của các ô */
            border-bottom: 1px solid #ddd; /* Chỉ giữ viền dưới */
            padding: 20px 8px;
            text-align: left;
        }
        .gridview th {
            background-color: #f2f2f2;
        }
        /* Đảm bảo không có viền cho hàng cuối cùng nếu cần */
        .gridview tr:last-child td {
            border-bottom: none; /* Loại bỏ viền dưới của hàng cuối cùng (tùy chọn) */
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
            margin: 20px 20px;
            cursor: pointer;
        }
        .tab-button.active {
            background-color: white !important; /* Giống hover */
            color: #009e9e !important;         /* Giống hover */
            border: 1px solid #009e9e !important; /* Giống hover */
        }
        .tab-button:hover {
            background-color: white;
            color: #009e9e;
            border: 1px solid #009e9e;
        }
    </style>

    <h2 id="title" class="tittle-green" style="text-align: center; margin-top: 90px">QUẢN LÍ BÀI VIẾT</h2>
    <asp:Button ID="btnCreateLi" style="margin-left: 70px" runat="server" CssClass="tab-button" Text="Bài viết đã tạo" OnClientClick="setActive(this); return true;" OnClick="btnCreateLi_Click" />
    <asp:Button ID="btnSaveLi"  style="margin-left: 10px" runat="server" CssClass="tab-button" Text="Bài viết đã lưu" OnClientClick="setActive(this); return true;" OnClick="btnSaveLi_Click" />
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
                    <asp:Button runat="server" CssClass="aspButton" Text="Sửa" PostBackUrl='<%# "Edit.aspx?BlogId=" + Eval("id") %>' Visible='<%# activeButton == "created" %>' />
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

            // Cập nhật giá trị của HiddenField để lưu trạng thái activeButton
            document.getElementById('<%= hdnActiveButton.ClientID %>').value = button.id === '<%= btnCreateLi.ClientID %>' ? 'created' : 'saved';
            console.log("setActive called for: ", button.id, "ActiveButton set to: ", document.getElementById('<%= hdnActiveButton.ClientID %>').value);
        }

        // Hàm để khôi phục trạng thái active khi trang tải hoặc sau PostBack
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
            console.log("restoreActiveState called, ActiveButton: ", activeButton);
        }

        // Gọi hàm restoreActiveState khi trang tải
        window.onload = function () {
            restoreActiveState();
        };
    </script>
</asp:Content>