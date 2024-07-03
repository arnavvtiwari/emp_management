    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  

	<h1>Employees List</h1>
	<table border="2" width="70%" cellpadding="2">
	<tr><th>Id</th><th>Name</th><th>Salary</th><th>Designation</th><th>Date of Birth</th><th>Edit</th><th>Delete</th></tr>
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
    <br/>
    <a href="empform">Add New Employee</a>