using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace foodblog1
{
        public partial class Login : System.Web.UI.Page
        {
            protected void Page_Load(object sender, EventArgs e)
            {
                if (!IsPostBack)
                {
                    // Kiểm tra cookie và tự động điền thông tin
                    if (Request.Cookies["Username"] != null && Request.Cookies["Password"] != null)
                    {
                        username.Value = Request.Cookies["Username"].Value;
                        password.Value = Request.Cookies["Password"].Value; 
                    }
                }
            else
            {
                string userInput = username.Value.Trim(); // Lấy giá trị từ input username
                string passInput = password.Value.Trim(); // Lấy giá trị từ input password

                // Kiểm tra thông tin đăng nhập
                List<User> userList = (List<User>)Application["UserList"];
                User user = userList.Find(u => u.Username == userInput && u.Password == passInput);

                if (user != null)
                {
                    // Đăng nhập thành công
                    Session["Username"] = user.Username;
                    Session["Fullname"] = user.Fullname;

                    // Kiểm tra xem người dùng có chọn "Ghi nhớ đăng nhập" không
                    if (chkRememberMe.Checked)
                    {
                        // Tạo cookie lưu thông tin đăng nhập
                        HttpCookie userCookie = new HttpCookie("Username", userInput)
                        {
                            Expires = DateTime.Now.AddDays(7) // Lưu trong 7 ngày
                        };
                        Response.Cookies.Add(userCookie);

                        HttpCookie passCookie = new HttpCookie("Password", passInput)
                        {
                            Expires = DateTime.Now.AddDays(7)
                        };
                        Response.Cookies.Add(passCookie);
                    }
                    else
                    {
 
                    }

                    // Điều hướng đến trang Home
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    // Đăng nhập không thành công
                    Response.Write("<script>alert('Tên đăng nhập hoặc mật khẩu không đúng');</script>");
                }
            }
        }

            
        }
    }
