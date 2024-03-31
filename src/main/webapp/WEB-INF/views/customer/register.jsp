

<!DOCTYPE html>
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' type='text/css' media='screen'
	href='${base}/css/customerCSS/style1.css'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src='main.js'></script>
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Import thư viện spring-form -->
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>

<!-- adminKit core -->
<script src="https://unpkg.com/@adminkit/core@latest/dist/js/app.js"></script>
<link rel="stylesheet"
	href="https://unpkg.com/@adminkit/core@latest/dist/css/app.css">

<link rel='stylesheet' type='text/css' media='screen'
	href='${base}/css/adminCSS/app.css'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>
body {
	display: inline;
	justify-content: center;
	background-color: #ccc;
}

main {
	border-radius: 5px;
	margin: auto;
	text-align: center;
	background-color: white;
	width: 400px;
	height: auto;
}

.legend {
	border: 0px;
	font-size: 30px;
	opacity: 60%;
}

.description {
	margin-top: 10px;
	margin-bottom: 30px;
	opacity: 70%;
}

.firstname {
	float: left;
	margin-left: 10px;
	margin-bottom: 20px;
}

.lastname {
	float: right;
	margin-right: 10px;
	margin-bottom: 20px;
}

.email {
	margin-bottom: 20px;
}

.password {
	margin-bottom: 20px;
}

.termOfUse {
	display: flex;
}

.termOfUse input {
	float: left;
	margin-left: 25px;
	margin-right: 10px;
}

.termOfUse p {
	float: right;
}

.termOfUse a {
	color: rgb(20, 208, 250);
	text-decoration: none;
}

.submit :hover {
	cursor: pointer;
}

footer {
	text-align: center;
	color: white;
}

footer a {
	text-align: center;
	color: white;
}
</style>
</head>
<body>

	<header>
		<div class="logo">
			<a href="${base }/home">
				<p>Be.pro</p>
			</a>
		</div>

	</header>
	<main class="d-flex w-100">
		<div class="container d-flex flex-column">
			<div class="row vh-100">
				<div class="col-sm-10 col-md-8 col-lg-6 mx-auto d-table h-100">
					<div class="d-table-cell align-middle">

						<div class="text-center mt-4">
							<h1 class="h2">Get started</h1>
							<p class="lead">Start creating the best possible user
								experience for you customers.</p>
						</div>

						<div class="card">
							<div class="card-body">
								<div class="m-sm-4">
									<sf:form modelAttribute="userModel" action="${base }/register"
										method="post" id="form1">
										<div class="mb-3">
											<label class="form-label">Username</label>
											<sf:input path="name"
												class="form-control form-control-lg" type="text"
												name="username" id="idUserName"
												placeholder="Enter your name" required="required"/>
										</div>
										
										<div>
											<input class="role" name="role" type="text" value="${guestRole }" style="display: none">
										</div>
										
										<div class="mb-3">
											<label class="form-label">Email</label>
											<sf:input path="email" class="form-control form-control-lg"
												type="email" name="email" id="idEmail"
												placeholder="Enter your email" required="required"/>
										</div>
										<div class="mb-3">
											<label class="form-label">Password</label>
											<sf:input path="password"
												class="form-control form-control-lg" type="password"
												name="password" id="idPassword" placeholder="Enter password" required="required"/>
										</div>
										<div class="mb-3">
											<label class="form-label">Confirm Password</label> <input
												class="form-control form-control-lg" type="password"
												name="cPassword" placeholder="Confirm password" required="required"/>
											<c:if test="${passwordAttribute == false}">
											    <h3>reconfirm the password</h3>
											</c:if>
										</div>
										<div class="mb-3">
											<label class="form-label">Phone</label>
											<sf:input path="phone" class="form-control form-control-lg"
												type="text" name="phone" id="idPhone"
												placeholder="Enter your phone number" required="required"/>
										</div>
										<div class="mb-3">
											<label class="form-label">Address</label>
											<sf:input path="shipping_address"
												class="form-control form-control-lg" type="text"
												name="address" id="idAddress"
												placeholder="Enter your address" required="required"/>
										</div>
										<div class="mb-3">
										    <input type="checkbox" path="tOS" class="tOS" name="tOS" id="tOSID"/>Agree to terms and conditions
										</div>
										<div class="text-center mt-3">
											<div class="submit">
												<button type="submit" form="form1" value="Submit"
													style="border: 0; color: white; font-size: 15px; font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif; background-color: rgb(20, 208, 250); width: 300px; height: 30px; border-radius: 5px;">
													Sign up now</button>
											</div>
										</div>
									</sf:form>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</main>

	<footer>
		<p>
			Already have an account? <a class="signIn" href="${base }/login">Log in</a>
		</p>
	</footer>

	<script type="text/javascript">
	    const element = document.getElementById("form1");
	    element.addEventListener('submit', event => {
	    	const tOSval = document.getElementById("tOSID").checked ;
            if (tOSval == false) {
            	event.preventDefault();
                console.log("Hello!");
                alert("You have to Agree to the terms and conditions");
                }
            else {
                return true;
            }
	    })
	</script>
</body>
</html>