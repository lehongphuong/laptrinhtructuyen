<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
        <%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
            <%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
                <%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
                    <!DOCTYPE html>
                    <html lang="en">

                    <head>
                        <!-- Required meta tags always come first -->
                        <meta charset="utf-8">
                        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
                        <meta http-equiv="x-ua-compatible" content="ie=edge">
                        <title>Học lập trình trực tuyến</title>
                        <!-- Font Awesome -->
                        <!-- angular js -->
                        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>

                        <!-- w3 school -->
                        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
                        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
                        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

                        <!-- <link rel="stylesheet" href="css/font-awesome.min.css"> -->
                        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.0/css/font-awesome.min.css">
                       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

                        <!-- CSS -->
                        <link href="css/compiled.min.css" rel="stylesheet">
                        <!-- <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script> -->
                        <!-- Bootstrap core CSS -->
                        <!-- <link href="css/bootstrap.min.css" rel="stylesheet"> -->
                        <!-- Material Design Bootstrap -->
                        <link href="css/mdb.min.css" rel="stylesheet">
                        <!-- Your custom styles (optional) -->
                        <link href="css/style.css" rel="stylesheet">

                       <!-- mirror editor-->
					   <link rel="stylesheet" href="library/codemirror.css">
					   <script src="library/codemirror.js"></script>
					   <script src="library/selection-pointer.js"></script>
					   <script src="library/xml.js"></script>
					   <script src="library/javascript.js"></script>
					   <script src="library/css.js"></script>
					   <script src="library/vbscript.js"></script>
					   <script src="library/htmlmixed.js"></script>
					   <script src="library/markdown.js"></script>
					   <script src="library/show-hint.js"></script>
					   <script src="library/javascript-hint.js"></script>
					   <link rel=stylesheet href="library/docs.css">
					   <script src="library/matchbrackets.js"></script>
					   <link rel="stylesheet" href="library/show-hint.css">
					   <script src="library/clike.js"></script>
					   <script src="library/python.js"></script>
					   
					   <style>.CodeMirror {border: 25px inset #dee;}</style>
					   <!-- /mirror editor-->

                    </head>

                    <body class="fixed-sn white-skin bg-skin-lp" ng-app="">


                        <!--Double navigation-->
                        <header>
   <!-- Navbar -->
                            <nav class="navbar navbar-toggleable-md navbar-dark scrolling-navbar double-nav fixed-top">
       <!-- SideNav slide-out button -->
                                <div class="float-xs-left">
                                    <a href="home.do"><img style="margin-left:20px" src="img/custom/logo.png" /></a>
                                </div>
       <!-- Breadcrumb-->
                                <div class="breadcrumb-dn mr-auto">
                                    <bold>
                                        <a class="nav-link" href="home.do">
                                            <bold>
                                                <h6>CODING PROGRAM</h6>
                                            </bold>
                                        </a>
                                    </bold>
                                </div>
                                <div class="menuHori">
                                    <ul class="nav navbar-nav ml-auto flex-row">


                                        <bean:define id="idMenu" name="challengesForm" property="menuId"></bean:define>
                                        <bean:define id="idCate" name="challengesForm" property="cateId"></bean:define>
                                        <logic:iterate name="challengesForm" property="cateList" id="cate">

                                            <bean:define id="cateId1" name="cate" property="cateId"></bean:define>

                                            <logic:equal name="cate" property="menuId" value="${idMenu}">

                                                <logic:equal name="challengesForm" property="cateId" value="${cateId1}">
                                                    <li class="nav-item menuActive">
                                                        <html:link action="home-to-practics.do?menuId=${idMenu}&cateId=${cateId1}">
                                                            <span class="hidden-sm-down uppercase"><bean:write name="cate" property="name"/></span>
                                                        </html:link>
                                                    </li>
                                                </logic:equal>

                                                <logic:notEqual name="challengesForm" property="cateId" value="${cateId1 }">
                                                    <li class="nav-item">
                                                        <html:link action="home-to-practics.do?menuId=${idMenu}&cateId=${cateId1}">
                                                            <span class="hidden-sm-down uppercase"><bean:write name="cate" property="name"/></span>
                                                        </html:link>
                                                    </li>
                                                </logic:notEqual>

                                            </logic:equal>
                                        </logic:iterate>


                                        <logic:equal name="challengesForm" property="statusLogin" value="notLogin">
                                            <li class="nav-item dropdown">
                                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <i class="fa fa-user"></i> <span class="hidden-sm-down">ACCOUNT</span>
                                                </a>
                                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                                                    <a class="dropdown-item" data-toggle="modal" data-target="#modal-login">LOGIN</a>
                                                    <a class="dropdown-item" data-toggle="modal" data-target="#modal-register">REGISTER</a>
                                                </div>
                                            </li>
                                        </logic:equal>

                                        <logic:equal name="challengesForm" property="statusLogin" value="login">
                                            <li class="nav-item dropdown">
                                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <i class="fa fa-user"></i> <span class="hidden-sm-down">
                  <span class="uppercase"> WELCOME <bean:write name="challengesForm" property="username"/> </span>

                                                    </span>
                                                </a>
                                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                                                    <html:link action="/user-logout.do" styleClass="dropdown-item">LOGOUT</html:link>
                                                </div>
                                            </li>
                                        </logic:equal>

                                        <logic:equal name="challengesForm" property="statusLogin" value="fail">
                   <!-- Modal Login -->
                                            <li class="nav-item dropdown">
                                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <i class="fa fa-user"></i> <span class="hidden-sm-down">LOGIN FAIL PLEASE AGAIN</span>
                                                </a>
                                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                                                    <a class="dropdown-item" data-toggle="modal" data-target="#modal-login">LOGIN</a>
                                                    <a class="dropdown-item" data-toggle="modal" data-target="#modal-register">LOGOUT</a>
                                                </div>
                                            </li>
                                        </logic:equal>

                                </div>
                            </nav>
   <!-- /.Navbar -->
                        </header>
                        <!--Main layout-->


                        <div class="container" style="margin-top:100px">

                            <div style="float:right;  font-size:20px; margin-bottom:25px" class="row-lg-12">
                                <button type="button" class="btn btn-outline-warning waves-effect">
         Points: <bean:write name="challengesForm" property="point"/>
         Rank: <bean:write name="challengesForm" property="rank"/> </button>

                                <hr>
                            </div>


   <!-- main  -->
                            <div class="row-lg-12 clearfix" style="margin-top:10px">
                                <h1 style="color:#00C851;">Solve Me First<span><i class="fa fa-bookmark" aria-hidden="true"></i></span></h1>
                                <br>


       <!-- Nav tabs -->
                                <div class="tabs-wrapper tabs-5">
                                    <ul class="nav classic-tabs tabs-grey" role="tablist" style="background-color:#33b5e5">
                                        <li class="nav-item">
                                            <a class="nav-link waves-light active" data-toggle="tab" href="#panel83" role="tab"><i class="fa fa-code fa-2x" aria-hidden="true"></i><br> Problem</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link waves-light" data-toggle="tab" href="#panel84" role="tab"><i class="fa fa-upload fa-2x" aria-hidden="true"></i><br> Submissions</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link waves-light" data-toggle="tab" href="#panel85" role="tab"><i class="fa fa-trophy fa-2x"  aria-hidden="true"></i><br> Leaderboard</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link waves-light" data-toggle="tab" href="#panel86" role="tab"><i class="fa fa-edit fa-2x" aria-hidden="true"></i><br> Editorial</a>
                                        </li>
                                    </ul>
                                </div>

       <!-- Tab panels -->
                                <div class="tab-content card">

           <!--problem 1-->
                                    <div class="tab-pane fade in show active" id="panel83" role="tabpanel">
									<!--define data problem-->
									<bean:define id="prob" name="challengesForm" property="problem"></bean:define>
									<div class="problemConstraint">
										 <div class="time-limit">
                                            <div class="property-title">Time limit per test</div>
                                            <bean:write name="prob" property="constrain"/>
                                          </div>
                                        <div class="memory-limit">
                                            <div class="property-title">Memory limit per test</div>256 megabytes</div>
                                        <div class="input-file">
                                            <div class="property-title">Input</div>standard input</div>
                                        <div class="output-file">
                                            <div class="property-title">Output</div>standard output</div>
										
									</div>				
	
                                    
                                    <div>
                                        <bean:write name="prob" property="description"/>
                                    </div>
                                    <div class="input-specification">
                                        <div class="section-title">Input</div>
                                       <bean:write name="prob" property="inputRequire"/>
                                    </div>
                                    <div class="output-specification">
                                        <div class="section-title">Output</div>
                                       <bean:write name="prob" property="outputRequire"/>
                                    </div>
                                    <div class="sample-tests">
                                        <div class="section-title">Examples</div>
                                        <div class="sample-test">
                                            <div class="input">
                                                <div class="title">Input</div>
                                                
                                                <pre><bean:write name="prob" property="inputTestCase"/></pre>
                                            </div>
                                            <div class="output">
                                                <div class="title">Output</div>
                                               <pre><bean:write name="prob" property="outputTestCase"/></pre>
                                            </div>
                                             
                                        </div>
                                    </div>
                                    <div class="note">
                                        <div class="section-title">Explain</div>
                                        <p><bean:write name="prob" property="explain"/></p>
                                    </div>
                                    
                                    
<!-- form run code -->
 
<div class="col-lg-3 select-language">
 <label for="sel1">SELECT LANGUAGE:</label>
 <html:select name="challengesForm" styleClass="form-control" property="editor" styleId="sel1">
   <html:option value="C++">C++</html:option>
   <html:option value="JAVA">JAVA</html:option>
   <html:option value="PYTHON">PYTHON</html:option>
 </html:select>

</div>

<html:form action="/chanllenges.do?subId=${param.subId}&menuId=${param.menuId}&cateId=${param.cateId}&editor=c++" styleId="c++">

</html:form>

<html:form action="/chanllenges.do?subId=${param.subId}&menuId=${param.menuId}&cateId=${param.cateId}&editor=java" styleId="java">

</html:form>

<html:form action="/chanllenges.do?subId=${param.subId}&menuId=${param.menuId}&cateId=${param.cateId}&editor=python" styleId="python">

</html:form>

<script type="text/javascript">

//Material Select Initialization
$(document).ready(function() {
	$( "#sel1" ).change(function() {
			var action=$("#sel1").val();
			if(action=="C++"){
				document.getElementById("c++").submit();
		  	}
			if(action=="JAVA"){
				document.getElementById("java").submit();
		  	}
			if(action=="PYTHON"){
				document.getElementById("python").submit();
		  	}
		});
 });

</script>
 
<br><br>


<html:form   action="/chanllenges.do?subId=${param.subId}&menuId=${param.menuId}&cateId=${param.cateId}&editor=${param.editor}&run=true" >
 
<!-- c++ -->
     	
     	<logic:equal name="challengesForm" property="editor" value="C++">
     	<h4><span class="label label-info">C++ EDITOR</span></h4><br>
     	
	   <html:textarea name="challengesForm" property="codeSample"  styleId="code-c++">
 
	   </html:textarea>
	
	    <script type="text/javascript">
	     var editor = CodeMirror.fromTextArea(document.getElementById("code-c++"), {
	    	 lineNumbers: true,
	         matchBrackets: true,
	         mode: "text/x-c++src"
	     });
	   </script>
	 
	   
     	<br><br><br>
     	</logic:equal>
     	
<!-- end c++ -->
     	
<!-- python -->

		<logic:equal name="challengesForm" property="editor" value="PYTHON">
     	<h4><span class="label label-info">PYTHON EDITOR</span></h4><br>
    <html:textarea name="challengesForm" property="codeSample"   styleId="code-python">
 
	   </html:textarea>
	
	    <script type="text/javascript">
	     var editor = CodeMirror.fromTextArea(document.getElementById("code-python"), {
	    	 mode: {name: "python",
	   	      version: 3,
	   	      singleLineStringErrors: false},
	   	      lineNumbers: true,
	   	      indentUnit: 4,
	   	      matchBrackets: true
	     });
	   </script>
	   		 
	   
	   
     	<br><br><br>
     	</logic:equal>
     	
<!-- end python -->
     	
<!-- java --> 
     	
     	<logic:equal name="challengesForm" property="editor" value="JAVA">
     	<h4><span class="label label-info">JAVA EDITOR</span></h4><br>
   
	   <html:textarea name="challengesForm" property="codeSample"  styleId="code-java">
 
	   </html:textarea>
	
	    <script type="text/javascript">
	     var editor = CodeMirror.fromTextArea(document.getElementById("code-java"), {
	    	 lineNumbers: true,
	         matchBrackets: true,
	         mode: "text/x-java"
	     });
	   </script>
	   		 
	   	 
	   
	   
     	<br><br><br>
     	</logic:equal>
     	
<!-- end java --> 
				
				
				
<script> 
  var mac = CodeMirror.keyMap.default == CodeMirror.keyMap.macDefault;
  CodeMirror.keyMap.default[(mac ? "Cmd" : "Ctrl") + "-Space"] = "autocomplete";
</script>
									
									
									
           <!-- buttton -->

                                    <div class="d-flex justify-content-end">
                                        <div class="mr-auto p-2">

                                            <fieldset class="form-group" style="margin-top:15px">
                                                <input type="checkbox" id="checkbox1" ng-model="myVar" ng-init="myVar = false">
                                                <label for="checkbox1">Test against custom input</label>
                                            </fieldset>
                                            
                                            <div ng-if="myVar">
                                            
                                       	<html:textarea styleId="textarea1" name="challengesForm" styleClass="md-textarea"   property="inputUser">
                                       	</html:textarea>
                                            	
                                                <label for="textarea1">Type your Testcase</label>
                                            </div>


                                        </div>
                                        <div class="p-2">
                                            <html:submit  property="submit" value="runCode" styleClass="btn btn-outline-default waves-effect">Run code</html:submit>
                                        </div>
                                        <div class="p-2">
                                            <html:submit   property="submit" value="submit" styleClass="btn btn-success waves-effect">Submit</html:submit>
                                        </div>
                                    </div>
           <!-- end button -->
									
									
									
									</html:form>

<!-- end form run code -->


<!-- result runcode  -->

 

 

<logic:equal name="challengesForm" property="run" value="${param.run }">
	<h1><label class="label label-success">Result compiler</label></h1>
	<div class="input">
         <div class="title">Input</div>
         
         <pre><bean:write name="challengesForm" property="inputTestCase"/></pre>
     </div>
     
     <logic:notEqual name="challengesForm" property="outputTestCase" value="inputUser">
     
     	<div class="output">
         <div class="title">Output</div>
        <pre><bean:write name="challengesForm" property="outputTestCase"/></pre>
     	</div>
     	
     </logic:notEqual>
     
     <div class="output">
         <div class="title">Your Output</div>
        <pre><bean:write name="challengesForm" property="outputTestCase"/></pre>
     </div>
     <div class="output">
         <div class="title">Error</div>
        <pre><bean:write name="challengesForm" property="outputTestCase"/></pre>
     </div>
</logic:equal>
<!-- end runcode  -->

<logic:equal name="challengesForm" property="run" value="${param.run }">

<script type="text/javascript">
$(document).ready(function() {
	 
	$('html, body').animate({
        scrollTop: $(document).height()
    }, 1500);		 
	});
</script>

</logic:equal>






                                </div>
       <!--/.problem 1-->

       <!--submittion 2-->
                                <div class="tab-pane fade" id="panel84" role="tabpanel">
                                    <logic:iterate name="challengesForm" property="submitList" id="submit">
										<bean:write name="submit" property="time"/>
										<jsp:getProperty name="submit" property="point"/>
									</logic:iterate>

                                </div>
       <!--/.submition 2-->

       <!--leaderboard 3-->
                                <div class="tab-pane fade" id="panel85" role="tabpanel">
                                
                                <logic:iterate name="challengesForm" property="leaderList" id="leader">
									<jsp:getProperty name="leader" property="userId"/>
									<jsp:getProperty name="leader" property="submitId"/>
								</logic:iterate>

                                </div>
       <!--/.leaderboard 3-->
 
       <!--editorial 4-->
                                <div class="tab-pane fade" id="panel86" role="tabpanel">
                                    <bean:define id="edit" name="challengesForm" property="editorial"></bean:define>
                                    <jsp:getProperty name="edit" property="subId"/>
                                     <jsp:getProperty name="edit" property="explain"/>
                                     <jsp:getProperty name="edit" property="code"/>

                                </div>
       <!--/.edittorial 4-->

                            </div>

                        </div>

                        </div>
                        <!-- end main -->




                        <!--Footer-->
                        <footer class="page-footer center-on-small-only" id="scroll">

   <!--Footer Links-->
                            <div class="container-fluid">
                                <div class="row">

           <!--First column-->
                                    <div class="col-md-3 offset-md-1">
                                        <h5 class="title">FPT CODING PROGRAM</h5>
                                        <p>Team 11 INTERN in FPTSoftware.</p>
                                    </div>
           <!--/.First column-->

                                    <hr class="hidden-md-up">

           <!--Second column-->
                                    <div class="col-md-2 offset-md-1">
                                        <h5 class="title">My's name team</h5>
                                        <ul>
                                            <li><a href="#!">Lê Hồng Phương</a></li>
                                            <li><a href="#!">Võ Thị Ngọc Hiền</a></li>
                                            <li><a href="#!">Nguyễn Thị Nương</a></li>
                                            <li><a href="#!">Võ Văn Hòa</a></li>
                                            <li><a href="#!">Nguyễn Duy Thức</a></li>
                                        </ul>
                                    </div>
           <!--/.Second column-->

                                    <hr class="hidden-md-up">

           <!--Third column-->
                                    <div class="col-md-2">
                                        <h5 class="title">Devoloper</h5>
                                        <ul>
                                            <li><a href="#!">© Full Stack ©</a></li>
                                            <li><a href="#!">Front End & Content</a></li>
                                            <li><a href="#!">Front End & Content</a></li>
                                            <li><a href="#!">Coding & Front End</a></li>
                                            <li><a href="#!">Coding & Designer</a></li>
                                        </ul>
                                    </div>
           <!--/.Third column-->

                                    <hr class="hidden-md-up">

           <!--Fourth column-->
                                    <div class="col-md-3">
                                        <h5 class="title">University</h5>
                                        <ul>
                                            <li><a href="#!">Phạm Văn Đồng - Quảng Ngãi</a></li>
                                            <li><a href="#!">Kinh Tế Huế - Huế</a></li>
                                            <li><a href="#!">Phạm Văn Đồng - Quảng Ngãi</a></li>
                                            <li><a href="#!">Quảng Nam - Quảng Nam</a></li>
                                            <li><a href="#!">Quảng Nam - Quảng Nam</a></li>
                                        </ul>
                                    </div>
           <!--/.Fourth column-->

                                </div>
                            </div>
   <!--/.Footer Links-->


   <!--Social buttons-->
                            <div class="social-section">
                                <ul>
                                    <li><a class="btn-floating btn-small btn-fb"><i class="fa fa-facebook"> </i></a></li>
                                    <li><a class="btn-floating btn-small btn-tw"><i class="fa fa-twitter"> </i></a></li>
                                    <li><a class="btn-floating btn-small btn-gplus"><i class="fa fa-google-plus"> </i></a></li>
                                    <li><a class="btn-floating btn-small btn-li"><i class="fa fa-linkedin"> </i></a></li>
                                    <li><a class="btn-floating btn-small btn-git"><i class="fa fa-github"> </i></a></li>
                                    <li><a class="btn-floating btn-small btn-pin"><i class="fa fa-pinterest"> </i></a></li>
                                    <li><a class="btn-floating btn-small btn-ins"><i class="fa fa-instagram"> </i></a></li>
                                </ul>
                            </div>
   <!--/.Social buttons-->

   <!--Copyright-->
                            <div class="footer-copyright">
                                <div class="container-fluid">
                                    © 2017 Copyright: <a href="https://www.dct13.appsot.com"> Lehongphuong.io </a>

                                </div>
                            </div>
   <!--/.Copyright-->

                        </footer>
                        <!--/.Footer-->





                        <!-- back to top  -->


                        <!-- SCRIPTS -->
                        <script type="text/javascript" src="js/compiled.min.js"></script>
                        <script>
                        
                        
                        	
                       
                        
                            $(".button-collapse").sideNav();

                            var el = document.querySelector('.custom-scrollbar');
                            Ps.initialize(el);
                            $(document).ready(function() {
                                        
                            	$(window).scroll(function() {
                                    if ($(this).scrollTop() > 50) {
                                        $('#back-to-top').fadeIn();
                                    } else {
                                        $('#back-to-top').fadeOut();
                                    }
                                }); 
                            	
                         	});
                        </script>
                        <!-- SCRIPTS -->
                        <!-- JQuery -->
                        <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
                        <!-- Bootstrap tooltips -->
                        <script type="text/javascript" src="js/tether.min.js"></script>
                        <!-- MDB core JavaScript -->
                        <script type="text/javascript" src="js/mdb.min.js"></script>
                    </body>

                    </html>