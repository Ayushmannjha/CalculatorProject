<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page errorPage="error.jsp" %>
<%@ page import="test.ExpressionEvaluator" %>
<%
    String expression = request.getParameter("expression");
    int result = 0;
    if(expression != null && !expression.isEmpty()) {
        // Evaluate expression
        result = ExpressionEvaluator.evalExpression(expression);
    }
    String conver = request.getParameter("convertor");
    int i = 0;
    if (conver != null && !conver.isEmpty()) {
        i = Integer.parseInt(conver);
    }
%>
<!DOCTYPE html>
<html>
<head>
<style>
    *{
box-sizing: border-box;
padding: 0px;
margin: 0px;
    }
   
    
    h1 {
        text-align: center;
        font-family: Arial, sans-serif;
        color: blue;
    }
    
    textarea {
        width: 100%;
        height: 20px;
        margin: 10px auto;
        display: block;
        font-size: 20px;
        text-align: center;
        border: none;
        font-weight: bolder; 
    }
    
    form {
        width: 300px;
        margin: 0 auto;
    }
    
    input[type="button"] {
        width: 50px;
        height: 50px;
        margin: 5px;
        border-radius: 10px;
        background-color: lightgray;
        font-size: 20px;
        border: none;
    }
    
    input[type="button"]:hover {
        background-color: gray;
        
    }
    
    input[type="submit"] {
        width: 50px;
        height: 50px;
        margin: 5px;
        border-radius: 10px;
        background-color: green;
        color: white;
        font-size: 20px;
        border: none;
    }
    
    input[type="submit"]:hover {
        background-color: darkgreen;
       
    }
    input[type="text"] {
        background-color: darkgreen;
        padding: 10px ;
        width: 100%;
    }
    .container{
        border: 1px solid rgb(101, 216, 182);
        padding: 10px;
        border-radius: 20px;
     
        padding: 10px;
        border-radius: 20px;
        background-color: rgb(209, 240, 224);
margin-top: 25%;
    }

    #re{
        background-color: darkgreen;
        padding: 10px ;
        border: none;
        color: white;
    }
    #expression{
        background-color: white;
        border-radius: 10px;
        border: 1px rgb(189, 186, 186) solid;
        font-weight: bolder;
        font-size: 15px
    }
    .navbar {
  background-color: #333;
  overflow: hidden;
}

.navbar h1 {
  float: left;
  color: white;
  text-align: center;
  padding: 14px 16px;
  margin: 0;
}

.navbar select {
  float: right;
  margin: 14px 16px;
}

</style>
    <meta charset="ISO-8859-1">
    <title>Calculator</title>
    
</head>
<body>
   
    <nav class="navbar">
        <h1>Calculator</h1>
       <select >
        <option value="">Convertors</option>
        <option value="">currency</option>
        <option value="">length</option>
        <option value="">cube</option>
        <option value="">cuboid</option>
       </select>
      </nav>
      
    <form method="get" action="add.jsp">
        <div class="container">
            <textarea rows="" cols=""><%= result %></textarea>
        <input type="text" name="expression" id="expression" placeholder="Enter expression" />
        <br><br>
       
        <input type="button" value="1" onclick="insertValue('1')" />
        <input type="button" value="2" onclick="insertValue('2')" />
        <input type="button" value="3" onclick="insertValue('3')" />
        <input type="button" value="+" onclick="insertValue('+')" />
        <br>
        
        <input type="button" value="4" onclick="insertValue('4')" />
        <input type="button" value="5" onclick="insertValue('5')" />
        <input type="button" value="6" onclick="insertValue('6')" />
        <input type="button" value="-" onclick="insertValue('-')" />
        <br>
        
        <input type="button" value="7" onclick="insertValue('7')" />
        <input type="button" value="8" onclick="insertValue('8')" />
        <input type="button" value="9" onclick="insertValue('9')" />
        <input type="button" value="X" onclick="insertValue('X')" />
        <br>
        
        <input type="button" value="0" onclick="insertValue('0')" />
        <input type="button" value="/" onclick="insertValue('/')" />
        <input type="submit" value="=" />
        <input type="button" value="AC" id = "re" onclick="refresh()" />
        <br><br>
       
    </form>
</div>
   
    
    <script>
        function insertValue(value) {
            document.getElementById("expression").value += value;
        }
        
        function refresh() {
            document.getElementById("expression").value = "";
            document.getElementsByTagName("textarea")[0].innerHTML = 0;
        }
    </script>
    
</body>
</html>
