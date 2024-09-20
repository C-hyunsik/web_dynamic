<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Form Example</title>
<style>
body {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
    background-color: #f0f0f0;
    font-family: Arial, sans-serif;
}

form {
    width: 50%;
}

table {
    width: 100%;
    border-collapse: collapse;
    background-color: #fff;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    font-size: 1.2em; /* Increase font size */
}

th, td {
    padding: 15px;
    text-align: left;
}

th {
    background-color: #4CAF50;
    color: white;
}

td {
    background-color: #f9f9f9;
}

input[type="text"], select {
    width: 95%;
    padding: 8px;
    margin: 4px 0;
    border: 1px solid #ccc;
    border-radius: 4px;
}

input[type="checkbox"] {
    margin-right: 5px;
}

input[type="submit"], input[type="reset"] {
    width: 100px;
    padding: 10px 15px;
    margin: 10px;
    border: none;
    border-radius: 4px;
    background-color: #4CAF50;
    color: white;
    cursor: pointer;
    font-size: 1em;
}

input[type="submit"]:hover, input[type="reset"]:hover {
    background-color: #45a049;
}
</style>
</head>
<body>
    <form method="post" action="jstlResult.jsp">
        <table border="1" cellpadding="5" cellspacing="0">
            <tr>
                <th width="70">이름</th>
                <td><input type="text" name="name" /></td>
            </tr>
            <tr>
                <th width="70">나이</th>
                <td><input type="text" name="age" /></td>
            </tr>
            <tr>
                <th width="70">색깔</th>
                <td>
                    <select name="color" id="color" style="width: 100px;">
                        <optgroup label="색깔">
                            <option value="red">빨강</option>
                            <option value="green">초록</option>
                            <option value="blue">파랑</option>
                            <option value="magenta">보라</option>
                            <option value="cyan">하늘</option>
                        </optgroup>
                    </select>
                </td>
            </tr>
            <tr>
                <th>취미</th>
                <td>
                    <input type="checkbox" name="hobby" id="hobby1" value="독서" />
                    <label for="hobby1">독서</label>
                    <input type="checkbox" name="hobby" id="hobby2" value="영화" />
                    <label for="hobby2">영화</label>
                    <input type="checkbox" name="hobby" id="hobby3" value="음악" />
                    <label for="hobby3">음악</label>
                    <input type="checkbox" name="hobby" id="hobby4" value="게임" />
                    <label for="hobby4">게임</label>
                    <input type="checkbox" name="hobby" id="hobby5" value="쇼핑" />
                    <label for="hobby5">쇼핑</label>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="SEND" />
                    <input type="reset" value="CANCEL" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>