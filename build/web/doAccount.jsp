<%-- 
    Document   : doAccount
    Created on : Sep 9, 2019, 12:08:33 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try{
            
            String uname= request.getParameter("uname");
            String accno=request.getParameter("accno");
            String type=request.getParameter("acc_type");
            String details=request.getParameter("details");
          
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/online_banking","root" ,"root");
            PreparedStatement ps=con.prepareStatement("insert into account(AccountHolderName,AccountNumber,AccountType,AccountDetails) values(?,?,?,?)");
            ps.setString(1,uname);
            ps.setString(2,accno); 
            ps.setString(3,type);
            ps.setString(4,details); 
           
            int result=ps.executeUpdate();
            if(result==1)
            {
              
               response.sendRedirect("main.jsp?message=account");
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
