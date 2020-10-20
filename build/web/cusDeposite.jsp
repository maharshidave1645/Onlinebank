<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.io.*" %>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try{
            String name=request.getParameter("uname");
            String number=request.getParameter("accNo");
            String amount= request.getParameter("Amount");
            float obalance=Float.parseFloat(amount);
            
         
          
            
           Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/online_banking","root" ,"root");
            PreparedStatement ps=con.prepareStatement("insert into deposite(AccountHolderName,AccountNumber,amount) values(?,?,?)");
            ps.setString(1,name);
            ps.setString(2,number); 
            ps.setString(3,amount); 
           
           
            int result=ps.executeUpdate();
            if(result==1)
            {
              out.println("Amount has send for approval");
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
