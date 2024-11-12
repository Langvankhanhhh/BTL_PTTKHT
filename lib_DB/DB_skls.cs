using System;
using System.Data;
using System.Data.SqlClient;

namespace lib_DB
{
    public class DB_skls
    {
        public string cnstr;
        string json = "";


        public string GetInfor()
        {
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
            catch (Exception ex)
            {
                json = "{\"ok\":0,\"msg\":\"Lỗi: " + ex.Message + "\"}";
            }
            return json;
        }

        public string AddSuKienLichSu(string idSuKien, string tenSuKien, string mo_ta, string ngayBatDau, string ngayKetThuc,string loai_su_kien)
        {
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
                        cmd.Parameters.Add("@loai", SqlDbType.VarChar, 50).Value = "SuKienLichSu";
                        cmd.Parameters.Add("@id_su_kien", SqlDbType.VarChar, 50).Value = idSuKien;
                        cmd.Parameters.Add("@ten_su_kien", SqlDbType.NVarChar, 255).Value = tenSuKien;
                        cmd.Parameters.Add("@mo_ta", SqlDbType.NVarChar, -1).Value = mo_ta;

                        if (DateTime.TryParse(ngayBatDau, out DateTime ngayDienRa) && ngayDienRa >= new DateTime(1753, 1, 1))
                        {
                            cmd.Parameters.Add("@ngay_bat_dau", SqlDbType.DateTime).Value = ngayDienRa;
                        }
                        else
                        {
                            throw new Exception("Ngày diễn ra không hợp lệ.");
                        }

                        if (DateTime.TryParse(ngayKetThuc, out DateTime ngayDungLai) && ngayDungLai >= new DateTime(1753, 1, 1))
                        {
                            cmd.Parameters.Add("@ngay_ket_thuc", SqlDbType.DateTime).Value = ngayDungLai;
                        }
                        else
                        {
                            throw new Exception("Ngày kết thúc không hợp lệ.");
                        }

                        cmd.Parameters.Add("@loai_su_kien", SqlDbType.NVarChar, 50).Value = loai_su_kien; 
                        object result = cmd.ExecuteScalar();
                        json = result != null ? result.ToString() : "{\"ok\":0,\"msg\":\"Không có kết quả trả về\"}";
                    }
                }
            }
            catch (Exception ex)
            {
                json = "{\"ok\":0,\"msg\":\"Lỗi: " + ex.Message + "\"}";
            }
            return json;
        }
         public string UpdateSuKienLichSu(string idSuKien, string tenSuKien, string mo_ta, string ngayBatDau, string ngayKetThuc,string loai_su_kien)
        {
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
                        cmd.Parameters.Add("@loai", SqlDbType.VarChar, 50).Value = "SuKienLichSu";
                        cmd.Parameters.Add("@id_su_kien", SqlDbType.VarChar, 50).Value = idSuKien;
                        cmd.Parameters.Add("@ten_su_kien", SqlDbType.NVarChar, 255).Value = tenSuKien;
                        cmd.Parameters.Add("@mo_ta", SqlDbType.NVarChar, -1).Value = mo_ta; 
                        cmd.Parameters.Add("@ngay_bat_dau", SqlDbType.Date).Value = DateTime.Parse(ngayBatDau); 
                        cmd.Parameters.Add("@ngay_ket_thuc", SqlDbType.Date).Value = DateTime.Parse(ngayKetThuc); 
                        cmd.Parameters.Add("@loai_su_kien", SqlDbType.NVarChar, 50).Value = loai_su_kien; 
                        object result = cmd.ExecuteScalar();
                        json = result != null ? result.ToString() : "{\"ok\":0,\"msg\":\"Không có kết quả trả về\"}";
                    }
                }
            }
            catch (Exception ex)
            {
                json = "{\"ok\":0,\"msg\":\"Lỗi: " + ex.Message + "\"}";
            }
            return json;
        }

      
        public string DeleteSuKienLichSu(string idSuKien)
        {
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
                        cmd.Parameters.Add("@loai", SqlDbType.VarChar, 50).Value = "SuKienLichSu";
                        cmd.Parameters.Add("@id_su_kien", SqlDbType.VarChar, 50).Value = idSuKien;
                        object result = cmd.ExecuteScalar();
                        json = (string)result;
                    }
                }
            }
            catch (Exception ex)
            {
                json = "{\"ok\":0,\"msg\":\"Lỗi: " + ex.Message + "\"}";
            }
            return json;
        }


        public string AddNhanVat(string idNhanVat, string tenNhanVat,string ngay_sinh, string ngay_mat, string vai_tro, string mo_ta_nv, string idSuKien)
        {
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
                        cmd.Parameters.Add("@loai", SqlDbType.VarChar, 50).Value = "NhanVatLanhDao";
                        cmd.Parameters.Add("@id_nhan_vat", SqlDbType.VarChar, 50).Value = idNhanVat;
                        cmd.Parameters.Add("@ten_nhan_vat", SqlDbType.NVarChar, 255).Value = tenNhanVat;

                        DateTime ngaySinhRa;
                        if (DateTime.TryParse(ngay_sinh, out ngaySinhRa) && ngaySinhRa >= new DateTime(1753, 1, 1))
                        {
                            cmd.Parameters.Add("@ngay_sinh", SqlDbType.DateTime).Value = ngaySinhRa;
                        }
                        else
                        {
                            throw new Exception("Ngày diễn ra không hợp lệ.");
                        }
                         DateTime ngayMatDi;
                        if (DateTime.TryParse(ngay_sinh, out ngayMatDi) && ngayMatDi >= new DateTime(1753, 1, 1))
                        {
                            cmd.Parameters.Add("@ngay_mat", SqlDbType.DateTime).Value = ngayMatDi;
                        }
                        else
                        {
                            throw new Exception("Ngày diễn ra không hợp lệ.");
                        }

                        cmd.Parameters.Add("@vai_tro", SqlDbType.NVarChar, 100).Value = vai_tro;
                        cmd.Parameters.Add("@mo_ta_nv", SqlDbType.NVarChar, -1).Value = mo_ta_nv;
                        cmd.Parameters.Add("@id_su_kien", SqlDbType.VarChar, 50).Value = idSuKien;
                        object result = cmd.ExecuteScalar();
                        json = (string)result;
                    }
                }
            }
            catch (Exception ex)
            {
                json = "{\"ok\":0,\"msg\":\"Lỗi: " + ex.Message + "\"}";
            }
            return json;
        }
        public string UpdateNhanVat(string idNhanVat, string tenNhanVat,string ngay_sinh, string ngay_mat, string vai_tro, string mo_ta_nv, string idSuKien)
        {
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
                        cmd.Parameters.Add("@loai", SqlDbType.VarChar, 50).Value = "NhanVatLanhDao";
                        cmd.Parameters.Add("@id_nhan_vat", SqlDbType.VarChar, 50).Value = idNhanVat;
                        cmd.Parameters.Add("@ten_nhan_vat", SqlDbType.NVarChar, 255).Value = tenNhanVat;

                        DateTime ngaySinhRa;
                        if (DateTime.TryParse(ngay_sinh, out ngaySinhRa) && ngaySinhRa >= new DateTime(1753, 1, 1))
                        {
                            cmd.Parameters.Add("@ngay_sinh", SqlDbType.DateTime).Value = ngaySinhRa;
                        }
                        else
                        {
                            throw new Exception("Ngày diễn ra không hợp lệ.");
                        }
                        DateTime ngayMatDi;
                        if (DateTime.TryParse(ngay_sinh, out ngayMatDi) && ngayMatDi >= new DateTime(1753, 1, 1))
                        {
                            cmd.Parameters.Add("@ngay_mat", SqlDbType.DateTime).Value = ngayMatDi;
                        }
                        else
                        {
                            throw new Exception("Ngày diễn ra không hợp lệ.");
                        }

                        cmd.Parameters.Add("@vai_tro", SqlDbType.NVarChar, 100).Value = vai_tro;
                        cmd.Parameters.Add("@mo_ta_nv", SqlDbType.NVarChar, -1).Value = mo_ta_nv;
                        cmd.Parameters.Add("@id_su_kien", SqlDbType.VarChar, 50).Value = idSuKien;
                        object result = cmd.ExecuteScalar();
                        json = (string)result;
                    }
                }
            }
            catch (Exception ex)
            {
                json = "{\"ok\":0,\"msg\":\"Lỗi: " + ex.Message + "\"}";
            }
            return json;
        }

      
        public string DeleteNhanVat(string idNhanVat , string idSuKien)
        {
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
                        cmd.Parameters.Add("@loai", SqlDbType.VarChar, 50).Value = "NhanVatLanhDao";
                        cmd.Parameters.Add("@id_nhan_vat", SqlDbType.VarChar, 50).Value = idNhanVat;
                        cmd.Parameters.Add("@id_su_kien", SqlDbType.VarChar, 50).Value = idSuKien;
                        object result = cmd.ExecuteScalar();
                        json = (string)result;
                    }
                }
            }
            catch (Exception ex)
            {
                json = "{\"ok\":0,\"msg\":\"Lỗi: " + ex.Message + "\"}";
            }
            return json;
        }

        public string AddDienBien(string idDienBien, string tenDienBien, string mo_ta_dien_bien, string ngay, string vi_tri_dien_ra, string idSuKien)
        {
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
                        cmd.Parameters.Add("@loai", SqlDbType.VarChar, 50).Value = "DienBienLichSu";
                        cmd.Parameters.Add("@id_dien_bien", SqlDbType.VarChar, 50).Value = idDienBien;
                        cmd.Parameters.Add("@ten_dien_bien", SqlDbType.NVarChar, 255).Value = tenDienBien;
                        cmd.Parameters.Add("@mo_ta_dien_bien", SqlDbType.NVarChar, -1).Value = mo_ta_dien_bien;

                        DateTime ngayDienRa;
                        if (DateTime.TryParse(ngay, out ngayDienRa) && ngayDienRa >= new DateTime(1753, 1, 1))
                        {
                            cmd.Parameters.Add("@ngay", SqlDbType.DateTime).Value = ngayDienRa;
                        }
                        else
                        {
                            throw new Exception("Ngày diễn ra không hợp lệ.");
                        }

                        cmd.Parameters.Add("@vi_tri_dien_ra", SqlDbType.NVarChar, 255).Value = vi_tri_dien_ra;
                        cmd.Parameters.Add("@id_su_kien", SqlDbType.VarChar, 50).Value = idSuKien;

                        object result = cmd.ExecuteScalar();
                        json = (string)result;
                    }
                }
            }
            catch (Exception ex)
            {
                json = "{\"ok\":0,\"msg\":\"Lỗi: " + ex.Message + "\"}";
            }
            return json;
        }

        public string UpdateDienBien(string idDienBien, string tenDienBien,string mo_ta_dien_bien, string ngay ,string vi_tri_dien_ra ,string idSuKien)
        {
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
                        cmd.Parameters.Add("@loai", SqlDbType.VarChar, 50).Value = "DienBienLichSu";
                        cmd.Parameters.Add("@id_dien_bien", SqlDbType.VarChar, 50).Value = idDienBien;
                        cmd.Parameters.Add("@ten_dien_bien", SqlDbType.NVarChar, 255).Value = tenDienBien;
                        cmd.Parameters.Add("@mo_ta_dien_bien", SqlDbType.NVarChar, -1).Value = mo_ta_dien_bien;

                        DateTime ngayDienRa;
                        if (DateTime.TryParse(ngay, out ngayDienRa) && ngayDienRa >= new DateTime(1753, 1, 1))
                        {
                            cmd.Parameters.Add("@ngay", SqlDbType.DateTime).Value = ngayDienRa;
                        }
                        else
                        {
                            throw new Exception("Ngày diễn ra không hợp lệ.");
                        }
                        cmd.Parameters.Add("@vi_tri_dien_ra", SqlDbType.NVarChar, 255).Value = vi_tri_dien_ra;
                        cmd.Parameters.Add("@id_su_kien", SqlDbType.VarChar, 50).Value = idSuKien;

                        object result = cmd.ExecuteScalar();
                        json = (string)result;
                    }
                }
            }
            catch (Exception ex)
            {
                json = "{\"ok\":0,\"msg\":\"Lỗi: " + ex.Message + "\"}";
            }
            return json;
        }

    
        public string DeleteDienBien(string idDienBien ,string idSuKien)
        {
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
                        cmd.Parameters.Add("@loai", SqlDbType.VarChar, 50).Value = "DienBienLichSu";
                        cmd.Parameters.Add("@id_dien_bien", SqlDbType.VarChar, 50).Value = idDienBien;
                        cmd.Parameters.Add("@id_su_kien", SqlDbType.VarChar, 50).Value = idSuKien;

                        object result = cmd.ExecuteScalar();
                        json = (string)result;
                    }
                }
            }
            catch (Exception ex)
            {
                json = "{\"ok\":0,\"msg\":\"Lỗi: " + ex.Message + "\"}";
            }
            return json;
        }

        public string AddLucLuongThamGia(string id_luc_luong_tham_gia, string tenLucLuong, string mo_ta_luc_luong_tham_gia, string id_dien_bien)
        {
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
                        cmd.Parameters.Add("@loai", SqlDbType.VarChar, 50).Value = "LucLuongThamGia";
                        cmd.Parameters.Add("@id_luc_luong_tham_gia", SqlDbType.VarChar, 50).Value = id_luc_luong_tham_gia;
                        cmd.Parameters.Add("@ten_luc_luong_tham_gia", SqlDbType.NVarChar, 255).Value = tenLucLuong;
                        cmd.Parameters.Add("@mo_ta_luc_luong_tham_gia", SqlDbType.NVarChar, -1).Value = mo_ta_luc_luong_tham_gia;
                        cmd.Parameters.Add("@id_dien_bien", SqlDbType.VarChar, 50).Value = id_dien_bien;

                        object result = cmd.ExecuteScalar();
                        json = (string)result;
                    }
                }
            }
            catch (Exception ex)
            {
                json = "{\"ok\":0,\"msg\":\"Lỗi: " + ex.Message + "\"}";
            }
            return json;
        }
         public string UpdateLucLuongThamGia(string id_luc_luong_tham_gia, string tenLucLuong, string mo_ta_luc_luong_tham_gia, string idSuKien)
        {
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
                        cmd.Parameters.Add("@loai", SqlDbType.VarChar, 50).Value = "LucLuongThamGia";
                        cmd.Parameters.Add("@id_luc_luong_tham_gia", SqlDbType.VarChar, 50).Value = id_luc_luong_tham_gia;
                        cmd.Parameters.Add("@ten_luc_luong_tham_gia", SqlDbType.NVarChar, 255).Value = tenLucLuong;
                        cmd.Parameters.Add("@mo_ta_luc_luong_tham_gia", SqlDbType.NVarChar, -1).Value = mo_ta_luc_luong_tham_gia;
                        cmd.Parameters.Add("@id_su_kien", SqlDbType.VarChar, 50).Value = idSuKien;

                        object result = cmd.ExecuteScalar();
                        json = (string)result;
                    }
                }
            }
            catch (Exception ex)
            {
                json = "{\"ok\":0,\"msg\":\"Lỗi: " + ex.Message + "\"}";
            }
            return json;
        }
   
        public string DeleteLucLuongThamGia(string id_luc_luong_tham_gia, string idSuKien)
        {
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
                        cmd.Parameters.Add("@loai", SqlDbType.VarChar, 50).Value = "LucLuongThamGia";
                        cmd.Parameters.Add("@id_luc_luong_tham_gia", SqlDbType.VarChar, 50).Value = id_luc_luong_tham_gia;
                        cmd.Parameters.Add("@id_su_kien", SqlDbType.VarChar, 50).Value = idSuKien;

                        object result = cmd.ExecuteScalar();
                        json = (string)result;
                    }
                }
            }
            catch (Exception ex)
            {
                json = "{\"ok\":0,\"msg\":\"Lỗi: " + ex.Message + "\"}";
            }
            return json;
        }
        public string timkiem(string timkiem)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(cnstr))
                {
                    conn.Open();
                    using (SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "SP_SKLS";
                        cmd.Parameters.Add("@action", SqlDbType.VarChar, 50).Value = "timkiem";
                        cmd.Parameters.Add("@timkiem", SqlDbType.NVarChar, 255).Value = timkiem;

                        object result = cmd.ExecuteScalar();
                        json = (string)result;
                    }
                }
            }
            catch (Exception ex)
            {
                json = "{\"ok\":0,\"msg\":\"Lỗi: " + ex.Message + "\"}";
            }
            return json;
        }


        public string login(string uid, string pass)
        {
            string json = "";
            {
                try
                {
                    using (SqlConnection conn = new SqlConnection(cnstr))
                    {
                        conn.Open();
                        using (SqlCommand cmd = conn.CreateCommand())
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.CommandText = "SP_ngdung";
                            cmd.Parameters.Add("@action", SqlDbType.VarChar, 50).Value = "login";
                            cmd.Parameters.Add("@uid", SqlDbType.VarChar, 50).Value = uid;
                            cmd.Parameters.Add("@passLogIn", SqlDbType.VarChar, 50).Value = pass;
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

        public string dangky(string uid, string pwd, string name,string gmail, string dienthoai)
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
                        cmd.CommandText = "SP_ngdung";
                        cmd.Parameters.Add("@action", SqlDbType.VarChar, 50).Value = "dangky";
                        cmd.Parameters.Add("@user", SqlDbType.VarChar, 50).Value = uid;
                        cmd.Parameters.Add("@pass", SqlDbType.VarChar, 50).Value = pwd;
                        cmd.Parameters.Add("@name", SqlDbType.NVarChar, 100).Value = name;
                        cmd.Parameters.Add("@gmail", SqlDbType.VarChar, 100).Value = gmail;
                        cmd.Parameters.Add("@dienthoai", SqlDbType.VarChar, 20).Value = dienthoai;
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
