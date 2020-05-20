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
              <!--Bootstrap CSS-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
              <!jQuery-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>     
              <!--Bootstrap  JS-->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

    </head>
    <body>
              <!--Content-->
        <div class="container">
                  <!--Bootstrap Card Begin-->
            <div class="card text-center">
                   <!--Bootstrap Card header-->
                <div class="card-header">
                       <!--Bootstrap Tabs-->
                    <div  class="card-header-tabs" id="tabs">
                        <ul class="nav nav-tabs">
                               <!--Bootstrap Nav Tab 1-->
                            <li class="nav-item">
                                <a class="nav-link active" href="#words" data-toggle="tab" role="tab" aria-controls="settings" aria-selected="true">Number to words</a>
                            </li>
                                     <!--Bootstrap Nav Tab 2-->
                            <li class="nav-item">
                                <a class="nav-link" href="#dollars" data-toggle="tab" role="tab" aria-controls="settings" aria-selected="false">Number to Dollars</a>
                            </li>
                        </ul>
                    </div>

                                <!--Card Body-->
                    <div class="card-body">
                        <div class="tab-content">
                            <!--Tab 1 - Words-->
                            <div class="tab-pane active" id="words" role="tabpanel" aria-labelledby="word-tab">
                                <h1 class="card-title">Convert a number to words</h1>
                                <div class="card-text">
                                     <!--Number input form for WORDS-->
                                    <form action="NumberToWordsServlet">
                                        <div class="form-group row mx-sm-3 mb-2">
                                            <label for="username" class="col-sm-6 col-form-label">Enter Number Here</label> 
                                            <div class="col-sm-6">
                                                <input type="text" class="form-control" id="number1" name="number1" value="">
                                            </div>
                                        </div>
                                        <button type="submit" class="btn btn-success"id="sbm" >Convert to Words</button>
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
                                <h1 class="card-title">Convert a number to dollars</h1>
                                <div class="card-text">
                                    <!--Number input form for DOLLAR-->
                                    <form action="NumberToDollarsServlet">
                                        <div class="form-group row mx-sm-3 mb-2">
                                            <label for="username" class="col-sm-6 col-form-label">Enter Number Here</label> 
                                            <div class="col-sm-6">
                                                <input type="text" class="form-control" id="number2" name="number2" value="">
                                            </div>
                                        </div>
                                        <button type="submit" class="btn btn-primary" >Convert to Dollars</button>
                                    </form> 
                                    <hr>
                                    <!--Collapse the servlet response for DOLLAR-->
                                    <div class="collapse" id="collapseExample">
                                        <div id="results">
                                            <h2>  The result is: <span>${result}</span></h2>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <script>
                //Once the tab is hidden
                $('a[data-toggle="tab"]').on('hidden.bs.tab', function (evt) {
                    //Hide the previous search result
                    $("#results").hide();
               
                });
                
                 $('a[data-toggle="tab"]').on('shown.bs.tab', function (evt) {
                    $('#collapse').collapse('hide');
                });

            </script>
    </body>
</html>

