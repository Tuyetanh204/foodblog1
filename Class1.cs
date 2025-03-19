using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace foodblog1
{
    //id - tiêu đề - danh mục - ảnh - nguyên liệu - các bước nấu - ngày tạo - tác giả 
    public class Blog
    {
        public string id { get; set; }
        public string title { get; set; }
        public string category { get; set; }
        public string img { get; set; }
        public string ingredient { get; set; }
        public string time { get; set; }
        public string content { get; set; }
        public DateTime CreatedDate { get; set; }
        public string author { get; set; }
    }
    public class User
    {
        public string Username { get; set; }
        public string Password { get; set; }
        public string Fullname { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public List<string> SaveList { get; set; } = new List<string>();
        public List<string> CreateList { get; set; } = new List<string>();
    }
}