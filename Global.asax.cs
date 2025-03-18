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
    img = "img/pancake.jpg",
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
    img = "img/supthit.jpg",
    ingredient = "4 củ khoai tây, 1 củ cà rốt, 3 nhánh cần tây, 2 hoa hồi, 1 củ hành tây trắng, muối, hạt tiêu đen, 5 lát gừng, 0.5 kg thịt ức bò",
    time="60 phút",
    content = "Đun sôi thịt bò trong năm phút. Vớt sạch bọt rồi rửa sạch lại. Đổ nước vào nồi. Thêm hoa hồi, thịt bò và gừng rồi đun sôi trong 20 phút. Cho tất cả nguyên liệu còn lại vào nồi rồi hầm trong 1 giờ.",
    CreatedDate = new DateTime(2025, 3, 17),
    author = "Admin 1"},

    new Blog {id = "4",
    title = "Salad bông cải xanh",
    category = "Món chay",
    img = "img/salad.jpg",
    ingredient = "1,5 cốc bông cải xanh thái nhỏ, 1 cốc quả việt quất, 1/4 cốc hành tây cắt nhỏ, 1/2 cốc quả nam việt quất khô, 1/4 cốc hạt hướng dương, 1 quả táo, 1 cốc sữa chua Hy Lạp, 1/4 cốc Mật ong, 1 muỗng canh nước chanh, 2 muỗng cà phê giấm táo",
    time="60 phút",
    content = "Pha sốt trộn gồm hỗn hợp: sữa chua Hy Lạp, mật ong, nước chanh và giấm táo. Trộn tất cả các nguyên liệu còn lại với sốt trong tô lớn. Bảo quản tủ lạnh ngăn mát và ăn trong vòng 2 ngày",
    CreatedDate = new DateTime(2024, 1, 10),
    author = "Nguyen Tuyet"},

    new Blog {
  id = "5",
  title = "Nộm gà xé phay",
  category = "Món chính",
  img = "img/nomga.jpg",
  ingredient = "300g thịt gà luộc, 1 củ hành tây, rau răm, lạc rang, giấm, đường, nước mắm, tỏi, ớt",
  time = "30 phút",
  content = "Luộc thịt gà, xé nhỏ thịt. Hành tây thái mỏng, ngâm giấm đường. Trộn gà, hành tây, rau răm với nước mắm pha tỏi ớt. Rắc lạc rang lên trên khi ăn.",
  CreatedDate = new DateTime(2025, 2, 28),
  author = "Admin 2"
},

    new Blog {
  id = "6",
  title = "Canh đậu hũ cải bẹ xanh",
  category = "Món chay",
  img = "img/canhdau.jpg",
  ingredient = "200g đậu hũ non, 1 bó cải bẹ xanh, gừng, muối, tiêu",
  time = "40 phút",
  content = "Đun sôi nước, thêm gừng thái lát. Thả đậu hũ non và cải bẹ xanh vào nồi. Nêm muối và tiêu vừa ăn. Nấu thêm 5 phút rồi tắt bếp.",
  CreatedDate = new DateTime(2024, 3, 15),
  author = "Nguyen Tuyet"
},

new Blog {
  id = "7",
  title = "Bánh chuối hấp cốt dừa",
  category = "Tráng miệng",
  img = "img/banhchuoi.jpg",
  ingredient = "Chuối chín, bột năng, cốt dừa, đường thốt nốt, đậu phộng rang",
  time = "70 phút",
  content = "Chuối thái lát, trộn bột năng và đường thốt nốt. Hấp trong 30 phút. Phủ cốt dừa và rắc đậu phộng lên trên khi ăn.",
  CreatedDate = new DateTime(2025, 5, 12),
  author = "Admin 1"
},

new Blog {
  id = "8",
  title = "Phở bò tái chín",
  category = "Món chính",
  img = "img/phobo.jpg",
  ingredient = "500g bánh phở, 1kg xương bò, 500g thịt bò tái, hành lá, ngò gai, quế, hồi, gừng, hành tím",
  time = "90 phút",
  content = "Hầm xương bò với gừng và hành tím. Thêm quế và hồi vào nước dùng. Luộc bánh phở, xếp thịt bò tái chín vào tô, chan nước dùng.",
  CreatedDate = new DateTime(2025, 2, 8),
  author = "Admin 1"
},

new Blog {
  id = "9",
  title = "Chè bắp ngọt",
  category = "Tráng miệng",
  img = "img/chebap.jpg",
  ingredient = "Bắp non, nước cốt dừa, đường, bột năng",
  time = "50 phút",
  content = "Nấu bắp non cắt mỏng với nước. Pha nước cốt dừa với bột năng và đường, đổ vào nồi chè. Đun sôi và ăn nóng hoặc lạnh.",
  CreatedDate = new DateTime(2024, 6, 20),
  author = "Nguyen Tuyet"
},

new Blog {
  id = "10",
  title = "Bánh mì que phô mai",
  category = "Ăn vặt",
  img = "img/banhmiq.jpg",
  ingredient = "Bột mì, men nở, phô mai, bơ",
  time = "80 phút",
  content = "Nhào bột mì với men nở và nước. Chia thành que nhỏ, phết bơ và đặt phô mai. Nướng ở 180 độ C trong 15 phút.",
  CreatedDate = new DateTime(2025, 1, 15),
  author = "Admin 2"
},

new Blog {
  id = "11",
  title = "Cơm chiên thập cẩm",
  category = "Món chính",
  img = "img/comchien.jpg",
  ingredient = "Cơm nguội, trứng gà, xúc xích, cà rốt, đậu Hà Lan, hành tím, nước tương",
  time = "45 phút",
  content = "Xào hành tím, thêm cà rốt và xúc xích. Đập trứng, xào cơm với đậu Hà Lan. Nêm nước tương và tiêu.",
  CreatedDate = new DateTime(2025, 3, 12),
  author = "Nguyen Tuyet"
},

new Blog {
  id = "12",
  title = "Sữa chua trái cây",
  category = "Tráng miệng",
  img = "img/suachua.jpg",
  ingredient = "Sữa chua, xoài, dâu tây, kiwi, mật ong",
  time = "20 phút",
  content = "Xếp trái cây thái lát vào cốc. Thêm sữa chua và mật ong lên trên. Khuấy đều trước khi ăn.",
  CreatedDate = new DateTime(2024, 8, 1),
  author = "Admin 3"
},

new Blog {
  id = "13",
  title = "Bánh tráng nướng",
  category = "Ăn vặt",
  img = "img/2.jpg",
  ingredient = "Bánh tráng, trứng gà, ruốc, hành lá, tương ớt",
  time = "15 phút",
  content = "Phết trứng gà đánh tan lên bánh tráng. Thêm ruốc và hành lá. Nướng trên bếp than cho đến khi giòn.",
  CreatedDate = new DateTime(2025, 4, 10),
  author = "Nguyen Tuyet"
},

new Blog {
  id = "14",
  title = "Đậu phụ sốt cà chua",
  category = "Món chay",
  img = "img/dauphu.jpg",
  ingredient = "Đậu phụ, cà chua, hành lá, tỏi, dầu ăn, nước mắm chay",
  time = "30 phút",
  content = "Chiên đậu phụ vàng giòn. Xào tỏi và cà chua, thêm nước mắm chay. Nấu đến khi sốt sánh, thêm đậu phụ và nấu trong 5 phút.",
  CreatedDate = new DateTime(2024, 11, 30),
  author = "Admin 2"
},

new Blog {
  id = "15",
  title = "Gỏi cuốn tôm thịt",
  category = "Ăn vặt",
  img = "img/3-4.jpg",
  ingredient = "Bánh tráng, tôm, thịt ba chỉ, bún tươi, rau sống, nước chấm",
  time = "30 phút",
  content = "Luộc tôm và thịt. Xếp tôm, thịt, bún, và rau lên bánh tráng, cuộn chặt tay. Dùng kèm nước mắm chua ngọt.",
  CreatedDate = new DateTime(2025, 2, 25),
  author = "Admin 3" }

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