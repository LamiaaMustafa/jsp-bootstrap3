<%-- 
    Document   : updateemployee
    Created on : May 31, 2019, 10:55:58 PM
    Author     : Syla-Group
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            if(request.getMethod().equals("POST")){
                String empid=request.getParameter("empid");
                String firstname=request.getParameter("firstname");
                String lastname=request.getParameter("lastname");
                String job=request.getParameter("job");
                String username=request.getParameter("username");
                String password=request.getParameter("password");
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                   String url="jdbc:mysql://localhost:3306/traveldb";
                   Connection con=DriverManager.getConnection(url, "root", "");
                   Statement stm= con.createStatement();
                   String sql="update employees set firstName='"+firstname+"',lastName='"+lastname+"',job='"+job+"',userName='"+username+"',passWord='"+password+"' WHERE id = '"+empid+"'";
                  out.println(sql);
                   int n=stm.executeUpdate(sql);
                 if(n==1){
                   out.println("تم تعديل موظف");
                   response.sendRedirect("employee.jsp");
                   }else{
                   out.println("فشل تعديل موظف");
                   }
                 
                   
                         }catch (Exception ex){
                         out.println(ex.getMessage());
                         }//catch
            }
        %>
    </body>
</html>
