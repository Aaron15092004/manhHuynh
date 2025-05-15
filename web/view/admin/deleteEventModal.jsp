<%-- 
    Document   : deleteEventModal
    Created on : Mar 10, 2025, 12:10:59 PM
    Author     : Admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="modal fade" id="delete-event-modal" tabindex="-1" role="dialog" aria-labelledby="delete-modal-label" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="delete-modal-label">Confirm Deletion</h5>
                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to delete this Event?</p>
            </div>
            <div class="modal-footer">
                <form action="events?action=delete" method="POST">
                    <div class="form-group" style="display: none">
                        <input type="text" class="form-control" id="idDeleteInput" name="event_id">
                    </div>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                    <button type="submit" class="btn btn-danger">Yes</button>
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