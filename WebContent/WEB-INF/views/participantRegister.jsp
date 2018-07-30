<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<title>WInner Registration Form ::</title>
<!-- metatags-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Sports Camp Registration Form a Flat Responsive Widget,Login form widgets, Sign up Web 	forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Meta tag Keywords -->
<!-- css files -->
<link rel="stylesheet" href="assets/css/jquery-ui.css"/>
<link rel="icon" href="http://getbootstrap.com/favicon.ico">
<link href="assets/css/style.css" rel="stylesheet" type="text/css" media="all"/><!--stylesheet-css-->
<link href="//fonts.googleapis.com/css?family=Josefin+Sans:100,100i,300,300i,400,400i,600,600i,700,700i" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link href="//fonts.googleapis.com/css?family=PT+Sans:400,400i,700,700i" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="assets/js/upload-image.js"></script> 
<!-- //css files -->
</head>
<body>
	<h1>Winners Form</h1>
<div class="w3l-main"> 
	<div class="w3l-from">  
		<form action="/SpinTheWheelProject/getUserInfo.html" modelAttribute="winners" method="post" enctype="multipart/form-data">
			<div class="w3l-details1">	
			<div class="w3l-user">
				<label class="head">First Name<span class="w3l-star"> * </span></label>
				<input type="text" name="firstName" placeholder="" required="">
			</div>
			<div class="clear"></div>
			<div class="w3l-user"> 
				<label class="head">Last Name<span class="w3l-star"> * </span></label>
				<input type="text" name="lastName" placeholder="" required="">
			</div>  
			</div>
			<div class="w3l-mail">
				<label class="head">Email<span class="w3l-star"> * </span></label>
				<input type="email" name="email" placeholder="" required="">
			</div>
			<div class="clear"></div>
			<div class="w3l-details1">
				<div class="w3l-num">
					<label class="head">Phone Number<span class="w3l-star"> * </span></label>
					<input type="text"  name="phoneNo" placeholder="" required="">
				</div>
				<div class="w3l-date"> 
					<label class="head">Birth Date<span class="w3l-star"> * </span></label>
						<div class="styled-input">
							<input class="date" id="birthDate" name="birthDate" type="text" value="MM/DD/YYYY" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'MM/DD/YYYY';}" required="">
						</div>
					</div>	
			<div class="clear"></div>
			<div class="gender">
				<label class="head">gender<span class="w3l-star"> * </span></label>	
					<select name="gender" class="form-control" required="">
						<option>Gender</option>
						<option value="Male">Male</option>
						<option value="Female">Female</option>
					</select>
			</div>
			<div class="w3l-options2">
			<label class="head">Select Store<span class="w3l-star"> * </span></label>	
				<select name="storeName" class="category2" required="">
						<option value="none">Store</option>
						<option value="Store-1">Store-1</option>
						<option value="Store-2">Store-2</option>
						<option value="Store-3">Store-3</option>
						<option value="Store-4">Store-4</option>
						
					</select>
			</div>
			<div class="clear"></div>
			</div>
			<div class="w3l-user">
				<label class="head">Street Address<span class="w3l-star"> * </span></label>
				<input type="text" name="address" placeholder="" required="">
			</div>
			<div class="w3l-num">
					<label class="head">City<span class="w3l-star"> * </span></label>
					<input type="text"  name="city" placeholder="" required="">
				</div>
			<div class="w3l-sym">
					<label class="head">State<span class="w3l-star"> * </span></label>
					<input type="text" name="state" placeholder="" required="">
			</div>
			<div class="clear"></div>
			<div class="w3l-num">
					<label class="head">Postal / Zip Code<span class="w3l-star"> * </span></label>
					<input type="text"  name="zipcode" placeholder="" required="">
				</div>
			<div class="w3l-options2">
			<label class="head">Country<span class="w3l-star"> * </span></label>	
				<select name="country" class="category2" required="">
						<option value="none">Select Country</option>
						<option value="India">India</option>
						<option value="UAE">UAE</option>
						<option value="US">US</option>
						<option value="United Kingdom">United Kingdom</option>
						
					</select>
			</div>
			<div class="clear"></div>
			<p class="lead">Select a PNG or JPEG image, having maximum size <span id="max-size">500.00</span> KB.</p>
			<div id="image-preview-div" style="display: none">
            <label for="exampleInputFile">Selected image:</label>
            <br>
            <img id="preview-img" src="noimage">
          </div>
          <div class="form-group">
            <input type="file" name="file"  id="file" required="">
          </div>
          <div class="container-login100-form-btn"> 
						<button class="login100-form-btn" type="submit">Login</button>
		  </div>
		</form>
	</div>
</div>
	<footer>&copy; 2018 Winner Registration Form.  | 
	</footer>
	<!-- Default-JavaScript --> <script type="text/javascript" src="assets/js/jquery-2.1.4.min.js"></script>

<!-- Calendar -->
<script src="assets/js/jquery-ui.js"></script>
	<script>
		$(function() {
		$( "#datepicker,#datepicker1" ).datepicker();
		 
		});
		
		
		
	</script>
	
<!-- //Calendar -->

</body>
</html>