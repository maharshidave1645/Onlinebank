<%-- 
    Document   : doWithdraw
    Created on : Sep 9, 2019, 1:06:33 PM
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
        <title>JSP Page</title>
    </head>
    <body>
         <%
            try{
            
            String amount= request.getParameter("Amount");
            float obalance=Float.parseFloat(amount);
            String number=request.getParameter("accNo");
         
          
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/online_banking","root" ,"root");
            PreparedStatement ps1=con.prepareStatement("select * from account where  AccountNumber=?");
            ps1.setString(1,number);
            ResultSet rs1=ps1.executeQuery();
             out.println(rs1);
             if(rs1.next())
             {
                
                 if(rs1.getFloat(5)>0 || rs1.getFloat(5)>-0.0)
                 {
                     out.println("hi");
                      float pbalance=rs1.getFloat(5);
                      float totalbalance= pbalance-obalance;
                    
                     
                    PreparedStatement ps=con.prepareStatement("update account set amount=? where AccountNumber=?");
                    ps.setFloat(1,totalbalance);
                    ps.setString(2,number);
       
                     
                    int result=ps.executeUpdate();
                    
                    if(result==1)
                    {
                        out.println("h1");
                        String number1=request.getParameter("accNo");
                 
                        PreparedStatement ps2=con.prepareStatement("delete from withdraw where AccountNumber=?");
                        ps2.setString(1,number1);
      
                        int ans= ps2.executeUpdate();
                                                out.println("h2");
                        if(ans==1)
                        {   
                                                    out.println("h3");
                            response.sendRedirect("approval.jsp?message=deposite");
                        }
                         else
                        {
                        out.println("Failure");
                        }
    
                       ps2.close();
                        
                    }
                     ps.close();
                 }
                    con.close();
                   
                 }
                 else
                {
                 response.sendRedirect("lowBal.jsp?message=nobalance");
                }
            
             }
             
            
            
            
            catch(Exception ex){
               
                
               ex.printStackTrace();

             
            }
         %> 
    </body>
</html>
