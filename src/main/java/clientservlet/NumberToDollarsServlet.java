/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clientservlet;

import com.dataaccess.webservicesserver.NumberConversion;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.net.URL;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.WebServiceRef;

/**
 *
 * @author JadyMartins
 */
@WebServlet(name = "NumberToDollarsServlet", urlPatterns = {"/NumberToDollarsServlet"})
public class NumberToDollarsServlet extends HttpServlet {

    @WebServiceRef(wsdlLocation = "WEB-INF/wsdl/www.dataaccess.com/webservicesserver/NumberConversion.wso.wsdl")
    private NumberConversion service;

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
        
        
        //SSL Code Fix by David 
        TrustManager[] trustAllCerts = new TrustManager[]{
            new X509TrustManager() {
                public java.security.cert.X509Certificate[] getAcceptedIssuers() {
                    return null;
                }

                public void checkClientTrusted(
                        java.security.cert.X509Certificate[] certs, String authType) {
                }

                public void checkServerTrusted(
                        java.security.cert.X509Certificate[] certs, String authType) {
                }
            }
        };

        // Install the all-trusting trust manager
        try {
            SSLContext sc = SSLContext.getInstance("SSL");
            sc.init(null, trustAllCerts, new java.security.SecureRandom());
            HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());
        } catch (Exception e) {
        }

        // Acessing URL
        try {
             URL url = new URL("https://hostname/index.jsp");
        } catch (MalformedURLException e) {
        }
        //Content type to be returned
       response.setContentType("text/html;charset=UTF-8");
        
           try (PrintWriter out = response.getWriter()) {
             //Request Dispatcher to dispatch equest to jsp
            RequestDispatcher rdObj = null;
            rdObj = request.getRequestDispatcher("/index.jsp");
           //User input
                        
            String number2 = request.getParameter("number2");
            
             String regex = "\\d+";
            //If input has not numeric characters
            if(!number2.trim().matches(regex)){
                //Send a message back alerting the user
                request.setAttribute("resultDollar", "Input not valid");
                rdObj.include(request, response);
                 // $('.active').removeClass('active');
  
                 
           //   out.println("<script type='text/javascript'>$('#words').removeClass('active');</script>");
                out.println("<script type='text/javascript'>$('#dollar').addClass('active');</script>");
                out.println("<script type='text/javascript'>$('.collapse').collapse();</script>");
            }else{
                // TODO initialize WS operation arguments here
                com.dataaccess.webservicesserver.NumberConversionSoapType port = service.getNumberConversionSoap();
            // TODO initialize WS operation arguments here
     
            // TODO process result here

            
            java.math.BigDecimal dNum = new java.math.BigDecimal(number2);
            java.lang.String result = port.numberToDollars(dNum);
            
            //Assign result to variable in index.jsp            
            request.setAttribute("resultDollar", result);
            
          //  request.setAttribute("activeTab", "dollar");
            //Include previous page with the  response 
            // out.println("<script type='text/javascript'> $('#words').removeClass('active').eq($('#dollar').addClass('active');</script>");
  
            out.println("<script type='text/javascript'>$('.collapseDollar').collapse();</script>");
            rdObj.include(request, response);
            //Toggle the collapse bar wto display response
            
                 
              
                //out.println("<script type='text/javascript'>$('#dollar').addClass('active');</script>");
               //  out.println("<script type='text/javascript'>$('#words').removeClass('active');</script>");
              
            }
        } catch (Exception ex) {
            // TODO handle custom exceptions here
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
        processRequest(request, response);
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
