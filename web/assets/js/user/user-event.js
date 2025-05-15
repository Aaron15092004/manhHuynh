/**
 * Harmoni Event Management System
 * JavaScript functions for Admin Event Management
 */

$(document).ready(function () {
    // Xử lý hiển thị ảnh preview khi chọn file trong form thêm mới
    $('#image').change(function () {
        previewImage(this, 'imagePreview');
        // Cập nhật tên file hiển thị
        $(this).next('.custom-file-label').html(this.files[0].name);
    });

    // Xử lý hiển thị ảnh preview khi chọn file trong form chỉnh sửa
    $('#edit-image').change(function () {
        previewImage(this, 'preview-image');
        // Cập nhật tên file hiển thị
        $(this).next('.custom-file-label').html(this.files[0].name);
    });

    // Xử lý sự kiện edit từ table
    $('#responsive-data-table').on('click', 'button[data-bs-target="#edit-event-modal"]', function () {
        editEventModal(this);
    });

    // Xử lý sự kiện delete từ table
    $('#responsive-data-table').on('click', 'button[data-bs-target="#delete-event-modal"]', function () {
        const eventId = $(this).data('event-id');
        // Gọi hàm từ deleteEventModal.jsp
        deleteEventModal(eventId);
    });

    // Xử lý hiển thị thông báo lỗi nếu có
    if ($('.alert-danger').length > 0) {
        // Tự động đóng thông báo sau 5 giây
        setTimeout(function () {
            $('.alert-danger').alert('close');
        }, 5000);
    }

    // Xử lý hiển thị modal xác nhận logout
    $('.logout-btn').click(function (e) {
        e.preventDefault();
        $('#logoutModal').modal('show');
    });
});

/**
 * Hiển thị ảnh preview khi người dùng chọn file
 * @param {HTMLElement} input - Input file element
 * @param {string} previewId - ID của thẻ img để hiển thị preview
 */
function previewImage(input, previewId) {
    if (input.files && input.files[0]) {
        const reader = new FileReader();
        reader.onload = function (e) {
            $('#' + previewId).attr('src', e.target.result);
            $('#' + previewId).css('display', 'block');
        }
        reader.readAsDataURL(input.files[0]);
    }
}

/**
 * Xử lý khi nhấn nút Edit Event
 * Lấy thông tin từ hàng được chọn và điền vào form chỉnh sửa
 * @param {HTMLElement} button - Nút Edit được click
 */
function editEventModal(button) {
    // Lấy dữ liệu từ row hiện tại
    const row = $(button).closest('tr');
    const cells = row.find('td');

    const eventId = cells.eq(0).text().trim();
    const title = cells.eq(1).text().trim();
    const description = cells.eq(2).text().trim();
    const location = cells.eq(3).text().trim();
    const date = cells.eq(4).text().trim();
    const maxAttendees = cells.eq(5).text().trim();
    const imageSrc = cells.find('img').attr('src');

    // Gán giá trị vào form
    $('#edit-event-id').val(eventId);
    $('#edit-title').val(title);
    $('#edit-description').val(description);
    $('#edit-location').val(location);
    $('#edit-max-attendees').val(maxAttendees);

    // Hiển thị ảnh hiện tại
    $('#preview-image').attr('src', imageSrc);
    $('#edit-current-image').val(imageSrc);

    // Định dạng ngày tháng và gán vào input
    const formattedDate = formatDateForInput(date);
    $('#edit-event-date').val(formattedDate);

    // Chọn category trong dropdown
    const categoryName = cells.eq(7).text().trim();
    $('#edit-category option').each(function () {
        if ($(this).text().trim() === categoryName) {
            $(this).prop('selected', true);
        } else {
            $(this).prop('selected', false);
        }
    });

    // Lấy giá vé từ data-ticket-price
    const ticketPrice = $(button).data('ticket-price') || 0;
    $('#edit-ticket-price').val(ticketPrice);

    // Reset label file input
    $('.custom-file-label').html('Choose file...');
}

/**
 * Chuyển đổi định dạng ngày tháng từ các định dạng khác nhau sang định dạng cho input datetime-local
 * @param {string} dateString - Chuỗi ngày tháng cần chuyển đổi
 * @returns {string} - Chuỗi ngày tháng ở định dạng YYYY-MM-DDThh:mm
 */
function formatDateForInput(dateString) {
    if (!dateString || typeof dateString !== 'string') {
        return '';
    }

    try {
        // Kiểm tra nếu đã ở định dạng dd/MM/yyyy HH:mm (từ fmt:formatDate)
        if (dateString.includes('/')) {
            const parts = dateString.split(/[\s\/\:]/);
            if (parts.length >= 5) {
                const day = parts[0].padStart(2, '0');
                const month = parts[1].padStart(2, '0');
                const year = parts[2];
                const hour = parts[3].padStart(2, '0');
                const minute = parts[4].padStart(2, '0');

                return `${year}-${month}-${day}T${hour}:${minute}`;
            }
        }

        // Xử lý định dạng timestamp SQL: "2025-03-20 22:35:00.0"
        const dateTimeParts = dateString.trim().split(/[\s\.]/);
        const datePart = dateTimeParts[0]; // "2025-03-20"

        if (dateTimeParts.length >= 2) {
            let timePart = dateTimeParts[1]; // "22:35:00"
            // Chỉ lấy giờ và phút
            timePart = timePart.split(':').slice(0, 2).join(':');
            return `${datePart}T${timePart}`;
        }

        return '';
    } catch (error) {
        console.error("Lỗi khi định dạng ngày:", error, dateString);
        return '';
    }
}

/**
 * Kiểm tra form trước khi submit
 * @param {string} formId - ID của form cần kiểm tra
 * @returns {boolean} - Kết quả kiểm tra (true nếu hợp lệ, false nếu không hợp lệ)
 */
function validateEventForm(formId) {
    const form = document.getElementById(formId);

    if (!form)
        return true;

    const title = form.querySelector('[name="title"]').value.trim();
    const location = form.querySelector('[name="location"]').value.trim();
    const eventDate = form.querySelector('[name="event_date"]').value.trim();
    const maxAttendees = form.querySelector('[name="maxAttendees"]').value.trim();
    const ticketPrice = form.querySelector('[name="ticketPrice"]')?.value.trim();

    let isValid = true;
    let errorMessage = '';

    if (!title) {
        errorMessage += 'Title is required\n';
        isValid = false;
    }

    if (!location) {
        errorMessage += 'Location is required\n';
        isValid = false;
    }

    if (!eventDate) {
        errorMessage += 'Event date is required\n';
        isValid = false;
    }

    if (!maxAttendees || parseInt(maxAttendees) <= 0) {
        errorMessage += 'Max attendees must be a positive number\n';
        isValid = false;
    }

    if (ticketPrice !== undefined && (ticketPrice === '' || parseFloat(ticketPrice) < 0)) {
        errorMessage += 'Ticket price must be a non-negative number\n';
        isValid = false;
    }

    if (!isValid) {
        alert('Please fix the following errors:\n' + errorMessage);
    }

    return isValid;
}

/**
 * Xác nhận đăng xuất
 */
function confirmLogout() {
    $('#logoutModal').modal('show');
}

/**
 * Xử lý hiển thị thông báo lỗi khi không có quyền
 * @param {string} message - Thông báo lỗi
 */
function showErrorMessage(message) {
    if (!message)
        return;

    // Tạo alert hiển thị thông báo lỗi
    const alertHtml = `
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            ${message}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    `;

    // Chèn vào đầu trang
    $('.breadcrumb-wrapper').after(alertHtml);

    // Tự động đóng sau 5 giây
    setTimeout(function () {
        $('.alert-danger').alert('close');
    }, 5000);
}

// QUAN TRỌNG: KHÔNG định nghĩa lại hàm deleteEventModal ở đây
// vì nó đã được định nghĩa trong deleteEventModal.jsp