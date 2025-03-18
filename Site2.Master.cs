using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace foodblog1
{
    public partial class Site2 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Kiểm tra trạng thái đăng nhập
                if (Session["Username"] != null) // Người dùng đã đăng nhập
                {
                
                        // Đã đăng nhập
                        phNavLinks.Controls.Add(new Literal { Text = "<a href='Home.aspx'>Trang chủ</a>" });
                        phNavLinks.Controls.Add(new Literal { Text = "<div class='dropdown'><button class='dropbtn' disabled>Cá nhân</button><div class='dropdown-content'><a href='new.aspx'>Tạo bài</a><a href='manage.aspx'>Quản lý</a><a href='#' onclick='Logout_Click()'>Đăng xuất</a></div></div>" });
                    

                }
                else
                {
                    // Chưa đăng nhập
                    phNavLinks.Controls.Add(new Literal { Text = "<a href='Home.aspx'>Trang chủ</a>" });
                    phNavLinks.Controls.Add(new Literal { Text = "<a href='register.aspx'>Đăng ký</a>" });
                    phNavLinks.Controls.Add(new Literal { Text = "<a href='Login.aspx'>Đăng nhập</a>" });
                }
            }
        }
        protected void Logout_Click(object sender, EventArgs e)
        {
            // Xóa Session khi người dùng đăng xuất
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Home.aspx");
        }
    }
}
