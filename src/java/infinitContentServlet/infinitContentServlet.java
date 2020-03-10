package infinitContentServlet;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "infiniteServlet", urlPatterns = {"/infiniteServlet"})
public class infinitContentServlet extends HttpServlet {

    private static Integer counter = 11;

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {

        String data = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss").format(Calendar.getInstance().getTime());

        if (request.getCharacterEncoding() == null) {
            request.setCharacterEncoding("UTF-8");
        }
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();
        try {
            String resp = "";
            for (int i = 1; i <= 10; i++) {
                resp += "<tr>"
                        + "<td><span class='badge badge-info'>" + counter++ + "</span></td>"
                        + "<td>Conteúdo atualizado dinamicamente do servidor em " + data + "</td>"        
                        + "<td><img src='https://source.unsplash.com/random' style='width: 40px; height: 40px'></td>"
                        + "</tr>";
            }
            out.write(resp);
        } finally {
            out.close();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
    }
}
