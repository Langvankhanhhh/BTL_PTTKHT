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
        public string get_status()
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

        public string add(string id_sk, string ten_sk, string mo_ta, string ngay_batdau, string ngay_ketthuc, string loai_sk)
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
                        cmd.Parameters.Add("@action", SqlDbType.VarChar, 50).Value = "add";
                        cmd.Parameters.Add("@id_su_kien", SqlDbType.Int).Value = id_sk;
                        cmd.Parameters.Add("@ten_su_kien", SqlDbType.Int).Value = ten_sk;
                        cmd.Parameters.Add("@mo_ta", SqlDbType.Int).Value = mo_ta;
                        cmd.Parameters.Add("@ngay_bat_dau", SqlDbType.Int).Value = ngay_batdau;
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
                        cmd.CommandText = "SP_SKLS";
                        cmd.Parameters.Add("@action", SqlDbType.VarChar, 50).Value = "delete";
                        cmd.Parameters.Add("@id_su_kien", SqlDbType.Int).Value = id_sk;
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
