<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>;
<html>
<head>
  <title>Calculator</title>
</head>
<body>
<h1>Simple Calculator</h1>
<form method="post" action="/calculate">
  <fieldset>
    <legend>Calculator</legend>
    <table>
      <tr>
        <td>First operand: </td>
        <td><input name="first-operand" type="text"/></td>
      </tr>
      <tr>
        <td>Operator: </td>
        <td>
          <select name="operator">
            <option value="+">Addition</option>
            <option value="-">Subtraction</option>
            <option value="*">Multiplication</option>
            <option value="/">Division</option>
          </select>
        </td>
      </tr>
      <tr>
        <td>Second operand: </td>
        <td><input name="second-operand" type="text"/></td>
      </tr>
      <tr>
        <td></td>
        <td><input type="submit" value="Calculate"/></td>
      </tr>
    </table>
  </fieldset>
</form>

<h3 style="background: orangered"> <c:out value="${excep}"/> </h3>
<h3 style="background: aqua"> <c:out value="${firstOperand}"/>  <c:out value="${operator}"/>   <c:out value="${secondOperand}"/>  <c:out value="${result}"/> </h3>
</body>
</html>