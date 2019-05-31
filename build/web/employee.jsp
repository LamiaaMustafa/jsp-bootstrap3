<%-- 
    Document   : employee
    Created on : May 31, 2019, 10:06:59 PM
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
        <title>employee</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" href="css/mycss.css"/>
        <style>
            .page-header{
                color: #6c76d7 ;
            }
        </style>
    </head>
    <body>
<%
        String s=(String)session.getAttribute("userid");
        if(s==null){
        response.sendRedirect("index.jsp");
        }
           %>
        <div class="container">
            <div class="row">
            <div class="col-xs-1" style="margin-top:20px;">
                <a href="admin.jsp"><span class="glyphicon glyphicon-arrow-left " aria-hidden="true"></span> رجوع</a>
            </div>
            <h1 class="page-header">مرحبا <%=s %> </h1>
            </div>
            <h3>يمكنك من هنا إضافة أو حذف أو تعديل بيانات الموظفين </h3>
            <form method="post">
                <div class="row">
                    <div class="col-xs-12 col-md-5">
                        <a role="button" id="addbutton" class="btn btn-success btn-lg"> اضافة موظف</a>
                        <a role="button" id="updatebutton" class="btn btn-warning btn-lg"> تعديل موظف</a>
                        <a role="button" id="deletebutton" class="btn btn-danger btn-lg"> حذف موظف</a>

                    </div>

                    <div class="col-xs-9 col-md-4 col-md-offset-2">
                            <input type="text" class="form-control  " id="searchinput" name="searchinput" >
                    </div>
                    <div class=" col-md-1 col-xs-3">
                    <button type="submit" class="btn btn-primary btn-sm" id="search">بحث</button>
                    </div>

                </div>

            </form>
            <div id="addModal" class="modal fade" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">اضافة موظف</h4>
                  
                </div>
                <div class="modal-body">
                    <form method="post" action="addemployee.jsp">
                        <div class="form-group row">
                        <div class="col-md-10">
                            <input type="text" class="form-control" id="idcard" name="idcard" placeholder="الرقم الوطني" required>
                        </div>
                        <label for="lastname" class="col-md-2 ">الرقم الوطني</label>

                    </div>  
                        <div class="form-group row">
                        <div class="col-md-10">
                            <input type="text" class="form-control" id="firstname" name="firstname" placeholder="الاسم الأول" required>
                        </div>
                         <label for="firstname" class="col-md-2 ">الاسم الأول</label>

                    </div>
                    <div class="form-group row">
                        <div class="col-md-10">
                            <input type="text" class="form-control" id="lastname" name="lastname" placeholder="الاسم الأخير" required>
                        </div>
                        <label for="lastname" class="col-md-2 ">الاسم الأخير</label>

                    </div>
                      
                    <div class="form-group row">
                            
                        <div class="col-md-10">
                                <input type="text" class="form-control" id="job" name="job" placeholder="طبيعة العمل" required>
                            </div>
                             <label for="job" class="col-xs-12 col-md-2 ">طبيعة العمل</label>

                        </div>
                        <div class="form-group row">
                            <div class="col-md-10">
                                <input type="text" class="form-control" id="username" name="username" placeholder="اسم المستخدم">
                            </div>
                            <label for="username" class="col-md-2">اسم المستخدم</label>

                        </div>
                        <div class="form-group row">
                            <div class="col-md-10">
                                <input type="password" class="form-control" id="password" name="password" placeholder="كلمة المرور">
                            </div>
                            <label for="password" class="col-md-2">كلمة المرور</label>

                        </div>
                         
                        <div class="row">
                            <button type="button" class="btn btn-default btn-sm " data-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary btn-sm">اضاقة</button>        
                        </div>
                    </form>
                </div>
              </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
          </div><!-- /.modal -->
<div id="updateModal" class="modal fade" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">تعديل موظف</h4>
                  
                </div>
                <div class="modal-body">
                    <form method="post" action="updateemployee.jsp">
                        <div class="form-group row">
                        <div class="col-md-10">
                            <%
                             try{
                             Class.forName("com.mysql.jdbc.Driver");
                             String url="jdbc:mysql://localhost:3306/traveldb";
                             Connection con=DriverManager.getConnection(url, "root", "");
                             Statement stm= con.createStatement();
                             ResultSet r=stm.executeQuery("select id from employees");
                             %>
                            <select class="form-control" id="empid" name="empid">
                                 <% while(r.next()){
                                    %>
                                    <option><%=r.getString(1) %></option>
                                    <%
                                    }
                                     r.close();
                                     }catch (Exception ex){
                                     out.println(ex.getMessage());
                                     }//catch
                                    %>
                            </select>
                                </div>                            
                                <label class="col-md-2" >رقم الموظف</label>
                        </div>
<div class="form-group row">
                        <div class="col-md-10">
                            <input type="text" class="form-control" id="firstname" name="firstname" placeholder="الاسم الأول" required>
                        </div>
                         <label for="firstname" class="col-md-2 ">الاسم الأول</label>

                    </div>
                    <div class="form-group row">
                        <div class="col-md-10">
                            <input type="text" class="form-control" id="lastname" name="lastname" placeholder="الاسم الأخير" required>
                        </div>
                        <label for="lastname" class="col-md-2 ">الاسم الأخير</label>

                    </div>
                      
                    <div class="form-group row">
                            
                        <div class="col-md-10">
                                <input type="text" class="form-control" id="job" name="job" placeholder="طبيعة العمل" required>
                            </div>
                             <label for="job" class="col-xs-12 col-md-2 ">طبيعة العمل</label>

                        </div>
                        <div class="form-group row">
                            <div class="col-md-10">
                                <input type="text" class="form-control" id="username" name="username" placeholder="اسم المستخدم">
                            </div>
                            <label for="username" class="col-md-2">اسم المستخدم</label>

                        </div>
                        <div class="form-group row">
                            <div class="col-md-10">
                                <input type="password" class="form-control" id="password" name="password" placeholder="كلمة المرور">
                            </div>
                            <label for="password" class="col-md-2">كلمة المرور</label>

                        </div>
                                              
                        <div class="row">
                            <button type="button" class="btn btn-default btn-sm " data-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary btn-sm">تعديل</button>        
                        </div>
                    </form>
                </div>
              </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
          </div><!-- /.modal -->
<div id="deleteModal" class="modal fade" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">حذف موظف</h4>
                  
                </div>
                <div class="modal-body">
                    <form method="post" action="deleteemployee.jsp">
                        <div class="form-group row">
                        <div class="col-md-10">
                            <%
                             try{
                             Class.forName("com.mysql.jdbc.Driver");
                             String url="jdbc:mysql://localhost:3306/traveldb";
                             Connection con=DriverManager.getConnection(url, "root", "");
                             Statement stm= con.createStatement();
                             ResultSet r=stm.executeQuery("select id from employees");
                             %>
                            <select class="form-control" id="empid" name="empid">
                                 <% while(r.next()){
                                    %>
                                    <option><%=r.getString(1) %></option>
                                    <%
                                    }
                                     r.close();
                                     }catch (Exception ex){
                                     out.println(ex.getMessage());
                                     }//catch
                                    %>
                            </select>
                                </div>                            
                                <label class="col-md-2" >رقم الموظف</label>
                        </div>
                         
                        <div class="row">
                            <button type="button" class="btn btn-default btn-sm " data-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary btn-sm">حذف</button>        
                        </div>
                    </form>
                </div>
              </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
          </div><!-- /.modal -->
          

            
            <div class="row row-content" >
                
                <%
                    String search=request.getParameter("searchinput");
                    String sql="";
                    if(search!=null){
                         sql="select * from employees where firstName like '%"+search+"%'";
                        }else{
                        sql="select * from employees ";
                    }

                    try{
                    Class.forName("com.mysql.jdbc.Driver");
                   String url="jdbc:mysql://localhost:3306/traveldb";
                   Connection con=DriverManager.getConnection(url, "root", "");
                   Statement stm= con.createStatement();
                   ResultSet r=stm.executeQuery(sql);
                   %>
                   <div class="table-responsive">
                    <table class="table table-striped">
                        <tr class="info">
                          <th>الرقم الوطني </th>
                          <th>الاسم الاول</th>
                          <th>الاسم الاخير</th>
                          <th>طبيعة العمل</th>
                          <th>اسم المستخدم</th>
                          <th>كلمة المرور</th>                                    
                     </tr>
                  <%
                   while(r.next()){
                  %>
                  <tr style="text-align: left;">
                      <td><%=r.getString(1) %></td>  
                      <td><%=r.getString(2) %></td> 
                      <td><%=r.getString(3) %></td>  
                      <td><%=r.getString(4) %></td>  
                      <td><%=r.getString(5) %></td>  
                      <td><%=r.getString(6) %></td> 
                  </tr>
                  <%
                  }//while

                 out.println("</table> ");

                   r.close();
                   }catch (Exception ex){
                   out.println(ex.getMessage());
                   }//catch
                    %> 
                </div>     
        </div>
            
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="javascript/bootstrap.min.js"></script>
        <script>
            
            $("#addbutton").click(function(){
            $('#addModal').modal('toggle');
            });
            $("#updatebutton").click(function(){
            $('#updateModal').modal('toggle');
            });
            $("#deletebutton").click(function(){
            $('#deleteModal').modal('toggle');
            });
        </script>
 <script>
            
   </script>      
    </body>
</html>
