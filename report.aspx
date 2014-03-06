<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Avaya Reports</title>
    <link rel="shortcut icon" href="../assets/ico/favicon.png">
    <link href="css/jquery-ui-1.9.2.custom.css" rel="stylesheet" type="text/css" />
    <link href="css/jquery.dataTables_themeroller.css" rel="stylesheet" type="text/css"/>
    <link href="css/messi.css" rel="stylesheet" type="text/css"/>
    <link href="css/prettyLoader.css" rel="stylesheet" />
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/bootstrap-responsive.css" rel="stylesheet">
    <link href="css/docs.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
	<link href="css/events.css" rel="stylesheet">
    <link href="css/report.css" rel="stylesheet" />
	<style type="text/css">
        .ui-dialog { font-size: 65.5%; }
        .ui-dialog label, input, select { display:inline-block; }
        .ui-dialog input.text { margin-bottom:12px; width:95%; padding: .4em; }
        .ui-dialog select.text { margin-bottom:12px; width:97.7%; padding: .4em; }
        .ui-dialog fieldset { padding:0; border:0; margin-top:25px; }
        .ui-dialog h1 { font-size: 1.2em; margin: .6em 0; }
        .ui-dialog div#users-contain { width: 350px; margin: 20px 0; }
        .ui-dialog div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }
        .ui-dialog div#users-contain table td, div#users-contain table th { border: 1px solid #eee; padding: .6em 10px; text-align: left; }
        .ui-dialog .ui-dialog .ui-state-error { padding: .3em; }
        .ui-dialog .validateTips { border: 1px solid transparent; padding: 0.3em; }

        /*----------ESTILOS FUENTES--------*/
            @font-face {
                font-family: 'proxima_novalight';
                src: url('css/fonts/proximanova-light_0-webfont.eot');
                src: url('css/fonts/proximanova-light_0-webfont.eot?#iefix') format('embedded-opentype'),
                     url('css/fonts/proximanova-light_0-webfont.woff') format('woff'),
                     url('css/fonts/proximanova-light_0-webfont.ttf') format('truetype'),
                     url('css/fonts/proximanova-light_0-webfont.svg#proxima_novalight') format('svg');
                font-weight: normal;
                font-style: normal;

            }

            @font-face {
                font-family: 'proxima_nova_rgregular';
                src: url('css/fonts/proximanova-regular_0-webfont.eot');
                src: url('css/fonts/proximanova-regular_0-webfont.eot?#iefix') format('embedded-opentype'),
                     url('css/fonts/proximanova-regular_0-webfont.woff') format('woff'),
                     url('css/fonts/proximanova-regular_0-webfont.ttf') format('truetype'),
                     url('css/fonts/proximanova-regular_0-webfont.svg#proxima_nova_rgregular') format('svg');
                font-weight: normal;
                font-style: normal;

            }

            body {
                position:absolute;
                width:100%;
                background-color: #ffffff;
                color: #5a5a5a;
                font-family: 'proxima_novalight', 'proxima_nova_rgregular';
            }

        #content {
            position:absolute;
            width:100%;
            margin-left:auto;
            top:80px;
            margin-right:auto;
        }

         #header {
	width: 720px;
	margin-left: auto;
	margin-right: auto;
        }

            


    </style>
	<style>

    /* GLOBAL STYLES
    -------------------------------------------------- */
    /* Padding below the footer and lighter body text */

    



    /* CUSTOMIZE THE NAVBAR
    -------------------------------------------------- */

    /* Special class on .container surrounding .navbar, used for positioning it into place. */
    .navbar-wrapper {
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      z-index: 10;
      /*margin-top: 20px;*/
      margin-bottom: -90px; /* Negative margin to pull up carousel. 90px is roughly margins and height of navbar. */
    }
    .navbar-wrapper .navbar {

    }

    /* Remove border and change up box shadow for more contrast */
    .navbar .navbar-inner {
      border: 0;
      -webkit-box-shadow: 0 2px 10px rgba(0,0,0,.25);
         -moz-box-shadow: 0 2px 10px rgba(0,0,0,.25);
              box-shadow: 0 2px 10px rgba(0,0,0,.25);
    }

    /* Downsize the brand/project name a bit */
    .navbar .brand {
      padding: 20px 0; /* Increase vertical padding to match navbar links */
      font-size: 16px;
      font-weight: bold;
      text-shadow: 0 -1px 0 rgba(0,0,0,.5);
    }
     .brand{
       /*background: url(assets/img/bg-avaya-logo.png) repeat-x;*/
          border-bottom-left-radius: 4px;
           -webkit-border-bottom-left-radius: 4px;
           -moz-border-bottom-left-radius: 4px;
          border-top-left-radius: 4px;
           -webkit-border-top-left-radius: 4px;
           -moz-border-top-left-radius: 4px;
     }

    /* Navbar links: increase padding for taller navbar */
    .navbar .nav > li > a {
      padding: 25px 18px;
    }

    /* Offset the responsive button for proper vertical alignment */
    .navbar .btn-navbar {
      margin-top: 10px;
    }


    /* MARKETING CONTENT
    -------------------------------------------------- */

    /* Center align the text within the three columns below the carousel */
    .marketing .span4 {
      text-align: center;
    }
    .marketing h2 {
      font-weight: normal;
      font-size: 15px;
      margin-bottom: 0px;
      text-transform: uppercase;
    }
    .marketing .span4 p {
      margin-left: 10px;
      margin-right: 10px;
    }


    /* Featurettes
    ------------------------- */

    .featurette-divider {
      margin: 60px 0; /* Space out the Bootstrap <hr> more */
    }
    .featurette {
      padding-top: 60px; /* Vertically center images part 1: add padding above and below text. */
      overflow: hidden; /* Vertically center images part 2: clear their floats. */
      margin: 0 0 30px;
    }
    .featurette-image {
      margin-top: -40px; /* Vertically center images part 3: negative margin up the image the same amount of the padding to center it. */
    }

    /* Give some space on the sides of the floated elements so text doesn't run right into it. */
    .featurette-image.pull-left {
      margin-right: 40px;
    }
    .featurette-image.pull-right {
      margin-left: 40px;
    }

    /* Thin out the marketing headings */
    .featurette-heading {
      font-size: 40px !important  ;
      font-weight: 300;
      line-height: 1;
      letter-spacing: -1px;
    }

    /* RESPONSIVE CSS
    -------------------------------------------------- */

    @media (max-width: 979px) {

      .container.navbar-wrapper {
        margin-bottom: 0;
        width: auto;
      }
      .navbar-inner {
        border-radius: 0;
        margin: 0;
      }
      
      .marketing h2{
        font-size: 16px;
      }
      
      .marketing p{
        font-size: 13px;
      }
      
      .featurette {
        height: auto;
        padding: 0;
      }
      .featurette-image.pull-left,
      .featurette-image.pull-right {
        display: block;
        float: none;
        max-width: 40%;
        margin: 0 auto 20px;
      }
    }


    @media (max-width: 767px) {

      .navbar-inner {
        margin: 0px;
      }

      .carousel {
        margin-left: -20px;
        margin-right: -20px;
      }
      .carousel .container {

      }
      .carousel .item {
        height: 300px;
      }
      .carousel img {
        height: 300px;
      }
      .carousel-caption {
        width: 65%;
        padding: 0 70px;
        margin-top: 100px;
      }
      .carousel-caption h1 {
        font-size: 30px;
      }
      .carousel-caption .lead,
      .carousel-caption .btn {
        font-size: 18px;
      }

      .marketing .span4 + .span4 {
        margin-top: 40px;
      }

      .featurette-heading {
        font-size: 30px;
      }
      .featurette .lead {
        font-size: 18px;
        line-height: 1.5;
      }

    }
	
	.search {
	    left: 46%;
		position: relative;
		top: -47px;
		width: 450px;
		margin-bottom: -48px;
	}
	
	.search input, .search a {
	   margin-left:10px;
	}
	
	#search {
	   position:relative;
	   top:-9px;
	}
	
	#item_search {
	    position:relative;
		top:-3px;
	}
	
	#advance {
	    position:relative;
		top:-5px;
	}
	
	.nav li #lbluser, .nav li #nombre 
    {
        display:inline-block;
        font-family:"Helvetica Neue", Helvetica, Arial, sans-serif;
        font-size:14px;
        color:#999999;
        cursor:default;
        padding-top:25px;
	float: left;
    }

        #contentForm3 #txtMessage {
            position:relative;
            width:95%;
            margin-left: 5px ;
            padding: 7px 5px 7px 5px ;
        }

        #DragWordList {
            position:relative;
            width:100%;
            margin: 0px ;
            padding: 7px 5px 7px 5px ;
        }

        #DragWordList li {
            font-size:9px;
            display: inline ;
            background-color: #acdae9 ;
            padding: 0px 13px 0px 13px ;
            border-radius: 4px;
            border-width:1px;
            margin-left:3px;
            margin-right:3px;
        }

        #contentForm4 #txtMessage2 {
            position:relative;
            width:95%;
            margin-left: 5px ;
            padding: 7px 5px 7px 5px ;
        }

        #DragWordList2 {
            position:relative;
            width:100%;
            margin: 0px ;
            padding: 7px 5px 7px 5px ;
        }

        #DragWordList2 li {
            font-size:9px;
            display: inline ;
            background-color: #acdae9 ;
            padding: 0px 13px 0px 13px ;
            border-radius: 4px;
            border-width:1px;
            margin-left:3px;
            margin-right:3px;
        }

        #fieldsetemp {
            position:relative;
            left:100px;
            background: none repeat scroll 0 0 #FCFCFC;
            border: 0 none;
            margin-bottom: 10px;
            width: 1300px;
        }

        #fechainicial, #fechafinal, #pInitial, #pEnd {
            display: inline-block;
        }

        #promocodes {
            width: 380px;
        }
        #promocodes, #lblpcode, #view, #exit {
            display: inline-block;
        }

        #view {
            background: none repeat scroll 0 0 #EEEEEE;
            border: 0 none;
            box-shadow: none;
            color: #445058;
            cursor: pointer;
            font-size: 14px;
            margin: -6px 12px 0 60px;
            padding: 7px 10px 8px;
            width: 70px;
        }

	        #view:hover {
                color : #FFF;
                background: none repeat scroll 0 0 #8b0000;
	        }

        #exit {
            background: none repeat scroll 0 0 #EEEEEE;
            border: 0 none;
            box-shadow: none;
            color: #445058;
            cursor: pointer;
            font-size: 14px;
            margin: -6px 12px 0 60px;
            padding: 7px 10px 8px;
            width: 70px;
        }
	        #exit:hover {
                color : #FFF;
                background: none repeat scroll 0 0 #8b0000;
	        }



    </style>
	
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/jQueryUi.js"></script>
    <script type="text/javascript" src="js/messi.js"></script>
    <script type="text/javascript" src="js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="js/dataTables.editor.js"></script>
    <script type="text/javascript" src="js/json2.js"></script>
    <script type="text/javascript" src="js/prettyLoader.js"></script>
    <script type="text/javascript" src="js/jquery.sha256.js"></script>
    	<script type="text/javascript" src="js/report-page.js"></script>

</head>
<body>
    <div id="header">
	    <div class="navbar navbar-inverse navbar-fixed-top">
			  <div class="navbar-inner">
				<div class="container">
				  <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				  </button>
				  <a class="brand" href="http://avaya.com"><img style="max-height: 30px;" src="images/avaya.png" alt="Avaya" /></a>
				 
				</div>
			  </div>
		</div>  
	</div>
	<div id="content">
        
        <table id="datatables" style="width:100%;text-align:center;visibility:hidden" >
            <thead id="thead">
               <tr>
                   <th width="6%">Email</th>
                   <th width="6%">Register Date</th>
                   <th width="6%">Q1</th>
                   <th width="6%">Q2</th>
                   <th width="6%">Q3</th>
                   <th width="6%">Q4</th>
                   <th width="6%">Q5</th>
				   <th width="6%">Q6</th>
                   <th width="6%">Q7</th>
                   <th width="6%">Q8</th>
                   <th width="6%">Q9</th>
                   <th width="6%">Q10</th>
                   <th width="6%">Q11</th>
                   <th width="6%">Q12</th>
                   <th width="6%">Q13</th>
                   <th width="6%">Q14</th>
                   
                   
               </tr>
            </thead>
            <tbody id="tbody">
            </tbody>
            <tfoot><tr><td colspan="2"><table><tr>
                            <td><div id="toExcel"><a href="#" id="btnDescargaExcel" ><img src="images/xls.png" alt="to Excel"/></a></div></td>
                            
                        </tr>
                        </table>  
                        </td>
                     <td>&nbsp;</td>
                     <td>&nbsp;</td>
                     <td>&nbsp;</td>
					 <td>&nbsp;</td>
                     <td>&nbsp;</td>
                     <td>&nbsp;</td>
                     <td>&nbsp;</td>
                     <td>&nbsp;</td>
                     <td>&nbsp;</td>
					 <td>&nbsp;</td>
                     <td>&nbsp;</td>
                     <td>&nbsp;</td>
					 <td>&nbsp;</td>
					 
                   </tr>
            </tfoot>
        </table>
	</div>
	<script src="js/bootstrap-dropdown.js"></script>
        
	
</body>
</html>