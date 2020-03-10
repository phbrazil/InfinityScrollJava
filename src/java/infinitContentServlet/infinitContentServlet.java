package infinitContentServlet;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "infinitContentServlet", urlPatterns = {"/infinitContentServlet"})
public class infinitContentServlet extends HttpServlet {

    private static Integer counter = 1;

    protected void processRequest(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        try {
            String resp = "";
            for (int i = 1; i <= 10; i++) {
                resp += "<p><span>"
                        + counter++
                        + "</span> This is the dynamic content served freshly from server</p>";
            }
            out.write(resp);
        } finally {
            out.close();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        
        System.out.println("entrei no get");
        PrintWriter out = response.getWriter();
        try {
            String resp = "";
            for (int i = 1; i <= 10; i++) {
                resp += "<p><span>"
                        + counter++
                        + "</span> This is the dynamic content served freshly from server</p>";
            }
            out.write(resp);
        } finally {
            out.close();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        System.out.println("entrei aqui post");
        processRequest(request, response);
    }
}
