<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>	
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
	<script src="webjars/jquery/3.2.1/jquery.js" ></script>
	<script src="webjars/jquery/3.2.1/jquery.min.js" ></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
	<script src="webjars/bootstrap/5.1.1/js/bootstrap.bundle.min.js" ></script>
	<script src="webjars/bootstrap/5.1.1/js/bootstrap.bundle.js" ></script>
	<script src="webjars/ckeditor/18.0.0/classic/ckeditor.js"></script>
	<link href="webjars/bootstrap/5.1.1/css/bootstrap.css" rel="stylesheet" type="text/css">
	<link href="webjars/bootstrap/5.1.1/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="css/style.css" rel="stylesheet" type="text/css"> 
	</head>
	
	
	
	
<body >
	<div class="top">
		<div>
		  <nav class="navbar navbar-expand-lg navbar-light bg-light"> <a class="navbar-brand" href="#"><img id="homeImg" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT37retqUtRmKwJCpLjKm-RCCi3uP75IsLyo4jlPnKtQgacqUbbktssPeG7s-R-79S9vsM&usqp=CAU"></a>
		    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent1" aria-controls="navbarSupportedContent1" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
			  <div class="collapse navbar-collapse" id="navbarSupportedContent1">
			    <ul class="navbar-nav mr-auto">
			      <li class="nav-item active"> <a class="nav-link" href="#">公布欄 </a> </li>
			      
		        </ul>
		    </div>
		  </nav>
        </div>
	</div>
		
	<div class="container">
				
				<c:choose>
				<c:when test="${Label=='revise'}">
				 <ul id="clothingnav1" style="margin-bottom: 13px;" class="nav nav-tabs" role="tablist">
				      <li class="nav-item"> <a class="nav-link active" href="#home1" id="hometab1" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">修改內容</a> </li>
				      
			    </ul>
			  	<form action="./reviseDataUpdate" method="post" enctype="multipart/form-data">
			  	 <input type="hidden" name="id" value="${data.id}" />
			  	<div class="detailList">
			  		<span>標題:</span><input type="text" id="title" name="title" value="${data.title}" required/>
			  	</div>
				<div class="detailList">
			  		<span>發布日期:</span> <input type="datetime-local"  step="1" id="publishdate" name="publishdate"  value="${data.publishdate}" required/>
			  	</div>
			  	<div class="detailList">
			  		<span>截止日期:</span><input type="datetime-local" step="1" id="enddate" name="enddate" value="${data.enddate}" required/><br/>
			  	</div>
			  	<div class="detailList">
			  		<span>發布者:</span> <input type="text" id="publisher" name="publisher" value="${data.publisher}" required/><br/>
			  	</div>
			  	<div class="detailList">
			  		<span>公布內容:</span>
			  	 	<textarea id="context" name="context" rows="10" cols="50" >${data.context}</textarea><br/>
			  	</div>
			     <div  class="detailList">
				  		<span>附件:</span>
				  		<div id="appendix">
				  	 	<span id="url" onclick="window.open('./upload/${data.url}')">${data.url}</span>
				  	 	<input type=file name="file" style="display:none"/><br/>
				  	 	<button id="change" type="button"  class="btn btn-secondary">更換</button>
				  	 	</div>
				</div>
				    
			       
				<div class="d-flex align-items-center justify-content-around">
					  <button type="submit"  class="btn btn-primary">修改</button>
			
					  <button  id="back" type="button" class="btn btn-secondary">返回</button>
			
				</div>
			      
			    </form>
			</c:when>
			<c:when test="${Label=='detail'}">
			  <ul id="clothingnav1" style="margin-bottom: 13px;" class="nav nav-tabs" role="tablist">
				      <li class="nav-item"> <a class="nav-link active" href="#home1" id="hometab1" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">詳細內容</a> </li>
				      
			    </ul>
			   
			  	
			  	<div class="detailList">
			  		<span>標題:</span><input type="text" id="title" name="title" value="${data.title}" disabled="true"  required/>
			  	</div>
				<div class="detailList">
			  		<span>發布日期:</span> <input type="datetime-local"  step="1" id="publishdate" name="publishdate" disabled="true" value="${data.publishdate}" required/>
			  	</div>
			  	<div class="detailList">
			  		<span>截止日期:</span><input type="datetime-local" step="1" id="enddate" name="enddate" disabled="true" value="${data.enddate}" required/><br/>
			  	</div>
			  	<div class="detailList">
			  		<span>發布者:</span> <input type="text" id="publisher" name="publisher" disabled="true" value="${data.publisher}" required/><br/>
			  	</div>
			  	<div class="detailList">
			  		<span>公布內容:</span>
			  	 	<textarea id="context" name="context" rows="10" cols="50" disabled="true" >${data.context}</textarea><br/>
			  	</div>
			    <div class="detailList">
				  		<span>附件:</span>
				  		<div id="appendix">
				  	 	<span id="url" onclick="window.open('./upload/${data.url}')">${data.url}</span>
				  	 	</div>
				</div>     
			       
				<div class="d-flex align-items-center justify-content-around">
					 
			
					  <button  id="back" type="button" class="btn btn-secondary">返回</button>
			
				</div>
			      
			   
			</c:when>
			
			<c:otherwise>
			 <ul id="clothingnav1" style="margin-bottom: 13px;" class="nav nav-tabs" role="tablist">
				      <li class="nav-item"> <a class="nav-link active" href="#home1" id="hometab1" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">新增資料</a> </li>
				      
			    </ul>
				<form action="./addDataSave" method="post" enctype="multipart/form-data">
				  	
				  	<div class="detailList">
			  		<span>標題:</span><input type="text" id="title" name="title" value="${data.title}"   required/>
			  	</div>
				<div class="detailList">
			  		<span>發布日期:</span> <input type="datetime-local"  step="1" id="publishdate" name="publishdate"  value="" required/>
			  	</div>
			  	<div class="detailList">
			  		<span>截止日期:</span><input type="datetime-local" step="1" id="enddate" name="enddate"  value="" required/><br/>
			  	</div>
			  	<div class="detailList">
			  		<span>發布者:</span> <input type="text" id="publisher" name="publisher"  value="${data.publisher}" required/><br/>
			  	</div>
			  	<div class="detailList">
			  		<span>公布內容:</span>
			  	 	<textarea id="context" name="context" rows="10" cols="50"  >${data.context}</textarea><br/>
			  	</div>
				     <div class="detailList">
				  		<span>附件:</span>
				  	 	<input type=file name="file"/><br/>
				  	</div> 
				       
					<div class="d-flex align-items-center justify-content-around">
						  <button type="submit"  class="btn btn-primary">新增</button>
				
						  <button  id="back" type="button" class="btn btn-secondary">返回</button>
				
					</div>
				      
				    </form>
			
				</c:otherwise>
			
			</c:choose>
		
		

			

  		</div>
			
		
		
		


</body>
<script>
	$('#back').on('click',function(){
		location.href='./home'
	})
	
	$('#change').on('click',function(){
		$('#appendix').empty();
		$('#appendix').append('<input type=file name="file" /><br/>')
	})
	
		
		
	    ClassicEditor
        .create(document.querySelector('#context'),{
        	ckfinder: {
                uploadUrl: './uploadImage'
            }
        })
        .then(editor => {
        	
        	if('${Label}'=='detail'){
        		const toolbarElement = editor.ui.view.toolbar.element;
            	toolbarElement.style.display = 'none';
        	}
        	
        	
        })
</script>

</html>