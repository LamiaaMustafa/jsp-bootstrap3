<%-- 
    Document   : addemployee
    Created on : May 31, 2019, 10:29:43 PM
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
                String idcard=request.getParameter("idcard");
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
                   String sql="insert into employees values('"+idcard+"','"+firstname+"','"+lastname+"','"+job+"','"+username+"','"+password+"')";
                   int n=stm.executeUpdate(sql);
                 if(n==1){
                   out.println("تم إضافة موظف");
                   response.sendRedirect("employee.jsp");
                   }else{
                   out.println("فشل إضافة موظف");
                   }
                 
                   
                         }catch (Exception ex){
                         out.println(ex.getMessage());
                         }//catch
            }
        %>
    </body>
</html>
