package com.suv.servlets;

import com.suv.dao.Message;
import com.suv.dao.UserDao;
import com.suv.entities.User;
import com.suv.java.ConnectionProvider;
import com.suv.java.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


@MultipartConfig
public class EditServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlet</title>");
            out.println("</head>");
            out.println("<body>");

            String userEmail = request.getParameter("user-email");
            String userPassword = request.getParameter("user-password");
            String userName = request.getParameter("user-name");
            String userAbout = request.getParameter("user-about");
            Part part = request.getPart("newImage");
            String imageName = part.getSubmittedFileName();
            String deletePath = part.getSubmittedFileName();

            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("currentUser");
            user.setEmail(userEmail);
            user.setPassword(userPassword);
            user.setName(userName);
            user.setAbout(userAbout);
            user.setProfile(imageName);

            UserDao userDao = new UserDao(ConnectionProvider.getConnection());
            boolean answer = userDao.updateUser(user);
            if (answer) {

                String path = request.getRealPath("/") + "pics" + File.separator + user.getProfile();
                String deletePath1 = request.getRealPath("/") + "pics" + File.separator + deletePath;
                if(!deletePath.equals("default.png"))
                Helper.deleteFile(deletePath1);

                if (Helper.saveFile(part.getInputStream(), path)) {
                    out.println("Updated..");
                    Message msg = new Message("Profile details updated!!","Success","alert-success");
                    session.setAttribute("msg", msg);
                    

                } else {
                       Message msg = new Message("Profile details not updated!!","error","alert-danger");
                    session.setAttribute("msg", msg); 
                }
            } else {
                out.println("Not Updated..");
                Message msg = new Message("Profile details not updated!!","error","alert-danger");
                    session.setAttribute("msg", msg);
                
                
                
                
            }
            response.sendRedirect("profile.jsp");
            out.println("Not Updated..");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
