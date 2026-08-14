package com.rapidrx.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/online-payment")
public class OnlinePaymentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        String simulationId =
                request.getParameter("simulationId");

        if (simulationId == null ||
                simulationId.trim().isEmpty()) {

            response.sendRedirect(
                    "online-payment.jsp?error=invalid"
            );
            return;
        }

        // Save payment information in session
        session.setAttribute(
                "paymentMethod",
                "Online Payment"
        );

        session.setAttribute(
                "paymentStatus",
                "Paid"
        );

        // Reuse existing order creation flow
        response.sendRedirect("confirm-payment");
    }
}