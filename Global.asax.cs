using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace foodblog1
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            //Data test


            //Tài khoản
            Application["UserList"] = new List<User>
    {
        new User { Username = "admin", Password = "123", Fullname = "Admin 1", Phone = "1234567890", Email = "user1@example.com" },
        new User { Username = "me123", Password = "123", Fullname = "User Two", Phone = "0987654321", Email = "user2@example.com" }
    };
            ////Blog:  id - tiêu đề - danh mục - ảnh - nguyên liệu - các bước nấu - ngày tạo - tác giả 
            Application["BlogList"] = new List<Blog>
    {
        new Blog {id = "1",
    title = "Bánh Pancake Dễ Làm",
    category = "Ẩm thực",
    img = "img/b2.jpg",
    ingredient = "Bột mì, Trứng, Sữa, Đường",
    content = "Công thức này giúp bạn làm bánh pancake mềm mịn. Trộn bột mì và đường, sau đó thêm trứng và sữa. Đổ bột lên chảo nóng và nấu cho đến khi vàng.",
    CreatedDate = new DateTime(2025, 3, 10),
    author = "Nguyen Tuyet"},
        new Blog {id = "2",
    title = "Kem xoài",
    category = "Tráng Miệng",
    img = "img/b2.jpg",
    ingredient = "1 cốc kem, 1/4 cốc đường, 2-3 giọt tinh chất vani, 1/2 cốc xoài xay nhuyễn, 1/2 cốc xoài thái nhỏ",
    content = "Trộn đều kem trong bát cho đến khi phồng rồi thêm đường. Trộn đều, thêm tinh chất vani. Đổ vào khuôn kem, để vào tủ đông từ 5-6 giờ. Cho vào bát trang trí với sốt xoài và các miếng xoài thái nhỏ.",
    CreatedDate = new DateTime(2025, 3, 17),
    author = "Admin 1"},
    };
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}