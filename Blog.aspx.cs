using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace foodblog1
{
    public partial class Blog1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Lấy BlogId từ querystring
            string blogId = Request.QueryString["BlogId"];
            if (!string.IsNullOrEmpty(blogId))
            {
                // Lấy danh sách blog từ Application
                List<Blog> blogList = (List<Blog>)Application["BlogList"];
                Blog currentBlog = blogList?.Find(b => b.id == blogId);

                if (currentBlog != null)
                {
                    // Hiển thị thông tin blog
                    blogTitle.InnerText = currentBlog.title;
                    blogAuthor.InnerText = currentBlog.author;
                    blogDate.InnerText = currentBlog.CreatedDate.ToString("dd/MM/yyyy");
                    blogTime.InnerText = currentBlog.time;
                    blogImage.ImageUrl = currentBlog.img;
                    blogIngredient.InnerText = $"Nguyên liệu cần chuẩn bị: {currentBlog.ingredient}";
                    blogContent.InnerText = currentBlog.content;

                    // Cập nhật URL và nội dung cho thẻ <a>
                    categoryLink.HRef = $"Category.aspx?category={currentBlog.category}";
                    categoryLink.InnerText = currentBlog.category;
                }
                else
                {
                    // Xử lý nếu không tìm thấy blog
                    Response.Write("<script>alert('Bài viết không tồn tại!');</script>");
                }
            }
            else
            {
                // Xử lý nếu thiếu querystring
                Response.Write("<script>alert('Không tìm thấy BlogId!');</script>");
            }
        }
    }
}