package config;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Servlet Context Listener để khởi tạo các tài nguyên khi ứng dụng khởi động
 * Chịu trách nhiệm đồng bộ thư mục uploads giữa project và build
 */
@WebListener
public class WebAppInitializer implements ServletContextListener {

    /**
     * Đường dẫn tương đối của thư mục uploads trong ứng dụng web
     */
    private static final String UPLOAD_DIR = "uploads/event_images";

    /**
     * Logger để ghi log
     */
    private static final Logger logger = Logger.getLogger(WebAppInitializer.class.getName());

    /**
     * Phương thức được gọi khi ServletContext được khởi tạo (khi ứng dụng khởi
     * động)
     *
     * @param sce Sự kiện ServletContext
     */
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext context = sce.getServletContext();

        try {
            // Lấy đường dẫn thư mục build (đường dẫn thực thi)
            String webRootPath = context.getRealPath("/");
            Path buildUploadPath = Paths.get(webRootPath, UPLOAD_DIR);

            // Đảm bảo thư mục uploads trong build tồn tại
            Files.createDirectories(buildUploadPath);

            // Lấy đường dẫn thư mục gốc của project
            String projectPath = getProjectRootPath();
            Path projectUploadPath = Paths.get(projectPath, "web", UPLOAD_DIR);

            // Đảm bảo thư mục uploads trong project tồn tại
            Files.createDirectories(projectUploadPath);

            // Ghi log thông tin về các đường dẫn
            logger.info("Application root path: " + projectPath);
            logger.info("Web root path (build): " + webRootPath);
            logger.info("Project upload path: " + projectUploadPath);
            logger.info("Build upload path: " + buildUploadPath);

            // Đồng bộ từ project sang build (để khôi phục sau khi build)
            if (Files.exists(projectUploadPath)) {
                // Sao chép tất cả ảnh từ project sang build
                Files.list(projectUploadPath).forEach(file -> {
                    try {
                        if (Files.isRegularFile(file)) {
                            Path dest = buildUploadPath.resolve(file.getFileName());
                            Files.copy(file, dest, StandardCopyOption.REPLACE_EXISTING);
                            logger.info("Restored image from project to build: " + file.getFileName());
                        }
                    } catch (IOException e) {
                        logger.log(Level.WARNING, "Failed to copy file from project to build: " + file, e);
                    }
                });
            }

            // Đồng bộ từ build sang project (để đảm bảo không bị mất ảnh)
            Files.list(buildUploadPath).forEach(file -> {
                try {
                    if (Files.isRegularFile(file)) {
                        Path dest = projectUploadPath.resolve(file.getFileName());
                        if (!Files.exists(dest)) {
                            Files.copy(file, dest, StandardCopyOption.REPLACE_EXISTING);
                            logger.info("Backed up image from build to project: " + file.getFileName());
                        }
                    }
                } catch (IOException e) {
                    logger.log(Level.WARNING, "Failed to copy file from build to project: " + file, e);
                }
            });

            // Lưu đường dẫn vào context để truy cập từ các servlet
            context.setAttribute("UPLOAD_DIR_PATH", buildUploadPath.toString());
            context.setAttribute("UPLOAD_DIR_URL", "/" + UPLOAD_DIR);
            context.setAttribute("PROJECT_UPLOAD_DIR_PATH", projectUploadPath.toString());

            logger.info("Upload directories initialized and synchronized successfully");

        } catch (IOException e) {
            logger.log(Level.SEVERE, "Failed to initialize upload directories", e);
        }
    }

    /**
     * Phương thức được gọi khi ServletContext bị hủy (khi ứng dụng dừng)
     *
     * @param sce Sự kiện ServletContext
     */
    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // Không cần làm gì đặc biệt khi ứng dụng dừng
        logger.info("Application shutting down");
    }

    /**
     * Xác định đường dẫn thư mục gốc của project
     *
     * @return Đường dẫn thư mục gốc dự án
     */
    private String getProjectRootPath() {
        // Lấy đường dẫn thư mục làm việc hiện tại
        String currentPath = System.getProperty("user.dir");

        // Kiểm tra xem có phải là thư mục project không
        if (Files.exists(Paths.get(currentPath, "web"))) {
            return currentPath;
        }

        // Thử với một số thư mục cha
        Path path = Paths.get(currentPath);
        for (int i = 0; i < 3; i++) {
            Path parent = path.getParent();
            if (parent != null && Files.exists(parent.resolve("web"))) {
                return parent.toString();
            }
            path = parent;
        }

        // Nếu không tìm thấy, sử dụng thư mục người dùng
        logger.warning("Could not determine project root path, using user home directory as fallback");
        return System.getProperty("user.home") + "/harmoni_project";
    }
}
