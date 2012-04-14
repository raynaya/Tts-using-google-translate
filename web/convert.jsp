<%-- 
    Document   : index
    Created on : Apr 14, 2012, 4:07:11 PM
    Author     : shamik
--%>

<%@page import="java.io.*"%>
<%@page import="org.apache.http.HttpEntity"%>
<%@page import="org.apache.http.HttpResponse"%>
<%@page import="org.apache.http.client.methods.HttpGet"%>
<%@page import="org.apache.http.impl.client.*"%>
<%@page import="org.apache.http.client.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="freetts.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <body>
        
        
       <%
       String string=request.getParameter("a");
        HttpClient httpclient = new DefaultHttpClient();
HttpGet httpget = new HttpGet("http://translate.google.com/translate_tts?tl=en&q="+string);
HttpResponse res = httpclient.execute(httpget);
HttpEntity entity = res.getEntity();
if (entity != null) {
    InputStream instream = entity.getContent();
    OutputStream t = new FileOutputStream(new File("C:\\Documents and Settings\\shamik\\My Documents\\NetBeansProjects\\freetts\\web\\resources\\newfile.mp3"));
    int l;
    byte[] tmp = new byte[2048];
    while ((l = instream.read(tmp)) != -1) {
    t.write(tmp, 0, l);
    }
    instream.close();
	t.flush();
	t.close();
        response.sendRedirect("/speech.jsp");
}
        %>
    </body>
</html>
