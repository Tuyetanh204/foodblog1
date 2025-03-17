using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace foodblog1
{
    //id - tiêu đề - danh mục - ảnh - nguyên liệu - các bước nấu - ngày tạo - tác giả 
    public class Blog
    {
        public string id;
        public string title;
        public string category;
        public string img;
        public string ingredient;
        public string content;
        public DateTime CreatedDate { get; set; }
        public string author;
    }
    public class User
    {
        public string Username { get; set; }
        public string Password { get; set; }
        public string Fullname { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
    }
}