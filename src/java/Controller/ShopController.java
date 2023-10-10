/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.ProductDAO;

import Model.Category;
import Model.Product;
import Model.Setting;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author admin
 */
@WebServlet(name = "ShopController", urlPatterns = {"/shop"})
public class ShopController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
 String indexPage = request.getParameter("index");
        if (indexPage == null) {
            indexPage = "1";

        }
        int index = Integer.parseInt(indexPage);
        ProductDAO c = new ProductDAO();
  int count = c.getTotalProduct();
        int endPage = count / 16;
        if (count % 16 != 0) {
            endPage++;
        }
        List<Product> list;

        list = c.getAllProduct(index);
        request.setAttribute("listP", list);
request.setAttribute("endP", endPage);
        request.setAttribute("tag", index);
        request.getRequestDispatcher("shop.jsp").forward(request, response);

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

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      String sortprice = request.getParameter("sortprice");
String sortname = request.getParameter("sortname");
 String indexPage = request.getParameter("index");
        if (indexPage == null) {
            indexPage = "1";

        }
        int index = Integer.parseInt(indexPage);
ProductDAO c = new ProductDAO();

  int count = c.getTotalProduct();
        int endPage = count / 16;
        if (count % 16 != 0) {
            endPage++;
        }
        List<Product> listP = null;
if ("all".equals(sortprice) || "all".equals(sortname)) {
    listP = c.getAllProduct(index);
} else if ("asc".equals(sortprice)) {
    listP = c.getpriceAsc(index);
} else if ("desc".equals(sortprice)) {
    listP = c.getpriceDesc(index);
} else if("asc".equals(sortname)){
    listP = c.getNameAsc(index);
} else if ("desc".equals(sortname)) {
    listP = c.getNameDesc(index);
} 

        request.setAttribute("listP", listP);
request.setAttribute("endP", endPage);
        request.setAttribute("tag", index);
        request.getRequestDispatcher("shop.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
