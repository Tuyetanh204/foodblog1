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
            // Không cần xử lý nguyên liệu tại server vì toàn bộ quản lý được thực hiện ở phía client qua hidden field.
        }

        // Xử lý nút "Đăng bài"
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Lấy dữ liệu từ các trường nhập liệu khi submit
            string title = txtTitle.Text.Trim();
            string category = ddlCategory.SelectedValue;
            string time = txtTime.Text.Trim();
            string steps = txtSteps.Text.Trim();

            string imagePath = "";
            if (fileImage.HasFile)
            {
                string fileName = fileImage.FileName;
                // Lưu ảnh vào thư mục "img"
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

            // Reset lại các trường nhập liệu
            txtTitle.Text = "";
            ddlCategory.SelectedIndex = 0;
            txtTime.Text = "";
            txtSteps.Text = "";
            // Reset hidden field và mảng ingredients (nếu bạn muốn làm cho client cập nhật lại: Người dùng phải reload lại trang nếu phương pháp client hoàn toàn)
            hdnIngredients.Value = "";
        }
    }
}
