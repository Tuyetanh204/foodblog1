<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="foodblog1.Manage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        /* CSS gốc cho phiên bản laptop (desktop) */
        .gridview {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
            border: none; /* Loại bỏ viền xung quanh bảng */
        }
        .gridview th, .gridview td {
            border: none; /* Loại bỏ viền mặc định của các ô */
            border-bottom: 1px solid #ddd; /* Chỉ giữ viền dưới */
            padding: 20px 8px; /* Padding gốc */
            text-align: left;
            font-size: 16px; /* Cỡ chữ gốc */
        }
        /* Phân bổ chiều rộng cho các cột trên cả laptop */
        .gridview th:nth-child(1), .gridview td:nth-child(1) { /* Cột STT */
            width: 9%; /* Giảm chiều rộng cột STT */
            min-width: 50px; /* Đảm bảo không quá nhỏ */
        }
        .gridview th:nth-child(2), .gridview td:nth-child(2) { /* Cột Tiêu đề */
            width: 50%; /* Tăng chiều rộng cột Tiêu đề */
            min-width: 200px;
        }
        .gridview th:nth-child(3), .gridview td:nth-child(3) { /* Cột Danh mục */
            width: 21%; /* Đặt chiều rộng cho cột Danh mục */
            min-width: 100px;
        }
        .gridview th:nth-child(4), .gridview td:nth-child(4) { /* Cột Thao tác */
            width: 20%; /* Giảm chiều rộng cột Thao tác */
            min-width: 150px;
        }
        .gridview th {
            background-color: #f2f2f2;
        }
        .gridview tr:last-child td {
            border-bottom: none; /* Loại bỏ viền dưới của hàng cuối cùng */
        }
        button, .aspButton {
            background-color: #009e9e;
            border: 1px solid #009e9e;
            color: white;
            padding: 10px 20px; /* Padding gốc */
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px; /* Cỡ chữ gốc */
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
            padding: 10px 20px; /* Padding gốc */
            margin: 20px 20px; /* Margin gốc */
            cursor: pointer;
            font-size: 16px; /* Cỡ chữ gốc */
        }
        .tab-button.active {
            background-color: white !important;
            color: #009e9e !important;
            border: 1px solid #009e9e !important;
        }
        h2.tittle-green {
            color: #008080;
            text-align: center;
            margin: 90px 0 20px 0; /* Margin gốc */
            font-size: 28px; /* Cỡ chữ gốc */
        }

        /* Tab container để căn giữa và linh hoạt */
        .tab-container {
            display: flex;
            justify-content: flex-start; /* Giữ nguyên căn trái như ban đầu */
            margin-left: 70px; /* Margin-left gốc */
            margin-bottom: 20px;
        }

        /* Responsive cho mobile (dưới 768px) */
        @media screen and (max-width: 768px) {
            h2.tittle-green {
                font-size: 20px; /* Giảm kích thước tiêu đề trên mobile */
                margin-top: 20px; /* Giảm margin-top để tiết kiệm không gian */
            }
            .tab-container {
                justify-content: center; /* Căn giữa các nút tab trên mobile */
                margin-left: 0; /* Bỏ margin-left để căn giữa */
                flex-wrap: wrap; /* Cho phép xuống dòng nếu không đủ chỗ */
            }
            .tab-button {
                padding: 8px 12px; /* Giảm padding cho nút tab */
                font-size: 12px; /* Giảm kích thước chữ */
                margin: 5px; /* Giảm margin */
            }
            .gridview {
                width: 100%; /* Chiếm toàn bộ chiều rộng trên mobile */
                overflow-x: auto; /* Cho phép cuộn ngang nếu nội dung quá rộng */
                display: block; /* Đảm bảo cuộn ngang hoạt động */
            }
            .gridview table {
                min-width: 600px; /* Đảm bảo bảng có chiều rộng tối thiểu để không bị co quá nhỏ */
            }
            .gridview th, .gridview td {
                padding: 10px 5px; /* Giảm padding trên mobile */
                font-size: 12px; /* Giảm kích thước chữ */
            }
            /* Giảm kích thước nút trong GridView */
            .aspButton {
                padding: 6px 10px;
                font-size: 12px;
            }
        }

        /* Responsive cho màn hình rất nhỏ (dưới 480px) */
        @media screen and (max-width: 480px) {
            h2.tittle-green {
                font-size: 18px;
            }
            .tab-button {
                padding: 6px 10px;
                font-size: 11px;
            }
            .gridview th, .gridview td {
                padding: 8px 3px;
                font-size: 11px;
            }
            .aspButton {
                padding: 5px 8px;
                font-size: 11px;
            }
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