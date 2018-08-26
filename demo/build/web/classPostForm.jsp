<%-- 
    Document   : classPostForm
    Created on : Aug 21, 2018, 8:29:49 PM
    Author     : khan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="partials/header.jsp" %> 

        <div class="row">
        <h1 style="text-align: center;">Create a new post</h1>
        <div style="width: 30%; margin: 25px auto;">
            <form action="addClassPost.jsp" method="POST">
                <div class="form-group">
                    <input class="form-control" type="text" name="subject" placeholder="Subject">    
                </div>
                <div class="form-group">
                    <input class="form-control" type="text" name="topic" placeholder="Title or Topic">    
                </div>
<!--                <div class="form-group">
                    <input class="form-control" type="text" name="image" placeholder="image url">    
                </div>-->
                <div class="form-group">
                    <textarea class="form-control" name="description" placeholder="description"></textarea>
                </div>
                <div class="form-group">
                    <p>Add pics</p>
                    <i class="far fa-image fa-2x" name="pic"></i>
                </div>
                <div class="form-group">
                    <p>Add files</p>
                    <i class="fas fa-file-pdf fa-2x" name="file"></i>
                </div>
                <div class="form-group">
                    <button class="btn btn-lg btn-primary btn-block">Submit!</button>
                </div>
            </form>
             <a href="classPosts.jsp">Go back</a>
        </div>
    </div>

<%@ include file="partials/footer.jsp" %> 