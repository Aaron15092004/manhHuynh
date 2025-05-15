<%-- 
    Document   : editEventModal
    Created on : Mar 16, 2025, 4:46:34 PM
    Author     : YourName
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="modal fade modal-edit-contact" id="edit-event-modal" tabindex="-1" role="dialog" aria-labelledby="edit-modal-label" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <form action="${pageContext.request.contextPath}/user/events?action=edit" method="POST" enctype="multipart/form-data" id="editEventForm" onsubmit="return validateEventForm('editEventForm')">
                <input type="hidden" id="edit-event-id" name="event_id">
                <div class="modal-header px-4">
                    <h5 class="modal-title" id="editEventModalTitle">Edit Event</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <div class="modal-body px-4">
                    <div class="form-group row mb-6">
                        <label for="edit-image" class="col-sm-4 col-lg-2 col-form-label">Image</label>
                        <div class="col-sm-8 col-lg-10">
                            <div class="custom-file mb-1">
                                <input type="file" class="custom-file-input" id="edit-image" name="image" accept="image/*">
                                <label class="custom-file-label" for="edit-image">Choose file...</label>
                            </div>
                            <div class="mt-2">
                                <img id="preview-image" src="" alt="Current Image" class="img-thumbnail" style="max-width: 150px;">
                                <input type="hidden" id="edit-current-image" name="currentImage" value="">
                            </div>
                        </div>
                    </div>

                    <div class="row mb-2">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="edit-title">Title</label>
                                <input type="text" class="form-control" id="edit-title" name="title" required>
                            </div>
                        </div>

                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="edit-description">Description</label>
                                <textarea class="form-control" id="edit-description" name="description" rows="3"></textarea>
                            </div>
                        </div>

                        <div class="col-lg-6">
                            <div class="form-group mb-4">
                                <label for="edit-location">Location</label>
                                <input type="text" class="form-control" id="edit-location" name="location" required>
                            </div>
                        </div>

                        <div class="col-lg-6">
                            <div class="form-group mb-4">
                                <label for="edit-event-date">Date</label>
                                <input type="datetime-local" class="form-control" id="edit-event-date" name="event_date" required>
                                <small class="form-text text-muted">Please enter the date in the format: yyyy-MM-ddTHH:mm</small>
                            </div>
                        </div>

                        <div class="col-lg-6">
                            <div class="form-group mb-4">
                                <label for="edit-max-attendees">Max Attendees</label>
                                <input type="number" class="form-control" id="edit-max-attendees" name="maxAttendees" min="1" required>
                            </div>
                        </div>

                        <!-- Thêm phần ticket price -->
                        <div class="col-lg-6">
                            <div class="form-group mb-4">
                                <label for="edit-ticket-price">Ticket Price</label>
                                <input type="number" class="form-control" id="edit-ticket-price" name="ticketPrice" min="0" step="0.01" required>
                                <small class="form-text text-muted">Enter the price for each ticket</small>
                            </div>
                        </div>

                        <div class="col-lg-6">
                            <div class="form-group mb-4">
                                <label for="edit-category">Category</label>
                                <select class="form-control" id="edit-category" name="category">
                                    <c:forEach items="${listCategory}" var="cat">
                                        <option value="${cat.category_id}">${cat.category_name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal-footer px-4">
                    <button type="button" class="btn btn-secondary btn-pill" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary btn-pill">Save Changes</button>
                </div>
            </form>
        </div>
    </div>
</div>