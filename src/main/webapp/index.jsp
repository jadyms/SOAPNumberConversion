<%-- 
    Document   : index
    Created on : May 20, 2020, 3:59:07 PM
    Author     : JadyMartins
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Conversion</title>
    <!--Meta Tag-->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--Bootstrap CSS-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <!jQuery-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>     
    <!--Bootstrap  JS-->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
     <!--CSS-->
    <style><%@include file="/WEB-INF/css/style.css"%></style>
</head>
<body>
    
    <!--Content-->
    <div class="row d-flex justify-content-center vertical-center">
        <!--Bootstrap Card Begin-->
        <div class="card text-center col-md-6 ">
            <!--Bootstrap Tabs-->
            <div  class="card-header-tabs" id="tabs">
                <ul class="nav nav-tabs" id="myTab">
                    <!--Bootstrap Nav Tab 1-->
                    <li class="nav-item active">
                        <a class="nav-link" href="#words" data-toggle="tab" role="tab" aria-controls="settings" aria-selected="true">Number to words</a>
                    </li>
                    <!--Bootstrap Nav Tab 2-->
                    <li class="nav-item ">
                        <a class="nav-link" href="#dollars" data-toggle="tab" role="tab" aria-controls="settings" aria-selected="false">Number to Dollars</a>
                    </li>
                </ul>
            </div>
            <!--Card Body-->
            <div class="card-body">
                <div class="tab-content">
                    <!--Tab 1 - Words-->
                    <div class="tab-pane " id="words" role="tabpanel" aria-labelledby="word-tab">
                        <h1 class="card-title">Convert a Number to Words</h1>
                        <div class="card-text">
                            <!--Number input form for WORDS-->
                            <form action="NumberToWordsServlet">
                                <div class="form-group row mx-sm-3 mb-2">
                                    <div class="col-sm-12">
                                        <input type="text" class="form-control"  placeholder="Enter Number Here" id="number1" name="number1" value="">
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary"id="sbm" ><strong>Convert</strong></button>
                            </form> 
                            <hr>
                            <!--Collapse the servlet response for WORDS-->
                            <div class="collapse" id="collapseExample">
                                <div id="results">
                                    <h2>  The result is: <span>${result}</span></h2>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--Tab 2 - Dollars-->
                    <div class="tab-pane" id="dollars" role="tabpanel" aria-labelledby="dollar-tab">
                        <h1 class="card-title">Convert a Number to Dollars</h1>
                        <div class="card-text">
                            <!--Number input form for DOLLAR-->
                            <form action="NumberToDollarsServlet">
                                <div class="form-group row mx-sm-3 mb-2">
                                    <div class="col-sm-12">
                                        <input type="text" class="form-control" placeholder="Enter Number Here" id="number2" name="number2" value="">
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-success " ><strong>Convert</strong></button>
                            </form> 
                            <hr>
                            <!--Collapse the servlet response for DOLLAR-->
                            <div class="collapseDollar" id="collapseExample">
                                <div id="resultsDollar">
                                    <h2>  The result is: <span>${resultDollar}</span></h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            //Temporary storage of last visited tab
            $(document).ready(function () {
                $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {
                    localStorage.setItem('activeTab', $(e.target).attr('href'));
                });
                var activeTab = localStorage.getItem('activeTab');
                if (activeTab) {
                    $('#myTab a[href="' + activeTab + '"]').tab('show');
                }
            });
            
            //Once the tab Dollars is clicked
            $('#myTab a[href="#dollars"]').on('hidden.bs.tab', function (evt) {
                //Hide the previous search result
                $("#results").hide();

            });
            //Once the tab Words is clicked
            $('#myTab a[href="#words"]').on('hidden.bs.tab', function (evt) {
                //Hide the previous search result
                $("#resultsDollar").hide();
            });
        </script>
</body>
</html>

