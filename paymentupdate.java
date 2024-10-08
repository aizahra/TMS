/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/paymentupdate")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
             maxFileSize=1024*1024*10,      // 10MB
             maxRequestSize=1024*1024*50)
public class paymentupdate extends HttpServlet {
    private static final String SAVE_DIR = "images";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter outt = response.getWriter();

        //String savePath = "C:\Users\admin\Documents\NetBeansProjects\WebApplication1" + File.separator + SAVE_DIR; //specify your path here
        if (request.getParameter("btn_add") != null) {
            outt.print("0lmmmmmmmmm");
            String savePath = "";
            Part filePart = null;
            filePart = request.getPart("img");

            String path = "C:\\Users\\admin\\Documents\\NetBeansProjects\\WebApplication3\\web" + File.separator + SAVE_DIR;

            File file = new File(path);
            file.mkdir();
            String fileName = extractFileName(filePart);

            outt.print(path);
            OutputStream out = null;
            InputStream filecontent = null;

            try {
                out = new FileOutputStream(new File(path + File.separator + fileName));

                filecontent = filePart.getInputStream();


                int read = 0;
                final byte[] bytes = new byte[1024];

                while ((read = filecontent.read(bytes)) != -1) {
                    out.write(bytes, 0, read);

                    savePath = path + File.separator + fileName;

                }

                String DirPlusFileName = null;
                DirPlusFileName = SAVE_DIR + File.separator + fileName;

                outt.printf(DirPlusFileName);

                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/tms", "tms", "tms");
                String query = "insert into payment values(?,?)";

                PreparedStatement pst;
                pst = conn.prepareStatement(query);

                // String filePath= savePath + File.separator + fileName ;
                
                pst.setString(1, DirPlusFileName);
                pst.setString(2, fileName);
                int x = pst.executeUpdate();
                if (x > 0)
                    outt.print("sucessfully changed");
            } catch (Exception ex) {
                outt.print(ex);
            }
        }


        if (request.getParameter("btn_delete") != null) {
            outt.print("DELETE");
            String fileName = null;
            String path = "C:\\Users\\admin\\Documents\\NetBeansProjects\\WebApplication3\\web" + File.separator + SAVE_DIR;

            try {
                Part filePart = request.getPart("img");
                fileName = extractFileName(filePart);

                File file = new File(path + File.separator + fileName);
                if (file.exists()) {
                    if (file.delete()) {
                        outt.print("File deleted successfully.");
                    } else {
                        outt.print("Failed to delete the file.");
                    }
                } else {
                    outt.print("File not found.");
                }

                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/tms", "tms", "tms");
                String query = "delete from payment where imgname=?";

                PreparedStatement pst = conn.prepareStatement(query);
                pst.setString(1, request.getParameter("txt_imgname"));

                int x = pst.executeUpdate();
                if (x > 0) {
                    outt.print("Successfully deleted from the database.");
                } else {
                    outt.print("Failed to delete from the database.");
                }
            } catch (Exception ex) {
                outt.print(ex);
            }
        }


        if (request.getParameter("btn_view") != null) {
            Connection conn = null;
            try {

                if (request.getParameter("btn_view") != null) {

                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                    conn = DriverManager.getConnection("jdbc:derby://localhost:1527/tms", "tms", "tms");
                    Statement stmt1 = conn.createStatement();
                    ResultSet rs = stmt1.executeQuery("select * from payment");


                    outt.print("<html><body><form name=ff>");
                    outt.print("<table >");

                    while (rs.next()) {


                        outt.print("<tr>");
                        outt.print("<td> <img src=" + rs.getString(1) + " width='250' height='200' alt='Tulips'/> </td>");
//                        outt.print("<td>" + rs.getString(2) + "</td>");
//                        outt.print("<td>" + rs.getString(3) + "</td>");
                        
                        
                        
                        outt.print("</tr>");

                    }


                    outt.println("</form></body></html>");

                }
            } catch (Exception ex) {
                outt.println(ex);
            } finally {
                if (conn != null) {
                    try {
                        conn.close();
                        conn = null;
                    } catch (SQLException ex) {
                        ex.printStackTrace();
                    }
                }
            }
        }
    }

    private String extractFileName(Part part) {
        final String partHeader = part.getHeader("content-disposition");

        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(
                        content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}