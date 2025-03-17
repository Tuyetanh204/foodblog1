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