using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace foodblog1
{
    public partial class Site2 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
               Update();
        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            // Xóa Session khi người dùng đăng xuất
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Home.aspx");
        }
        
        
        protected void Update()
        {
            // Thêm nút mặc định luôn hiển thị, như "Trang chủ"
            phNavLinks.Controls.Add(new Literal { Text = "<a href='Home.aspx'>Trang chủ</a>" });

            if (Session["Username"] != null) // Người dùng đã đăng nhập
            {
                // Thêm các liên kết dành cho người dùng đã đăng nhập
                phNavLinks.Controls.Add(new Literal
                {
                    Text = "<div class='dropdown'><button class='dropbtn' disabled>Cá nhân</button><div class='dropdown-content'>"
                });
                phNavLinks.Controls.Add(new Literal { Text = "<a href='new.aspx'>Tạo bài</a>" });
                phNavLinks.Controls.Add(new Literal { Text = "<a href='manage.aspx'>Quản lý</a>" });

                // Tạo nút "Đăng xuất" sử dụng LinkButton
                LinkButton logoutButton = new LinkButton
                {
                    ID = "btnLogout",
                    Text = "Đăng xuất",
                    CssClass = "logout-link" // Giữ định dạng giao diện qua CSS
                };
                logoutButton.Click += Logout_Click; // Gắn sự kiện Logout_Click
                phNavLinks.Controls.Add(logoutButton);

                phNavLinks.Controls.Add(new Literal { Text = "</div></div>" });
            }
            else
            {
                // Thêm các liên kết dành cho người dùng chưa đăng nhập
                phNavLinks.Controls.Add(new Literal { Text = "<a href='register.aspx'>Đăng ký</a>" });
                phNavLinks.Controls.Add(new Literal { Text = "<a href='Login.aspx'>Đăng nhập</a>" });
            }
        }
    }
    }

