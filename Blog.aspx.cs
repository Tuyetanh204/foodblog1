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
                        // Hiển thị thông tin chi tiết blog
                        blogTitle.InnerText = currentBlog.title;
                        blogAuthor.InnerText = $"Tác giả: {currentBlog.author}";
                        blogDate.InnerText = $"Ngày tạo: {currentBlog.CreatedDate.ToString("dd/MM/yyyy")}";
                        blogCategory.InnerHtml = $"Danh mục: <a href='Category.aspx?category={currentBlog.category}'>{currentBlog.category}</a>";
                        blogImage.ImageUrl = currentBlog.img;
                        blogContent.InnerText = currentBlog.content;
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
