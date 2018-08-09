<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 해더부분 -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="NailStore" name="pageTitle" />
</jsp:include>


<c:set var="path" value="${pageContext.request.contextPath }" />
<!-- store css -->

<link href="${path }/resources/css/store.css" rel="stylesheet" />
<link href="${path }/resources/css/review.css" rel="stylesheet" />
<!-- store js -->
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDmfjiMcgfcCVI6QKs42Kk4AvHUVdOQtso"></script>
    <script src="http://malsup.github.com/jquery.form.js"></script> 


<script type="text/javascript">
// 외부 js 에서 쓰이는 변수 setting
 var latitude = ${store.store_latitude };
 var longitude = ${store.store_longitude };
 var path = ${pageContext.request.contextPath };
</script>
<script src="${path }/resources/js/store.js?ver=2"></script>
<div>
<div id="wrapper">

	<div id="left-side">

		<div id="first" class="active">

			<div class="row">

				<!-- 가게 이미지 시작 -->
				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-10 animatepop">
					<img src="${path }/resources/icons/love_blank.svg" alt="false" class="b_icon zindex"
						id="b_icon">
					
					<div class="hovereffect">
						<img class="img-responsive radius14"
							src="${path }/resources/images/nail_store/${store.store_re_img }" alt="출력 실팽">
						<div class="overlay">
							<h2>${store. store_name }</h2>
							<p>
								<a href="#">크게 보기</a>
							</p>
						</div>
					</div>
				</div>
				<!--가게 이미지 끝-->
				<div class="col-lg-8 col-md-8 col-sm-8 col-xs-10">
					<h3>${store. store_name }</h3>
					<p>장소 : ${store. store_address }</p>
					<p>Tel. ${store. store_phone }</p>
					<p>평일 10:00 - 21:00 토요일 11:00 - 21:00 일요일 11:00 - 20:00</p>
					<p>속눈썹 연장, 왁싱, 스킨/바디케어, 주차, 무선 인터넷, 애완동물 동반</p>
				</div>
			</div>
			<div class="row" style="margin-top: 20px;">
				<marquee>공지사항입니다~~~~~~~~~~~~</marquee>
			</div>
			<!-- tab 화면 시작-->
			<div class="row">
				<div class="tabbable-panel">
					<div class="tabbable-line">
						<ul class="nav nav-tabs ">
							<li class="active"><a href="#tab_default_2"
								data-toggle="tab"> 가격 </a></li>
							<li><a href="#tab_default_1" data-toggle="tab"> 시술정보 </a></li>
							<li><a id="review_tab" href="#tab_default_3" data-toggle="tab"> 리뷰 </a></li>
								<!-- <script type="text/javascript">
								$('#reviewList').on('click',function () {
									location.href="${path}/storeReview/storeReviewList.do?store_pk=${store.store_pk}";
								});
								</script> -->
					
						</ul>
						<div class="tab-content">
							<!-- tab1 시작 -->
							<div class="tab-pane" id="tab_default_1">
								<div class="carousel slide multi-item-carousel" id="theCarousel">
									<div class="carousel-inner" >
									<c:forEach var="nail" items="${nails }" varStatus="status" step='3'>
									<c:choose>
										<c:when test="${status.count eq 1}">									
										<div class="item active" >
										</c:when>
										<c:when test="${status.index %3 eq 0 }">									
										<div class="item">
										</c:when>
									</c:choose>	
										<c:forEach var='i' begin='${status.index }' end="${status.index +2 }">
										<a href="#NailModal${nails[i].nail_pk }" data-toggle="modal">
											<div class="col-lg-4 col-md-4 col-sm-4 col-xs-10 animatepop" style="margin-top: 10px;height:250px;">
												<div class="hovereffect">
												
													<img class="img-responsive radius14 smail-carousel"
														src="${path }/resources/images/nails/${nails[i].nail_re_img}" alt="">
													<div class="overlay">
														<h2>${nails[i].nail_name}</h2>
														<p>
															<a href="#NailModal${nails[i].nail_pk }" data-toggle="modal">더보기</a>
														</p>
													</div>
													
												</div>
											</div>
											</a>																				
											</c:forEach>
											<c:choose>
										<c:when test="${status.count eq 1 }">
										</div>
										</c:when>
										<c:when test="${status.index %3 eq 0 }">
										</div>		
										</c:when>	
										</c:choose>
										<!-- item end -->						
										</c:forEach>
									</div>
									<!--  casual inner end -->
									<c:forEach var ="nail" items="${nails }">
										<!-- Modal start -->
											<div class="modal fade" id="NailModal${nail.nail_pk }">
										<div class="modal-dialog">
											<div class="modal-content">

												<!-- Modal Header -->
												<div class="modal-header">
													<h4 class="modal-title">시술정보 상세</h4>
													<button type="button" class="close" data-dismiss="modal">&times;</button>
												</div>

												<!-- Modal body -->
												<div class="modal-body">
													<div class="wh100">
															<img class="img-responsive radius14"
															src="${path }/resources/images/nails/${nail.nail_re_img}" alt="네일 사진">
													</div>
													<p>네일 색상 : ${nail.nail_color }, 타입 : ${nail.nail_check==1?'네일':'페디' }, 종류	 : ${nail.nail_style }</p>
												</div>
												<!-- Modal footer -->
												<div class="modal-footer">
												</div>

											</div>
										</div>
									</div>
									<!-- Modal End -->
									</c:forEach>
									<a class="left carousel-control" href="#theCarousel"
										data-slide="prev"><i
										class="glyphicon glyphicon-chevron-left"></i></a> <a
										class="right carousel-control" href="#theCarousel"
										data-slide="next"><i
										class="glyphicon glyphicon-chevron-right"></i></a>
								</div>
							</div>
							<!-- tab1 끝 -->
							<div class="tab-pane active" id="tab_default_2">
							<div style="width: 70%;">
										<h3 style="margin-left: 30px;">젤네일</h3>
											<hr style="margin-left: 30px;">
										<c:forEach var="menu" items="${menus }" varStatus="status">									
										<p style="width: 100%;">
											<span>${menu.menu_name }</span><span style="float: right;">${menu.menu_price }원</span>
										</p>
										<p style="margin-left: 20px; color:grey;">${menu.menu_info }</p>
										</c:forEach>
										<br> <br>
									</div>
							</div>
							<div class="tab-pane" id="tab_default_3">



								<!-- 시작.. -->
	<c:forEach var="review" items="${reviews }" varStatus="status" >
	<!--<c:if test="${review.review_level==2 }"></c:if>-->
	<ul id='comment-main' class="media comment-box level1">
     <c:if test="${review.review_level==1}">
      <li>
        <div class="media-left">
          <img class="member_profile" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
        </div>
        <div class="media-body">
        <span><h5 class="media-heading">아이디       작성일</h5><span>
                  <div class="review_content">
                    <p>
                    <c:if test="${review.review_re_img != null}">
                    <img class="review-img"alt="" src="${path}/resources/images/review_img/${review.review_re_img}">                
                    </c:if>
                    <c:out value="${review.review_content}"></c:out>
                    </p>
                 <div class="reply-btn-positon">
                   <!-- 점주만-->
                    <button class='btn btn-light basic-btn btn-reply' type="button" value='${status.index }'>답글</button>
                 </div>
                  </div>
                  <div class="row">
                      <div class="col-sm-3" style="padding-top:10px;">

                        <!--for문으로 버튼 클릭안되게하기-->
                        <c:forEach begin="1" end="${review.review_star}">
                     <button type="button" class=" btn btn-xs btn-warning" class="view_star" >
                         <i class="fa fa-star" aria-hidden="true"></i>
                     </button>
                     </c:forEach>

                        <c:forEach begin="1" end="${5-review.review_star}">
                     <button type="button" class=" btn btn-xs btn-default" class="view_star" >
                         <i class="fa fa-star" aria-hidden="true"></i>
                     </button>
                      </c:forEach>
                     

                        <span class=""><c:out value="${review.review_star}"></c:out></span><small> / 5</small>
                      </div>
                  </div>
              </div>
              <br>
         	  <br>
            </li>
            </c:if>
     
             
              	
             
         
             	<ul class="media comment-box level2 comment-reply">
					<c:forEach var="review2" items="${reviews }" varStatus="status1" >
                <c:if test="${review2.review_level==2 && review2.review_ref==review.review_pk}">                     		
         		 <li>
                   <div class="media-left">
                           <img class="member_profile" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
                   </div>
                   <div class="media-body">
                       <h5 class="media-heading">아이디       작성일</h5>
                       <div class="review_content">
               		   <p>
                    <c:out value="${review2.review_content}"></c:out>
                    </p>
                      <div class="result-btn-positon">
                      <button class='btn btn-light basic-btn btn-update' type="button" onclick="">수정</button>
                      <button id="delete-button" class='btn btn-light basic-btn btn-delete' type="button" onclick="">삭제</button>
                      </div>
                       </div>
                    </div>          
         	  <br>
                 </li>
           
                 </c:if>
                 </c:forEach>
                 
              </ul>
                  </ul>
               </c:forEach>

               
					<jsp:useBean id="currTime" class="java.util.Date" />
                    <div id='' class="media comment-box insertComment">
         			  <form id="review_insert" action="${path}/storeReview/storeReviewInsert.do" name="review_insert" method="post" enctype="multipart/form-data">
						<input type="hidden" value="${memberLoggedIn.memberPk }" name="member_pk"/>
						<input type="hidden" value="${memberLoggedIn.memberId }" name="review_writer"/>
                		<input type="hidden" value="${store. store_pk  }" name="store_pk"/>
                		<input type="hidden" value="${currTime }" name="review_date"/>
                	    <input type="hidden" value="1" name="review_level"/>
                	
                		 <div class="media-left">
                         <img class="member_profile" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
                 		</div>
                		 <div class="media-body purple-border input_comment">
                     		<div class="media-heading row" style="margin-right: 0px;margin-left: 0px; font-size: 13pt;"><div class="col-xs-3">${memberLoggedIn.memberId}</div>
                     			<div class="col-xs-9" style="text-align: right;"><fmt:formatDate value="${currTime}" pattern="yyyy년MM월dd일HH시mm분"/>
								</div>
							</div>
                     		<div class="form-group" style="margin-bottom:0px;">
                        		 <textarea class="form-control" id="" rows="3" name="review_content" required=" 	"></textarea>
                     		</div>
                 <div class="row" style="margin-right:0px;">
                     <div class="col-sm-5">
                       <input type="hidden" id="selected_rating" name=review_star value="" required="required">
                    <button type="button" class="btnrating btn btn-default btn-xs" data-attr="1" id="rating-star-1">
                        <i class="fa fa-star" aria-hidden="true"></i>
                    </button>
                    <button type="button" class="btnrating btn btn-default btn-xs" data-attr="2" id="rating-star-2">
                        <i class="fa fa-star" aria-hidden="true"></i>
                    </button>
                    <button type="button" class="btnrating btn btn-default btn-xs" data-attr="3" id="rating-star-3">
                        <i class="fa fa-star" aria-hidden="true"></i>
                    </button>
                    <button type="button" class="btnrating btn btn-default btn-xs" data-attr="4" id="rating-star-4">
                        <i class="fa fa-star" aria-hidden="true"></i>
                    </button>
                    <button type="button" class="btnrating btn btn-default btn-xs" data-attr="5" id="rating-star-5">
                        <i class="fa fa-star" aria-hidden="true"></i>
                    </button>
                       <span class="selected-rating">0</span><small> / 5</small>
                     </div>

                      <div class="col-sm-2">
                      </div>

                          <div class="col-sm-5" style="text-align:right;padding-top:1px;left: 30px;">
                            <div class="input-group btn ">
                              <input type="text" class="form-control image-preview-filename " disabled="disabled" style="background:white;"> <!-- don't give a name === doesn't send on POST/GET -->
                 <span class="input-group-btn image-preview">
                     <!-- image-preview-clear button -->
                     <button type="button" class="btn btn-default image-preview-clear basic-btn" style="display:none;">
                         <span class="glyphicon glyphicon-remove"></span> Clear
                     </button>
                     <!-- image-preview-input -->
                     <div class="btn btn-default image-preview-input basic-btn">
                         <span class="glyphicon glyphicon-folder-open"></span>
                         <span class="image-preview-input-title ">Browse</span>
                         <input type="file" accept="image/png, image/jpeg, image/gif" name="review_ori_img"/> <!-- rename it -->
                     </div>
                 </span> </div>

                       <button id="result-button" class='btn btn-light basic-btn btn-center' type="button">완료</button>
                       <button id="reset-button" class='btn btn-light basic-btn btn-center' type="reset">취소</button>
                     </div>
                 </div>
                </div>
             </form>
           </div>
           
           <script type="text/javascript">
           $(function () {
        	   $("#result-button").click(function() {
        			          			   
        		        var form = $('#review_insert')[0];
              			var formData = new FormData(form);
              			formData=$("input[name=review_ori_img]")[0].files[0];
	      		        var review_value = { };
        		        $.each($("form[name=review_insert]").serializeArray(), function() {
        		        	review_value[this.name] = this.value;
        		        });
        		        review_value['review_ori_img']=$("input[name=review_ori_img]")[0].files[0];
        		 		console.log(review_value);
        		 		
        		 		var jsonData = JSON.stringify(review_value);
						console.log(jsonData);
						
						console.log(formData);

						
        		 		$.ajax({
        		            type : 'POST',
        		            url : '${path}/storeReview/storeReviewInsert.do',
        		            data : formData,
        		            enctype: 'multipart/form-data',
        		            async: false,
        		            cache: false,
        		            contentType: false,
        		            processData: false,
        		            dataType : 'json',
        		            
        		            error: function(xhr, status, error){
        		                alert(error);
        		            },
        		            
        		  
        		       })	
        		       $("form[name=review_insert]").submit();
        		    
        		       })		
        		    })
           </script>
							<br><br><br><br><br>
							</div>
							<!-- 3번째 탭 끝 -->
							
							 <script type="text/javascript">
             $(function () {
              $(".btnrating").on('click',(function(e) {

             var previous_value = $("#selected_rating").val();

             var selected_value = $(this).attr("data-attr");
             $("#selected_rating").val(selected_value);

             $(".selected-rating").empty();
             $(".selected-rating").html(selected_value);

             for (i = 1; i <= selected_value; ++i) {
             $("#rating-star-"+i).toggleClass('btn-warning');
             $("#rating-star-"+i).toggleClass('btn-default');
             }

             for (ix = 1; ix <= previous_value; ++ix) {
             $("#rating-star-"+ix).toggleClass('btn-warning');
             $("#rating-star-"+ix).toggleClass('btn-default');
             }
             $("input[name=review_star]").val(selected_value);
             }));

                   $("#reset-button").on('click',function() {

                     $(".selected-rating").empty();
                     $(".selected-rating").html(0);
                     for (i = 1; i <= 5; ++i) {
                     $("#rating-star-"+i).removeClass();
                     $("#rating-star-"+i).addClass('btnrating');
                     $("#rating-star-"+i).addClass('btn');
                     $("#rating-star-"+i).addClass('btn-default');
                     $("#rating-star-"+i).addClass('btn-xs');
                     }
                     $("#selected_rating").val('');
                     $("input[name=review_star]").val(0);
                   });

                    $('.view_star').attr('disabled', true);


                    
                  
   });





               </script>

               <script type="text/javascript">
               $(document).on('click', '#close-preview', function(){
            	   
  $('.image-preview').popover('hide');
  // Hover befor close the preview
  $('.image-preview').hover(
      function () {
         $('.image-preview').popover('show');
      },
       function () {
         $('.image-preview').popover('hide');
      }
  );
});

$(function() {
  // Create the close button
  var closebtn = $('<button/>', {
      type:"button",
      text: 'x',
      id: 'close-preview',
      style: 'font-size: initial;',
  });
  closebtn.attr("class","close pull-right");
  // Set the popover default content
  $('.image-preview').popover({
      trigger:'manual',
      html:true,
      title: "<strong>Preview</strong>"+$(closebtn)[0].outerHTML,
      content: "There's no image",
      placement:'auto left'
  });
  // Clear event
  $('.image-preview-clear').click(function(){
      $('.image-preview').attr("data-content","").popover('hide');
      $('.image-preview-filename').val("");
      $('.image-preview-clear').hide();
      $('.image-preview-input input:file').val("");
      $(".image-preview-input-title").text("Browse");
  });
  // Create the preview image
  $(".image-preview-input input:file").change(function (){
      var img = $('<img/>', {
          id: 'dynamic',
          width:250,
          height:200
      });
      var file = this.files[0];
      var reader = new FileReader();
      // Set preview image into the popover data-content
      reader.onload = function (e) {
          $(".image-preview-input-title").text("Change");
          $(".image-preview-clear").show();
          $(".image-preview-filename").val(file.name);
          img.attr('src', e.target.result);
          $(".image-preview").attr("data-content",$(img)[0].outerHTML).popover("show");
      }
      reader.readAsDataURL(file);
  });
});

$(".btn-reply").on('click',function() {
 //$(this).parents('div').children(".level2").toggle();
	 var index=$(this).attr('value');
	 var div=$(this).parents('ul').children('ul').toggle();
	
	 
		
		
		

})

$('#review_tab').one('click', function() {	
	$('.comment-reply').css('display','none');

	 var li = $('<li></li>'); 
	 var html='';
		html+="<div id='' class='media comment-box insertComment'>";
		html+="<form name='' action='' method='post'>";
		html+="<div class='media-left'>";
		html+="<img class='member_profile' src='${path}/resources/member_profile/{memberLogged.member_re_img}'>";
		html+="</div>";
		html+="<div class='media-body purple-border input_comment'>";
		html+=" <h5 class='media-heading'>아이디       작성일</h5>";
		html+="<div class='form-group' style='margin-bottom:0px;'>";
		html+="<textarea class='form-control' id='' rows='3' placeholder='댓글을 작성하세요'></textarea>";
		html+="</div>";
		html+="</div>";
		html+="<div class='row'>";
		html+="<div class='col-sm-4 col-sm-offset-8' style='text-align:right; padding-top:5px; left: 30px;'>";
		html+="<button class='btn btn-light basic-btn btn-center' type='submit'>완료</button> ";
		html+="<button class='btn btn-light basic-btn btn-center' type='reset'>취소</button>";
		html+="</div>";
		html+="</div>";
		html+="</div>";
		html+="</form>";
		html+="</div>";
		html+="</br>";
		li.html(html);
		
		$('.level2').append(li);
})


/*$('#review_tab').on('click', function() {	
	$('.comment-reply').css('display','none');
})*/
               </script>
						</div>
						<!-- tab content 끝 -->
					</div>
				</div>
				<!-- tab 화면 끝 -->


			</div>
			<!-- row 끝 -->
		</div>


		<div id="second">

			<div class="NailStoreMap animatepop" id="map">
			</div>
			<div class="addrText animatepop">
				<p>${store.store_address }</P>
			</div>

		</div>
		<div id="third">
			<div id='calendar'></div>
			<div id='calendarModal' class="modal fade pop-up-1" tabindex="-1"
				role="dialog" aria-labelledby="myLargeModalLabel-1"
				aria-hidden="true">
				<div class="modal-dialog" style="width: 400px;">
					<form class="" action="" method="post">

						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">×</button>
								<h4 class="modal-title" id="myLargeModalLabel-1">예약등록</h4>
							</div>
							<div class="modal-body">

								<div class="row">
									<div class="form-group">
										<table id="reservaiton-form" class="table">
											<thead>
												<tr>
													<td><label for="sel1">예약자:</label></td>
													<td colspan="6">
														<p id="reserName" for="sel1">홍성진</p> <!---->
													</td>
												</tr>
											</thead>
											<tbody>

												<tr>
													<td><label for="sel1">예약일시:</label></td>
													<td colspan="6">
														<p id="reserDate" for="sel1"></p> <!--<input type="type" id="reservation-timepicker" class="timepicker form-control input-sm" name="reservation-timepicker" style="width:130px;" />-->
														<input type="hidden" id="reservation-userName"
														name="reservation-userName" value="홍성진" /> <input
														type="hidden" id="reservation-id" name="reservation-id"
														value="10" />
													</td>
												</tr>

												<tr>
													<td><label for="sel1">시술선택:</label></td>
													<td style="width: 72"><select
														class="form-control input-sm" id="choice1" name='choice1'>
															<!--점주레벨이 아니면 disabled-->
															<option>손</option>
															<option>발</option>
													</select></td>
													<td colspan="5" style="width: 172px;"><select
														class="form-control input-sm" id="choice2" name='choice2'>
															<!--점주레벨이 아니면 disabled-->
															<option>메뉴1</option>
															<option>메뉴2</option>
															<option>메뉴3</option>
													</select></td>
												</tr>

												<tr>
													<td><label for="sel1">담당자:</label></td>
													<td><select class="form-control input-sm"
														id="choice-employee" name="choice-employee">
															<!--점주레벨이 아니면 disabled-->
															<option value="a">원장</option>
															<option value="b">디자이너1</option>
															<option value="c">디자이너2</option>
													</select></td>
												</tr>
										</table>
										</tbody>
										<hr>
										<div class="col-xs-2"></div>
										<div class="col-xs-4" style="text-align: right;">
											<button id="result-reservaiton" type="button"
												class="btn btn-success" name="button">확인</button>
										</div>
										<!--점주만 삭제-->
										<div class="col-xs-4" style="text-align: left;">
											<button id="remove-reservaiton" type="button"
												class="btn btn-danger" name="button">삭제</button>
										</div>
										<div class="col-xs-2"></div>

									</div>

								</div>
							</div>
							<!-- /.modal-content -->
					</form>
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal mixer image -->
		</div>
	</div>
	<div id="fourth">


		<div class="row">
			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-10 animatepop">
				<h3>Nail Shop ${store.store_name }</h3>
				<p>Nail Shop Tel ${store.store_phone }</p>
				<p>KakaoChat : ${store.store_kakao }</p>
				<p>instagram : ${store.store_instagram }</p>
			</div>
			<!--가게 Info 끝-->
			<div class="col-lg-7 col-md-7 col-sm-7 col-xs-10">
				<form class="" action="/insertQna.do" method="post" name="QnaInsert">
					<div class="form-group">
						<label> 문의사항 : <input type="text" class="form-control"
							placeholder="제목 입력" autofocus size="20" name ="qna_title"></label> <br>
						<textarea name="qna_content" cols="40" rows="6"></textarea>
						<button type="button" id="answer-submit" class="btn btn-default">전송!</button>
						<input type="hidden" value="${store.store_pk }" name="store_pk"/>
						<input type="hidden" value="${memberLoggedIn.memberPk }" name="member_pk"/>
						<input type="hidden" value="${memberLoggedIn.memberId }" name="qna_writer"/>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<div id="border">
	<div id="line" class="one"></div>
</div>
<div id="right-side">
	<div style="position: fixed;">
		<ul>
			<li class="shop active">
				<div class="icon active">
					<img src="${path }/resources/icons/shop.svg" alt="">
				</div> Shop
			</li>
			<li class="map">
				<div class="icon">
					<img src="${path }/resources/icons/map.svg" alt="">
				</div> Map
			</li>
			<li class="reserve">
				<div class="icon">
					<img src="${path }/resources/icons/calander.svg" alt="">
				</div> Reserve
			</li>
			<li class="qna">
				<div class="icon">
					<img src="${path }/resources/icons/customer.svg" alt="">
				</div> Contact
			</li>
		</ul>
	</div>
</div>
</div>
<!-- 푸터부분 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
