<%-- 
    Document   : deleteemployee
    Created on : May 31, 2019, 10:21:07 PM
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
                String empid=request.getParameter("empid");                
                
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                   String url="jdbc:mysql://localhost:3306/traveldb";
                   Connection con=DriverManager.getConnection(url, "root", "");
                   Statement stm= con.createStatement();
                   String sql="delete from employees WHERE id = '"+empid+"'";
                  out.println(sql);
                   int n=stm.executeUpdate(sql);
                 if(n==1){
                   out.println("تم حذف موظف");
                   response.sendRedirect("employee.jsp");
                   }else{
                   out.println("فشل حذف موظف");
                   }
                 
                   
                         }catch (Exception ex){
                         out.println(ex.getMessage());
                         }//catch
            }
        %>
    </body>
</html>
