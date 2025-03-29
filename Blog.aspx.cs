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
                    blogContent.InnerHtml = currentBlog.content;
                    categoryLink.HRef = $"Category.aspx?category={currentBlog.category}";
                    categoryLink.InnerText = currentBlog.category;
                    // Xử lý phần nguyên liệu
                    ingredientList.InnerHtml = ""; // Xóa nội dung cũ (nếu có)
                    string[] ingredients = currentBlog.ingredient.Split(new string[] { ", " }, StringSplitOptions.None);
                    foreach (string ingredient in ingredients)
                    {
                        ingredientList.InnerHtml += $"<li>{ingredient}</li>";
                    }
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

            // Xử lý hiển thị nút "Lưu" hoặc "Bỏ lưu"
            if (Session["Username"] != null)
            {
                string username = Session["Username"].ToString();
                List<User> userList = Application["UserList"] as List<User>;
                User currentUser = userList?.Find(u => u.Username == username);

                if (currentUser != null)
                {
                    // Kiểm tra xem BlogId có nằm trong SaveList hay không
                    if (currentUser.SaveList.Contains(blogId))
                    {
                        btnSave.Text = "Bỏ lưu"; // Nếu đã lưu, nút chuyển thành "Bỏ lưu"
                        btnSave.CssClass = "save-button unsave";
                    }
                    else
                    {
                        btnSave.Text = "Lưu"; // Nếu chưa lưu, nút là "Lưu"
                        btnSave.CssClass = "save-button save";
                    }

                    // Hiển thị nút
                    btnSave.Visible = true;
                }
            }
            }


        protected void ToggleSaveStatus(object sender, EventArgs e)
        {
            string blogId = Request.QueryString["BlogId"];
            if (!string.IsNullOrEmpty(blogId) && Session["Username"] != null)
            {
                string username = Session["Username"].ToString();
                List<User> userList = Application["UserList"] as List<User>;
                User currentUser = userList?.Find(u => u.Username == username);

                if (currentUser != null)
                {
                    if (currentUser.SaveList.Contains(blogId))
                    {
                        // Nếu đã lưu, xóa ID khỏi SaveList
                        currentUser.SaveList.Remove(blogId);
                        btnSave.Text = "Lưu"; // Cập nhật nút thành "Lưu"
                        btnSave.CssClass = "save-button save";
                    }
                    else
                    {
                        // Nếu chưa lưu, thêm ID vào SaveList
                        currentUser.SaveList.Add(blogId);
                        btnSave.Text = "Bỏ lưu"; // Cập nhật nút thành "Bỏ lưu"
                        btnSave.CssClass = "save-button unsave";
                    }
                }
            }
        }

    }

}