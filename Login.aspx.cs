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
            if (IsPostBack)
            {
                // Lấy dữ liệu từ form
                string username = Request.Form["username"];
                string password = Request.Form["password"];

                // Kiểm tra thông tin đăng nhập
                User user = TestData.Users.Find(u => u.Username == username && u.Password == password);

                if (user != null)
                {
                    // Đăng nhập thành công
                    Session["Username"] = user.Username;
                    Session["Fullname"] = user.Fullname;
                    Response.Redirect("CourseList.aspx");
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