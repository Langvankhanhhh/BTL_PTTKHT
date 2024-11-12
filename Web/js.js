$(document).ready(function () {
    function loadTable() {
        var container = $("#skls");
        container.empty();
        container.append('<div>Đang tải dữ liệu...</div>');

        $.post('API.aspx', { action: 'get_infor' }, function (data) {
            container.empty();
            if (data.length > 0) {
                data.forEach(function (item) {
                    var eventDiv = $("<div class='event'></div>");
                    eventDiv.append($("<div class='event-id'></div>").text("ID Sự Kiện: " + item.id_su_kien));
                    eventDiv.append($("<div class='event-name'></div>").text("Tên Sự Kiện: " + item.ten_su_kien));
                    eventDiv.append($("<div class='event-desc'></div>").text("Mô Tả: " + item.mo_ta));
                    eventDiv.append($("<div class='event-start'></div>").text("Ngày Bắt Đầu: " + item.ngay_bat_dau));
                    eventDiv.append($("<div class='event-end'></div>").text("Ngày Kết Thúc: " + item.ngay_ket_thuc));
                    eventDiv.append($("<div class='event-type'></div>").text("Loại Sự Kiện: " + item.loai_su_kien));
                    eventDiv.append($("<div></div>").html(`
                    <button class="delete-btn" onclick="xoask('${item.id_su_kien}', this)">Xóa</button>
                    <button class="edit-btn" onclick="suask('${item.id_su_kien}', this)">Sửa</button>
                    <button class="add-btn" onclick="themnhanvat('${item.id_su_kien}', this)">Thêm Nhân Vật</button>
                    <button class="add-btn" onclick="themdienbien('${item.id_su_kien}', this)">Thêm Diễn Biến</button>
                `));

                    if (item.nhan_vat_lanh_dao && item.nhan_vat_lanh_dao.length > 0) {
                        var nhanVatDiv = $("<div></div>").text("Nhân Vật Lãnh Đạo:");
                        item.nhan_vat_lanh_dao.forEach(function (nv) {
                            nhanVatDiv.append($("<div></div>").text("   ID Nhân Vật: " + nv.id_nhan_vat));
                            nhanVatDiv.append($("<div></div>").text("   Tên Nhân Vật: " + nv.ten_nhan_vat));
                            nhanVatDiv.append($("<div></div>").text("   Ngày Sinh: " + nv.ngay_sinh));
                            nhanVatDiv.append($("<div></div>").text("   Vai Trò: " + nv.vai_tro));
                            nhanVatDiv.append($("<div></div>").text("   Mô Tả: " + nv.mo_ta_nv));
                            nhanVatDiv.append($("<div></div>").html(`
                            <button class="delete-btn" onclick="xoanhanvat('${item.id_su_kien}', '${nv.id_nhan_vat}', this)">Xóa</button>
                            <button class="edit-btn" onclick="suanhanvat('${item.id_su_kien}', '${nv.id_nhan_vat}', this)">Sửa</button>
                        `));
                        });
                        eventDiv.append(nhanVatDiv);
                    }

                    if (item.dien_bien_lich_su && item.dien_bien_lich_su.length > 0) {
                        var dienBienDiv = $("<div class='dien-bien'></div>").text("Diễn Biến Lịch Sử:");
                        item.dien_bien_lich_su.forEach(function (db) {
                            var dbDiv = $("<div class='dien-bien'></div>");
                            dbDiv.append($("<div></div>").text("   Tên Diễn Biến: " + db.ten_dien_bien));
                            dbDiv.append($("<div></div>").text("   Mô Tả: " + db.mo_ta_dien_bien));
                            dbDiv.append($("<div></div>").text("   Ngày: " + db.ngay));
                            dbDiv.append($("<div></div>").text("   Vị Trí Diễn Ra: " + db.vi_tri_dien_ra));
                            dbDiv.append($("<div></div>").html(`
                            <button class="delete-btn" onclick="xoadienbien('${item.id_su_kien}', '${db.id_dien_bien}', this)">Xóa</button>
                            <button class="edit-btn" onclick="suadienbien('${item.id_su_kien}', '${db.id_dien_bien}', this)">Sửa</button>
                            <button class="add-btn" onclick="themlucluong('${db.id_dien_bien}', this)">Thêm Lực Lượng</button>
                        `));

                            if (db.luc_luong_tham_gia && db.luc_luong_tham_gia.length > 0) {
                                var lucLuongDiv = $('<div class="luc-luong"></div>').text("Lực Lượng Tham Gia:");
                                db.luc_luong_tham_gia.forEach(function (ll) {
                                    lucLuongDiv.append($("<div></div>").text("   Mã Lực Lượng: " + ll.id_luc_luong_tham_gia));
                                    lucLuongDiv.append($("<div></div>").text("   Tên Lực Lượng: " + ll.ten_luc_luong_tham_gia));
                                    lucLuongDiv.append($("<div></div>").text("   Mô Tả: " + ll.mo_ta_luc_luong_tham_gia));
                                    lucLuongDiv.append($("<div></div>").html(`
                                    <button class="delete-btn" onclick="xoalucluong('${db.id_dien_bien}', '${ll.id_luc_luong_tham_gia}', this)">Xóa</button>
                                    <button class="edit-btn" onclick="sualucluong('${db.id_dien_bien}', '${ll.id_luc_luong_tham_gia}', this)">Sửa</button>
                                `));
                                });
                                dbDiv.append(lucLuongDiv);
                            }
                            dienBienDiv.append(dbDiv);
                        });
                        eventDiv.append(dienBienDiv);
                    }

                    container.append(eventDiv);
                });
            } else {
                container.append('<div>Không có dữ liệu nào.</div>');
            }
            checklogin();
        }, 'json');
    }

    window.themsk = function () {
        var html = `
    <form id="addSuKienForm">
        <div class="mb-3">
            <label for="idSuKienInput">ID Sự Kiện:</label>
            <input type="text" class="form-control" id="idSuKienInput">
        </div>
        <div class="mb-3">
            <label for="tenSuKienInput">Tên Sự Kiện:</label>
            <input type="text" class="form-control" id="tenSuKienInput">
        </div>
        <div class="mb-3">
            <label for="ngayBatDauInput">Ngày Bắt Đầu:</label>
            <input type="date" class="form-control" id="ngayBatDauInput">
        </div>
        <div class="mb-3">
            <label for="ngayKetThucInput">Ngày Kết Thúc:</label>
            <input type="date" class="form-control" id="ngayKetThucInput">
        </div>
        <div class="mb-3">
            <label for="moTaSuKienInput">Mô Tả:</label>
            <input type="text" class="form-control" id="moTaSuKienInput">
        </div>
        <div class="mb-3">
            <label for="loaiSuKienInput">Loại Sự Kiện:</label>
            <input type="text" class="form-control" id="loaiSuKienInput">
        </div>
    </form>
    `;

        $.confirm({
            title: 'Thêm Sự Kiện',
            content: html,
            buttons: {
                add: {
                    text: 'Thêm',
                    btnClass: 'btn-primary',
                    action: function () {
                        var id_su_kien = $('#idSuKienInput').val();
                        var tenSuKien = $('#tenSuKienInput').val();
                        var ngayBatDau = $('#ngayBatDauInput').val();
                        var ngayKetThuc = $('#ngayKetThucInput').val();
                        var moTaSuKien = $('#moTaSuKienInput').val();
                        var loaiSuKien = $('#loaiSuKienInput').val();

                        $.post('API.aspx', {
                            action: 'add',
                            loai: 'SuKienLichSu',
                            id_su_kien: id_su_kien,
                            ten_su_kien: tenSuKien,
                            ngay_bat_dau: ngayBatDau,
                            ngay_ket_thuc: ngayKetThuc,
                            mo_ta: moTaSuKien,
                            loai_su_kien: loaiSuKien
                        }, function (data) {
                            if (data.ok) {
                                $.alert('Thêm Sự Kiện Thành Công');
                                loadTable(); 
                            } else {
                                $.alert('Thêm Sự Kiện Thất Bại');
                            }
                        }, 'json');
                    }
                },
                cancel: {
                    text: 'Hủy',
                    btnClass: 'btn-secondary',
                }
            }
        });
    };

    window.themnhanvat = function (id_su_kien) {
        var html = `
        <form id="addNhanVatForm">
            <div class="mb-3">
                <label for="maNhanVatInput">Mã Nhân Vật:</label>
                <input type="text" class="form-control" id="maNhanVatInput">
            </div>
            <div class="mb-3">
                <label for="tenNhanVatInput">Tên Nhân Vật:</label>
                <input type="text" class="form-control" id="tenNhanVatInput">
            </div>
            <div class="mb-3">
                <label for="ngaySinhInput">Ngày Sinh:</label>
                <input type="date" class="form-control" id="ngaySinhInput">
            </div>
            <div class="mb-3">
                <label for="ngayMatInput">Ngày Mất (nếu có):</label>
                <input type="date" class="form-control" id="ngayMatInput">
            </div>
            <div class="mb-3">
                <label for="vaiTroInput">Vai Trò:</label>
                <input type="text" class="form-control" id="vaiTroInput">
            </div>
            <div class="mb-3">
                <label for="moTaNhanVatInput">Mô Tả:</label>
                <input type="text" class="form-control" id="moTaNhanVatInput">
            </div>
        </form>
    `;

        $.confirm({
            title: 'Thêm Nhân Vật',
            content: html,
            buttons: {
                add: {
                    text: 'Thêm',
                    btnClass: 'btn-primary',
                    action: function () {
                        var id_nhan_vat = $('#maNhanVatInput').val();
                        var tenNhanVat = $('#tenNhanVatInput').val();
                        var ngaysinh = $('#ngaySinhInput').val();
                        var ngaymat = $('#ngayMatInput').val();
                        var vaiTro = $('#vaiTroInput').val();
                        var moTaNhanVat = $('#moTaNhanVatInput').val();

                        $.post('API.aspx', {
                            action: 'add',
                            loai: 'NhanVatLanhDao',
                            id_su_kien: id_su_kien,
                            id_nhan_vat: id_nhan_vat,
                            ten_nhan_vat: tenNhanVat,
                            ngay_sinh: ngaysinh,
                            ngay_mat: ngaymat,
                            vai_tro: vaiTro,
                            mo_ta_nv: moTaNhanVat
                        }, function (data) {
                            if (data.ok) {
                                $.alert('Thêm Nhân Vật Thành Công');
                                loadTable();
                            } else {
                                $.alert('Thêm Nhân Vật Thất Bại');
                            }
                        }, 'json');
                    }
                },
                cancel: {
                    text: 'Hủy',
                    btnClass: 'btn-secondary',
                }
            }
        });
    };
    window.themlucluong = function (id_dien_bien) {
        var html = `
        <form id="addLucLuongForm">
            <div class="mb-3">
                <label for="idLucLuongInput">Mã Lực Lượng:</label>
                <input type="text" class="form-control" id="idLucLuongInput">
            </div>
            <div class="mb-3">
                <label for="tenLucLuongInput">Tên Lực Lượng:</label>
                <input type="text" class="form-control" id="tenLucLuongInput">
            </div>
            <div class="mb-3">
                <label for="moTaLucLuongInput">Mô Tả:</label>
                <input type="text" class="form-control" id="moTaLucLuongInput">
            </div>
        </form>
    `;

        $.confirm({
            title: 'Thêm Lực Lượng',
            content: html,
            buttons: {
                add: {
                    text: 'Thêm',
                    btnClass: 'btn-primary',
                    action: function () {
                        var idLucLuong = $('#idLucLuongInput').val();
                        var tenLucLuong = $('#tenLucLuongInput').val();
                        var moTaLucLuong = $('#moTaLucLuongInput').val();

                        $.post('API.aspx', {
                            action: 'add',
                            loai: 'LucLuongThamGia',
                            id_dien_bien: id_dien_bien,
                            id_luc_luong_tham_gia: idLucLuong,
                            ten_luc_luong_tham_gia: tenLucLuong,
                            mo_ta_luc_luong_tham_gia: moTaLucLuong
                        }, function (data) {
                            if (data.ok) {
                                $.alert('Thêm Lực Lượng Thành Công');
                                loadTable();
                            } else {
                                $.alert('Thêm Lực Lượng Thất Bại');
                            }
                        }, 'json');
                    }
                },
                cancel: {
                    text: 'Hủy',
                    btnClass: 'btn-secondary',
                }
            }
        });
    };
    window.themdienbien = function (id_su_kien) {
        var html = `
        <form id="addDienBienForm">
            <div class="mb-3">
                <label for="idDienBienInput">ID Diễn Biến:</label>
                <input type="text" class="form-control" id="idDienBienInput">
            </div>
            <div class="mb-3">
                <label for="tenDienBienInput">Tên Diễn Biến:</label>
                <input type="text" class="form-control" id="tenDienBienInput">
            </div>
            <div class="mb-3">
                <label for="moTaDienBienInput">Mô Tả:</label>
                <input type="text" class="form-control" id="moTaDienBienInput">
            </div>
            <div class="mb-3">
                <label for="ngayInput">Ngày:</label>
                <input type="date" class="form-control" id="ngayInput">
            </div>
            <div class="mb-3">
                <label for="viTriDienRaInput">Vị Trí Diễn Ra:</label>
                <input type="text" class="form-control" id="viTriDienRaInput">
            </div>
        </form>
    `;

        $.confirm({
            title: 'Thêm Diễn Biến',
            content: html,
            buttons: {
                add: {
                    text: 'Thêm',
                    btnClass: 'btn-primary',
                    action: function () {
                        var idDienBien = $('#idDienBienInput').val();
                        var tenDienBien = $('#tenDienBienInput').val();
                        var moTaDienBien = $('#moTaDienBienInput').val();
                        var ngay = $('#ngayInput').val();
                        var viTriDienRa = $('#viTriDienRaInput').val();

                        $.post('API.aspx', {
                            action: 'add',
                            loai: 'DienBienLichSu',
                            id_su_kien: id_su_kien,
                            id_dien_bien:idDienBien,
                            ten_dien_bien: tenDienBien,
                            mo_ta_dien_bien: moTaDienBien,
                            ngay: ngay,
                            vi_tri_dien_ra: viTriDienRa
                        }, function (data) {
                            if (data.ok) {
                                $.alert('Thêm Diễn Biến Thành Công');
                                loadTable();
                            } else {
                                $.alert('Thêm Diễn Biến Thất Bại');
                            }
                        }, 'json');
                    }
                },
                cancel: {
                    text: 'Hủy',
                    btnClass: 'btn-secondary',
                }
            }
        });
    };

    window.suask = function (id_su_kien, button) {
        var eventDiv = $(button).closest('.event');
        var ten_su_kien = eventDiv.find(".event-name").text().replace("Tên Sự Kiện: ", "").trim();
        var mo_ta = eventDiv.find(".event-desc").text().replace("Mô Tả: ", "").trim();
        var ngay_bat_dau = eventDiv.find(".event-start").text().replace("Ngày Bắt Đầu: ", "").trim();
        var ngay_ket_thuc = eventDiv.find(".event-end").text().replace("Ngày Kết Thúc: ", "").trim();
        var loai_su_kien = eventDiv.find(".event-type").text().replace("Loại Sự Kiện: ", "").trim();

        var html = `
        <form id="editEventForm">
            <div class="mb-3">
                <label>ID Sự Kiện: ${id_su_kien}</label>
            </div>
            <div class="mb-3">
                <label for="tenSuKienInput">Tên Sự Kiện:</label>
                <input type="text" class="form-control" id="tenSuKienInput" value="${ten_su_kien}">
            </div>
            <div class="mb-3">
                <label for="moTaInput">Mô Tả:</label>
                <textarea class="form-control" id="moTaInput">${mo_ta}</textarea>
            </div>
            <div class="mb-3">
                <label for="ngayBatDauInput">Ngày Bắt Đầu:</label>
                <input type="date" class="form-control" id="ngayBatDauInput" value="${ngay_bat_dau}">
            </div>
            <div class="mb-3">
                <label for="ngayKetThucInput">Ngày Kết Thúc:</label>
                <input type="date" class="form-control" id="ngayKetThucInput" value="${ngay_ket_thuc}">
            </div>
            <div class="mb-3">
                <label for="loaiskInput">Loại Sự Kiện:</label>
                <input type="text" class="form-control" id="loaiskInput" value="${loai_su_kien}">
            </div>
        </form>
    `;

        $.confirm({
            title: 'Chỉnh Sửa Sự Kiện',
            content: html,
            buttons: {
                save: {
                    text: 'Sửa',
                    btnClass: 'btn-primary',
                    action: function () {
                        var newTenSuKien = $('#tenSuKienInput').val();
                        var newMoTa = $('#moTaInput').val();
                        var newNgayBatDau = $('#ngayBatDauInput').val();
                        var newNgayKetThuc = $('#ngayKetThucInput').val();
                        var loaisk = $('#loaiskInput').val();

                        $.post('API.aspx', { action: 'update', loai: 'SuKienLichSu', id_su_kien: id_su_kien, ten_su_kien: newTenSuKien, mo_ta: newMoTa, ngay_bat_dau: newNgayBatDau, ngay_ket_thuc: newNgayKetThuc, loai_su_kien: loaisk }, function (data) {
                            if (data.ok) {
                                $.alert('Chỉnh Sửa Thành Công');
                                loadTable();
                            } else {
                                $.alert('Chỉnh Sửa Thất Bại');
                            }
                        }, 'json');
                    }
                },
                cancel: {
                    text: 'Hủy',
                    btnClass: 'btn-secondary',
                }
            }
        });
    };

   
    window.suanhanvat = function (id_su_kien, id_nhan_vat, button) {
        var nvDiv = $(button).closest("div:contains('Nhân Vật Lãnh Đạo:')");
        var ten_nhan_vat = nvDiv.find("div").eq(1).text().replace("Tên Nhân Vật: ", "").trim();
        var ngay_sinh = nvDiv.find("div").eq(2).text().replace("Ngày Sinh: ", "").trim();
        var vai_tro = nvDiv.find("div").eq(3).text().replace("Vai Trò: ", "").trim();
        var mo_ta_nv = nvDiv.find("div").eq(4).text().replace("Mô Tả: ", "").trim();

  

        var html = `
            <form id="editNhanVatForm">
                <div class="mb-3">
                    <label>ID Nhân Vật: ${id_nhan_vat}</label>
                </div>
                <div class="mb-3">
                    <label for="tenNhanVatInput">Tên Nhân Vật:</label>
                    <input type="text" class="form-control" id="tenNhanVatInput" value="${ten_nhan_vat}">
                </div>
                <div class="mb-3">
                    <label for="ngaySinhInput">Ngày Sinh:</label>
                    <input type="text" class="form-control" id="ngaySinhInput" value="${ngay_sinh}">
                </div>
                <div class="mb-3">
                    <label for="vaiTroInput">Vai Trò:</label>
                    <input type="text" class="form-control" id="vaiTroInput" value="${vai_tro}">
                </div>
                <div class="mb-3">
                    <label for="moTaNvInput">Mô Tả:</label>
                    <input type="text" class="form-control" id="moTaNvInput" value="${mo_ta_nv}">
                </div>
            </form>
            `;

        $.confirm({
            title: 'Chỉnh Sửa Nhân Vật',
            content: html,
            buttons: {
                save: {
                    text: 'Sửa',
                    btnClass: 'btn-primary',
                    action: function () {
                        var newTenNhanVat = $('#tenNhanVatInput').val();
                        var newNgaySinh = $('#ngaySinhInput').val();
                        var newVaiTro = $('#vaiTroInput').val();
                        var newMoTaNv = $('#moTaNvInput').val();

                        $.post('API.aspx', { action: 'update', loai: 'NhanVat', id_su_kien: id_su_kien, id_nhan_vat: id_nhan_vat, ten_nhan_vat: newTenNhanVat, ngay_sinh: newNgaySinh, vai_tro: newVaiTro, mo_ta_nv: newMoTaNv }, function (data) {
                            if (data.ok) {
                                $.alert('Chỉnh Sửa Thành Công');
                                loadTable();
                            } else {
                                $.alert('Chỉnh Sửa Thất Bại');
                            }
                        }, 'json');
                    }
                },
                cancel: {
                    text: 'Hủy',
                    btnClass: 'btn-secondary'
                }
            }
        });
    };
    window.suadienbien = function (id_su_kien, id_dien_bien, button) {
        var dienBienDiv = $(button).closest('.dien-bien');
        var ten_dien_bien = dienBienDiv.find("div").eq(1).text().replace("Tên Diễn Biến: ", "").trim();
        var mo_ta_dien_bien = dienBienDiv.find("div").eq(2).text().replace("Mô Tả: ", "").trim();
        var ngay = dienBienDiv.find("div").eq(3).text().replace("Ngày: ", "").trim();
        var vi_tri_dien_ra = dienBienDiv.find("div").eq(4).text().replace("Vị Trí Diễn Ra: ", "").trim();

        var html = `
        <form id="editDienBienForm">
            <div class="mb-3">
                <label>ID Diễn Biến: ${id_dien_bien}</label>
            </div>
            <div class="mb-3">
                <label for="tenDienBienInput">Tên Diễn Biến:</label>
                <input type="text" class="form-control" id="tenDienBienInput" value="${ten_dien_bien}">
            </div>
            <div class="mb-3">
                <label for="moTaDienBienInput">Mô Tả:</label>
                <input type="text" class="form-control" id="moTaDienBienInput" value="${mo_ta_dien_bien}">
            </div>
            <div class="mb-3">
                <label for="ngayInput">Ngày:</label>
                <input type="date" class="form-control" id="ngayInput" value="${ngay}">
            </div>
            <div class="mb-3">
                <label for="viTriDienRaInput">Vị Trí Diễn Ra:</label>
                <input type="text" class="form-control" id="viTriDienRaInput" value="${vi_tri_dien_ra}">
            </div>
        </form>
    `;

        $.confirm({
            title: 'Chỉnh Sửa Diễn Biến',
            content: html,
            buttons: {
                save: {
                    text: 'Sửa',
                    btnClass: 'btn-primary',
                    action: function () {
                        var newTenDienBien = $('#tenDienBienInput').val();
                        var newMoTaDienBien = $('#moTaDienBienInput').val();
                        var newNgay = $('#ngayInput').val();
                        var newViTriDienRa = $('#viTriDienRaInput').val();

                        $.post('API.aspx', {
                            action: 'update',
                            loai: 'DienBien',
                            id_su_kien: id_su_kien,
                            id_dien_bien: id_dien_bien,
                            ten_dien_bien: newTenDienBien,
                            mo_ta_dien_bien: newMoTaDienBien,
                            ngay: newNgay,
                            vi_tri_dien_ra: newViTriDienRa
                        }, function (data) {
                            if (data.ok) {
                                $.alert('Chỉnh Sửa Thành Công');
                                loadTable();
                            } else {
                                $.alert('Chỉnh Sửa Thất Bại');
                            }
                        }, 'json');
                    }
                },
                cancel: {
                    text: 'Hủy',
                    btnClass: 'btn-secondary',
                }
            }
        });
    };

    window.sualucluong = function (id_dien_bien, id_luc_luong_tham_gia, button) {
        var lucLuongDiv = $(button).closest('.luc-luong'); 
        var ten_luc_luong = lucLuongDiv.find("div").eq(1).text().replace("   Tên Lực Lượng: ", "").trim();
        var mo_ta = lucLuongDiv.find("div").eq(2).text().replace("   Mô Tả: ", "").trim(); 



        var html = `
            <form id="editLucLuongForm">
                <div class="mb-3">
                    <label>ID Lực lượng Tham Gia: ${id_luc_luong_tham_gia}</label>
                </div>
                <div class="mb-3">
                    <label for="tenLucLuongInput">Tên Lực Lượng:</label>
                    <input type="text" class="form-control" id="tenLucLuongInput" value="${ten_luc_luong}">
                </div>
                <div class="mb-3">
                    <label for="moTaInput">Mô Tả:</label>
                    <input type="text" class="form-control" id="moTaInput" value="${mo_ta}">
                </div>
            </form>
            `;

        $.confirm({
            title: 'Chỉnh Sửa Lực Lượng',
            content: html,
            buttons: {
                save: {
                    text: 'Sửa',
                    btnClass: 'btn-primary',
                    action: function () {
                        var newTenLucLuong = $('#tenLucLuongInput').val();
                        var newMoTa = $('#moTaInput').val();

                        $.post('API.aspx', { action: 'update', loai: 'LucLuongThamGia', id_dien_bien: id_dien_bien, id_luc_luong_tham_gia: id_luc_luong_tham_gia, ten_luc_luong_tham_gia: newTenLucLuong, mo_ta_luc_luong_tham_gia: newMoTa}, function (data) {
                            if (data.ok) {
                                $.alert('Chỉnh Sửa Thành Công');
                                loadTable();
                            } else {
                                $.alert('Chỉnh Sửa Thất Bại');
                            }
                        }, 'json');
                    }
                },
                cancel: {
                    text: 'Hủy',
                    btnClass: 'btn-secondary',
                }
            }
        });
    };

    window.xoask = function (id_su_kien, button) {
        $.confirm({
            title: 'Xác Nhận Xóa',
            content: 'Bạn có chắc chắn muốn xóa sự kiện này?',
            buttons: {
                confirm: {
                    text: 'Xóa',
                    btnClass: 'btn-danger',
                    action: function () {
                        $.post('API.aspx', { action: 'delete', loai: 'SuKienLichSu', id_su_kien: id_su_kien }, function (data) {
                            if (data.ok) {
                                $.alert('Xóa Thành Công');
                                loadTable();
                            } else {
                                $.alert('Xóa Thất Bại');
                            }
                        }, 'json');
                    }
                },
                cancel: {
                    text: 'Hủy',
                    btnClass: 'btn-secondary'
                }
            }
        });
    };
    window.xoanhanvat = function (id_su_kien, id_nhan_vat) {
        $.confirm({
            title: 'Xác Nhận Xóa',
            content: 'Bạn có chắc chắn muốn xóa nhân vật này?',
            buttons: {
                confirm: {
                    text: 'Xóa',
                    btnClass: 'btn-danger',
                    action: function () {
                        $.post('API.aspx', { action: 'delete', loai: 'NhanVatLanhDao', id_su_kien: id_su_kien, id_nhan_vat: id_nhan_vat }, function (data) {
                            if (data.ok) {
                                $.alert('Xóa nhân vật thành công');
                                loadTable();
                            } else {
                                $.alert('Xóa nhân vật thất bại');
                            }
                        }, 'json');
                    }
                },
                cancel: {
                    text: 'Hủy',
                    btnClass: 'btn-secondary'
                }
            }
        });
    };

    window.xoadienbien = function (id_su_kien, id_dien_bien) {
        $.confirm({
            title: 'Xác Nhận Xóa',
            content: 'Bạn có chắc chắn muốn xóa diễn biến lịch sử này?',
            buttons: {
                confirm: {
                    text: 'Xóa',
                    btnClass: 'btn-danger',
                    action: function () {
                        $.post('API.aspx', { action: 'delete', loai: 'DienBienLichSu', id_su_kien: id_su_kien, id_dien_bien: id_dien_bien }, function (data) {
                            if (data.ok) {
                                $.alert('Xóa diễn biến thành công');
                                loadTable();
                            } else {
                                $.alert('Xóa diễn biến thất bại');
                            }
                        }, 'json');
                    }
                },
                cancel: {
                    text: 'Hủy',
                    btnClass: 'btn-secondary'
                }
            }
        });
    };

    window.xoalucluong = function (id_su_kien, id_luc_luong) {
        $.confirm({
            title: 'Xác Nhận Xóa',
            content: 'Bạn có chắc chắn muốn xóa lực lượng này?',
            buttons: {
                confirm: {
                    text: 'Xóa',
                    btnClass: 'btn-danger',
                    action: function () {
                        $.post('API.aspx', { action: 'delete', loai: 'LucLuongThamGia', id_su_kien: id_su_kien, id_luc_luong: id_luc_luong }, function (data) {
                            if (data.ok) {
                                $.alert('Xóa lực lượng thành công');
                                loadTable();
                            } else {
                                $.alert('Xóa lực lượng thất bại');
                            }
                        }, 'json');
                    }
                },
                cancel: {
                    text: 'Hủy',
                    btnClass: 'btn-secondary'
                }
            }
        });
    };

    window.dangky = function () {
        var html = `
        <form id="registerForm">
            <div class="mb-3">
                <label for="usernameInput">Username:</label>
                <input type="text" class="form-control" id="usernameInput">
            </div>
            <div class="mb-3">
                <label for="passwordInput">Password:</label>
                <input type="password" class="form-control" id="passwordInput">
            </div>
            <div class="mb-3">
                <label for="RepeatPassInput">Nhập lại Password:</label>
                <input type="password" class="form-control" id="RepeatPassInput">
            </div>
            <div class="mb-3">
                <label for="nameInput">Tên:</label>
                <input type="text" class="form-control" id="nameInput">
            </div>
            <div class="mb-3">
                <label for="emailInput">Email:</label>
                <input type="email" class="form-control" id="emailInput">
            </div>
            <div class="mb-3">
                <label for="phoneInput">Số điện thoại:</label>
                <input type="tel" class="form-control" id="phoneInput">
            </div>
        </form>
    `;

        $.confirm({
            title: 'Đăng Ký',
            content: html,
            buttons: {
                register: {
                    text: 'Đăng Ký',
                    btnClass: 'btn-primary',
                    action: function () {
                        var username = $('#usernameInput').val();
                        var password = $('#passwordInput').val();
                        var Repeatpassword = $('#RepeatPassInput').val();
                        var name = $('#nameInput').val();
                        var gmail = $('#emailInput').val();
                        var dienthoai = $('#phoneInput').val();

                        if (!name || !dienthoai || !gmail || !username || !password || !Repeatpassword) {
                            alert("Vui lòng điền đầy đủ thông tin.");
                            return;
                        }

                        if (password !== Repeatpassword) {
                            alert("Mật khẩu không khớp, vui lòng kiểm tra lại.");
                            return;
                        }
                        var Pass = CryptoJS.SHA1(password).toString();

                        $.post('API.aspx', {
                            action: 'dangky',
                            user: username,
                            pass: Pass,
                            name: name,
                            gmail: gmail,
                            dienthoai: dienthoai
                        }, function (data) {
                            if (data.ok == 1) {
                                salt_value = data.salt;
                                if (salt_value != '') {
                                } else {
                                    alert("Tài khoản chưa được đăng ký!");
                                }
                            } else {
                                alert("Đăng ký thất bại");
                            }
                        }, 'json');
                    }
                },
                cancel: {
                    text: 'Hủy',
                    btnClass: 'btn-secondary',
                }
            }
        });
    };

    window.dangnhap = function () {
        var html = `
        <form id="loginForm">
            <div class="mb-3">
                <label for="loginUsernameInput">Username:</label>
                <input type="text" class="form-control" id="loginUsernameInput">
            </div>
            <div class="mb-3">
                <label for="loginPasswordInput">Password:</label>
                <input type="password" class="form-control" id="loginPasswordInput">
            </div>
        </form>
    `;

        $.confirm({
            title: 'Đăng Nhập',
            content: html,
            buttons: {
                login: {
                    text: 'Đăng Nhập',
                    btnClass: 'btn-primary',
                    action: function () {
                        var username = $('#loginUsernameInput').val();
                        var password = $('#loginPasswordInput').val();

                        var hashedPassword = CryptoJS.SHA1(password).toString();
                        $.post('API.aspx', {
                            action: 'login',
                            uid: username,
                            passLogIn: hashedPassword
                        }, function (data) {
                            if (data.ok) {
                                $.alert('Đăng Nhập Thành Công');
                                checklogin();
                            } else {
                                $.alert('Đăng Nhập Thất Bại');
                            }
                        }, 'json');
                    }
                },
                cancel: {
                    text: 'Hủy',
                    btnClass: 'btn-secondary',
                }
            }
        });
    };

    function checklogin() {
        $.post('API.aspx', { action: 'check_login' }, function (data) {

            if (data.ok === 1) {
                $('#dangnhap,#dangky').hide();
                $('#logout').show();
                control(data.level);
            } else {
                $('#logout').hide();
                $('#dangnhap,#dangky').show();
                control(1);
            }
        }, 'json');
    }

    function control(level) {
        level = parseInt(level);
        if (level === 1) {
            $('.delete-btn, .edit-btn, .add-btn').hide();
        } else if (level === 2) {
            $('.delete-btn, .edit-btn, .add-btn').show();
        }
    }

    window.timkiem = function () {
        var container = $("#skls");
        var html = `
            <form id="searchForm">
                <div class="mb-3">
                    <label for="searchInput">Nhập từ khóa tìm kiếm:</label>
                    <input type="text" class="form-control" id="searchInput">
                </div>
            </form>
            `;
        $.confirm({
            title: 'Tìm Kiếm Sự Kiện Lịch Sử',
            content: html,
            buttons: {
                search: {
                    text: 'Tìm kiếm',
                    btnClass: 'btn-primary',
                    action: function () {
                        var timkiem = $('#searchInput').val();

                        if (!timkiem) {
                            $.alert('Vui lòng nhập từ khóa tìm kiếm.');
                            return false;
                        }

                        $.post('API.aspx', {
                            action: 'timkiem',
                            timkiem: timkiem
                        }, function (data) {
                            if (data.total_results != 0) {
                                container.empty();
                                if (data.length > 0) {
                                    data.forEach(function (item) {
                                        var eventDiv = $("<div class='event'></div>");
                                        eventDiv.append($("<div class='event-id'></div>").text("ID Sự Kiện: " + item.id_su_kien));
                                        eventDiv.append($("<div class='event-name'></div>").text("Tên Sự Kiện: " + item.ten_su_kien));
                                        eventDiv.append($("<div class='event-desc'></div>").text("Mô Tả: " + item.mo_ta));
                                        eventDiv.append($("<div class='event-start'></div>").text("Ngày Bắt Đầu: " + item.ngay_bat_dau));
                                        eventDiv.append($("<div class='event-end'></div>").text("Ngày Kết Thúc: " + item.ngay_ket_thuc));
                                        eventDiv.append($("<div class='event-type'></div>").text("Loại Sự Kiện: " + item.loai_su_kien));
                                        eventDiv.append($("<div></div>").html(`
                                            <button class="delete-btn" onclick="themsk(this)">Thêm sự kiện</button>
                                            <button class="delete-btn" onclick="xoask('${item.id_su_kien}', this)">Xóa</button>
                                            <button class="edit-btn" onclick="suask('${item.id_su_kien}', this)">Sửa</button>
                                            <button class="add-btn" onclick="themnhanvat('${item.id_su_kien}', this)">Thêm Nhân Vật</button>
                                            <button class="add-btn" onclick="themdienbien('${item.id_su_kien}', this)">Thêm Diễn Biến</button>
                                        `));

                                        if (item.nhan_vat_lanh_dao && item.nhan_vat_lanh_dao.length > 0) {
                                            var nhanVatDiv = $("<div></div>").text("Nhân Vật Lãnh Đạo:");
                                            item.nhan_vat_lanh_dao.forEach(function (nv) {
                                                nhanVatDiv.append($("<div></div>").text("   ID Nhân Vật: " + nv.id_nhan_vat));
                                                nhanVatDiv.append($("<div></div>").text("   Tên Nhân Vật: " + nv.ten_nhan_vat));
                                                nhanVatDiv.append($("<div></div>").text("   Ngày Sinh: " + nv.ngay_sinh));
                                                nhanVatDiv.append($("<div></div>").text("   Vai Trò: " + nv.vai_tro));
                                                nhanVatDiv.append($("<div></div>").text("   Mô Tả: " + nv.mo_ta_nv));
                                                nhanVatDiv.append($("<div></div>").html(`
                                                <button class="delete-btn" onclick="xoanhanvat('${item.id_su_kien}', '${nv.id_nhan_vat}', this)">Xóa</button>
                                                <button class="edit-btn" onclick="suanhanvat('${item.id_su_kien}', '${nv.id_nhan_vat}', this)">Sửa</button>
                                            `));
                                            });
                                            eventDiv.append(nhanVatDiv);
                                        }

                                        if (item.dien_bien_lich_su && item.dien_bien_lich_su.length > 0) {
                                            var dienBienDiv = $("<div class='dien-bien'></div>").text("Diễn Biến Lịch Sử:");
                                            item.dien_bien_lich_su.forEach(function (db) {
                                                var dbDiv = $("<div class='dien-bien'></div>");
                                                dbDiv.append($("<div></div>").text("   Tên Diễn Biến: " + db.ten_dien_bien));
                                                dbDiv.append($("<div></div>").text("   Mô Tả: " + db.mo_ta_dien_bien));
                                                dbDiv.append($("<div></div>").text("   Ngày: " + db.ngay));
                                                dbDiv.append($("<div></div>").text("   Vị Trí Diễn Ra: " + db.vi_tri_dien_ra));
                                                dbDiv.append($("<div></div>").html(`
                                                <button class="delete-btn" onclick="xoadienbien('${item.id_su_kien}', '${db.id_dien_bien}', this)">Xóa</button>
                                                <button class="edit-btn" onclick="suadienbien('${item.id_su_kien}', '${db.id_dien_bien}', this)">Sửa</button>
                                                <button class="add-btn" onclick="themlucluong('${db.id_dien_bien}', this)">Thêm Lực Lượng</button>
                                            `));

                                                if (db.luc_luong_tham_gia && db.luc_luong_tham_gia.length > 0) {
                                                    var lucLuongDiv = $('<div class="luc-luong"></div>').text("Lực Lượng Tham Gia:");
                                                    db.luc_luong_tham_gia.forEach(function (ll) {
                                                        lucLuongDiv.append($("<div></div>").text("   Mã Lực Lượng: " + ll.id_luc_luong_tham_gia));
                                                        lucLuongDiv.append($("<div></div>").text("   Tên Lực Lượng: " + ll.ten_luc_luong_tham_gia));
                                                        lucLuongDiv.append($("<div></div>").text("   Mô Tả: " + ll.mo_ta_luc_luong_tham_gia));
                                                        lucLuongDiv.append($("<div></div>").html(`
                                                    <button class="delete-btn" onclick="xoalucluong('${db.id_dien_bien}', '${ll.id_luc_luong_tham_gia}', this)">Xóa</button>
                                                    <button class="edit-btn" onclick="sualucluong('${db.id_dien_bien}', '${ll.id_luc_luong_tham_gia}', this)">Sửa</button>
                                                `));
                                                    });
                                                    dbDiv.append(lucLuongDiv);
                                                }
                                                dienBienDiv.append(dbDiv);
                                            });
                                            eventDiv.append(dienBienDiv);
                                        }

                                        container.append(eventDiv);
                                    });
                                } else {
                                    container.append('<div>Không có dữ liệu nào.</div>');
                                }
                                checklogin();
                            } else {
                                $.alert('Không tìm thấy kết quả nào.');
                            }
                        }, 'json');
                    }
                },
                cancel: {
                    text: 'Hủy',
                    btnClass: 'btn-secondary',
                }
            }
        });
    };

    function logout() {
        $.post('API.aspx', { action: 'logout' }, function (data) {
            if (data.ok === 1) {
                $.alert('Đăng Xuất Thành Công');
                checklogin();

            } else {
                $.alert('Đăng Xuất Thất Bại');

            }
        }, 'json');
    }
    loadTable();
    $('#trangchu').click(function () {
        loadTable();
    });
    $('#logout').click(function () {
        logout();
    });

});
