<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employees List</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            padding: 20px;
        }
        
        h1 {
            text-align: center;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        
        table, th, td {
            border: 1px solid #ddd;
        }
        
        th, td {
            padding: 10px;
            text-align: left;
        }
        
        th {
            background-color: #666699;
            color: white;
        }
        a.button {
            display: inline-block;
            padding: 10px 20px;
            text-decoration: none;
            background-color: #666699; 
            color: white;
            border-radius: 5px;
            margin-top: 10px;
        }
        
        a.button:hover {
            background-color: #8533ff;
        }
    </style>
</head>
<body>
    <h1>Employees List</h1>
    <table>
    <tr>
        <th>EID</th>
        <th>Name</th>
        <th>Salary</th>
        <th>Designation</th>
        <th>DOB</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <c:forEach var="emp" items="${list}">
        <tr>
            <td>${emp.eid}</td>
            <td>${emp.name}</td>
            <td>${emp.salary}</td>
            <td>${emp.designation}</td>
            <td>${emp.dob}</td>
            <td><a href="editemp/${emp.eid}">Edit</a></td>
            <td><a href="deleteemp/${emp.eid}">Delete</a></td>
        </tr>
    </c:forEach>
</table>

<div>
    <c:if test="${currentPage > 1}">
        <a href="viewemp?page=${currentPage - 1}">Previous</a>
    </c:if>
    <c:forEach var="i" begin="1" end="${totalPages}">
        <c:choose>
            <c:when test="${i == currentPage}">
                <strong>${i}</strong>
            </c:when>
            <c:otherwise>
                <a href="viewemp?page=${i}">${i}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    <c:if test="${currentPage < totalPages}">
        <a href="viewemp?page=${currentPage + 1}">Next</a>
    </c:if>
</div>
    <a href="empform" class="button">Add New Employee</a>
</body>
</html>
