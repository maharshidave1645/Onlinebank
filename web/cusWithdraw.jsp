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
            PreparedStatement ps1=con.prepareStatement("select * from account where  AccountNumber=?");
            ps1.setString(1,number);
            ResultSet rs1=ps1.executeQuery();
             out.println(rs1);
             if(rs1.next())
             {
                
                 if(rs1.getFloat(5)>0 || rs1.getFloat(5)>-0.0)
                 {
                     
                      float pbalance=rs1.getFloat(5);
                      float totalbalance= pbalance-obalance;
                      if(totalbalance < 0)
                      {
                          response.sendRedirect("lowBal.jsp?message=nobalance");
                      }
                      else
                      {

                        PreparedStatement ps=con.prepareStatement("insert into withdraw(AccountHolderName,AccountNumber,amount) values(?,?,?)");
                        ps.setString(1,name);
                        ps.setString(2,number); 
                        ps.setString(3,amount); 
           
           
                       int result=ps.executeUpdate();
                       if(result==1)
                      {
                        out.println("Amount has send for approval");
                        response.sendRedirect("main.jsp?message=account");
                      }
                        ps.close();
                      }
                 }
                else
                {
                 response.sendRedirect("lowBal.jsp?message=nobalance");
                }
                      

           
            
            
             }
            
            con.close();
            ps1.close();
            }
            catch(Exception ex){
               
                
               ex.printStackTrace();

             
            }
         %>  
    </body>
</html>

