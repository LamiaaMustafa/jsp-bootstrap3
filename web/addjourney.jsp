<%-- 
    Document   : addjourney
    Created on : May 31, 2019, 12:54:14 PM
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
                String dest=request.getParameter("dest");
                String date=request.getParameter("date");
                String time=request.getParameter("time");
                String num=request.getParameter("num");
                String descripe=request.getParameter("descripe");
                String price=request.getParameter("price");
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                   String url="jdbc:mysql://localhost:3306/traveldb";
                   Connection con=DriverManager.getConnection(url, "root", "");
                   Statement stm= con.createStatement();
                   String sql="insert into journey values(null,'"+dest+"','"+date+"','"+time+"','"+num+"','"+descripe+"','"+price+"')";
                   int n=stm.executeUpdate(sql);
                 if(n==1){
                   out.println("تم إضافة رحلة");
                   response.sendRedirect("user.jsp");
                   }else{
                   out.println("فشل إضافة رحلة");
                   }
                 
                   
                         }catch (Exception ex){
                         out.println(ex.getMessage());
                         }//catch
            }
        %>
    </body>
</html>
