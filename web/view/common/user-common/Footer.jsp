<%-- 
    Document   : Footer
    Created on : Mar 16, 2025, 1:10:00 AM
    Author     : YourName
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <footer class="footer mt-auto">
        <div class="copyright bg-white">
            <p>
                Copyright &copy; <span id="currentYear">2025</span> Harmoni - All Rights Reserved.
            </p>
        </div>
    </footer>
    <script>
        document.getElementById('currentYear').textContent = new Date().getFullYear();
    </script>
</html>