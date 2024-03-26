

<!DOCTYPE html>
<html>
<head>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Contact</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='${base}/css/customerCSS/style1.css'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	
	<!-- Import thư viện spring-form -->
	<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
	
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
            margin-top: 10px ;
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

        .termOfUse input{
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

        footer a{
            text-align: center;
            color: white;
        }
    </style>
</head>
<body>

    <header>
        <div class="logo">
            <a href="">
                <p>Be.pro</p>
            </a>
        </div>
        <div class="navi">
            <div class="home">
                <a href="">
                    <h4>Home</h4>
                </a>
            </div>
            <div class="shop">
                <a href="">
                    <h4>Shop</h4>
                </a>
            </div>
            <div class="port">
                <a href="">
                    <h4>Portfolio</h4>
                </a>
            </div>
            <div class="page">
                <a href="">
                    <h4>Page</h4>
                </a>
            </div>
            <div class="blog">
                <a href="">
                    <h4>Blog</h4>
                </a>
            </div>
            <div class="elements">
                <a href="">
                    <h4>Elements</h4>
                </a>
            </div>
        </div>
    </header>
    <main>
<%--     	${message } <br>
    	 <div>
    	 <c:forEach var = "employee" items="${employees}">
         Nhân viên: ${employee.maNv } - ${employee.tenNv } <br>
         </c:forEach>
    	 </div>
    	 
    	 Simple form
        <fieldset class="form_center">
        <legend class="legend">Register</legend>
        <form action="${base }/contact" method="get" id="form1">
        <div class='description'>Create your account. It's free and only takes a minute</div>
        <div class="register">
            <div class="firstname">
                <input type="text" name="firstName" id="firstName" placeholder="First Name" style="height: 25px;">
            </div>
            
            <div class="lastname">
                <input type="text" name="lastName" id="lastName" placeholder="Last Name" style="height: 25px;">
            </div>

            <div class="email">
                <input type="email" name="email" placeholder="Email" style="height: 25px; width: 340px;">
            </div>

            <div class="password">
                <input type="password" name="password" placeholder="Password" style="height: 25px; width: 340px;">
            </div>

            <div class="confirmPassword">
                <input type="password" name="confirmPassword" placeholder="Confirm Password" style="height: 25px; width: 340px;">
            </div>

            <div class="termOfUse">
                <input type="checkbox"> 
                <p>I accept the <a href="">Terms of use</a> & <a href="">Privacy Policy</a>.</p>
            </div>

                <div class="submit">
                <button type="submit" form="form1" value="Submit" style="border: 0; color: white; font-size: 15px; font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif; background-color: rgb(20, 208, 250); width: 300px; height: 30px; border-radius: 5px;">
                    Sign up now
                </button>
            </div>
        </div>
        </form>
        </fieldset> --%>
        
        <!-- Spring-form -->
		
        <fieldset class="form_center">
        <legend class="legend">Contact</legend>
        <sf:form modelAttribute="contactModel" action="${base }/contact-spring-form" method="post" id="form1">
        <div class='description'>Let we know your information. So that we can contact with you later</div>
        <div class="register">
            <div class="firstname">
                <sf:input path="firstName" type="text" name="firstName" id="firstName" placeholder="First Name" style="height: 25px;" /> 
            </div>
            
            <div class="lastname">
                <sf:input path="lastName" type="text" name="lastName" id="lastName" placeholder="Last Name" style="height: 25px;"/>
            </div>

            <div class="email">
                <sf:input path="email" type="email" name="email" placeholder="Email" style="height: 25px; width: 340px;"/>
            </div>
            
            <div class="message">
                <sf:input path="message" type="text" name="message" id="idMessage" placeholder="What you want to tell us" style="height: 25px; width: 340px;"/>
            </div>


            <div class="termOfUse">
                <input type="checkbox"/>  
                <p>I accept the <a href="">Terms of use</a> & <a href="">Privacy Policy</a>.</p> 
            </div>

                <div class="submit">
                <button type="submit" form="form1" value="Submit" style="border: 0; color: white; font-size: 15px; font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif; background-color: rgb(20, 208, 250); width: 300px; height: 30px; border-radius: 5px;">
                    Sign up now
                </button>
            </div>
        </div>
        </sf:form>
        </fieldset>
        
        
        <!-- Ajax form -->
        <!-- <fieldset class="form_center">
        <legend class="legend">Register</legend>
        <form>
        <div class='description'>Create your account. It's free and only takes a minute</div>
        <div class="register">
            <div class="firstname">
                <input type="text" name="firstName" id="idfirstName" placeholder="First Name" style="height: 25px;">
            </div>
            
            <div class="lastname">
                <input type="text" name="lastName" id="idlastName" placeholder="Last Name" style="height: 25px;">
            </div>

            <div class="email">
                <input type="email" name="email" id="idEmail" placeholder="Email" style="height: 25px; width: 340px;">
            </div>
            
            <div class="message">
                <input type="text" name="message" id="idMessage" placeholder="What you want to tell us" style="height: 25px; width: 340px;">
            </div>


            <div class="termOfUse">
                <input type="checkbox"> 
                <p>I accept the <a href="">Terms of use</a> & <a href="">Privacy Policy</a>.</p>
            </div>

                <div class="submit">
                <button type="button" onclick=submit_Click() style="border: 0; color: white; font-size: 15px; font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif; background-color: rgb(20, 208, 250); width: 300px; height: 30px; border-radius: 5px;">
                    Sign up now
                </button>
            </div>
        </div>
        </form>
        </fieldset> -->
    </main>

    <footer>
        <p>Thank you for your concern. <a class="signIn" href="">Home</a></p>
    </footer>
    
    <script type="text/javascript">
    	function submit_Click() {
			//Js object: key phải trùng với property của object 
    		let data = {
					firstName: $( "#idfirstName" ).val(),
					lastName: $( "#idlastName" ).val(),
					email: $( "#idEmail" ).val(),
					message: $( "#idMessage" ).val()
			};
    	
    	//$ == jquery
    	//json == javascript object
    	
    	jQuery.ajax({
    		url: "${base }/contact-ajax",
    		type: "post",
    		contentType: "application/json",
    		data: JSON.stringify(data),
    		
    		dataType: "json",
    		success: function(jsonResult) {
    			alert(jsonResult.statusMessage);
    		},
    		error: function(jqXhr, textStatus, errorMessage) {
    			
    		}
    	})
		}
    </script>
</body>
</html>