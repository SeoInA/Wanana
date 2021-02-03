<!--템플릿 jsp에 개인정보를 집어넣은 페이지-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Wanana</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/index.css">
<link rel="stylesheet" type="text/css" href="//cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">
<style>
    .modal label {  
    	display: block;
    	margin-top: 20px;
    	letter-spacing: 2px;
    }
    .modal form {
    	margin: 0 auto;
    	width: 459px;
    }
    .modal input{
    	width: 100%;
    	height: 27px;
    	background-color: #efefef;
    	border-radius: 6px;
    	border: 1px solid #dedede; 
    	padding: 10px;
    	margin-top: 10px;
    	font-size: 0.9em;
    	color: #3a3a3a; 
    }
    .modal input:focus{
    		border: 1px solid #97d6eb;
    	}
	
    #submit{
    	width: 100%;
    	height: 35px;
    	text-align: center;
    	border: none;
    	margin-top: 20px;
    	cursor: pointer;
    }
    #submit:hover{
    	color: #fff;
    	background-color: #216282;
    	opacity: 0.9;
    }
	.modal {
        position: fixed;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        opacity: 0;
        visibility: hidden;
        transform: scale(1.1);
        transition: visibility 0s linear 0.25s, opacity 0.25s 0s, transform 0.25s;
    }
    .modal-content {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        background-color: white;
        padding: 1rem 1.5rem;
        width: 500px;
        height: 180px;
        border-radius: 0.5rem;
    }
    .close-button {
        float: right;
        width: 1.5rem;
        line-height: 1.5rem;
        text-align: center;
        cursor: pointer;
        border-radius: 0.25rem;
        background-color: lightgray;
    }
    .close-button:hover {
        background-color: darkgray;
    }
    .show-modal {
        opacity: 1;
        visibility: visible;
        transform: scale(1.0);
        transition: visibility 0s linear 0s, opacity 0.25s 0s, transform 0.25s;
    }

    @import url('//cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css');

    /* light300 regular400 bold700 extrabold800 */
    body{font-family: 'NanumSquareRound', sans-serif; color: black;}
        header h2{font-weight: 800;}

        /* Header */
        header {
        width:100%;
        padding: 20px 0;
        }

        nav ul {
        margin: 0;
        padding: 0;
        list-style-type: none;
        }
        
        nav.mypagemenu ul {
        margin: 0 0 0 80px;
        padding: 0;
        list-style-type: none;
        }

        nav a{
        margin: 5px 0;
        padding: 5px 0;
        text-decoration: none;
        font-weight: bold;
        line-height: 1.3;
        color: black;
        }

        h4 a{
        margin: 5px 0;
        padding: 5px 0;
        text-decoration: none;
        font-weight: bold;
        line-height: 1.3;
        color: black;
        text-align: right;
        float:right;
        }

        #yellowtitle{
        color: #F9CA03;
        }

        .imageicon{
        padding: 0px 0px 0px 10px;
        text-align: right;
        float:right;
        }

        nav a:hover {
        color: #F9CA03;
        }

        /* Main */
        main {
        background-color: #F2F2F2;
        }

        .titlebar{
        background-color:white;
        width: 100%;
        line-height: 60px;
        padding: 20px 120px;
        border: 1px solid;
        border-color: white white #E6E6E6 white;
        }

        .titlebar h2{
        display: inline;
        top:40%;
        left: 14%;
        }

        .titlebar a{
        margin: 0 0 0 30px;
        top:30%;
        left: 20%;
        }

		.profile_img{
		margin-right: 20px;
		vertical-align:middle;
		}

		.login_user{
		vertical-align:middle;
		}

        .editprofile{
        vertical-align:middle;
        border-radius: 40px;
        text-align: center;
        color: #F9CA03;
        border: 1px solid #F9CA03;
        padding: 10px 15px;
        font-weight: 700;
        font-size: 15;
        }

        .mypagemenu{
        background-color:white;
        width: 100%;
        display: block; margin: 0px auto;
        padding: 0 0 0 40px;
        }

        .profile{
            background-color:white;
            width: 90%;
            display: block; margin: 0px auto;
        }

        .myportfolio{
        padding: 30px;
        background-color:white;
        border-radius: 40px;
        width: 85%;
        display: block; margin: 0px auto;
        }

        .leftmenu{
        width: 30px;
        height: 50px;
        background-color:white;
        }

        .trigger{
        background-color:white;
        margin-top: 20px;
        border-radius: 40px;
        text-align: center;
        color: #d3d3d3;
        border: 1px solid #F2F2F2;
        padding: 70px 70px;
        font-weight: 700;
        font-size: 18px;
        }
        
        :hover.trigger{
        border: 1px solid #F9CA03;
        color:#F9CA03;
        }

        @media only screen and (min-width: 480px) {
        nav a{
            text-align: center;
            float: left;
            margin-right: 5%;
        }

        .imageicon, h4 a{
            float: right;
        }
        
        }

        @media only screen and (min-width: 768px) {
        header h2 {
            float: left;
            font-size: 2rem;
        }

        nav {
            text-align: center;
            margin-left: 50px;
            float: left;
            width: 40%;
        }

        
        main article {
            float: left;
            width: 70%;
        }
        
        }

        /* Common */
        .clearfix:after {
        clear: both;
        content: " ";
        display: table;
        }

        .wrapper {
        max-width: 1024px;
        width: 90%;
        margin: 0 auto;
        }

        h1, h2, h3, p {
        margin: 0;
        }

        * {
        box-sizing: border-box;
        }
        
        .home{
        margin-top: 10px;
        margin-right: 5px;
        background-color: white;
        border: 1px solid #F9CA03;
        color: #F9CA03;
        vertical-align:middle;
        border-radius: 40px;
        text-align: center;
        padding: 10px 15px;
        font-weight: 700;
        width: 200px;
        font-size: 18px;
        }
        
        .print{
        margin-top: 10px;
        margin-right: 5px;
        background-color: #F9CA03;
        color: white;
        border: 1px solid #F9CA03;
        vertical-align:middle;
        border-radius: 40px;
        text-align: center;
        padding: 10px 15px;
        font-weight: 700;
        width: 200px;
        font-size: 18px;
        }
        
        /* 
        @media print {
		#printSection {-webkit-print-color-adjust: exact;}
		}
		*/
		
        /*
        main{
        	display:block;
        	margin: 0 12.5%;
        
        }
        */
        
        
	   @page {
	    size: A4 landscape; /*A4*/
	    margin:0;
	  }
</style>


</head>


<body>
	 <jsp:include page="/WEB-INF/views/basic/header.jsp" />
	 <%
	 String templateURL ="/WEB-INF/views/templates/"+request.getAttribute("temName")+".jsp";
	 %>
	 
	 <main>
	 	<div class="wrap" style="width:100%; position:relative;">
	 		<div style="display:block; margin:0 auto;">
	 			<div id="printSection" style="float:left; margin-right: 15px; padding-left: 22px;">
		     		<jsp:include page="<%=templateURL%>" flush="true"/>
				</div>
				<div id="button_wrap" style="display:flex;">
					<div style="flex-direction:column;">
				    	<button type="button" class="home" name=home id="homeB" onclick="location.href='<%=request.getContextPath()%>/home'">HOME</button>
				    	<button type="button" class="print" name=print id="printB" onclick="">출력 </button>
			    	</div>	
			    </div>	
			    
	 		</div>
	 	</div>
	 </main>
	 
	 <!--  
	 <div style="display: flex; justify-content: center;">
		<button type="button" class="home" name=home id="homeB" onclick="location.href='<%=request.getContextPath()%>/home'">HOME</button>
		<button type="button" class="print" name=print id="printB" onclick="">출력 </button>
    </div>	
	 -->
	
	 
	    
     <jsp:include page="/WEB-INF/views/basic/footer.jsp" />
     <script>

     $(document).ready(function() {
         
   	  $("#printB").click(function() {
   	   	  
   		 var initBody = document.body.innerHTML;
   		 
                window.onbeforeprint = function(){
                    document.body.innerHTML = document.getElementById('printSection').innerHTML;
                }
                window.onafterprint = function(){
                    document.body.innerHTML = initBody;
                }
                window.print();   
	       });
     });
      
         
        </script>
     

</body>
</html>