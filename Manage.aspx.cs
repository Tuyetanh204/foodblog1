using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace foodblog1
{
    public partial class Manage : System.Web.UI.Page
    {
        protected string activeButton
        {
            get { return ViewState["ActiveButton"] as string ?? "created"; } // Lấy từ ViewState, mặc định là "created"
            set { ViewState["ActiveButton"] = value; } // Lưu vào ViewState
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCreatedBlogs(); // Hiển thị danh sách bài viết đã tạo khi vào trang
                btnCreateLi.Attributes["class"] = "tab-button active"; // Đảm bảo nút "Bài viết đã tạo" active ban đầu
                btnSaveLi.Attributes["class"] = "tab-button";
            }
        }

        protected void btnCreateLi_Click(object sender, EventArgs e)
        {
            activeButton = "created";
            LoadCreatedBlogs();
            btnCreateLi.Attributes["class"] = "tab-button active";
            btnSaveLi.Attributes["class"] = "tab-button";
        }

        protected void btnSaveLi_Click(object sender, EventArgs e)
        {
            activeButton = "saved";
            LoadSavedBlogs();
            btnSaveLi.Attributes["class"] = "tab-button active";
            btnCreateLi.Attributes["class"] = "tab-button";
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
                    var data = blogList.Where(b => currentUser.CreateList.Contains(b.id)).ToList();
                    gvBlogs.DataSource = data;
                    gvBlogs.DataBind();
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
                    var data = blogList.Where(b => currentUser.SaveList.Contains(b.id)).ToList();
                    gvBlogs.DataSource = data;
                    gvBlogs.DataBind();
                }
            }
        }

        protected void gvBlogs_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string blogId = e.CommandArgument.ToString();
            if (e.CommandName == "DeleteBlog")
            {
                DeleteBlog(blogId);
                // Sau khi xóa, duy trì trạng thái "created" và cập nhật giao diện
                activeButton = "created";
                btnCreateLi.Attributes["class"] = "tab-button active";
                btnSaveLi.Attributes["class"] = "tab-button";
            }
            else if (e.CommandName == "RemoveFromSaved")
            {
                RemoveFromSaved(blogId);
                // Sau khi bỏ lưu, duy trì trạng thái "saved" và cập nhật giao diện
                activeButton = "saved";
                btnSaveLi.Attributes["class"] = "tab-button active";
                btnCreateLi.Attributes["class"] = "tab-button";
            }
        }

        protected void DeleteBlog(string blogId)
        {
            var blogList = Application["BlogList"] as List<Blog>;
            var userList = Application["UserList"] as List<User>;

            if (blogList != null && Session["Username"] != null)
            {
                var blog = blogList.Find(b => b.id == blogId);
                if (blog != null)
                {
                    blogList.Remove(blog);
                    Application["BlogList"] = blogList;

                    // Xóa blogId khỏi CreateList của tất cả user
                    foreach (User user in userList)
                    {
                        user.CreateList.Remove(blogId);
                    }
                    Application["UserList"] = userList;

                    LoadCreatedBlogs(); // Cập nhật lại danh sách
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
                    LoadSavedBlogs(); // Cập nhật lại danh sách
                }
            }
        }
    }
}