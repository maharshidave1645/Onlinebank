<%-- 
    Document   : doRegister
    Created on : Sep 4, 2019, 12:01:19 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.io.*" %>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>



<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
    </head>
    <body>
        <%
            try{
            
            String uname= request.getParameter("username");
            String pass=request.getParameter("password");
            String question=request.getParameter("question");
            String answer=request.getParameter("answer");
            String address=request.getParameter("address");
            String email=request.getParameter("email");
            String mobile=request.getParameter("mobile");
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/online_banking","root" ,"root");
            PreparedStatement ps=con.prepareStatement("insert into customers values(?,?,?,?,?,?,?)");
            ps.setString(1,uname);
            ps.setString(2,pass); 
            ps.setString(3,question);
            ps.setString(4,answer); 
            ps.setString(5,address);
            ps.setString(6,email);
            ps.setString(7,mobile);
            int result=ps.executeUpdate();
            if(result==1)
            {
              
               response.sendRedirect("index.jsp?message='success'");
            }
            

            con.close();
            ps.close();
            
            
            
            
            
            
            
            }
            catch(Exception ex){
               
                
               ex.printStackTrace();

             
            }
         %>  
    </body>
</html>
