using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace foodblog1
{
    public class Class1
    {
    }
    public class User
    {
        public string Username { get; set; }
        public string Password { get; set; }
        public string Fullname { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
    }
    public static class TestData
    {
        public static List<User> Users = new List<User>
    {
        new User { Username = "admin", Password = "123", Fullname = "Admin 1", Phone = "1234567890", Email = "user1@example.com" },
        new User { Username = "me123", Password = "123", Fullname = "User Two", Phone = "0987654321", Email = "user2@example.com" }
    };

    }
}