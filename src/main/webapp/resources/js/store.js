
// 구글맵 세팅
//js 파일은 읽은 뒤에 바인딩 되기 때문에 onLoad로 설정해주어야 바인딩이 제대로 된
$(function() {
	var mapCanvas = document.getElementById("map");
	var mapOptions = {
		center : new google.maps.LatLng(latitude, longitude),
		zoom : 14
	};
	var map = new google.maps.Map(mapCanvas, mapOptions);

	
$(window).resize(function() {
	if ($(window).width() < 768) {
		$(".shop").addClass("active");
		$(".map").removeClass("active");
		$(".reserve").removeClass("active");
		$(".qna").removeClass("active");
		$("#line").addClass("one");
		$("#line").removeClass("two");
		$("#line").removeClass("three");
		$("#line").removeClass("four");
	}
});
// 메뉴 이동
$(".shop").click(function() {
	$(".shop").addClass("active");
	$(".map").removeClass("active");
	$(".reserve").removeClass("active");
	$(".qna").removeClass("active");
	$("#line").addClass("one");
	$("#line").removeClass("two");
	$("#line").removeClass("three");
	$("#line").removeClass("four");
	$("#first").addClass("active");
	$("#second").removeClass("active");
	$("#third").removeClass("active");
	$("#fourth").removeClass("active");
});
$(".map").click(function() {
	$(".map").addClass("active");
	$(".shop").removeClass("active");
	$(".reserve").removeClass("active");
	$(".qna").removeClass("active");
	$("#line").addClass("two");
	$("#line").removeClass("one");
	$("#line").removeClass("three");
	$("#line").removeClass("four");
	$("#first").removeClass("active");
	$("#second").addClass("active");
	$("#third").removeClass("active");
	$("#fourth").removeClass("active");
	
});

$(".reserve").click(function() {
	$(".reserve").addClass("active");
	$(".map").removeClass("active");
	$(".shop").removeClass("active");
	$(".qna").removeClass("active");
	$("#line").addClass("three");
	$("#line").removeClass("two");
	$("#line").removeClass("one");
	$("#line").removeClass("four");
	$("#first").removeClass("active");
	$("#second").removeClass("active");
	$("#third").addClass("active");
	$("#fourth").removeClass("active");
});

$(".qna").click(function() {
	$(".qna").addClass("active");
	$(".map").removeClass("active");
	$(".reserve").removeClass("active");
	$(".shop").removeClass("active");
	$("#line").addClass("four");
	$("#line").removeClass("two");
	$("#line").removeClass("three");
	$("#line").removeClass("one");
	$("#first").removeClass("active");
	$("#second").removeClass("active");
	$("#third").removeClass("active");
	$("#fourth").addClass("active");
});
//메뉴이동 끝

//북마크 기능
$("#b_icon").click(function() {
	if ($('#b_icon').attr("alt")=='false') 
	{	$('#b_icon').attr("alt","true");
		$('#b_icon').attr("src","/spring/resources/icons/love_filled.svg");
	} else {
		$('#b_icon').attr("alt","false");
		$('#b_icon').attr("src","/spring/resources/icons/love_blank.svg");
	}
});
//작은케러셀
// Instantiate the Bootstrap carousel
$('.multi-item-carousel').carousel({
	interval : false
});

// for every slide in carousel, copy the next slide's item in the slide.
// Do the same for the next, next item.
$('.multi-item-carousel .item').each(
		function() {
			var next = $(this).next();
			if (!next.length) {
				next = $(this).siblings(':first');
			}
			next.children(':first-child').clone().appendTo($(this));

			if (next.next().length > 0) {
				next.next().children(':first-child').clone().appendTo($(this));
			} else {
				$(this).siblings(':first').children(':first-child').clone()
						.appendTo($(this));
			}
		});
//문의사항 전송
$('#answer-submit').click(
		function(){

			var queryString = $("form[name=QnaInsert]").serialize();
			console.log(queryString);
			$.ajax({
				type :'post',
				url: path + '/insertQna.do',
				data: queryString,
				dataType : 'json',
				success : function(json){
					alert(json)
				},
				error : function(xhr, status, error){
					alert(error);
				}
			})
			
		});

});