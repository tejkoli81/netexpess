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
<jsp:include page="alertBox.jsp"/>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title><jsp:include page="Header/projectTitle.jsp"></jsp:include></title>
<meta content="" name="description">
<meta content="" name="keywords">

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


	<!-- Payment js File -->
<script src="css/script.js"></script>


<script src="css/script.js"></script>


					<script>
    function validateForm() {
        var paymentMethod = document.getElementById('payment-method').value;

        if (paymentMethod === 'card') {
            if (!validCardNumber()) {
                return false;
            }
        }
        return true;
    }

    function validCardNumber() {
        var cardNumber = document.getElementById('card_number').value;
        var cardNumberError = document.getElementById('card-number-error');

        if (!/^\d{16}$/.test(cardNumber)) {
            cardNumberError.innerHTML = 'Please enter a valid 16-digit card number';
            return false;
        } else {
            cardNumberError.innerHTML = '';
            return true;
        }
    }
</script>

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
	<br />
	<br />
	<!-- ======= Services Section ======= -->
	<section id="services" class="services">
	<div class="container" data-aos="fade-up">
		<div class="row">

			<div class="col-md-6" data-aos-delay="100">
				<div class="icon-box">
					<h2 align="center" style="color: red;">View Selected Plans</h2>
					<hr />
					<%
                String id=request.getParameter("p_id");
				System.out.print("Plan ID Select "+id);
				session.setAttribute("p_id", id);
                Map<String,String> p_details=GlobalFunction.getPlanDetails(id);
                
                %>

					<table class="table table-bordered">
						<tr>
							<th>Plan Name</th>
							<td><%=p_details.get("plan_name") %></td>
						</tr>
						<tr>

							<th>Data Transfer(In MBs)</th>
							<td><%=p_details.get("data_transfer") %></td>
						</tr>
						<tr>
							<th>Hours</th>
							<td><%=p_details.get("hours") %></td>
						</tr>
						<tr>
							<th>Validity(Days)</th>
							<td><%=p_details.get("validity") %></td>
						</tr>
						<tr>
							<th>Package Cost</th>
							<td><%=p_details.get("package_cost") %></td>
						</tr>
						<tr>
							<th>Net Amount</th>
							<td><%=p_details.get("net_amount") %></td>
						</tr>
					</table>
				</div>
			</div>
			<div class="col-md-6" data-aos-delay="100">
				<div class="icon-box">
					<h2 align="center" style="color: red;">Parocess Payments</h2>

					<form action="ProcessPayment" method="POST">
						
						<div class="form-group">
								<div class="form-group card-fields1">
									<label for="card-number">Payment:</label> <input type="text"
										readonly="readonly" class="form-control" id="card-number" 
										name="payment"
										value="<%=p_details.get("net_amount") %>" required>
								</div>

								<div class="form-group">
									<label for="payment-method">Select Payment Method:</label> <select
										class="form-control" id="payment-method" name="payment-method">
										<option value="card">Card</option>
										<option value="upi">UPI</option>
									</select>
								</div>

								<div class="form-group card-fields">
									<label for="card-number">Card Number:</label> <input
										type="text" class="form-control" id="card_number"
										name="card_number" onkeyup="validCardNumber()">
									<div id="card-number-error" class="error-message"
										style="color: red;"></div>
								</div>
								<div class="form-group card-fields">
									<label for="card-number">Card Holder:</label> <input
										type="text" class="form-control" id="card_holder"
										name="card_holder"">
								</div>
								<div class="form-group card-fields">
									<label for="expiration-date">Expiration Date:</label> <input
										class="form-control" type="month" id="expiration-date"
										name="expiration-date" placeholder="MM/YYYY">
								</div>
								<div class="form-group card-fields">
									<label for="cvv">CVV:</label> <input type="password" id="cvv"
										class="form-control" name="cvv" maxlength="3">
								</div>

								<div class="form-group upi-fields" style="display: none;">
									<img alt="" src="img/PayQr.png"
										style="height: 40%; width: 40%;" class="form-control"><br />
									<input type="text" class="form-control"
										placeholder="Transaction ID" id="upi-id" name="upi_id">
								</div>
								<button type="submit" class="btn btn-primary btn-block">Submit
									Payment</button>
							</div>
						
					</form>
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