<%@ Page Language="C#"  MasterPageFile="~/Site1.Master"  AutoEventWireup="true" CodeBehind="BlogPost.aspx.cs" Inherits="foodblog1.BlogPost" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <style>
   .main-content .article {
     background-color: #f2f2f2;
     padding: 20px;
     margin-bottom: 20px;
   }
   .main-content .article h2 {
     margin-top: 0;
   }
 </style>
   <div class="main-content">
       <div class="article">
           <h2 id="postTitle">Tiêu đề bài blog</h2>
           <p id="postContent">Nội dung bài blog...</p>
           <asp:Button ID="saveButton" runat="server" Text="Lưu" OnClick="SaveButton_Click" />
       </div>
   </div>
</asp:Content>
