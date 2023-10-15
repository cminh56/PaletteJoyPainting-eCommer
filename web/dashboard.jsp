<%-- 
    Document   : dashboard
    Created on : Oct 5, 2023, 9:33:53 AM
    Author     : Mai Vu Bao
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.UserDAO" %>
<%@page import="Model.Post" %>
<%@page import="java.util.ArrayList" %>
<%@page import="Model.Comment" %>
<!DOCTYPE html>
<html dir="ltr" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- Tell the browser to be responsive to screen width -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="keywords"
              content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, Ample lite admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, Ample admin lite dashboard bootstrap 5 dashboard template">
        <meta name="description"
              content="Ample Admin Lite is powerful and clean admin dashboard template, inpired from Bootstrap Framework">
        <meta name="robots" content="noindex,nofollow">
        <title>Admin Dashboard</title>
        <link rel="canonical" href="https://www.wrappixel.com/templates/ample-admin-lite/" />
        <!-- Favicon icon -->
        <link rel="icon" type="image/png" sizes="16x16" href="plugins/images/favicon.png">
        <!-- Custom CSS -->
        <link href="plugins/bower_components/chartist/dist/chartist.min.css" rel="stylesheet">
        <link rel="stylesheet" href="plugins/bower_components/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.css">
        <!-- Custom CSS -->
        <link href="css/style.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    </head>

    <body>
        <!-- ============================================================== -->
        <!-- Preloader - style you can find in spinners.css -->
        <!-- ============================================================== -->
        <div class="preloader">
            <div class="lds-ripple">
                <div class="lds-pos"></div>
                <div class="lds-pos"></div>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- Main wrapper - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <div id="main-wrapper" data-layout="vertical" data-navbarbg="skin5" data-sidebartype="full"
             data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
            <!-- ============================================================== -->
            <!-- Topbar header - style you can find in pages.scss -->
            <!-- ============================================================== -->
            <header class="topbar" data-navbarbg="skin5">
                <nav class="navbar top-navbar navbar-expand-md navbar-dark">
                    <div class="navbar-header" data-logobg="skin6">
                        <!-- ============================================================== -->
                        <!-- Logo -->
                        <!-- ============================================================== -->
                        <a class="navbar-brand" href="dashboard.jsp" style="text-decoration: none; font-size: 24px; font-weight: bold; color: #333; font-family: Arial, sans-serif;">Admin Dashboard</a>
                        <!-- ============================================================== -->
                        <!-- End Logo -->
                        <!-- ============================================================== -->
                        <!-- ============================================================== -->
                        <!-- toggle and nav items -->
                        <!-- ============================================================== -->
                        <a class="nav-toggler waves-effect waves-light text-dark d-block d-md-none"
                           href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
                    </div>
                    <!-- ============================================================== -->
                    <!-- End Logo -->
                    <!-- ============================================================== -->
                    <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin5">

                        <!-- ============================================================== -->
                        <!-- Right side toggle and nav items -->
                        <!-- ============================================================== -->
                        <ul class="navbar-nav ms-auto d-flex align-items-center">

                            <!-- ============================================================== -->
                            <!-- Search -->
                            <!-- ============================================================== -->
                            <li class=" in">

                            </li>
                            <li>
                                <a class="profile-pic" href="admin-profile.jsp">
                                    <img src="${sessionScope.user.getAvatar()}" alt="user-img" width="36"
                                         class="img-circle"></a>
                                <a href="logout" style="padding-right: 20px"><span class="text-white font-medium">Sign Out</span></a>
                            </li>
                        </ul>
                    </div>
                </nav>
            </header>
            <!-- ============================================================== -->
            <!-- End Topbar header -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Left Sidebar - style you can find in sidebar.scss  -->
            <!-- ============================================================== -->
            <aside class="left-sidebar" data-sidebarbg="skin6">
                <!-- Sidebar scroll-->
                <div class="scroll-sidebar">
                    <!-- Sidebar navigation-->
                    <nav class="sidebar-nav">
                        <ul id="sidebarnav">
                            <!-- User Profile-->
                            <li class="sidebar-item pt-2">
                                <a class="sidebar-link waves-effect waves-dark sidebar-link" href="admin"
                                   aria-expanded="false">
                                    <i class="far fa-clock" aria-hidden="true"></i>
                                    <span class="hide-menu">Statistic</span>
                                </a>
                            </li>
                            <li class="sidebar-item">
                                <a class="sidebar-link waves-effect waves-dark sidebar-link" href="admin-profile.jsp"
                                   aria-expanded="false">
                                    <i class="fa fa-user" aria-hidden="true"></i>
                                    <span class="hide-menu">Profile</span>
                                </a>
                            </li>
                            <li class="sidebar-item">
                                <a class="sidebar-link waves-effect waves-dark sidebar-link" href="manageslide"
                                   aria-expanded="false">
                                    <i class="fa fa-table" aria-hidden="true"></i>
                                    <span class="hide-menu">Slider Management</span>
                                </a>
                            </li>
                            <li class="sidebar-item">
                                <a class="sidebar-link waves-effect waves-dark sidebar-link" href="managepost"
                                   aria-expanded="false">
                                    <i class="fa fa-table" aria-hidden="true"></i>
                                    <span class="hide-menu">Post Management</span>
                                </a>
                            </li>
                        </ul>

                    </nav>
                    <!-- End Sidebar navigation -->
                </div>
                <!-- End Sidebar scroll-->
            </aside>
            <!-- ============================================================== -->
            <!-- End Left Sidebar - style you can find in sidebar.scss  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Page wrapper  -->
            <!-- ============================================================== -->
            <div class="page-wrapper">
                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <div class="page-breadcrumb bg-white">
                    <div class="row align-items-center">
                        <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                            <h4 class="page-title">Dashboard</h4>
                        </div>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- ============================================================== -->
                <!-- End Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Container fluid  -->
                <!-- ============================================================== -->
                <div class="container-fluid">
                    <!-- ============================================================== -->
                    <!-- Three charts -->
                    <!-- ============================================================== -->
                    <div class="row justify-content-center">
                        <div class="col-lg-4 col-md-12">
                            <div class="white-box analytics-info">
                                <h3 class="box-title">Total Waiting Post</h3>
                                <ul class="list-inline two-part d-flex align-items-center mb-0">
                                    <li>
                                        <div id="sparklinedash"><canvas width="67" height="30"
                                                                        style="display: inline-block; width: 67px; height: 30px; vertical-align: top;"></canvas>
                                        </div>
                                    </li>
                                    <li class="ms-auto"><span class="counter text-success">${listStatus.get(0)}</span></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-12">
                            <div class="white-box analytics-info">
                                <h3 class="box-title">Total Approved Post</h3>
                                <ul class="list-inline two-part d-flex align-items-center mb-0">
                                    <li>
                                        <div id="sparklinedash2"><canvas width="67" height="30"
                                                                         style="display: inline-block; width: 67px; height: 30px; vertical-align: top;"></canvas>
                                        </div>
                                    </li>
                                    <li class="ms-auto"><span class="counter text-purple">${listStatus.get(1)}</span></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-12">
                            <div class="white-box analytics-info">
                                <h3 class="box-title">Total denied Post</h3>
                                <ul class="list-inline two-part d-flex align-items-center mb-0">
                                    <li>
                                        <div id="sparklinedash3"><canvas width="67" height="30"
                                                                         style="display: inline-block; width: 67px; height: 30px; vertical-align: top;"></canvas>
                                        </div>
                                    </li>
                                    <li class="ms-auto"><span class="counter text-info">${listStatus.get(2)}</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- RECENT SALES -->
                    <!-- ============================================================== -->
                    <div class="row">
                        <div class="col-md-12 col-lg-6 col-sm-12">
                            <div class="white-box">
                                <div class="d-md-flex mb-3">
                                    <h3 class="box-title mb-0">Top 3 best seller Categories</h3>
                                </div>
                                <div class="table-responsive">
                                    <table class="table no-wrap">
                                        <thead>
                                            <tr>
                                                <th class="border-top-0">#</th>
                                                <th class="border-top-0">Name</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listCategory}" var="cate">
                                                <tr>
                                                    <td>${cate.getCategoryID()}</td>
                                                    <td>${cate.getCategoryName()}</td>
                                                </tr>
                                            </c:forEach>


                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 col-lg-6 col-sm-12">
                            <div class="white-box">
                                <div class="d-md-flex mb-3">
                                    <h3 class="box-title mb-0">Top 3 best seller Type</h3>
                                </div>
                                <div class="table-responsive">
                                    <table class="table no-wrap">
                                        <thead>
                                            <tr>
                                                <th class="border-top-0">#</th>
                                                <th class="border-top-0">Name</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listTopType}" var="type">
                                                <tr>
                                                    <td>${type.split("-")[0]}</td>
                                                    <td>${type.split("-")[1]}</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- PRODUCTS YEARLY SALES -->
                    <!-- ============================================================== -->
                    <div class="row">
                        <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
                            <div class="white-box">
                                <h3 class="box-title">Order Statistic</h3>
                                <div class="col-md-3 col-sm-4 col-xs-6 ms-auto">
                                    <form id="filter" action="admin">
                                        <select class="form-select shadow-none row border-top" name="filter" onchange="submit()">
                                            <option value="1" ${filter eq '1' ? 'selected' : ''}>1 Week</option>
                                            <option value="2" ${filter eq '2' ? 'selected' : ''}>1 Month</option>
                                            <option value="3" ${filter eq '3' ? 'selected' : ''}>3 Month</option>
                                            <option value="4" ${filter eq '4' ? 'selected' : ''}>6 Month</option>
                                            <option value="5" ${filter eq '5' ? 'selected' : ''}>1 Year</option>
                                        </select>
                                    </form> 
                                </div>
                                <div>
                                    <canvas id="barChart"></canvas>
                                </div>
                                
                                <script>
                                    function submit() {
                                        document.getElementById('filter').submit();
                                    }
                                </script>


                                <script>
                                    const ctx = document.getElementById('barChart');
                                    
                                    new Chart(ctx, {
                                        type: 'bar',
                                        data: {
                                            labels: ${listTotal.keySet()},
                                            datasets: [{
                                                    label: '# of Orders',
                                                    data: ${listTotal.values()},
                                                    borderWidth: 1
                                                }]
                                        },
                                        options: {
                                            scales: {
                                                y: {
                                                    beginAtZero: true
                                                }
                                            }
                                        }
                                    });
                                </script>
                            </div>
                        </div>
                    </div>


                    <div class="row">
                        <!-- .col -->
                        <div class="col-md-12 col-lg-12 col-sm-12">
                            <div class="card white-box p-0">
                                <div class="card-body">
                                    <h3 class="box-title mb-0">User Diagram</h3>
                                </div>
                                <div class="comment-widgets" style="padding-bottom: 50px">
                                    <canvas width="400" height="400" id="pieChart"></canvas>
                                </div>
                            </div>
                        </div>
                        <script>
                            const cs = document.getElementById('pieChart');
                            const data = {
                                labels: [
                                    'Active Account',
                                    'Banned Account'
                                ],
                                datasets: [{
                                        label: 'My First Dataset',
                                        data: [${listCountAccount.get(1)}, ${listCountAccount.get(0)}],
                                        backgroundColor: [
                                            '#88F460',
                                            'rgb(255, 99, 132)'
                                        ],
                                        hoverOffset: 4
                                    }]
                            };
                            const config = {
                                type: 'doughnut',
                                data: data,
                                options: {
                                    maintainAspectRatio: false // Disable aspect ratio constraint
                                }
                            };
                            new Chart(cs, config);
                        </script>

                        <!-- ============================================================== -->
                        <!-- Recent Comments -->
                        <!-- ============================================================== -->
                        <div class="row" style="padding-right: 0">
                            <!-- .col -->
                            <div class="col-md-12 col-lg-12 col-sm-12" style="padding-right: 0">
                                <div class="card white-box p-0">
                                    <div class="card-body">
                                        <h3 class="box-title mb-0">Recent Comments</h3>
                                    </div>
                                    <div class="comment-widgets">
                                        <%
                                            ArrayList<Comment> listComment = (ArrayList<Comment>) request.getAttribute("listComment");
                                            for(Comment comment : listComment) {
                                        %>
                                        <!-- Comment Row -->
                                        <div class="d-flex flex-row comment-row p-3 mt-0">
                                            <div class="p-2"><img src="<%=(new UserDAO()).getUser(comment.getUserID()).getAvatar()%>" alt="user" width="50" class="rounded-circle"></div>
                                            <div class="comment-text ps-2 ps-md-3 w-100">
                                                <h5 class="font-medium"><%=(new UserDAO()).getUser(comment.getUserID()).getUserName()%></h5>
                                                <span class="mb-3 d-block"><%=comment.getCommentContent()%></span>
                                                <div class="comment-footer d-md-flex align-items-center">
                                                    <div class="text-muted fs-2 ms-auto mt-2 mt-md-0"><%=comment.getCommentDate()%></div>
                                                </div>
                                            </div>
                                        </div>
                                        <%}%>
                                    </div>
                                </div>
                            </div>

                            <!-- /.col -->
                            <div class="col-md-12 col-lg-12 col-sm-12" style="padding-right: 0"> 
                                <div class="card white-box p-0">
                                    <div class="card-body">
                                        <h3 class="box-title mb-0">Recent Posts</h3>
                                    </div>
                                    <div class="comment-widgets">
                                        <%
                                            ArrayList<Post> listPost = (ArrayList<Post>) request.getAttribute("listPost");
                                            for(Post post : listPost) {
                                        %>
                                        <!-- Comment Row -->
                                        <div class="d-flex flex-row comment-row p-3 mt-0">
                                            <div class="p-2"><img src="<%=(new UserDAO()).getUser(post.getUserID()).getAvatar()%>" alt="user" width="50" class="rounded-circle"></div>
                                            <div class="comment-text ps-2 ps-md-3 w-100">
                                                <h5 class="font-medium"><%=(new UserDAO()).getUser(post.getUserID()).getUserName()%></h5>
                                                <span class="mb-3 d-block"><%=post.getTitle()%></span>
                                                <div class="comment-footer d-md-flex align-items-center">
                                                    <c:if test="<%=post.getStatusID().equals(String.valueOf(1))%>">
                                                        <%=post.getStatusID().equals(String.valueOf(1))%>
                                                        <span class="badge bg-primary rounded">Waiting</span>
                                                    </c:if>
                                                    <c:if test="<%=post.getStatusID().equals(String.valueOf(2))%>">
                                                        <span class="badge bg-success rounded">Approved</span>
                                                    </c:if>
                                                    <c:if test="<%=post.getStatusID().equals(String.valueOf(3))%>">
                                                        <span class="badge rounded bg-danger">Denied</span>
                                                    </c:if>


                                                    <div class="text-muted fs-2 ms-auto mt-2 mt-md-0"><%=post.getDate()%></div>
                                                </div>
                                            </div>
                                        </div>
                                        <%}%>
                                    </div>
                                </div>
                            </div>

                            <!-- /.col -->
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- End Container fluid  -->
                    <!-- ============================================================== -->
                    <!-- ============================================================== -->
                    <!-- footer -->
                    <!-- ============================================================== -->
                    <footer class="footer text-center"> 2023 © Palette Joy Bring Art To You
                    </footer>
                    <!-- ============================================================== -->
                    <!-- End footer -->
                    <!-- ============================================================== -->
                </div>
                <!-- ============================================================== -->
                <!-- End Page wrapper  -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Wrapper -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- All Jquery -->
            <!-- ============================================================== -->
            <script src="plugins/bower_components/jquery/dist/jquery.min.js"></script>
            <!-- Bootstrap tether Core JavaScript -->
            <script src="bootstrap/dist/js/bootstrap.bundle.min.js"></script>
            <script src="js/app-style-switcher.js"></script>
            <script src="plugins/bower_components/jquery-sparkline/jquery.sparkline.min.js"></script>
            <!--Wave Effects -->
            <script src="js/waves.js"></script>
            <!--Menu sidebar -->
            <script src="js/sidebarmenu.js"></script>
            <!--Custom JavaScript -->
            <script src="js/custom.js"></script>
            <!--This page JavaScript -->
            <!--chartis chart-->
            <script src="plugins/bower_components/chartist/dist/chartist.min.js"></script>
            <script src="plugins/bower_components/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
            <script src="js/pages/dashboards/dashboard1.js"></script>
    </body>

</html>
