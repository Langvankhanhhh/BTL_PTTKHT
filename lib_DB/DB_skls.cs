using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Text;

namespace lib_DB
{
    public class DB_skls
    {
        public string cnstr;
        public string get_infor(string data_get)
        {
            string json = "";
            try
            {

                using (SqlConnection conn = new SqlConnection(cnstr))
                {
                    conn.Open();
                    using (SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "SP_SKLS";
                        cmd.Parameters.Add("@action", SqlDbType.VarChar, 50).Value = "get_infor";
                        cmd.Parameters.Add("@data_get", SqlDbType.VarChar, 50).Value = data_get;
                        object result = cmd.ExecuteScalar();
                        json = (string)result;
                    }
                }
            }
            catch
            {
                json = "{\"ok\":0,\"msg\":\"Lỗi rồi\"}";
            }

            return json;
        }

        public string update(string id_sk, string ten_sk, string ma_ta, string nggay_batdau, string ngay_ketthuc, string loai_sk)
        {
            string json = "";

            try
            {
                using (SqlConnection conn = new SqlConnection(cnstr))
                {
                    conn.Open();
                    using (SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "SP_SKLS";
                        cmd.Parameters.Add("@action", SqlDbType.VarChar, 50).Value = "update";
                        cmd.Parameters.Add("@id_su_kien", SqlDbType.Int).Value = id_sk;
                        cmd.Parameters.Add("@mo_ta", SqlDbType.Int).Value = ma_ta;
                        cmd.Parameters.Add("@ngay_bat_dau", SqlDbType.Int).Value = nggay_batdau;
                        cmd.Parameters.Add("@ngay_ket_thuc", SqlDbType.Int).Value = ngay_ketthuc;
                        cmd.Parameters.Add("@loai_su_kien", SqlDbType.Int).Value = loai_sk;
                        object result = cmd.ExecuteScalar();
                        json = (string)result;
                    }
                }
            }
            catch (Exception ex)
            {
                json = "{\"ok\":0,\"msg\":\"Lỗi rồi: " + ex.Message + "\"}";
            }

            return json;
        }

        public string add(string id_sk, string ten_sk, string mo_ta,string ngay_batdau, string ngay_ketthuc, string loai_sk,string ten_nhan_vat, string ngay_sinh, string ngay_mat, string vai_tro, string mo_ta_nv,string ten_dia_diem, string vi_tri, string mo_ta_dd,string ten_thoi_diem, string ngay, string mo_ta_td)
        {
            string json = "";

            try
            {
                using (SqlConnection conn = new SqlConnection(cnstr))
                {
                    conn.Open();
                    using (SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "SP_ADD";

                        cmd.Parameters.Add("@action", SqlDbType.VarChar, 20).Value = "add";
                        cmd.Parameters.Add("@id_su_kien", SqlDbType.VarChar, 50).Value = id_sk;
                        cmd.Parameters.Add("@ten_su_kien", SqlDbType.NVarChar, 50).Value = ten_sk;
                        cmd.Parameters.Add("@mo_ta", SqlDbType.Text).Value = mo_ta;
                        cmd.Parameters.Add("@ngay_bat_dau", SqlDbType.Date).Value = ngay_batdau;
                        cmd.Parameters.Add("@ngay_ket_thuc", SqlDbType.Date).Value = ngay_ketthuc;
                        cmd.Parameters.Add("@loai_su_kien", SqlDbType.NVarChar, 50).Value = loai_sk;

                        cmd.Parameters.Add("@ten_nhan_vat", SqlDbType.NVarChar, 255).Value = ten_nhan_vat;
                        cmd.Parameters.Add("@ngay_sinh", SqlDbType.Date).Value = ngay_sinh;
                        cmd.Parameters.Add("@ngay_mat", SqlDbType.Date).Value = ngay_mat;
                        cmd.Parameters.Add("@vai_tro", SqlDbType.NVarChar, 100).Value = vai_tro;
                        cmd.Parameters.Add("@mo_ta_nv", SqlDbType.Text).Value = mo_ta_nv;

                        cmd.Parameters.Add("@ten_dia_diem", SqlDbType.NVarChar, 255).Value = ten_dia_diem;
                        cmd.Parameters.Add("@vi_tri", SqlDbType.NVarChar, 255).Value = vi_tri;
                        cmd.Parameters.Add("@mo_ta_dd", SqlDbType.Text).Value = mo_ta_dd;

                        cmd.Parameters.Add("@ten_thoi_diem", SqlDbType.NVarChar, 255).Value = ten_thoi_diem;
                        cmd.Parameters.Add("@ngay", SqlDbType.Date).Value = ngay;
                        cmd.Parameters.Add("@mo_ta_td", SqlDbType.Text).Value = mo_ta_td;

                        object result = cmd.ExecuteScalar();
                        json = (string)result;
                    }
                }
            }
            catch (Exception ex)
            {
                json = "{\"ok\":0,\"msg\":\"Lỗi rồi: " + ex.Message + "\"}";
            }

            return json;
        }


        public string delete(string id_sk)
        {
            string json = "";
            try
            {
                using (SqlConnection conn = new SqlConnection(cnstr))
                {
                    conn.Open();
                    using (SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "SP_DELETE";
                        cmd.Parameters.Add("@action", SqlDbType.VarChar, 50).Value = "delete";
                        cmd.Parameters.Add("@id_su_kien_delete", SqlDbType.VarChar, 50).Value = id_sk;
                        object result = cmd.ExecuteScalar();
                        json = (string)result;
                    }
                }
            }
            catch (Exception ex)
            {
                json = "{\"ok\":0,\"msg\":\"Lỗi rồi: " + ex.Message + "\"}";
            }
            return json;
        }
    }
}
