using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace foodblog1
{
	public partial class Home : System.Web.UI.Page
	{
            protected void Page_Load(object sender, EventArgs e)
            {
                // Lấy danh sách blog từ Application
                var blogList = Application["BlogList"] as List<Blog>;

                // Kiểm tra nếu danh sách blog không rỗng
                string htmlContent = "";

                if (blogList != null && blogList.Count > 0)
                {
                    foreach (var blog in blogList)
                    {
                        htmlContent += $@"
<a href='Blog.aspx?BlogId={blog.id}' class='article-link'>
    <div class='article'>
        <img src='{blog.img}' alt='{blog.title}' />
        <div class='details'>
            <h2>{blog.title}</h2>
            <p><strong>Danh mục:</strong> {blog.category}</p>
            <p><strong>Thời gian nấu:</strong> {blog.time}</p>
            <p><strong>Nguyên liệu:</strong> {(blog.ingredient.Length > 70 ? blog.ingredient.Substring(0, 70) + "..." : blog.ingredient)}</p>
            <p><strong>Tác giả:</strong> {blog.author}</p>
        </div>
    </div>
</a>";
                    }
                }
                else
                {
                    htmlContent = "<p>Không có bài viết nào được tìm thấy.</p>";
                }

                // Gán nội dung HTML động vào container
                articlesContainer.InnerHtml = htmlContent;
            }
        }
    }
