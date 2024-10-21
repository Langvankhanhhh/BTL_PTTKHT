$(document).ready(function () {
    function loadTable() {
        var tbody = $("#infoTable").find('tbody');
        tbody.empty();
        tbody.append('<tr><td colspan="4">Dữ liệu trống</td></tr>');

        $.post('api.aspx', { action: 'get_infor' }, function (data) {
            tbody.empty();
            if (data.length > 0) {
                for (var i = 0; i < data.length; i++) {
                    var history = data[i];
                    var hangMoi = $("<tr></tr>");
                    hangMoi.append($("<td></td>").text(history.id_su_kien));
                    hangMoi.append($("<td></td>").text(history.ten_su_kien));
                    hangMoi.append($("<td></td>").text(history.mo_ta));
                    hangMoi.append($("<td></td>").text(history.ngay_bat_dau));
                    hangMoi.append($("<td></td>").text(history.ngay_ket_thuc));
                    hangMoi.append($("<td></td>").text(history.loai_su_kien));
                    hangMoi.append($("<td></td>").html(
                        `<button class="edit-btn" onclick="chinhSuaHang(${history.id_su_kien}, this)">Sửa</button>
                         <button class="delete-btn" onclick="xoaHang(${history.id_su_kien}, this)">Xóa</button>
                         <button class="history-btn" onclick="xemLs(${history.id_su_kien})">Lịch sử</button>`
                    ));
                    tbody.append(hangMoi);
                }
            } else {
                tbody.append('<tr><td colspan="4">Không có dữ liệu nào.</td></tr>');
            }
        }, 'json');
    }

    

    function themHang() {
        var ten = $("#nameInput").val();
        if (ten == '') {
            alert("Nhập tên đi");
            return;
        }
        $("#nameInput").val("");
        var viTri = parseInt($("#locationInput").val());

        $.post('api.aspx', { action: 'add', ten: ten, ma_vi_tri: viTri }, function (data) {
            if (data.ok) {
                $("#nameInput").val("");
                $("#locationInput").val("1");
                loadTable();
            } else {
                alert("Thêm thất bại");
            }
        }, 'json');
    }

    window.xoaHang = function (ma_thanh_vien, button) {
        $.post('api.aspx', { action: 'delete', ma_thanh_vien: ma_thanh_vien }, function (data) {
            if (data.ok) {
                $(button).closest('tr').remove();
            } else {
                alert('Xoá thất bại');
            }
        }, 'json');
    }

    window.chinhSuaHang = function (ma_thanh_vien, button) {
        var hang = $(button).closest('tr');
        var oViTri = hang.find('td').eq(2);
        var viTriHienTai = oViTri.text();

        oViTri.attr('data-vi-tri-cu', viTriHienTai);
        oViTri.html(`
            <select class='editable'>
                <option value='1' ${viTriHienTai === 'KTX' ? 'selected' : ''}>KTX</option>
                <option value='2' ${viTriHienTai === 'Nhà trọ' ? 'selected' : ''}>Nhà trọ</option>
                <option value='3' ${viTriHienTai === 'Trường' ? 'selected' : ''}>Trường</option>
                <option value='4' ${viTriHienTai === 'Chợ' ? 'selected' : ''}>Chợ</option>
                <option value='5' ${viTriHienTai === 'Không biết' ? 'selected' : ''}>Không biết</option>
            </select>
        `);

        $(button).replaceWith(`<button class='save-btn' onclick='luuHang(${ma_thanh_vien}, this)'>Lưu</button>`);
    }

    window.luuHang = function (ma_thanh_vien, button) {
        var hang = $(button).closest('tr');
        var viTri = parseInt(hang.find('select').val());

        $.post('api.aspx', { action: 'update', ma_thanh_vien: ma_thanh_vien, ma_vi_tri: viTri }, function (data) {
            if (data.ok) {
                hang.find('td').eq(1).text(getTenViTri(viTri));
                $(button).replaceWith(`<button class="edit-btn" onclick="chinhSuaHang(${ma_thanh_vien}, this)">Sửa</button>`);
            } else {
                alert('Chỉnh sửa thất bại');
            }
        }, 'json');
    }

   


    loadTable();

    //$(window).click(function (event) {
    //    if (event.target.id === "loginModal") {
    //        $("#loginModal").hide();
    //    }
    //});
});
