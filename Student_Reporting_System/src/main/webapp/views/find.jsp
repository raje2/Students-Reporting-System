<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<body>
<h1>This is the Find jsp</h1><br><br>

<table>
    <thead>
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Semesters</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${students}" var="s">
        <tr>
            <td>${s.getId()}</td>
            <td>${s.getName()}</td>
            <td>${s.getSemesters()}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>