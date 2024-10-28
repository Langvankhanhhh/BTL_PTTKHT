using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web
{
    public partial class API : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string action = this.Request["action"];

            switch (action)
            {
                case "get_infor":
                    get_infor();
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
            string id_sk = this.Request["id_su_kien"]; 
            string ten_sk = this.Request["ten_su_kien"]; 
            string mo_ta = this.Request["mo_ta"]; 
            string ngay_batdau = this.Request["ngay_bat_dau"];
            string ngay_ketthuc = this.Request["ngay_ket_thuc"]; 
            string loai_sk = this.Request["loai_su_kien"];
            string ten_nhan_vat = this.Request["ten_nhan_vat"]; 
            string ngay_sinh = this.Request["ngay_sinh"]; 
            string ngay_mat = this.Request["ngay_mat"]; 
            string vai_tro = this.Request["vai_tro"]; 
            string mo_ta_nv = this.Request["mo_ta_nv"];
            string ten_dia_diem = this.Request["ten_dia_diem"]; 
            string vi_tri = this.Request["vi_tri"];
            string mo_ta_dd = this.Request["mo_ta_dd"]; 
            string ten_thoi_diem = this.Request["ten_thoi_diem"]; 
            string ngay = this.Request["ngay"]; 
            string mo_ta_td = this.Request["mo_ta_td"]; 

            lib_DB.DB_skls db = get_db();

            string json = db.add(
                id_sk, ten_sk, mo_ta,
                ngay_batdau, ngay_ketthuc, loai_sk,
                ten_nhan_vat, ngay_sinh, ngay_mat, vai_tro, mo_ta_nv,
                ten_dia_diem, vi_tri, mo_ta_dd,
                ten_thoi_diem, ngay, mo_ta_td
            );

            this.Response.Write(json);
        }


        void delete()
        {
            string id_sk = this.Request["id_su_kien_delete"];
            lib_DB.DB_skls db = get_db();
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

            lib_DB.DB_skls db = get_db();
            string json = db.update(id_sk, ten_sk, mo_ta, ngay_batdau, ngay_ketthuc, loai_sk);
            this.Response.Write(json);
        }

        void thong_bao_loi()
        {
            string rep = "{\"ok\":false,\"msg\":\"Lỗi rồi nhé, ko có action này!\"}";
            this.Response.Write(rep);
        }
        lib_DB.DB_skls get_db()
        {
            lib_DB.DB_skls db = new lib_DB.DB_skls();
            db.cnstr = "Data Source=KHANH\\SQLEXPRESS01;Initial Catalog=Ql_lichsu;Integrated Security=True;";
            return db;
        }


        void get_infor()
        {
            string data_get = this.Request["data_get"];
            lib_DB.DB_skls db = get_db();
            string json = db.get_infor(data_get);
            this.Response.Write(json);
        }

    }
}