using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Text;
using System.Web.UI.WebControls;

namespace foodblog1
{
    public partial class Manage : System.Web.UI.Page
    {
            protected string htmlContent = ""; // HTML động để hiển thị danh sách
            protected string activeButton = "created"; // Trạng thái mặc định là danh sách đã tạo

            protected void Page_Load(object sender, EventArgs e)
            {
                if (!IsPostBack)
                {
                    LoadCreatedBlogs(); // Hiển thị danh sách bài viết đã tạo khi vào trang
                }
            }
            protected void btnCreateLi_Click(object sender, EventArgs e)
            {
                activeButton = "created"; // Gán trạng thái nút active
                LoadCreatedBlogs(); // Hiển thị danh sách bài viết đã tạo
            }

            protected void btnSaveLi_Click(object sender, EventArgs e)
            {
                activeButton = "saved"; // Gán trạng thái nút active
                LoadSavedBlogs(); // Hiển thị danh sách bài viết đã lưu
            }

            private void LoadCreatedBlogs()
            {
                var userList = Application["UserList"] as List<User>;
                var blogList = Application["BlogList"] as List<Blog>;

                if (Session["Username"] != null && userList != null && blogList != null)
                {
                    string username = Session["Username"].ToString();
                    User currentUser = userList.Find(u => u.Username == username);

                    if (currentUser != null)
                    {
                        htmlContent = ""; // Xóa nội dung cũ
                        int index = 1;

                        foreach (var blogId in currentUser.CreateList)
                        {
                            var blog = blogList.Find(b => b.id == blogId);
                            if (blog != null)
                            {
                            var sb = new StringBuilder();
                            sb.Append("<tr>");
                            sb.Append($"<td>{index++}</td>");
                            sb.Append($"<td>{blog.title}</td>");
                            sb.Append($"<td>{blog.category}</td>");
                            sb.Append("<td>");
                            sb.Append($"<button onclick=\"window.location.href='Edit.aspx?BlogId={blog.id}'\">Sửa</button>");
                            sb.Append($"<button onclick=\"deleteBlog('{blog.id}')\">Xóa</button>");
                            sb.Append("</td>");
                            sb.Append("</tr>");
                            htmlContent += sb.ToString();


                        }
                    }
                    }
                }
            }

            private void LoadSavedBlogs()
            {
                var userList = Application["UserList"] as List<User>;
                var blogList = Application["BlogList"] as List<Blog>;

                if (Session["Username"] != null && userList != null && blogList != null)
                {
                    string username = Session["Username"].ToString();
                    User currentUser = userList.Find(u => u.Username == username);

                    if (currentUser != null)
                    {
                        htmlContent = ""; // Xóa nội dung cũ
                        int index = 1;

                        foreach (var blogId in currentUser.SaveList)
                        {
                            var blog = blogList.Find(b => b.id == blogId);
                            if (blog != null)
                            {

                            // Tạo một StringBuilder để xây dựng HTML
                            StringBuilder sb = new StringBuilder();

                            sb.Append("<tr>");
                            sb.Append($"<td>{index++}</td>");
                            sb.Append($"<td>{blog.title}</td>");
                            sb.Append($"<td>{blog.category}</td>");
                            sb.Append("<td>");
                            sb.Append($"<button onclick=\"window.location.href='Edit.aspx?BlogId={blog.id}'\">Sửa</button>");
                            sb.Append($"<button onclick=\"RemoveFromSaved('{blog.id}')\">Bỏ lưu</button>");
                            sb.Append("</td>");
                            sb.Append("</tr>");

                            // Thêm nội dung vào htmlContent
                            htmlContent += sb.ToString();

                        }
                    }
                    }
                }
            }

            protected void DeleteBlog(string blogId)
            {
                var blogList = Application["BlogList"] as List<Blog>;

                if (blogList != null && Session["Username"] != null)
                {
                    var blog = blogList.Find(b => b.id == blogId);
                    if (blog != null)
                    {
                        blogList.Remove(blog);
                        Application["BlogList"] = blogList;
                        LoadCreatedBlogs(); // Cập nhật danh sách sau khi xóa
                    }
                }
            }

            protected void RemoveFromSaved(string blogId)
            {
                var userList = Application["UserList"] as List<User>;

                if (Session["Username"] != null && userList != null)
                {
                    string username = Session["Username"].ToString();
                    User currentUser = userList.Find(u => u.Username == username);

                    if (currentUser != null)
                    {
                        currentUser.SaveList.Remove(blogId);
                        Application["UserList"] = userList;
                        LoadSavedBlogs(); // Cập nhật danh sách sau khi bỏ lưu
                    }
                }
            }
        }
    }
