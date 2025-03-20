using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;

namespace foodblog1
{
    public partial class Category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
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
                else if (blogList != null)
                {
                    // Hiển thị toàn bộ bài viết nếu không có query string
                    filteredBlogs = blogList;
                }

                // Cập nhật tiêu đề danh mục
                if (!string.IsNullOrEmpty(category))
                {
                    categoryTitle.InnerText = $"Danh mục / {category}";
                }
                else
                {
                    categoryTitle.InnerText = "Danh mục / Toàn bộ";
                }

                // Tạo nội dung HTML động
                RenderBlogs(filteredBlogs);
            }
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            string searchText = searchTextBox.Text.Trim();
            string selectedCategory = categoryDropDown.SelectedValue;

            // Lấy danh sách blog từ Application
            var blogList = (List<Blog>)Application["BlogList"];
            var filteredBlogs = new List<Blog>();

            if (blogList != null)
            {
                // Lọc blog theo danh mục và tiêu đề
                filteredBlogs = blogList.Where(b =>
                    (string.IsNullOrEmpty(selectedCategory) || b.category == selectedCategory) &&
                    (string.IsNullOrEmpty(searchText) || b.title.IndexOf(searchText, StringComparison.OrdinalIgnoreCase) >= 0)
                ).ToList();
            }

            // Ẩn tiêu đề danh mục
            categoryTitle.Visible = false;

            // Tạo nội dung HTML động
            RenderBlogs(filteredBlogs);
        }

        private void RenderBlogs(List<Blog> blogs)
        {
            string htmlContent = "";

            if (blogs.Count > 0)
            {
                foreach (var blog in blogs)
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
                htmlContent = "<p>Không tìm thấy bài viết nào.</p>";
            }

            // Gán nội dung HTML vào container
            articlesContainer.InnerHtml = htmlContent;
        }
    }
}
