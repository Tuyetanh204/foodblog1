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
            if (Session["Username"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                LoadCreatedBlogs();
                hdnActiveButton.Value = "created";
            }
            else
            {
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
            string username = Session["Username"].ToString();
            User currentUser = userList?.Find(u => u.Username == username);

            if (currentUser != null && blogList != null)
            {
                var data = blogList.Where(b => currentUser.CreateList.Contains(b.id)).ToList();
                gvBlogs.DataSource = data;
                gvBlogs.DataBind();
            }
        }

        private void LoadSavedBlogs()
        {
            var userList = Application["UserList"] as List<User>;
            var blogList = Application["BlogList"] as List<Blog>;
            string username = Session["Username"].ToString();
            User currentUser = userList?.Find(u => u.Username == username);

            if (currentUser != null && blogList != null)
            {
                var data = blogList.Where(b => currentUser.SaveList.Contains(b.id)).ToList();
                gvBlogs.DataSource = data;
                gvBlogs.DataBind();
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

            if (blogList != null)
            {
                var blog = blogList.Find(b => b.id == blogId);
                if (blog != null)
                {
                    Application.Lock();
                    blogList.Remove(blog);
                    foreach (User user in userList)
                    {
                        user.CreateList.Remove(blogId);
                    }
                    Application["BlogList"] = blogList;
                    Application["UserList"] = userList;
                    Application.UnLock();
                    LoadCreatedBlogs();
                }
            }
        }

        protected void RemoveFromSaved(string blogId)
        {
            var userList = Application["UserList"] as List<User>;
            string username = Session["Username"].ToString();
            User currentUser = userList?.Find(u => u.Username == username);

            if (currentUser != null)
            {
                Application.Lock();
                currentUser.SaveList.Remove(blogId);
                Application["UserList"] = userList;
                Application.UnLock();
                LoadSavedBlogs();
            }
        }
    }
}