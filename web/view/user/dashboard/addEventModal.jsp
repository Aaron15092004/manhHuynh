<%-- 
    Document   : addEventModal
    Created on : Mar 16, 2025, 10:32:30 PM
    Author     : YourName
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <div class="modal fade modal-add-contact" id="addVendor" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content">
                <form action="${pageContext.request.contextPath}/user/events?action=add" method="POST" enctype="multipart/form-data" id="addEventForm" onsubmit="return validateEventForm('addEventForm')">
                    <div class="modal-header px-4">
                        <h5 class="modal-title" id="exampleModalCenterTitle">Add New Event</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <div class="modal-body px-4">
                        <div class="form-group row mb-6">
                            <label for="coverImage" class="col-sm-4 col-lg-2 col-form-label">Image</label>
                            <div class="col-sm-8 col-lg-10">
                                <div class="custom-file mb-1">
                                    <input type="file" class="custom-file-input" id="image" name="image" accept="image/*" required>
                                    <label class="custom-file-label" for="coverImage">Choose file...</label>
                                    <div class="invalid-feedback">Example invalid custom file feedback</div>
                                </div>
                                <!-- Khu vực xem trước ảnh -->
                                <div id="imagePreviewContainer" class="mt-2" style="display: none;">
                                    <img id="imagePreview" src="#" alt="Preview" class="img-thumbnail" style="max-width: 150px;">
                                </div>
                            </div>
                        </div>

                        <div class="row mb-2">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="firstName">Title</label>
                                    <input type="text" class="form-control" id="title" name="title" required>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="lastName">Description</label>
                                    <textarea class="form-control" id="description" name="description" rows="3"></textarea>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="form-group mb-4">
                                    <label for="userName">Location</label>
                                    <input type="text" class="form-control" id="location" name="location" required>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="form-group mb-4">
                                    <label for="event_date">Date</label>
                                    <input type="datetime-local" class="form-control datepicker" id="event_date" name="event_date" required>
                                    <small class="form-text text-muted">Please enter the date in the format: yyyy-MM-ddTHH:mm</small>
                                    <div class="invalid-feedback">Please provide a valid date and time.</div>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="form-group mb-4">
                                    <label for="Birthday">Max Attendees</label>
                                    <input type="number" class="form-control" id="maxAttendees" name="maxAttendees" min="1" value="100" required>
                                </div>
                            </div>

                            <!-- Thêm phần ticket price -->
                            <div class="col-lg-6">
                                <div class="form-group mb-4">
                                    <label for="ticketPrice">Ticket Price</label>
                                    <input type="number" class="form-control" id="ticketPrice" name="ticketPrice" min="0" step="0.01" value="10.00" required>
                                    <small class="form-text text-muted">Enter the price for each ticket</small>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="form-group mb-4">
                                    <label for="category">Category</label>
                                    <select class="form-control" id="category" name="category">
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
                        <button type="Submit" class="btn btn-primary btn-pill">Save Event</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
</html>