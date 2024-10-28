$(document).ready(function () {
    function loadTable() {
        var container = $("#skls");
        container.empty();
        container.append('<div>Đang tải dữ liệu...</div>');
        var dataSKLS = [];
        var dataDD = [];
        var dataNV = [];
        var dataTDQT = [];
        $.post('API.aspx', { action: 'get_infor', data_get: 'dd' }, function (data) {
            dataDD = data;
        }, 'json');
        $.post('API.aspx', { action: 'get_infor', data_get: 'nv' }, function (data) {
            dataNV = data;
        }, 'json');
        $.post('API.aspx', { action: 'get_infor', data_get: 'tdqt' }, function (data) {
            dataTDQT = data;
        }, 'json');
        $.post('API.aspx', { action: 'get_infor', data_get: "skls" }, function (data) {
            container.empty();
            if (data.length > 0) {
                for (var i = 0; i < data.length; i++) {
                    var history = data[i];
                    var eventDiv = $("<div class='event'></div>");
                    eventDiv.append($("<div></div>").text("ID Sự Kiện: " + history.id_su_kien));
                    eventDiv.append($("<div></div>").text("Tên Sự Kiện: " + history.ten_su_kien));
                    eventDiv.append($("<div></div>").text("Mô Tả: " + history.mo_ta));
                    eventDiv.append($("<div></div>").text("Ngày Bắt Đầu: " + history.ngay_bat_dau));
                    eventDiv.append($("<div></div>").text("Ngày Kết Thúc: " + history.ngay_ket_thuc));
                    eventDiv.append($("<div></div>").text("Loại Sự Kiện: " + history.loai_su_kien));
                    for (var j = 0; j < dataNV.length; j++) {
                        var nv = dataNV[j];
                        if (history.id_nhan_vat == nv.id_nhan_vat) {
                            eventDiv.append($("<div></div>").text("Nhân Vật Liên Quan: " + nv.ten_nhan_vat));
                            eventDiv.append($("<div></div>").text("Ngày Sinh: " + nv.ngay_sinh));
                            eventDiv.append($("<div></div>").text("Ngày Mất: " + nv.ngay_mat));
                            eventDiv.append($("<div></div>").text("Vai Trò: " + nv.vai_tro));
                            eventDiv.append($("<div></div>").text("Giới Thiệu Nhân Vật: " + nv.mo_ta_nv));
                            break;
                        }
                    }
                    for (var k = 0; k < dataDD.length; k++) {
                        var dd = dataDD[k];
                        if (history.id_dia_diem == dd.id_dia_diem) {
                            eventDiv.append($("<div></div>").text("Địa Điểm Diễn Ra: " + dd.ten_dia_diem));
                            eventDiv.append($("<div></div>").text("Mô Tả Địa Điểm Diễn Ra: " + dd.mo_ta_dd));
                            eventDiv.append($("<div></div>").text("Vị Trí Cụ Thể Của Địa Điểm: " + dd.vi_tri));
                            break;
                        }
                    }
                    for (var h = 0; h < dataTDQT.length; h++) {
                        var tdqt = dataTDQT[h];
                        if (history.id_thoi_diem == dd.id_thoi_diem) {
                            eventDiv.append($("<div></div>").text("Thời Điểm Quan Trọng: " + tdqt.ten_thoi_diem));
                            eventDiv.append($("<div></div>").text("Diễn Biến Thời Điểm Quan Trọng: " + tdqt.mo_ta_td));
                            eventDiv.append($("<div></div>").text("Thời Gian Diễn Ra Sự Kiện Quan Trọng: " + tdqt.ngay));
                            break;
                        }
                    }
                    eventDiv.append($("<div></div>").html(
                        `<button class="delete-btn" onclick="XoaHang('${history.id_su_kien}',this)">Xóa</button>
                        <button class="edit-btn" onclick="chinhSuaHang('${history.id_su_kien}', this)">Sửa</button>
                        `
                    ));

                    container.append(eventDiv);
                }
            } else {
                container.append('<div>Không có dữ liệu nào.</div>');
            }
        }, 'json');
    }

    function themHang() {
        var idSuKien = $("#idInput").val();
        var ten = $("#tenInput").val();
        var mota = $("#motaInput").val();
        var ngaybd = $("#ngaybdInput").val();
        var ngaykt = $("#ngayktInput").val();
        var loaisk = $("#loaiInput").val();

        var tenNhanVat = $("#tennvInput").val();
        var ngaySinh = $("#ngaysinhInput").val();
        var ngayMat = $("#ngaymatInput").val();
        var vaiTro = $("#vaitroInput").val();
        var moTaNV = $("#motanvInput").val();

        var tenDiaDiem = $("#tenddInput").val();
        var viTri = $("#vitriddInput").val();
        var moTaDD = $("#motaddInput").val();

        var tenThoiDiem = $("#tentdqtInput").val();
        var thoiDiem = $("#thoiDiemtdqtInput").val();
        var moTaTDQT = $("#motatdqtInput").val();

        $.post('API.aspx', {
            action: 'add',
            id_su_kien: idSuKien,
            ten_su_kien: ten,
            mo_ta: mota,
            ngay_bat_dau: ngaybd,
            ngay_ket_thuc: ngaykt,
            loai_su_kien: loaisk,
            ten_nhan_vat: tenNhanVat,
            ngay_sinh: ngaySinh,
            ngay_mat: ngayMat,
            vai_tro: vaiTro,
            mo_ta_nv: moTaNV,
            ten_dia_diem: tenDiaDiem,
            vi_tri: viTri,
            mo_ta_dd: moTaDD,
            ten_thoi_diem: tenThoiDiem,
            ngay: thoiDiem,
            mo_ta_td: moTaTDQT
        }, function (data) {
            if (data.ok) {
                alert("Đã Thêm Thành Công", 'success');
                loadTable();
            } else {
                alert("Thêm thất bại");
            }
        }, 'json');
    }



    window.XoaHang = function (id_su_kien, button) {
        $.post('API.aspx', { action: 'delete', id_su_kien_delete: id_su_kien }, function (data) {
            if (data.ok) {
                alert("Đã Xóa Thành Công", 'success');
                loadTable();
            } else {
                alert('Xoá thất bại');
            }
        }, 'json');
    };

    window.chinhSuaHang = function (id_su_kien, button) {
        var container = $(button).closest('.event');
        var moTa = container.find('div').eq(2).text().replace('Mô Tả: ', '');
        container.find('div').eq(2).html(`<input type='text' value='${moTa}' />`);
        $(button).replaceWith(`<button class='save-btn' onclick='luuHang(${id_su_kien}, this)'>Lưu</button>`);
    }

    window.luuHang = function (id_su_kien, button) {
        var container = $(button).closest('.event');
        var moTa = container.find('input').val();

        $.post('api.aspx', { action: 'update', id_su_kien: id_su_kien, mo_ta: moTa }, function (data) {
            if (data.ok) {
                loadTable();
            } else {
                alert('Chỉnh sửa thất bại');
            }
        }, 'json');
    }

    $("#addBtn").click(themHang);

    loadTable();
});
