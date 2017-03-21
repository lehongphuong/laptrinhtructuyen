 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
 <%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
 <%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
 <%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
 <!DOCTYPE html>
 <html lang="en">
 <head>
   
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
   
   <style>.CodeMirror {border: 5px inset #dee;}</style>
   <!-- /mirror editor-->
   
   
   
   
   <!-- Required meta tags always come first -->
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <meta http-equiv="x-ua-compatible" content="ie=edge">
   <title>Học lập trình trực tuyến</title>
   <!-- Font Awesome -->
   <!-- w3 school -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

   <!-- <link rel="stylesheet" href="css/font-awesome.min.css"> -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.0/css/font-awesome.min.css">

   <!-- CSS -->
   <link href="css/compiled.min.css" rel="stylesheet">
   <!-- <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script> -->
   <!-- Bootstrap core CSS -->
   <!-- <link href="css/bootstrap.min.css" rel="stylesheet"> -->
   <!-- Material Design Bootstrap -->
   <link href="css/mdb.min.css" rel="stylesheet">
   <!-- Your custom styles (optional) -->
   <link href="css/style.css" rel="stylesheet">

   
   
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


        <bean:define id="idMenu" name="tutorialForm" property="menuId"></bean:define>
        <bean:define id="idCate" name="tutorialForm" property="cateId"></bean:define>
        <logic:iterate name="tutorialForm" property="cateList" id="cate">

        <bean:define id="cateId1" name="cate" property="cateId"></bean:define>

        <logic:equal name="cate" property="menuId" value="${idMenu}">

        <logic:equal name="tutorialForm" property="cateId" value="${cateId1}">
        <li class="nav-item menuActive">
          <html:link action="home-to-practics.do?menuId=${idMenu}&cateId=${cateId1}&tutId=1">
          <span class="hidden-sm-down uppercase"><bean:write name="cate" property="name"/></span>
          </html:link>
        </li>
      </logic:equal>

      <logic:notEqual name="tutorialForm" property="cateId" value="${cateId1 }">
      <li class="nav-item">
        <html:link action="home-to-practics.do?menuId=${idMenu}&cateId=${cateId1}&tutId=1">
        <span class="hidden-sm-down uppercase"><bean:write name="cate" property="name"/></span>
        </html:link>
      </li>
    </logic:notEqual>

  </logic:equal>
</logic:iterate>


<logic:equal name="tutorialForm" property="statusLogin" value="notLogin">
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

<logic:equal name="tutorialForm" property="statusLogin" value="login">
<li class="nav-item dropdown">
  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    <i class="fa fa-user"></i> <span class="hidden-sm-down">
    <span class="uppercase"> WELCOME <bean:write name="tutorialForm" property="username"/> </span>

  </span>
</a>
<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
  <html:link action="/user-logout.do" styleClass="dropdown-item">LOGOUT</html:link>
</div>
</li>
</logic:equal>

<logic:equal name="tutorialForm" property="statusLogin" value="fail">
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

<div class="container-fluid row">
 <div id="left" class="col-lg-3">
  <!-- Sidebar navigation -->
  <div id="leftmenuinner">
    <div id="leftmenuinnerinner">
      <ul class="menuVertical">
        
       
        <logic:iterate name="tutorialForm" property="tutList" id="tut">
        <bean:define id="tutId" name="tut" property="tuId"></bean:define>
        
        
       <logic:equal name="tut" property="tuId" value="${param.tutId}">
        <li><h5><a class="active" href="home-to-practics.do?menuId=${param.menuId}&cateId=${param.cateId}&tutId=${tutId}"><bean:write name="tut" property="title"/></a></h5></li>
      </logic:equal>
      
      <logic:notEqual name="tut" property="tuId" value="${param.tutId}">
      <li><a href="home-to-practics.do?menuId=${param.menuId}&cateId=${param.cateId}&tutId=${tutId}"><bean:write name="tut" property="title"/></a></li>
    </logic:notEqual>
    
    
  </logic:iterate>
  
  
  
</ul>
</div>
</div>
<!--end Sidebar navigation -->
</div>
<!-- noi dung -->
<div id="right" style="margin-top: 100px;" class="col-md-9">




 <div class="">
   <div class="w3-col l10 m12" id="main">
    <!-- Ezoic - Leaderboard - top_of_page -->
    <div id="ezoic-pub-ad-placeholder-103">
      <div id="mainLeaderboard" style="overflow:hidden;">
        <!-- MainLeaderboard-->
        <div id="div-gpt-ad-1422003450156-2">
          <script type="text/javascript">googletag.cmd.push(function() { googletag.display('div-gpt-ad-1422003450156-2'); });</script>
        </div>
      </div>
    </div>
    <!-- End Ezoic - Leaderboard - top_of_page -->
    <h1>HTML  Elements </h1>
    <div class="w3-clear nextprev">
      <a class="btn btn-outline-primary waves-effect"
      href="home-to-practics.do?menuId=${param.menuId}&cateId=${param.cateId}&tutId=${param.tutId>1?param.tutId-1:param.tutId}">❮ Previous</a>
      <a class="btn btn-success btn-rounded" style="float:right"
      href="home-to-practics.do?menuId=${param.menuId}&cateId=${param.cateId}&tutId=${param.tutId+1}">Next ❯</a>
    </div>
    <hr>

    
    <logic:iterate name="tutorialForm" property="tutCodeList" id="tutCode">
    
    <bean:define id="tutCodeId" name="tutCode" property="tuCoId"></bean:define>

    <h2><bean:write name="tutCode" property="title"/></h2>
    <P><bean:write name="tutCode" property="description"/></P>
    
    <div><textarea id="code-html${tutCodeId}" name="code-html${tutCodeId }">
<bean:write name="tutCode" property="code"/>
    </textarea></div>
    
    <script type="text/javascript">
     var editor = CodeMirror.fromTextArea(document.getElementById("code-html${tutCodeId }"), {
       mode: {name: "htmlmixed",
       version: 3,
       singleLineStringErrors: false},
       lineNumbers: true,
       indentUnit: 4,
       matchBrackets: true
     });
   </script>
   
   <a class="btn btn-info btn-rounded waves-effect waves-light"  target="_blank"
   href="run-html.do?menuId=${param.menuId}&cateId=${param.cateId}&tutId=${param.tutId}&tutCodeId=${tutCodeId}">
   Run code</a>
   <br><br><br> 
   
 </logic:iterate>
 




 <br>
 <div class="w3-clear nextprev">
  <a class="btn btn-outline-primary waves-effect"
  href="home-to-practics.do?menuId=${param.menuId}&cateId=${param.cateId}&tutId=${param.tutId>1?param.tutId-1:param.tutId}">❮ Previous</a>
  <a class="btn btn-success btn-rounded" style="float:right"
  href="home-to-practics.do?menuId=${param.menuId}&cateId=${param.cateId}&tutId=${param.tutId+1}">Next ❯</a>
</div>
</div>
</div>

</div>

</div>




<!--Footer-->
<footer class="page-footer center-on-small-only clearFix" >

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








<script> 
  var mac = CodeMirror.keyMap.default == CodeMirror.keyMap.macDefault;
  CodeMirror.keyMap.default[(mac ? "Cmd" : "Ctrl") + "-Space"] = "autocomplete";
</script>



<!-- SCRIPTS -->
<script type="text/javascript" src="js/compiled.min.js"></script>
<script>
 $(".button-collapse").sideNav();
 
 var el = document.querySelector('.custom-scrollbar');
 Ps.initialize(el);
 $(document).ready(function(){
   $(window).scroll(function () {
    if ($(this).scrollTop() > 50) {
      $('#back-to-top').fadeIn();
    } else {
      $('#back-to-top').fadeOut();
    }
  });
         // scroll body to 0px on click
         $('#back-to-top').click(function () {
          $('#back-to-top').tooltip('hide');
          $('body,html').animate({
            scrollTop: 0
          }, 800);
          return false;
        });
         
         $('#back-to-top').tooltip('show');
         
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