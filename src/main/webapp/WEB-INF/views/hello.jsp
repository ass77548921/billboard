<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
	<link href="webjars/bootstrap/5.1.1/css/bootstrap.css" rel="stylesheet" type="text/css">
	<link href="webjars/bootstrap/5.1.1/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="css/style.css?v=<?=time()?>" rel="stylesheet" type="text/css">
	
	</head>
	
	
	
	
<body >
	<div class="top">
		<div>
		  <nav class="navbar navbar-expand-lg navbar-light bg-light"> <a class="navbar-brand" href="#"><img id="homeImg" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT37retqUtRmKwJCpLjKm-RCCi3uP75IsLyo4jlPnKtQgacqUbbktssPeG7s-R-79S9vsM&usqp=CAU"></a>
		    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent1" aria-controls="navbarSupportedContent1" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
			  <div class="collapse navbar-collapse" id="navbarSupportedContent1">
			    <ul class="navbar-nav mr-auto">
			      <li class="nav-item active"> <a class="nav-link" href="#">公布欄 <span class="sr-only">(current)</span></a> </li>
			      
		        </ul>
		    </div>
		  </nav>
        </div>
	</div>
		
<div class="container">

			  <div class="row table-responsive">
				  <div class="container-fluid navdiv">
				    <ul id="clothingnav1" class="nav nav-tabs" role="tablist">
				      <li class="nav-item"> <a class="nav-link active" href="#home1" id="hometab1" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">瀏覽公布事項</a> </li>
				      
			        </ul>
				    <!-- Content Panel -->
				   
			    </div>
					<table class="table table-striped">
					
						<thead>
							<tr>
								<th scope="col" class="text-nowrap">選擇</th>
								<th scope="col" class="text-nowrap title">標題</th>
								<th scope="col" class="text-nowrap">發布日期</th>
								<th scope="col" class="text-nowrap">截止日期</th>
								<th scope="col" class="text-nowrap udtitle" >修改</th>
								<th scope="col" class="text-nowrap udtitle">刪除</th>
							</tr>
					  </thead>
					  <c:choose>
					  <c:when test="${aass.size()>0}">
					  <c:forEach items="${aass}" var="result" varStatus="s">
					  	<tbody>	
							<tr>
								<td><input type="checkbox" name="chkId" value="${result.id}"></td>
							  	<td scope="row" onclick="showlist(${result.id})" ><p>${result.title}</p></td>
								<td>${result.publishdate}</td>
								<td>${result.enddate}</td>
								<td class="btntd"><button onclick="reviseById(${result.id})" type="button" class="btn btn-info" title="修改"><i class="bi bi-pen"></i></button></td>
								<td class="btntd"><button type="button" class="btn btn-danger" onclick="deleteById(${result.id})"  ><i class="bi bi-trash-fill" title="刪除"></i></button></td>
							</tr>
						</tbody>
					</c:forEach>
					</c:when>
					<c:otherwise>
					<tbody>
							<tr>
							 
								<td scope="row" colspan="5" style="text-align: center;">No Data</td>
								
							</tr>
								
							
					</tbody>
					</c:otherwise></c:choose>
					</table>

  </div>

		<div class="d-flex align-items-center justify-content-around">
		  <button id="add" type="button" class="btn btn-primary">新增</button>

		  <button  id="enddel" type="button" class="btn btn-danger" style="display:none">刪除</button>

	  </div>
		<div class="modal fade" id="deleteWarning" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
			<div class="modal-content">
			  <div class="modal-header">
				<h5 class="modal-title">刪除警告</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			  </div>
			  <div class="modal-body">
				<p>確定要刪除嗎?</p>
			  </div>
			  <div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
				<button id="deleteSure" type="button" class="btn btn-primary">確定</button>
			  </div>
			  <input id="deleteid" value="" style="display:none">
			</div>
		  </div>
		</div>
		
		<div class="modal fade" id="deleteAll" tabindex="-1" aria-labelledby="deleteAll" aria-hidden="true">
		  <div class="modal-dialog">
			<div class="modal-content">
			  <div class="modal-header">
				<h5 class="modal-title">刪除警告</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			  </div>
			  <div class="modal-body">
				<p>確定要刪除已選擇項目嗎?</p>
			  </div>
			  <div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
				<button id="deleteAllSure" type="button" class="btn btn-primary">確定</button>
			  </div>
			 
			</div>
		  </div>
		</div>
		
		<div class="modal fade" id="detail" tabindex="-1" aria-labelledby="deleteByid" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
			  <div class="modal-header">
				<h5 class="modal-title">詳細內容</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			  </div>
			  <div class="modal-body">
			  	<div class="detailList">
			  		<span>標題:</span><input id="title" type="text" value="" readonly="readonly" disabled="disabled">
			  	</div>
				<div class="detailList">
			  		<span>發布日期:</span><input id="startdate" type="text" value="" readonly="readonly" disabled="disabled">
			  	</div>
			  	<div class="detailList">
			  		<span>截止日期:</span><input id="enddate" type="text" value="" readonly="readonly" disabled="disabled">
			  	</div>
			  	<div class="detailList">
			  		<span>發布者:</span><input id="publisher" type="text" value="" readonly="readonly" disabled="disabled">
			  	</div>
			  	<div class="detailList">
			  		<span>公布內容:</span>
			  		<textarea id=contexttext rows="4" cols="50" readonly="readonly" disabled="disabled">
					
					</textarea>
			  	</div>
			  </div>
			  <div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">關閉</button>
				
			  </div>
			</div>
		  </div>
		</div>

</div>		

<script>

	$('input[name=chkId]').on('click',function(){
		if($('input[name=chkId]:checked').length<=0){
			$('#enddel').css("display", "none");;
		}else{
			$('#enddel').css("display", "block")
		}
		
	})
	$('#enddel').on("click",function(){
		$('#deleteAll').modal('show')	
	})
	
	$('#deleteAllSure').on("click",function(){
		var data=Array()
		$("input[name=chkId]:checked").each(function(){
			data.push($(this).val());
		});
		
		$.ajax({
			type: 'Delete',
			  url: './deleteSelect',
			  data: JSON.stringify({
                "id":data
                }),
			  contentType:'application/json',
			  success: function(data){
				  location.reload();
			  }
			});
		
	})
	
	

	$('#add').on("click",function(){
		location.href='./addData'
	
	})
	

	function reviseById(e){
		location.href='./reviseData?id='+e;
	}

	function deleteById(e){
		$('#deleteid').val(e);
		$('#deleteWarning').modal('show')
		
	}
	
	$('#deleteSure').on("click",function(){
		
		$.ajax({
			type: 'Delete',
			  url: './deleteById',
			  data: JSON.stringify({
                "id":$('#deleteid').val()
                }),
			  contentType:'application/json',
			  success: function(data){
				  location.reload();
			  }
			});
		
		
		
		
		
	})
	
	
	
	function rejectAll() {
		var checkBoxs = $('input[name=chkId]:checked');
		if (checkBoxs.length == 0) {
			showAlert("請先選取資料!");
		} else {
			var identifier = "";
			$('input[name=chkId]:checked').each(function() {
				identifier += (this.value);
				identifier += ",<br/>"
			});
			$('#rejectId').html(identifier);
			$('#dialogReject').dialog("open");
			$(".mask").show();	
		};
	}

	function showlist(e){
		
		$.ajax({
			  type: 'POST',
			  url: './getDetail',
			  data: JSON.stringify({
                  "id":e
                  }),
			  contentType:'application/json',
			  success: function(data){
				  $('#title').val(data.title);
					$('#startdate').val(dataFormat(data.publishdate));
					$('#enddate').val(dataFormat(data.enddate));
					$('#publisher').val(data.publisher);
					$('#contexttext').val(data.context);
					$('#detail').modal('show');
			  }
			});
		
		
		
	}
	function dataFormat(d){
		let date = new Date(d)
		let year = date.getFullYear()
		let month = date.getMonth()+1
		if(month<10){
			month='0'+month
		 }
		let day = date.getDate()
		if(day<10){
			day='0'+day
		 }
		let hour = date.getHours()
		 if(hour<10){
			 hour='0'+hour
		 }
		 let min = date.getMinutes()
		 if(min<10){
			 min='0'+min
		 }
		let sec = date.getSeconds()
		if(sec<10){
			 sec='0'+sec
		 }
		return year+"-"+month+"-"+day+" "+hour+":"+min+":"+sec
		
	}
	
	

</script>
</body>

</html>