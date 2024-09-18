<%@page import="com.conn.ConnectionProvider"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Map"%>
<%@page import="com.conn.GlobalFunction"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title><jsp:include page="Header/projectTitle.jsp"></jsp:include></title>
<meta content="" name="description">
<meta content="" name="keywords">
<jsp:include page="alertBox.jsp"/>
<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
<link href="assets/vendor/aos/aos.css" rel="stylesheet">
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">
<style>
        body{
            background-color: #F6F6F6; 
            margin: 0;
            padding: 0;
        }
        h1,h2,h3,h4,h5,h6{
            margin: 0;
            padding: 0;
        }
        p{
            margin: 0;
            padding: 0;
        }
        .container{
            width: 80%;
            margin-right: auto;
            margin-left: auto;
        }
        .brand-section{
           background-color: #0d1033;
           padding: 10px 40px;
        }
        .logo{
            width: 50%;
        }

        .row{
            display: flex;
            flex-wrap: wrap;
        }
        .col-6{
            width: 50%;
            flex: 0 0 auto;
        }
        .text-white{
            color: #fff;
        }
        .company-details{
            float: right;
            text-align: right;
        }
        .body-section{
            padding: 16px;
            border: 1px solid gray;
        }
        .heading{
            font-size: 20px;
            margin-bottom: 08px;
        }
        .sub-heading{
            color: #262626;
            margin-bottom: 05px;
        }
        table{
            background-color: #fff;
            width: 100%;
            border-collapse: collapse;
        }
        table thead tr{
            border: 1px solid #111;
            background-color: #f2f2f2;
        }
        table td {
            vertical-align: middle !important;
            text-align: center;
        }
        table th, table td {
            padding-top: 08px;
            padding-bottom: 08px;
        }
        .table-bordered{
            box-shadow: 0px 0px 5px 0.5px gray;
        }
        .table-bordered td, .table-bordered th {
            border: 1px solid #dee2e6;
        }
        .text-right{
            text-align: end;
        }
        .w-20{
            width: 20%;
        }
        .float-right{
            float: right;
        }
    </style>
</head>

<body>

	<!-- ======= Header ======= -->
	<header id="header" class="fixed-top d-flex align-items-center ">
	<div
		class="container d-flex align-items-center justify-content-between">
		<a> <img src="photos/super_logo.jpeg" style="width: 40%; height: 40%;"></a>

		<nav id="navbar" class="navbar"> <%@ include
			file="Header/userHeader.jsp"%> <i
			class="bi bi-list mobile-nav-toggle"></i> </nav>
	</div>
	</header>
	<!-- End Header -->
	<br />
	<br />
	<!-- ======= Services Section ======= -->
	<section id="services" class="services">
	<div class="container" data-aos="fade-up">

		<div class="row">
			<div class="col-md-12" data-aos-delay="100">
				<div class="icon-box">
					<h2 align="center" style="color: red;">All Payment	 History Details</h2>
					<hr />
					<table class="table table-bordered">
						
						
						<%
					
						Connection con=ConnectionProvider.getConnection();
						String email=session.getAttribute("email").toString();
						String id = request.getParameter("bid");
						
						
						
						PreparedStatement ps=con.prepareStatement("SELECT * FROM bill where email='"+email+"'AND id='"+id+"'");
						//PreparedStatement ps=con.prepareStatement("select id, recharg_date,address,mobile, email, plan_name from bill, customer, plan where bill.id = customer.id and bill.plan_id = plan.plan_id and bill_email='"+email+"'");
						ResultSet rs=ps.executeQuery();
						GlobalFunction gf=new GlobalFunction();
						rs.next();
							
							
						
							
							String plan_id=rs.getString("plan_id");
							Map<String,String> plan_details=gf.getPlanDetails(plan_id);
							Map<String,String> customer_details=gf. getUserDetails(email);
						
						
						%>

						

					</table>
				</div>
			</div>
								 <div class="container">
        <div class="brand-section">
            <div class="row">
                <div class="col-6">
                    <h1 class="text-white">SuperSonic  </h1>
                </div>
                <div class="col-6">
                    <div class="company-details">
                        <p class="text-white">SGMS InfoTech</p>
                        <p class="text-white">Akurdi Pune 411035</p>
                        <p class="text-white">+91 99999 99991</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="body-section">
            <div class="row">
                <div class="col-6">
                    <h2 class="heading">Bill No.: <%=rs.getString("id") %> </h2>
                    <p class="sub-heading">Bill Date: <%=rs.getString("recharg_date") %></p>
                    <p class="sub-heading">Email Address: <%=customer_details.get("email")%> </p>
                </div>
                <div class="col-6">
                    <p class="sub-heading">Full Name: <%=customer_details.get("name")%> <%=customer_details.get("lname")%> </p>
                    <p class="sub-heading">Address: <%=customer_details.get("address")%>  </p>
                    <p class="sub-heading">Phone Number: <%=customer_details.get("mobile")%>  </p>
                    <p class="sub-heading">Email: <%=customer_details.get("email")%> </p>
                </div>
            </div>
        </div>

        <div class="body-section">
            <h3 class="heading">Ordered Plans</h3>
            <br>
            <table class="table-bordered">
                <thead>
                    <tr>
                        <th>Plan</th>
                        <th class="w-20">Cost</th>
                        <th class="w-20">Grand Total</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><%=plan_details.get("plan_name") %></td>
                        <td><%=plan_details.get("package_cost") %></td>
                         <td><%=rs.getString("net_amount") %></td>
                    </tr>
                    <tr>
                        <td colspan="2" class="text-right">Grand Total</td>
                        <td><%=rs.getString("net_amount") %></td>
                    </tr>
                </tbody>
            </table>
            <br>
            <h3 class="heading">Installation Status:Success </h3>
            <h3 class="heading">Payment Mode: 	<% if(rs.getString(7).equals("")){ %> Card <%} else{ %>UPI <% } %></h3>
            <h3 class="heading"><% if(rs.getString(7).equals("")){ %>Card Holder: <%=rs.getString("card_holder") %>  <%} else{ %>Transaction No: <%=rs.getString("upi_no") %> <% } %> </h3>
        </div>
     

     
    </div> 
		</div>
	</section>
	<!-- End Services Section -->
	<!-- End Hero -->
	<main id="main"> <!-- ======= Icon Boxes Section ======= --> <section
		id="icon-boxes" class="icon-boxes"> </section><!-- End Icon Boxes Section -->
	<!-- ======= Services Section ======= --> <section id="services"
		class="services">
	<div class="container" data-aos="fade-up">
	</section><!-- End Services Section --> <!-- ======= Footer ======= --> <footer
		id="footer">
	<div class="container">
		<div class="copyright"></div>
		<div class="credits">
			<jsp:include page="Header/projectTitle.jsp"></jsp:include>
		</div>
	</div>
	</footer>

	<div id="preloader"></div>
	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a> <!-- Vendor JS Files --> <script
		src="assets/vendor/aos/aos.js"></script> <script
		src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> <script
		src="assets/vendor/glightbox/js/glightbox.min.js"></script> <script
		src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script> <script
		src="assets/vendor/php-email-form/validate.js"></script> <script
		src="assets/vendor/swiper/swiper-bundle.min.js"></script> <!-- Template Main JS File -->
	<script src="assets/js/main.js"></script>
</body>

</html>