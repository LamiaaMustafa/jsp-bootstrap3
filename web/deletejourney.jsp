<%-- 
    Document   : deletejourney
    Created on : May 31, 2019, 6:44:44 PM
    Author     : Syla-Group
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            if(request.getMethod().equals("POST")){
                String travelid=request.getParameter("travelid");                
                
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                   String url="jdbc:mysql://localhost:3306/traveldb";
                   Connection con=DriverManager.getConnection(url, "root", "");
                   Statement stm= con.createStatement();
                   String sql="delete from journey WHERE id = '"+travelid+"'";
                  out.println(sql);
                   int n=stm.executeUpdate(sql);
                 if(n==1){
                   out.println("تم حذف رحلة");
                   response.sendRedirect("user.jsp");
                   }else{
                   out.println("فشل حذف رحلة");
                   }
                 
                   
                         }catch (Exception ex){
                         out.println(ex.getMessage());
                         }//catch
            }
        %>
    </body>
</html>
