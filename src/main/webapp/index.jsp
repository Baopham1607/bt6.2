<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>Murach's Java Servlets and JSP</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>
</head>
<body>
<h1>Survey</h1>
<p>Please fill out this survey to help us improve.</p>

<form action="survey" method="post">
    <label>Email:</label>
    <input type="email" name="email" required/><br/>

    <label>First Name:</label>
    <input type="text" name="firstName" required/><br/>

    <label>Last Name:</label>
    <input type="text" name="lastName" required/><br/>

    <label>Heard From:</label>
    <select name="heardFrom">
        <option value="Search Engine">Search Engine</option>
        <option value="Friend or Colleague">Friend or Colleague</option>
        <option value="Social Media">Social Media</option>
    </select><br/>

    <label>Receive Updates:</label>
    <input type="checkbox" name="wantsUpdates" value="Yes"/><br/>

    <label>Contact Via:</label>
    <input type="radio" name="contactVia" value="Email" checked/> Email
    <input type="radio" name="contactVia" value="Phone"/> Phone
    <input type="radio" name="contactVia" value="Mail"/> Mail
    <br/>

    <label>&nbsp;</label>
    <input type="submit" value="Submit"/>
</form>
</body>
</html>