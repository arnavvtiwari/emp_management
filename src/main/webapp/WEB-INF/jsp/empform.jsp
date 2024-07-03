<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Employee</title>
    <style type="text/css">
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }
        
        #form {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
        }
        
        #form h1 {
            text-align: center;
            margin-bottom: 20px;
        }
        
        table {
            width: 100%;
        }
        
        table td {
            padding: 10px;
        }
        
        input[type="text"], input[type="submit"] {
            width: calc(100% - 20px);
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        
        input[type="submit"] {
            background-color: #39c1e9;
            color: white;
            border: none;
            cursor: pointer;
        }
        
        input[type="submit"]:hover {
            background-color: #31a8e8;
        }
    </style>
</head>
<body>
    <div id="form">
        <h1>Add New Employee</h1>
        <form:form method="POST" action="save">  
            <table>  
                <tr>  
                    <td>E Id :</td> 
                    <td><form:input path="eid" /></td>
                </tr> 
                <tr>  
                    <td>Name :</td> 
                    <td><form:input path="name" /></td>
                </tr>  
                <tr>  
                    <td>Salary :</td>  
                    <td><form:input path="salary" /></td>
                </tr> 
                <tr>  
                    <td>Designation :</td>  
                    <td><form:input path="designation" /></td>
                </tr> 
                <tr>  
                    <td>Date of Birth :</td>  
                    <td><form:input path="dob" placeholder="dd/mm/yyyy" /></td>
                </tr> 
                <tr>  
                    <td></td>  
                    <td><input type="submit" value="Save" /></td>  
                </tr>  
            </table>  
        </form:form>
    </div>
</body>
</html>
