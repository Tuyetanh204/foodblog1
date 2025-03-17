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
    title = "Bánh Pancake",
    category = "Tráng miệng",
    img = "img/b2.jpg",
    ingredient = "Bột mì, Trứng, Sữa, Đường",
    time="60 phút",
    content = "Công thức này giúp bạn làm bánh pancake mềm mịn. Trộn bột mì và đường, sau đó thêm trứng và sữa. Đổ bột lên chảo nóng và nấu cho đến khi vàng.",
    CreatedDate = new DateTime(2024, 1, 10),
    author = "Nguyen Tuyet"},

        new Blog {id = "2",
    title = "Kem xoài",
    category = "Tráng miệng",
    img = "img/b2.jpg",
    ingredient = "1 cốc kem, 1/4 cốc đường, 2-3 giọt tinh chất vani, 1/2 cốc xoài xay nhuyễn, 1/2 cốc xoài thái nhỏ",
    time="60 phút",
    content = "Trộn đều kem trong bát cho đến khi phồng rồi thêm đường. Trộn đều, thêm tinh chất vani. Đổ vào khuôn kem, để vào tủ đông từ 5-6 giờ. Cho vào bát trang trí với sốt xoài và các miếng xoài thái nhỏ.",
    CreatedDate = new DateTime(2025, 3, 17),
    author = "Admin 1"},

    new Blog {id = "3",
    title = "Súp thịt bò",
    category = "Món chính",
    img = "img/b2.jpg",
    ingredient = "4 củ khoai tây, 1 củ cà rốt, 3 nhánh cần tây, 2 hoa hồi, 1 củ hành tây trắng, muối, hạt tiêu đen, 5 lát gừng, 0.5 kg thịt ức bò",
    time="60 phút",
    content = "Đun sôi thịt bò trong năm phút. Vớt sạch bọt rồi rửa sạch lại. Đổ nước vào nồi. Thêm hoa hồi, thịt bò và gừng rồi đun sôi trong 20 phút. Cho tất cả nguyên liệu còn lại vào nồi rồi hầm trong 1 giờ.",
    CreatedDate = new DateTime(2025, 3, 17),
    author = "Admin 1"},

    new Blog {id = "4",
    title = "Salad bông cải xanh",
    category = "Món chay",
    img = "img/b2.jpg",
    ingredient = "1,5 cốc bông cải xanh thái nhỏ, 1 cốc quả việt quất, 1/4 cốc hành tây cắt nhỏ, 1/2 cốc quả nam việt quất khô, 1/4 cốc hạt hướng dương, 1 quả táo, 1 cốc sữa chua Hy Lạp, 1/4 cốc Mật ong, 1 muỗng canh nước chanh, 2 muỗng cà phê giấm táo",
    time="60 phút",
    content = "Pha sốt trộn gồm hỗn hợp: sữa chua Hy Lạp, mật ong, nước chanh và giấm táo. Trộn tất cả các nguyên liệu còn lại với sốt trong tô lớn. Bảo quản tủ lạnh ngăn mát và ăn trong vòng 2 ngày",
    CreatedDate = new DateTime(2024, 1, 10),
    author = "Nguyen Tuyet"},

    new Blog {id = "5",
    title = "Bánh Pancake",
    category = "Tráng miệng",
    img = "img/b2.jpg",
    ingredient = "Bột mì, Trứng, Sữa, Đường",
    time="60 phút",
    content = "Công thức này giúp bạn làm bánh pancake mềm mịn. Trộn bột mì và đường, sau đó thêm trứng và sữa. Đổ bột lên chảo nóng và nấu cho đến khi vàng.",
    CreatedDate = new DateTime(2024, 1, 10),
    author = "Nguyen Tuyet"}
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