using System;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using lib_DB;
using Newtonsoft.Json.Linq;

namespace Web
{
    public partial class API : System.Web.UI.Page
    {
        Boolean IsLoggedIn = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            string action = this.Request["action"];
            switch (action)
            {
                case "dangky":
                    dangky();
                    break;
                case "login":
                    login();
                    break;
                case "check_login":
                    check_login();
                    break;
                case "logout":
                    logout();
                    break;
                case "get_infor":
                    get_infor();
                    break;
                case "timkiem":
                    timkiem();
                    break;
                case "add":
                    add();
                    break;
                case "delete":
                    delete();
                    break;
                case "update":
                    update();
                    break;
                default:
                    thong_bao_loi();
                    break;
            }
        }
        void dangky()
        {
            string user = Request.Form["user"];
            string pass = Request.Form["pass"];
            string name = Request.Form["name"];
            string gmail = Request.Form["gmail"];
            string dienthoai = Request.Form["dienthoai"];
            DB_skls db = get_db();
            string json = db.dangky(user, pass, name, gmail, dienthoai);
            this.Response.Write(json);
        }
        void login()
        {
            string uid = this.Request["uid"];
            string pass = this.Request["passLogIn"];

            DB_skls db = get_db();
            string json = db.login(uid, pass);
            this.Response.Write(json);

            if (json.Contains("\"ok\":1"))
            {
                IsLoggedIn = true;
                Session["IsLoggedIn"] = IsLoggedIn;
                Session["username"] = uid;

                var userInfo = JObject.Parse(json);
                Session["name"] = userInfo["name"].ToString();
                Session["level"] = (int)userInfo["level"];
                Session["gmail"] = userInfo["gmail"].ToString();
                Session["dienthoai"] = userInfo["dienthoai"].ToString();
                Session["lastLogin"] = userInfo["lastLogin"].ToString();
            }
        }

        void check_login()
        {
            if (Session["username"] != null)
            {
                string username = Session["username"].ToString();
                string name = Session["name"] != null ? Session["name"].ToString() : "Không có tên";
                string level = Session["level"] != null ? Session["level"].ToString() : "Không có cấp độ";
                string gmail = Session["gmail"] != null ? Session["gmail"].ToString() : "Không có gmail";
                string dienthoai = Session["dienthoai"] != null ? Session["dienthoai"].ToString() : "Không có điện thoại";
                string lastLogin = Session["lastLogin"] != null ? Session["lastLogin"].ToString() : "Chưa có đăng nhập trước";

                this.Response.Write($"{{\"ok\":1, \"username\":\"{username}\", \"name\":\"{name}\", \"level\":\"{level}\", \"gmail\":\"{gmail}\", \"dienthoai\":\"{dienthoai}\", \"lastLogin\":\"{lastLogin}\"}}");
            }
            else
            {
                this.Response.Write("{\"ok\":0, \"msg\":\"Chưa đăng nhập\"}");
            }
        }
        void logout()
        {
            IsLoggedIn = false;
            Session.Abandon();
            Response.Write("{\"ok\":1, \"msg\":\"Đăng xuất thành công.\"}");
        }
        void timkiem()
        {
            string timkiem = Request.Form["timkiem"];
            DB_skls db = get_db();
            string json = db.timkiem(timkiem);
            this.Response.Write(json);
        }
        void add()
        {
            string loai = this.Request["loai"];
            DB_skls db = get_db();
            string json = "";

            switch (loai)
            {
                case "SuKienLichSu":
                    json = db.AddSuKienLichSu(
                       this.Request["id_su_kien"],
                        this.Request["ten_su_kien"],
                        this.Request["mo_ta"],
                        this.Request["ngay_bat_dau"],
                        this.Request["ngay_ket_thuc"],
                        this.Request["loai_su_kien"]
                    );
                    break;
                case "NhanVatLanhDao":
                    json = db.AddNhanVat(
                        this.Request["id_nhan_vat"],
                        this.Request["ten_nhan_vat"],
                        this.Request["ngay_sinh"],
                        this.Request["ngay_mat"],
                        this.Request["vai_tro"],
                        this.Request["mo_ta_nv"],
                        this.Request["id_su_kien"]
                    );
                    break;
                case "DienBienLichSu":
                    json = db.AddDienBien(
                        this.Request["id_dien_bien"],
                        this.Request["ten_dien_bien"],
                        this.Request["mo_ta_dien_bien"],
                        this.Request["ngay"],
                        this.Request["vi_tri_dien_ra"],
                        this.Request["id_su_kien"]
                    );
                    break;
                case "LucLuongThamGia":
                    json = db.AddLucLuongThamGia(
                        this.Request["id_luc_luong_tham_gia"],
                        this.Request["ten_luc_luong_tham_gia"],
                        this.Request["mo_ta_luc_luong_tham_gia"],
                        this.Request["id_dien_bien"]
                    );
                    break;
                default:
                    thong_bao_loi();
                    return;
            }

            this.Response.Write(json);
        }

        void delete()
        {
            string loai = this.Request["loai"];
            DB_skls db = get_db();
            string json = "";

            switch (loai)
            {
                case "SuKienLichSu":
                    json = db.DeleteSuKienLichSu(this.Request["id_su_kien"]);
                    break;
                case "NhanVatLanhDao":
                    json = db.DeleteNhanVat(this.Request["id_nhan_vat"], this.Request["id_su_kien"]);
                    break;
                case "DienBienLichSu":
                    json = db.DeleteDienBien(this.Request["id_dien_bien"], this.Request["id_su_kien"]);
                    break;
                case "LucLuongThamGia":
                    json = db.DeleteLucLuongThamGia(this.Request["id_luc_luong_tham_gia"], this.Request["id_su_kien"]);
                    break;
                default:
                    thong_bao_loi();
                    return;
            }

            this.Response.Write(json);
        }

        void update()
        {
            string loai = this.Request["loai"];
            DB_skls db = get_db();
            string json = "";

            switch (loai)
            {
                case "SuKienLichSu":
                    json = db.UpdateSuKienLichSu(
                        this.Request["id_su_kien"],
                        this.Request["ten_su_kien"],
                        this.Request["mo_ta"],
                        this.Request["ngay_bat_dau"],
                        this.Request["ngay_ket_thuc"],
                        this.Request["loai_su_kien"]
                    );
                    break;
                case "NhanVat":
                    json = db.UpdateNhanVat(
                        this.Request["id_nhan_vat"],
                        this.Request["ten_nhan_vat"],
                        this.Request["ngay_sinh"],
                        this.Request["ngay_mat"],
                        this.Request["vai_tro"],
                        this.Request["mo_ta_nv"],
                        this.Request["id_su_kien"]
                    );
                    break;
                case "DienBien":
                    json = db.UpdateDienBien(
                        this.Request["id_dien_bien"],
                        this.Request["ten_dien_bien"],
                        this.Request["mo_ta_dien_bien"],
                        this.Request["ngay"],
                        this.Request["vi_tri_dien_ra"],
                        this.Request["id_su_kien"]
                    );
                    break;
                case "LucLuongThamGia":
                    json = db.UpdateLucLuongThamGia(
                        this.Request["id_luc_luong_tham_gia"],
                        this.Request["ten_luc_luong_tham_gia"],
                        this.Request["mo_ta_luc_luong_tham_gia"],
                        this.Request["id_su_kien"]
                    );
                    break;
                default:
                    thong_bao_loi();
                    return;
            }

            this.Response.Write(json);
        }

        void thong_bao_loi()
        {
            string rep = "{\"ok\":false,\"msg\":\"Lỗi rồi nhé, ko có action này!\"}";
            this.Response.Write(rep);
        }

        DB_skls get_db()
        {
            DB_skls db = new DB_skls();
            db.cnstr = "Data Source=KHANH\\SQLEXPRESS01;Initial Catalog=Ql_lichsu;Integrated Security=True;";
            return db;
        }

        void get_infor()
        {
            DB_skls db = get_db();
            string json = db.GetInfor();
            this.Response.Write(json);
        }
    }
}
