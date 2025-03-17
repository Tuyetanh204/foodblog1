using System;
using System.Collections.Generic;

public partial class register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack) // Kiểm tra khi người dùng gửi dữ liệu qua form
        {
            // 1. Lấy dữ liệu từ form
            string fullName = Request.Form["fname"];
            string email = Request.Form["email"];
            string phone = Request.Form["phone"];
            string username = Request.Form["username"];
            string password = Request.Form["password"];

            // 2. Lấy danh sách người dùng hiện tại từ Application
            List<User> userList = (List<User>)Application["UserList"];
            if (userList == null)
            {
                // Khởi tạo danh sách nếu chưa tồn tại
                userList = new List<User>();
                Application["UserList"] = userList;
            }

            // 3. Kiểm tra trùng lặp tên đăng nhập
            User existingUser = userList.Find(u => u.Username == username);
            if (existingUser != null)
            {
                // Tên đăng nhập đã tồn tại
                Response.Write("<script>alert('Tên đăng nhập đã tồn tại. Vui lòng chọn tên khác.');</script>");
                return;
            }

            // 4. Tạo đối tượng người dùng mới
            User newUser = new User
            {
                FullName = fullName,
                Email = email,
                Phone = phone,
                Username = username,
                Password = password // Cần mã hóa mật khẩu trong hệ thống thực tế
            };

            // 5. Thêm người dùng mới vào danh sách
            userList.Add(newUser);
            Application["UserList"] = userList; // Cập nhật danh sách người dùng trong Application

            // 6. Thông báo và chuyển hướng tới trang đăng nhập
            Response.Write("<script>alert('Đăng ký thành công! Vui lòng đăng nhập.');</script>");
            Response.Redirect("login.aspx");
        }
    }
}

// Lớp User để lưu thông tin người dùng
public class User
{
    public string FullName { get; set; }
    public string Email { get; set; }
    public string Phone { get; set; }
    public string Username { get; set; }
    public string Password { get; set; }
}
