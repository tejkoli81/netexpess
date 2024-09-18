<%@page import="com.conn.DateDifference"%>
<%@page import="java.time.LocalDate"%>
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
					<h2 align="center" style="color: red;">View All Payment	Details</h2>
					<hr />
					<table class="table table-bordered">
						<tr>
							<th>Sr.No</th>
							<th>Recharge Date</th>
							<th>Plan Name</th>
							<th>Data Transfer(In MBs)</th>
							<th>Validity(Days)</th>
							<th>Net Amount</th>							
							<th>Last Date</th>
						</tr>
						
						<%
						int sr_no=0;
						Connection con=ConnectionProvider.getConnection();
						String email=session.getAttribute("email").toString();	
						PreparedStatement ps=con.prepareStatement("SELECT * FROM bill where email='"+email+"' ORDER BY id DESC");
						ResultSet rs=ps.executeQuery();
						GlobalFunction gf=new GlobalFunction();
						DateDifference df=new DateDifference();
						
						while(rs.next())
						{
							sr_no++;
							String id=rs.getString("id");
							String plan_id=rs.getString("plan_id");
							
							String last_date=rs.getString("last_date");
							String c_date=LocalDate.now().toString();
							long nooddays=df.getDateDifference(last_date,c_date);	
							System.out.print("No of Days "+nooddays);
							if(nooddays>=-2)
							{
							
							Map<String,String> plan_details=gf.getPlanDetails(plan_id);
						%>

						<tr>
							<td><%=sr_no %></td>
							<td><%=rs.getString("recharg_date") %></td>
							<td><%=plan_details.get("plan_name") %></td>
							<td><%=plan_details.get("data_transfer") %></td>
							<td><%=plan_details.get("validity") %></td>
							<td><%=rs.getString("net_amount") %></td>
							<td><%=rs.getString("last_date") %></td>						
						</tr>
						<%}
						}
							%>

					</table>
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