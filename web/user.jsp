<%-- 
    Document   : user
    Created on : May 31, 2019, 6:40:02 AM
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
        <title>reserve</title>
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
            <h1 class="page-header">مرحبا <%=s %> </h1>
            <h3>يمكنك من هنا إضافة أو حذف أو تعديل الرحلات </h3>
            <form method="post">
                <div class="row">
                    <div class="col-xs-12 col-md-5">
                        <a role="button" href="travellersnames.jsp" class="btn btn-info btn-lg"> أسماء الركاب</a>
                        <a role="button" id="addbutton" class="btn btn-success btn-lg"> اضافة رحلة</a>
                        <a role="button" id="updatebutton" class="btn btn-warning btn-lg"> تعديل رحلة</a>
                        <a role="button" id="deletebutton" class="btn btn-danger btn-lg"> حذف رحلة</a>

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
                    <h4 class="modal-title">اضافة رحلة</h4>
                  
                </div>
                <div class="modal-body">
                    <form method="post" action="addjourney.jsp">
                        <div class="form-group row">
                        <div class="col-md-10">
                            <input type="text" class="form-control" id="dest" name="dest" placeholder="الوجهة" required>
                        </div>
                         <label for="dest" class="col-md-2 ">الوجهة</label>

                    </div>
                    <div class="form-group row">
                        <div class="col-md-10">
                            <input type="date" class="form-control" id="date" name="date" placeholder="التاريخ" required>
                        </div>
                        <label for="date" class="col-md-2 ">التاريخ</label>

                    </div>
                    <div class="form-group row">
                        <div class="col-md-10">
                            <input type="time" class="form-control" id="time" name="time" placeholder="الوقت" required>
                        </div>
                        <label for="time" class="col-md-2 ">الوقت</label>

                    </div>    
                    <div class="form-group row">
                            
                        <div class="col-md-10">
                                <input type="text" class="form-control" id="num" name="num" placeholder="عدد المقاعد" required>
                            </div>
                             <label for="num" class="col-xs-12 col-md-2 ">عدد المقاعد</label>

                        </div>
                        <div class="form-group row">
                                    <div class="col-md-10">
                                        <textarea class="form-control" id="descripe" name="descripe" rows="4" required></textarea>
                                    </div>
                                    <label for="descripe" class="col-md-2 ">الوصف</label>
                            </div>
                        <div class="form-group row">
                            <div class="col-md-10">
                                <input type="text" class="form-control" id="price" name="price" placeholder="السعر" required>
                            </div>
                            <label for="price" class="col-md-2">السعر</label>

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
                    <h4 class="modal-title">تعديل رحلة</h4>
                  
                </div>
                <div class="modal-body">
                    <form method="post" action="updatejourney.jsp">
                        <div class="form-group row">
                        <div class="col-md-10">
                            <%
                             try{
                             Class.forName("com.mysql.jdbc.Driver");
                             String url="jdbc:mysql://localhost:3306/traveldb";
                             Connection con=DriverManager.getConnection(url, "root", "");
                             Statement stm= con.createStatement();
                             ResultSet r=stm.executeQuery("select id from journey");
                             %>
                            <select class="form-control" id="travelid" name="travelid">
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
                                <label class="col-md-2" >رقم الرحلة</label>
                        </div>
                        <div class="form-group row">
                        <div class="col-md-10">
                            <input type="text" class="form-control" id="dest" name="dest" placeholder="الوجهة" required>
                        </div>
                         <label for="dest" class="col-md-2 ">الوجهة</label>

                    </div>
                    <div class="form-group row">
                        <div class="col-md-10">
                            <input type="date" class="form-control" id="date" name="date" placeholder="التاريخ" required>
                        </div>
                        <label for="date" class="col-md-2 ">التاريخ</label>

                    </div>
                    <div class="form-group row">
                        <div class="col-md-10">
                            <input type="time" class="form-control" id="time" name="time" placeholder="الوقت" required>
                        </div>
                        <label for="time" class="col-md-2 ">الوقت</label>

                    </div>    
                    <div class="form-group row">
                            
                        <div class="col-md-10">
                                <input type="text" class="form-control" id="num" name="num" placeholder="عدد المقاعد" required>
                            </div>
                             <label for="num" class="col-xs-12 col-md-2 ">عدد المقاعد</label>

                        </div>
                        <div class="form-group row">
                                    <div class="col-md-10">
                                        <textarea class="form-control" id="descripe" name="descripe" rows="4" required></textarea>
                                    </div>
                                    <label for="descripe" class="col-md-2 ">الوصف</label>
                            </div>
                        <div class="form-group row">
                            <div class="col-md-10">
                                <input type="text" class="form-control" id="price" name="price" placeholder="السعر" required>
                            </div>
                            <label for="price" class="col-md-2">السعر</label>

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
                    <h4 class="modal-title">حذف رحلة</h4>
                  
                </div>
                <div class="modal-body">
                    <form method="post" action="deletejourney.jsp">
                        <div class="form-group row">
                        <div class="col-md-10">
                            <%
                             try{
                             Class.forName("com.mysql.jdbc.Driver");
                             String url="jdbc:mysql://localhost:3306/traveldb";
                             Connection con=DriverManager.getConnection(url, "root", "");
                             Statement stm= con.createStatement();
                             ResultSet r=stm.executeQuery("select id from journey");
                             %>
                            <select class="form-control" id="travelid" name="travelid">
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
                                <label class="col-md-2" >رقم الرحلة</label>
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
                         sql="select * from journey where destination like '%"+search+"%'";
                        }else{
                        sql="select * from journey ";
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
                        <tr >
                          <th>رقم </th>
                          <th>الوجهة</th>
                          <th>التاريخ</th>
                          <th>الوقت</th>
                          <th>عدد المقاعد</th>
                          <th>الوصف</th>                                    
                          <th>السعر</th>                                    
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
                      <td><%=r.getString(7) %></td> 
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
