using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace foodblog1
{
    public partial class _new : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) // Kiểm tra khi người dùng gửi dữ liệu qua form
            {
                // Lấy dữ liệu từ các trường nhập liệu khi submit
                string title = Request.Form.Get("title");
                string category = Request.Form.Get("category");
                string time = Request.Form.Get("time");
                string steps = txtSteps.Text.Trim();

                string imagePath = "";
                if (fileImage.HasFile)
                {
                    string fileExt = System.IO.Path.GetExtension(fileImage.FileName).ToLower();
                    string[] allowedExtensions = { ".jpg", ".jpeg", ".png", ".gif" };
                    if (!allowedExtensions.Contains(fileExt))
                    {
                        litMessage.Text = "<p style='color:red;'>Chỉ được upload tệp hình ảnh (JPG, PNG, GIF)!</p>";
                        return;
                    }
                    string fileName = fileImage.FileName;
                    imagePath = "img/" + fileName;
                    fileImage.SaveAs(Server.MapPath(imagePath));
                }


                // Lấy danh sách nguyên liệu từ hidden field
                string ingredientsStr = hdnIngredients.Value;
                // Nếu cần, bạn có thể chuyển đổi ingredientsStr thành mảng:
                // string[] ingredientsArray = ingredientsStr.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);

                // Kiểm tra thông tin bắt buộc
                if (string.IsNullOrEmpty(title) ||
                    string.IsNullOrEmpty(category) ||
                    string.IsNullOrEmpty(ingredientsStr) ||
                    string.IsNullOrEmpty(steps))
                {
                    litMessage.Text = "<p style='color:red;'>Vui lòng điền đầy đủ các thông tin bắt buộc!</p>";
                    return;
                }

                // Tạo đối tượng Blog mới dựa theo lớp Blog bạn đã định nghĩa
                Blog newBlog = new Blog
                {
                    id = Guid.NewGuid().ToString(),
                    title = title,
                    category = category,
                    img = imagePath,
                    ingredient = ingredientsStr,
                    time = time,
                    content = steps,
                    CreatedDate = DateTime.Now,
                    author = Session["Username"]?.ToString() ?? "Ẩn danh"
                };

                // Lấy danh sách Blog từ Application, nếu chưa có thì khởi tạo mới
                List<Blog> blogList = Application["BlogList"] as List<Blog>;
                if (blogList == null)
                {
                    blogList = new List<Blog>();
                }
                blogList.Add(newBlog);
                Application["BlogList"] = blogList;

                litMessage.Text = "<p style='color:green;'>Bài viết đã được đăng thành công!</p>";
                // Reset hidden field và mảng ingredients (nếu bạn muốn làm cho client cập nhật lại: Người dùng phải reload lại trang nếu phương pháp client hoàn toàn)
                hdnIngredients.Value = "";
            }
        }

        
    }
}
