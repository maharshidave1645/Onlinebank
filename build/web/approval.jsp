<%-- 
    Document   : demo
    Created on : Sep 28, 2020, 3:06:47 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Online Bank</title>
<link href="css/menu.css" rel="stylesheet" type="text/css" />
<link href="css/main.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
html,body{
    background-image: url(images/img.gif);
}
</style>
</head>
    <body>
    <table width="900" border="1" align="center" cellpadding="0" cellspacing="0" style="font-weight:normal; background-color:#FFFFFF">
  <tr>
    <th colspan="3" scope="col" style="height:90px; background-color:#2175bc;"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="900" height="90">
      <param name="movie" value="images/banks.swf" />
      <param name="quality" value="high" />
      <embed src="images/banks.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="900" height="90"></embed>
    </object></th>
  </tr>
  <tr>
    <td colspan="3">&nbsp;</td>
  </tr>
  <tr>
<td width="160" >
<div id="ddblueblockmenu">
  <div class="menutitle">Account Operations</div>
  <ul>
    <li><a href="admin.jsp">Welcome,&nbsp;<%=(String)session.getAttribute("cust_name")%></a></li>
    <li><a href="customer.jsp">Customer Details</a></li>
    <li><a href="accDetails.jsp">Accounts Details</a></li>
    <li><a href="depositApproval.jsp">Deposit Approval</a></li>
    <li><a href="approval.jsp">Withdraw Approval</a></li>
    
	
	<li><a href="logOff.jsp">LogOut</a></li>
  </ul>
  <div class="menutitle">&nbsp;</div>
</div>

<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>	</td>
    <td colspan="2" style="padding:20px;">
	<div class="box1">
	<marquee><h2><font color="#FF0000">Online Net Banking System</font></h2></marquee>
	</div>
	<br/>
	<form id="form1" name="form1" method="post" action="doWithdraw.jsp">
	<table width="70%" border="0" align="center" cellpadding="2" cellspacing="2"border-collapse="collapse">
            
         <tr></tr>
        <tr></tr>
        <tr></tr>
          <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr >
          <th colspan="3" bgcolor="#333333" scope="col"><font color="#FFFFFF">Withdraw   For   Approval</font></th>
        </tr>
        
        <tr>
          <td width="39%">&nbsp;</td>
          <td width="3%">&nbsp;</td>
          <td width="58%">&nbsp;</td>
        </tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        
            <tr>
               
            </tr>
            
        
      
            <tr class="sectable">
                <th>AccountHolderName</th>
                <th>AccountNumber</th>
                <th>Amount</th>
            </tr>
              <% 
            try{
            
            //String ach=request.getParameter("uname");
            //String number=request.getParameter("accNo");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/online_banking","root" ,"root");
            PreparedStatement ps=con.prepareStatement("select * from withdraw");
            // ps.setString(2,number); 
             ResultSet rs=ps.executeQuery();%>
             <%
             while(rs.next())
             {
               out.println("<tr>"); %>
            
             <td><input name="uname" readonly="true"type="text" id="uname" value="<%  out.println(rs.getString(1));  %>"></td>
             <td><input name="accNo" readonly="true"type="text" id="accNo" value="<%  out.println(rs.getString(2));  %>"></td>
             <td><input name="Amount" readonly="true"type="text" id="Amount" value="<%  out.println(rs.getString(3));  %>"></td>
             <td><input type="submit" readonly="true"value="Accept"></td>
          
            
           
            <%
            
               out.println("</tr>");  
            }
            out.println("</table>");
               con.close();
               ps.close();
               rs.close();
            
            }
            catch(Exception ex){
                ex.printStackTrace();
                out.println(ex);
            }      
        %>
         </table>
        </form>
    </body>
</html>
