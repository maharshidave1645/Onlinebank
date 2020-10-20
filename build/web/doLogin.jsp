<%-- 
    Document   : doLogin
    Created on : Sep 4, 2019, 5:53:54 PM
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
        <title>Login Page</title>
    </head>
    <body>
        <%  
           
            try{
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/online_banking","root" ,"root");
            String uname=request.getParameter("username");
            String pwd=request.getParameter("password"); 
            if (uname.equals("admin") && pwd.equals("admin")) {
                   session.setAttribute("cust_name",uname);
                   response.sendRedirect("admin.jsp?message='success'");
                 }
             else 
            {
                out.println("Enter valid username or password!!");
            }
            if (uname != "admin"){
            PreparedStatement ps=con.prepareStatement("select * from customers where Username= ? and Password= ?");
            ps.setString(1,uname);     
            ps.setString(2,pwd); 

             ResultSet rs=ps.executeQuery();
             
             if(rs.next())
             {

                 session.setAttribute("cust_name",uname);
                 response.sendRedirect("main.jsp?message='success'");}
             
             else{
                 
                 response.sendRedirect("index.jsp?message=fail");
                 
             }
             ps.close();
         rs.close();
            }
         con.close();
         
            
            }
            catch(Exception ex){
                ex.printStackTrace();
            }
        
       
        
        
        
        %>
    </body>
</html>
