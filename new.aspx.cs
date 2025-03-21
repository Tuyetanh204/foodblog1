using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace foodblog1
{
    public partial class _new : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Request.QueryString["BlogId"] != null)
                {
                    string blogId = Request.QueryString["BlogId"];
                    LoadBlogForEdit(blogId);
                }
            }
            else
            {
                SaveBlog();
            }
        }

        private void LoadBlogForEdit(string blogId)
        {
            var blogList = Application["BlogList"] as List<Blog>;
            if (blogList != null)
            {
                var blog = blogList.Find(b => b.id == blogId);
                if (blog != null)
                {
                    pageTitle.InnerText = "Chỉnh sửa bài viết";
                    litMessage.Text = "<p style='color:blue;'>Đang chỉnh sửa bài viết: " + blog.title + "</p>";
                    ClientScript.RegisterStartupScript(this.GetType(), "SetFormValues",
                        $"document.getElementById('title').value = '{blog.title.Replace("'", "\\'")}'; " +
                        $"document.getElementById('category').value = '{blog.category}'; " +
                        $"document.getElementById('time').value = '{blog.time}'; " +
                        $"document.getElementById('{txtSteps.ClientID}').value = '{blog.content.Replace("'", "\\'")}';", true);
                    lblCurrentImage.Text = $"Ảnh hiện tại: {blog.img}";
                    lblCurrentImage.Visible = true;
                    hdnIngredients.Value = blog.ingredient;
                    ViewState["Ingredients"] = blog.ingredient; // Lưu vào ViewState để JavaScript sử dụng
                }
                else
                {
                    litMessage.Text = "<p style='color:red;'>Không tìm thấy bài viết!</p>";
                }
            }
        }

        private void SaveBlog()
        {
            string title = Request.Form.Get("title");
            string category = Request.Form.Get("category");
            string time = Request.Form.Get("time");
            string steps = txtSteps.Text.Trim();
            string ingredientsStr = hdnIngredients.Value;

            if (string.IsNullOrEmpty(title) || string.IsNullOrEmpty(category) ||
                string.IsNullOrEmpty(ingredientsStr) || string.IsNullOrEmpty(steps))
            {
                litMessage.Text = "<p style='color:red;'>Vui lòng điền đầy đủ các thông tin bắt buộc!</p>";
                return;
            }

            string imagePath = "";
            if (fileImage.HasFile)
            {
                string fileExt = System.IO.Path.GetExtension(fileImage.FileName).ToLower();
                string[] allowedExtensions = { ".jpg", ".jpeg", ".png", ".gif" };
                if (!allowedExtensions.Contains(fileExt))
                {
                    litMessage.Text = "<p style='color:red;'>Chỉ được upload tệp hình ảnh (JPG, PNG, GIF)!</p>";
                    return;
                }
                string fileName = Guid.NewGuid().ToString() + fileExt;
                imagePath = "img/" + fileName;
                fileImage.SaveAs(Server.MapPath(imagePath));
            }

            var blogList = Application["BlogList"] as List<Blog>;
            string currentUsername = Session["Username"].ToString();

            if (Request.QueryString["BlogId"] != null) // Chỉnh sửa
            {
                string blogId = Request.QueryString["BlogId"];
                var blog = blogList.Find(b => b.id == blogId);
                if (blog != null && blog.author == currentUsername)
                {
                    blog.title = title;
                    blog.category = category;
                    blog.time = time;
                    blog.content = steps;
                    blog.ingredient = ingredientsStr;
                    if (!string.IsNullOrEmpty(imagePath)) blog.img = imagePath;
                    blog.CreatedDate = DateTime.Now;

                    Application.Lock();
                    Application["BlogList"] = blogList;
                    Application.UnLock();

                    litMessage.Text = "<p style='color:green;'>Bài viết đã được cập nhật thành công!</p>";
                    Response.Redirect("Manage.aspx");
                }
            }
            else // Tạo mới
            {
                int maxId = blogList.Count > 0 ? blogList.Max(b => int.Parse(b.id)) : 0;
                string newId = (maxId + 1).ToString();

                Blog newBlog = new Blog
                {
                    id = newId,
                    title = title,
                    category = category,
                    img = imagePath,
                    ingredient = ingredientsStr,
                    time = time,
                    content = steps,
                    CreatedDate = DateTime.Now,
                    author = currentUsername
                };

                Application.Lock();
                blogList.Add(newBlog);
                Application["BlogList"] = blogList;

                var userList = Application["UserList"] as List<User>;
                User currentUser = userList.Find(u => u.Username == currentUsername);
                if (currentUser != null)
                {
                    currentUser.CreateList.Add(newId);
                }
                Application["UserList"] = userList;
                Application.UnLock();

                litMessage.Text = "<p style='color:green;'>Bài viết đã được đăng thành công!</p>";
                Response.Redirect("Manage.aspx");
            }

            hdnIngredients.Value = "";
        }
    }
}