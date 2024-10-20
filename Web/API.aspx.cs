using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web
{
    public partial class API : System.Web.UI.Page
    {
        private static string connectionString = "Data Source=.;Initial Catalog=QL_lichsu;Integrated Security=True";
        private static int loginAttempts = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            string action = this.Request["action"];

            switch (action)
            {
                case "get_infor":
                    get_status();
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


        void add()
        {
            string id_sk = this.Request["id_sk"];
            string ten_sk = this.Request["ten_sk"];
            string mo_ta = this.Request["mo_ta"];
            string ngay_batdau = this.Request["ngay_batdau"];
            string ngay_ketthuc = this.Request["ngay_ketthuc"];
            string loai_sk = this.Request["loai_sk"];

            Lib.DB_sk_ls db = get_db();
            string json = db.add(id_sk, ten_sk,mo_ta,ngay_batdau,ngay_ketthuc,loai_sk);
            this.Response.Write(json);
        }

        void delete()
        {
            string id_sk = this.Request["id_sk"];
            Lib.DB_sk_ls db = get_db();
            string json = db.delete(id_sk);
            this.Response.Write(json);
        }

        void update()
        {
            string id_sk = this.Request["id_sk"];
            string ten_sk = this.Request["ten_sk"];
            string mo_ta = this.Request["mo_ta"];
            string ngay_batdau = this.Request["ngay_batdau"];
            string ngay_ketthuc = this.Request["ngay_ketthuc"];
            string loai_sk = this.Request["loai_sk"];

            Lib.DB_sk_ls db = get_db();
            string json = db.update(id_sk, ten_sk, mo_ta, ngay_batdau, ngay_ketthuc, loai_sk);
            this.Response.Write(json);
        }

        void thong_bao_loi()
        {
            string rep = "{\"ok\":false,\"msg\":\"Lỗi rồi nhé, ko có action này!\"}";
            this.Response.Write(rep);
        }
        Lib.DB_sk_ls get_db()
        {
            Lib.DB_sk_ls db = new Lib.DB_sk_ls();
            db.cnstr = "Data Source=.;Initial Catalog=web_quan_ly_57kmt;Integrated Security=True;";
            return db;
        }


        void get_status()
        {
            Lib.DB_sk_ls db = get_db();
            string json = db.get_status();
            this.Response.Write(json);
        }

    }
}