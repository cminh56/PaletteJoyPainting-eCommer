/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DAO.PostDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Nhat Anh
 */
public class PostController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        getDataForPostPage(req, resp);
        req.getRequestDispatcher("blog.jsp").forward(req, resp);
    }

    public void getDataForPostPage(HttpServletRequest req, HttpServletResponse resp) {
        String searchKey = req.getParameter("searchKey");
        String date1 = req.getParameter("dateinput1");
        if (date1 == null) {
            date1 = "";
        }
        String date2 = req.getParameter("dateinput2");
        if (date2 == null) {
            date2 = "";
        }
        if (searchKey == null) {
            searchKey = "";
        }
        String category = req.getParameter("category");
        if (category == null) {
            category = "0";
        }

        String sortElement = req.getParameter("sortElement");
        if (sortElement == null) {
            sortElement = "[CommentNumber]";
        }
        String sortOrder = req.getParameter("sortOrder");
        if (sortOrder == null) {
            sortOrder = "ASC";
        }

        PostDAO postDAO = new PostDAO();
        ArrayList<Map<String, String>> postList = postDAO.getAllPosts(searchKey, date1, date2, sortElement, sortOrder);
        ArrayList<Map<String, String>> categoryList = postDAO.getPostNumberPerCategory();
        ArrayList<Integer> idList = postDAO.getPostIDByCategory(Integer.valueOf(category));
        ArrayList<Map<String, String>> recentPostList = new PostDAO().getRecentPost("0");
        if (Integer.valueOf(category) != 0) {
            Iterator<Map<String, String>> iterator = postList.iterator();
            while (iterator.hasNext()) {
                Map<String, String> map = iterator.next();
                if (!idList.contains(Integer.valueOf(map.get("BlogID")))) {
                    iterator.remove();
                }
            }
        }

        req.setAttribute("recentPostList", recentPostList);
        req.setAttribute("postList", postList);
        req.setAttribute("searchKey", searchKey);
        req.setAttribute("category", category);
        req.setAttribute("sortElement", sortElement);
        req.setAttribute("sortOrder", sortOrder);
        req.setAttribute("cateAndPostNumList", categoryList);
        req.setAttribute("date1", date1);
        req.setAttribute("date2", date2);
    }

}
