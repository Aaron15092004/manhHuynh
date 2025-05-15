<%-- 
    Document   : deleteEventModal
    Created on : Mar 16, 2025, 12:10:59 PM
    Author     : YourName
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="modal fade" id="delete-event-modal" tabindex="-1" role="dialog" aria-labelledby="delete-modal-label" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="delete-modal-label">Xác nhận xóa sự kiện</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Bạn có chắc chắn muốn xóa sự kiện này không?</p>
                <p class="text-danger">Lưu ý: Thao tác này không thể hoàn tác và sẽ xóa tất cả thông tin liên quan đến sự kiện này, bao gồm cả vé và đăng ký.</p>
            </div>
            <div class="modal-footer">
                <form action="${pageContext.request.contextPath}/user/events?action=delete" method="POST">
                    <div class="form-group" style="display: none">
                        <input type="text" class="form-control" id="idDeleteInput" name="event_id">
                    </div>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy bỏ</button>
                    <button type="submit" class="btn btn-danger">Xác nhận xóa</button>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    function deleteEventModal(event_id) {
        console.log("deleteEventModal called with ID:", event_id);
        let inputId = document.querySelector("#idDeleteInput");
        inputId.value = event_id;
    }
</script>