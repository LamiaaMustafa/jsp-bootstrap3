<%-- 
    Document   : login
    Created on : May 31, 2019, 6:20:16 AM
    Author     : Syla-Group
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" href="css/mycss.css"/>    </head>
    <body>
        <%
            if(request.getMethod().equals("POST")){
            String name=request.getParameter("username");
            String password=request.getParameter("Password");

            if(name.equals("admin") && password.equals("admin")){
                session.setAttribute("userid", "admin");
                response.sendRedirect("admin.jsp");
            }else{
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    String url="jdbc:mysql://localhost:3306/traveldb";
                    Connection con=DriverManager.getConnection(url, "root", "");
                     Statement stm= con.createStatement();
                     ResultSet r=stm.executeQuery("select passWord from employees where userName='"+name+"'");
                     if(r.next()){
                        String pw=r.getString(1);
                     if(pw.equals(password)){
                        session.setAttribute("userid", name);
                        response.sendRedirect("user.jsp");
                     }else{
                        %>
                        <div class="alert alert-warning" role="alert">
                                فشل تسجيل الدخول قد يكون اسم المستخدم او كلمة المرور غير صحيحة
                            <a href="index.jsp" role="button" class="btn btn-primary">عودة</a>
                        </div>
        
        
        <%

                     }
                     }else{
%>
                        <div class="alert alert-warning" role="alert">
                                فشل تسجيل الدخول قد يكون اسم المستخدم او كلمة المرور غير صحيحة
                            <a href="index.jsp" role="button" class="btn btn-primary">عودة</a>
                        </div>
        
        
        <%                     }
                }catch (Exception ex){
                   out.println(ex.getMessage());
                }//catch
            }
            }
        %>
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="javascript/bootstrap.min.js"></script>
          
    </body>
</html>
