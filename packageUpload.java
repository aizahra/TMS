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


@WebServlet("/packageUpload")
@MultipartConfig(fileSizeThreshold=1024*1024*2, //2MB
             maxFileSize=1024*1024*10,      // 10MB
             maxRequestSize=1024*1024*50)
public class packageUpload extends HttpServlet {
    private static final String SAVE_DIR = "images";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter outt = response.getWriter();

        
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
                String query = "insert into package values(?,?,?,?,?,?)";

                PreparedStatement pst;
                pst = conn.prepareStatement(query);

                pst.setInt(1, Integer.parseInt(request.getParameter("txt_pId")));
                pst.setString(2, request.getParameter("txt_pname"));
                pst.setString(3, DirPlusFileName);
                pst.setString(4, fileName);
                pst.setString(5, request.getParameter("txt_pdesc"));
                pst.setString(6, request.getParameter("txt_pbudget"));

                int x = pst.executeUpdate();
                if (x > 0)
                    outt.print("sucessfully added");
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
                String query = "delete from package where pId=?";

                PreparedStatement pst = conn.prepareStatement(query);
                pst.setInt(1, Integer.parseInt(request.getParameter("txt_pId")));

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
if (request.getParameter("btn_update") != null) {
            outt.print("UPDATE");
            String fileName = null;
            String path = "C:\\Users\\admin\\Documents\\NetBeansProjects\\WebApplication3\\web" + File.separator + SAVE_DIR;

            try {
                Part filePart = request.getPart("img");
                fileName = extractFileName(filePart);

                File file = new File(path + File.separator + fileName);
                if (file.exists()) {
                    if (file.delete()) {
                        outt.print("File updated successfully.");
                    } else {
                        outt.print("Failed to update the file.");
                    }
                } else {
                    outt.print("File not found.");
                }

                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/tms", "tms", "tms");
                String query = "UPDATE package SET pname=?,imgpath=?,imgname=?,pdesc=?,pbudget=? WHERE pId =?";
                   
                PreparedStatement pst = conn.prepareStatement(query);
                pst.setString(1, request.getParameter("txt_pname"));
                pst.setString(2, request.getParameter("txt_imgpath"));
                pst.setString(3, request.getParameter("txt_imgname"));
                pst.setString(4, request.getParameter("txt_pdesc"));
                pst.setString(5, request.getParameter("txt_pbudget"));
                pst.setInt(6, Integer.parseInt(request.getParameter("txt_pId")));

                int x = pst.executeUpdate();
                if (x > 0) {
                    outt.print("Successfully updated in the database.");
                } else {
                    outt.print("Failed to updated in the database.");
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
                    ResultSet rs = stmt1.executeQuery("select * from package");


                    outt.print("<html><body><form name=ff>");
                    outt.print("<table >");

                    while (rs.next()) {


                        outt.print("<tr>");
                        outt.print("<td>" + rs.getInt(1) + "</td>");
                        outt.print("<td>" + rs.getString(2) + "</td>");
                        outt.print("<td> <img src=" + rs.getString(3) + " width='250' height='200' alt='Tulips'/> </td>");
                        
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