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
            get { return ViewState["ActiveButton"] as string ?? "created"; }
            set { ViewState["ActiveButton"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCreatedBlogs();
                hdnActiveButton.Value = "created"; // Khởi tạo giá trị ban đầu cho HiddenField
            }
            else
            {
                // Đồng bộ activeButton với giá trị từ HiddenField sau PostBack
                activeButton = hdnActiveButton.Value;
            }
        }

        protected void btnCreateLi_Click(object sender, EventArgs e)
        {
            activeButton = "created";
            hdnActiveButton.Value = "created";
            LoadCreatedBlogs();
        }

        protected void btnSaveLi_Click(object sender, EventArgs e)
        {
            activeButton = "saved";
            hdnActiveButton.Value = "saved";
            LoadSavedBlogs();
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
                activeButton = "created";
                hdnActiveButton.Value = "created";
            }
            else if (e.CommandName == "RemoveFromSaved")
            {
                RemoveFromSaved(blogId);
                activeButton = "saved";
                hdnActiveButton.Value = "saved";
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

                    foreach (User user in userList)
                    {
                        user.CreateList.Remove(blogId);
                    }
                    Application["UserList"] = userList;

                    LoadCreatedBlogs();
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
                    LoadSavedBlogs();
                }
            }
        }
    }
}