package com.rapidrx.Controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/upload-prescription")
@MultipartConfig(
    maxFileSize = 5 * 1024 * 1024,
    maxRequestSize = 10 * 1024 * 1024
)
public class PrescriptionUploadServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        Part filePart = request.getPart("prescription");

        String fileName = filePart.getSubmittedFileName();

        if (fileName == null || fileName.isEmpty()) {
            response.sendRedirect("uploadPrescription.jsp?error=empty");
            return;
        }

        String extension = fileName.substring(
                fileName.lastIndexOf(".")
        ).toLowerCase();

        if (!extension.equals(".jpg")
                && !extension.equals(".jpeg")
                && !extension.equals(".png")) {

            response.sendRedirect("uploadPrescription.jsp?success=true");
            response.sendRedirect("dashboard.jsp");
            return;
        }

        String uploadPath = getServletContext()
                .getRealPath("/uploads");

        File uploadDir = new File(uploadPath);

        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        String newFileName = System.currentTimeMillis() + extension;

        filePart.write(new File(uploadDir, newFileName).getAbsolutePath());

        response.sendRedirect("dashboard.jsp");
    }
}