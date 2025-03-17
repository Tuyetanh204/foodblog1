using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace foodblog1
{
        public partial class Category : System.Web.UI.Page
        {
            protected void Page_Load(object sender, EventArgs e)
            {
                // Lấy giá trị danh mục từ query string
                string category = Request.QueryString["category"];

                // Lấy danh sách blog từ Application
                var blogList = (List<Blog>)Application["BlogList"];
                var filteredBlogs = new List<Blog>();

                if (!string.IsNullOrEmpty(category) && blogList != null)
                {
                    // Lọc danh sách bài viết theo danh mục
                    filteredBlogs = blogList.FindAll(b => b.category == category);
                }

                // Tạo HTML động
                string htmlContent = "";

                if (filteredBlogs.Count > 0)
                {
                    foreach (var blog in filteredBlogs)
                    {
                        htmlContent += $@"
                        <div class='article'>
                            <img src='{blog.img}' alt='{blog.title}' />
                            <div class='details'>
                                <h2>{blog.title}</h2>
                                <p><strong>Danh mục:</strong> {blog.category}</p>
                                <p><strong>Thời gian nấu:</strong> {blog.time}</p>
                                <p><strong>Nguyên liệu:</strong> {(blog.ingredient.Length > 70 ? blog.ingredient.Substring(0, 70) + "..." : blog.ingredient)}</p>
                                <p><strong>Tác giả:</strong> {blog.author}</p>
                            </div>
                        </div>";
                    }
                }
                else
                {
                    htmlContent = "<p>Không tìm thấy bài viết nào trong danh mục này.</p>";
                }

                // Gán nội dung HTML vào container
                articlesContainer.InnerHtml = htmlContent;

                // Cập nhật tiêu đề danh mục
                if (!string.IsNullOrEmpty(category))
                {
                    categoryTitle.InnerText = $"Danh mục / {category}";
                }
                else
                {
                    categoryTitle.InnerText = "Danh mục / Toàn bộ";
                }
            }
        }
    }
