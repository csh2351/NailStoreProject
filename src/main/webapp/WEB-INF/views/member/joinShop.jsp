<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var='path' value="${pageContext.request.contextPath}" />
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="점주 회원 가입" name="pageTitle" />
</jsp:include>

<link rel="stylesheet" type="text/css" href="${path }/resources/css/joinShop.css">
<script>
	var checkTest = false;
	function fn_enroll_validate() {
		var check1_1 = $("input:checkbox[id='check1_1']").is(":checked");
		var check1_2 = $("input:checkbox[id='check1_2']").is(":checked");
		var check1_3 = $("input:checkbox[id='check1_3']").is(":checked");
		var check2 = $("input:checkbox[id='check2']").is(":checked");

		if (check1_1 == false || check1_2 == false) {
			alert("필수 이용약관을 체크 하세요.");
			$("input:checkbox[id='check1_1']").focus();
			checkTest = true;
			return false;
		} else {
			$('#nextbtn').val("Next");
			return true;
		}
	}
</script>
<script>
	$(document).ready(function() {
		var navListItems = $('div.setup-panel div a'), allWells = $('.setup-content'), allNextBtn = $('.nextBtn');
		allWells.hide();
		navListItems.click(function(e) {
			e.preventDefault();
			var $target = $($(this).attr('href')), $item = $(this);
			if (!$item.hasClass('disabled')) {
				navListItems.removeClass('btn-primary').addClass('btn-default');
				$item.addClass('btn-primary');
				allWells.hide();
				$target.show();
				$target.find('input:eq(0)').focus();
				}
			});
			allNextBtn.click(function() {
				var check1_1=$("input:checkbox[id='check1_1']").is(":checked"); 
	            var check1_2=$("input:checkbox[id='check1_2']").is(":checked"); 
	            var check1_3=$("input:checkbox[id='check1_3']").is(":checked"); 
	            var check2=$("input:checkbox[id='check2']").is(":checked");
	            if(check1_1==false||check1_2==false){
	            	alert("필수 이용약관을 체크 하세요.");
	                $("input:checkbox[id='check1_1']").focus();
	                checkTest=true;
	                return false;
	            }
				var curStep = $(this).closest(".setup-content"), curStepBtn = curStep.attr("id"), nextStepWizard = $('div.setup-panel div a[href="#'
													+ curStepBtn + '"]').parent().next().children("a"), curInputs = curStep.find("input[type='text'],input[type='url']"), isValid = true;
				$(".form-group").removeClass("has-error");
				for (var i = 0; i < curInputs.length; i++) {
					if (!curInputs[i].validity.valid) {
						isValid = false;
						$(curInputs[i]).closest(".form-group").addClass("has-error");
					}
				}
				if (isValid)nextStepWizard.removeAttr('disabled').trigger('click');
			});
			$('div.setup-panel div a.btn-primary').trigger('click');
		});
</script>
<script>
	//샵 이미지 추가
	/*이미지 추가 input  script*/
	$(document).on('click', '#close-preview1', function() {
		$('.image-preview').popover('hide');
		// Hover befor close the preview
		$('.image-preview').hover(function() {
			$('.image-preview').popover('show');
		}, function() {
			$('.image-preview').popover('hide');
		});
	});

	$(function() {
		// Create the close button
		var closebtn = $('<button/>', {
			type : "button",
			text : 'x',
			id : 'close-preview1',
			style : 'font-size: initial;',
		});
		closebtn.attr("class", "close pull-right");
		// Set the popover default content
		$('.image-preview').popover({
			trigger : 'manual',
			html : true,
			title : "<strong>Preview</strong>" + $(closebtn)[0].outerHTML,
			content : "There's no image",
			placement : 'bottom'
		});
		// Clear event
		$('.image-preview-clear').click(function() {
			$('.image-preview').attr("data-content", "").popover('hide');
			$('.image-preview-filename').val("");
			$('.image-preview-clear').hide();
			$('.image-preview-input input:file').val("");
			$(".image-preview-input-title").text("Browse");
		});
		// Create the preview image
		$(".image-preview-input input:file").change(function() {
			var img = $('<img/>', {
				id : 'dynamic',
				width : 250,
				height : 200
			});
			var file = this.files[0];
			var reader = new FileReader();
			// Set preview image into the popover data-content
			reader.onload = function(e) {
				$(".image-preview-input-title").text("Change");
				$(".image-preview-clear").show();
				$(".image-preview-filename").val(file.name);
				img.attr('src', e.target.result);
				$(".image-preview").attr("data-content", $(img)[0].outerHTML).popover("show");
			}
			reader.readAsDataURL(file);
		});
	});
</script>
<div class="container">
	<div class="row">
		<h1>
			회원가입<small>점주</small>
		</h1>
	</div>
	<hr>
	<div class="stepwizard col-md-offset-2">
		<div class="stepwizard-row setup-panel">
			<div class="stepwizard-step">
				<a href="#step-1" type="button" class="btn btn-primary btn-circle">1</a>
				<p>약관 동의</p>
			</div>
			<div class="stepwizard-step">
				<a href="#step-2" type="button" class="btn btn-default btn-circle" disabled="disabled"><span class="glyphicon glyphicon-pencil"></span></a>
				<p>회원 정보</p>
			</div>
			<div class="stepwizard-step">
				<a href="#step-3" type="button" class="btn btn-default btn-circle" disabled="disabled"><span class="glyphicon glyphicon-pencil"></span></a>
				<p>점포 정보</p>
			</div>
		</div>
	</div>
	<form role="form" action="${path}/member/memberEnrollEnd.do" method="post" class="form-horizontal" enctype="multipart/form-data">
		<div class="row setup-content" id="step-1">
			<div class="col-xs-12">
				<div class="col-md-12">
					<h3>이용약관</h3><br>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="inputAgree"></label>
						<div class="panel panel-default col-sm-6">
							<div class="panel-body">
								<div class="form-group">
									<label for=""><h4>이용약관 1</h4></label>
									<textarea class="form-control" rows="5" style="resize: none; cursor: text;" readonly>
전자상거래(인터넷사이버몰) 표준약관
제1조(목적) 이 약관은 OO 회사(전자상거래 사업자)가 운영하는 OO 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리․의무 및 책임사항을 규정함을 목적으로 합니다.
                    
※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」
                    
제2조(정의)
                    
	① “몰”이란 OO 회사가 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.
                    
	② “이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
                    
	③ ‘회원’이라 함은 “몰”에 회원등록을 한 자로서, 계속적으로 “몰”이 제공하는 서비스를 이용할 수 있는 자를 말합니다.
                    
	④ ‘비회원’이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.
                    
제3조 (약관 등의 명시와 설명 및 개정) 
                    
	① “몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호․모사전송번호․전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보관리책임자등을 이용자가 쉽게 알 수 있도록 00 사이버몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.
                    
	② “몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회․배송책임․환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.
                    
	③ “몰”은 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
                    
	④ “몰”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다.  이 경우 "몰“은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다. 
                    
	⑤ “몰”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 “몰”에 송신하여 “몰”의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.
                    
	⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계법령 또는 상관례에 따릅니다.
									</textarea>
									<br>
									<h4 class="text-right">위 약관에 동의 합니다.<input type="checkbox" name='check1' id="check1_1" onclick="check_del()"></h4>
									<hr>
									<label for=""><h4>이용약관 2</h4></label>
									<textarea class="form-control" rows="5" style="resize: none; cursor: text;" readonly>
제4조(서비스의 제공 및 변경) 
                    
	① “몰”은 다음과 같은 업무를 수행합니다.
                                              
		1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결
		2. 구매계약이 체결된 재화 또는 용역의 배송
 		3. 기타 “몰”이 정하는 업무
                                              
	② “몰”은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.
                                              
	③ “몰”이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.
                                              
	④ 전항의 경우 “몰”은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.
                                              
제5조(서비스의 중단) 
                                              
	① “몰”은 컴퓨터 등 정보통신설비의 보수점검․교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.
                                              
	② “몰”은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.
                                              
	③ 사업종목의 전환, 사업의 포기, 업체 간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 “몰”은 제8조에 정한 방법으로 이용자에게 통지하고 당초 “몰”에서 제시한 조건에 따라 소비자에게 보상합니다. 다만, “몰”이 보상기준 등을 고지하지 아니한 경우에는 이용자들의 마일리지 또는 적립금 등을 “몰”에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다.
                                              
제6조(회원가입) 
                                              
	① 이용자는 “몰”이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.
                                              
	② “몰”은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다.
                                              
		1. 가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 “몰”의 회원재가입 승낙을 얻은 경우에는 예외로 한다.
		2. 등록 내용에 허위, 기재누락, 오기가 있는 경우
		3. 기타 회원으로 등록하는 것이 “몰”의 기술상 현저히 지장이 있다고 판단되는 경우
                                              
	③ 회원가입계약의 성립 시기는 “몰”의 승낙이 회원에게 도달한 시점으로 합니다.
                                              
	④ 회원은 회원가입 시 등록한 사항에 변경이 있는 경우, 상당한 기간 이내에 “몰”에 대하여 회원정보 수정 등의 방법으로 그 변경사항을 알려야 합니다.
                                              
제7조(회원 탈퇴 및 자격 상실 등) 
                                              
	① 회원은 “몰”에 언제든지 탈퇴를 요청할 수 있으며 “몰”은 즉시 회원탈퇴를 처리합니다.
                                              
	② 회원이 다음 각 호의 사유에 해당하는 경우, “몰”은 회원자격을 제한 및 정지시킬 수 있습니다.
                                              
		1. 가입 신청 시에 허위 내용을 등록한 경우
		2. “몰”을 이용하여 구입한 재화 등의 대금, 기타 “몰”이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우
		3. 다른 사람의 “몰” 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우
		4. “몰”을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우
                                              
	③ “몰”이 회원 자격을 제한․정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 “몰”은 회원자격을 상실시킬 수 있습니다.
                                              
	④ “몰”이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.
                                              
제8조(회원에 대한 통지)
                                              
	① “몰”이 회원에 대한 통지를 하는 경우, 회원이 “몰”과 미리 약정하여 지정한 전자우편 주소로 할 수 있습니다.
                                              
	② “몰”은 불특정다수 회원에 대한 통지의 경우 1주일이상 “몰” 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다.     
									</textarea>
									<br>
									<h4 class="text-right">위 약관에 동의 합니다.<input type="checkbox" name='check1' id="check1_2" onclick="check_del()"></h4>
									<hr>
									<label for=""><h4>이용약관 3</h4></label>
									<textarea class="form-control" rows="5" style="resize: none; cursor: text;" readonly>
제9조(구매신청 및 개인정보 제공 동의 등) 
                    
	① “몰”이용자는 “몰”상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, “몰”은 이용자가 구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다. 
                                                    
		1. 재화 등의 검색 및 선택
		2. 받는 사람의 성명, 주소, 전화번호, 전자우편주소(또는 이동전화번호) 등의 입력
		3. 약관내용, 청약철회권이 제한되는 서비스, 배송료․설치비 등의 비용부담과 관련한 내용에 대한 확인
		4. 이 약관에 동의하고 위 3.호의 사항을 확인하거나 거부하는 표시(예, 마우스 클릭)
		5. 재화등의 구매신청 및 이에 관한 확인 또는 “몰”의 확인에 대한 동의
		6. 결제방법의 선택
                                              
	② “몰”이 제3자에게 구매자 개인정보를 제공할 필요가 있는 경우 1) 개인정보를 제공받는 자, 2)개인정보를 제공받는 자의 개인정보 이용목적, 3) 제공하는 개인정보의 항목, 4) 개인정보를 제공받는 자의 개인정보 보유 및 이용기간을 구매자에게 알리고 동의를 받아야 합니다. (동의를 받은 사항이 변경되는 경우에도 같습니다.)
                                              
                                              
	③ “몰”이 제3자에게 구매자의 개인정보를 취급할 수 있도록 업무를 위탁하는 경우에는 1) 개인정보 취급위탁을 받는 자, 2) 개인정보 취급위탁을 하는 업무의 내용을 구매자에게 알리고 동의를 받아야 합니다. (동의를 받은 사항이 변경되는 경우에도 같습니다.) 다만, 서비스제공에 관한 계약이행을 위해 필요하고 구매자의 편의증진과 관련된 경우에는 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」에서 정하고 있는 방법으로 개인정보 취급방침을 통해 알림으로써 고지절차와 동의절차를 거치지 않아도 됩니다.
                                              
  제10조 (계약의 성립)
                                              
	①  “몰”은 제9조와 같은 구매신청에 대하여 다음 각 호에 해당하면 승낙하지 않을 수 있습니다. 다만, 미성년자와 계약을 체결하는 경우에는 법정대리인의 동의를 얻지 못하면 미성년자 본인 또는 법정대리인이 계약을 취소할 수 있다는 내용을 고지하여야 합니다.
                                              
		1. 신청 내용에 허위, 기재누락, 오기가 있는 경우
		2. 미성년자가 담배, 주류 등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우
		3. 기타 구매신청에 승낙하는 것이 “몰” 기술상 현저히 지장이 있다고 판단하는 경우
                                              
	② “몰”의 승낙이 제12조제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.
                                              
	③ “몰”의 승낙의 의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능 여부, 구매신청의 정정 취소 등에 관한 정보 등을 포함하여야 합니다.
                                              
제11조(지급방법) “몰”에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각 호의 방법중 가용한 방법으로 할 수 있습니다. 단, “몰”은 이용자의 지급방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도  추가하여 징수할 수 없습니다.
                                              
 		1. 폰뱅킹, 인터넷뱅킹, 메일 뱅킹 등의 각종 계좌이체 
		2. 선불카드, 직불카드, 신용카드 등의 각종 카드 결제
		3. 온라인무통장입금
		4. 전자화폐에 의한 결제
		5. 수령 시 대금지급
		6. 마일리지 등 “몰”이 지급한 포인트에 의한 결제
		7. “몰”과 계약을 맺었거나 “몰”이 인정한 상품권에 의한 결제  
		8. 기타 전자적 지급 방법에 의한 대금 지급 등
                                              
제12조(수신확인통지․구매신청 변경 및 취소)
                                              
	① “몰”은 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.
                                              
	② 수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있고 “몰”은 배송 전에 이용자의 요청이 있는 경우에는 지체 없이 그 요청에 따라 처리하여야 합니다. 다만 이미 대금을 지불한 경우에는 제15조의 청약철회 등에 관한 규정에 따릅니다.
                                              
제13조(재화 등의 공급)
                                              
	① “몰”은 이용자와 재화 등의 공급시기에 관하여 별도의 약정이 없는 이상, 이용자가 청약을 한 날부터 7일 이내에 재화 등을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한 조치를 취합니다. 다만, “몰”이 이미 재화 등의 대금의 전부 또는 일부를 받은 경우에는 대금의 전부 또는 일부를 받은 날부터 3영업일 이내에 조치를 취합니다.  이때 “몰”은 이용자가 재화 등의 공급 절차 및 진행 사항을 확인할 수 있도록 적절한 조치를 합니다.
                                              
	② “몰”은 이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시합니다. 만약 “몰”이 약정 배송기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상하여야 합니다. 다만 “몰”이 고의․과실이 없음을 입증한 경우에는 그러하지 아니합니다.
                                              
제14조(환급) “몰”은 이용자가 구매신청한 재화 등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체 없이 그 사유를 이용자에게 통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을 받은 날부터 3영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다.
                                              
제15조(청약철회 등)
                                              
	① “몰”과 재화등의 구매에 관한 계약을 체결한 이용자는 「전자상거래 등에서의 소비자보호에 관한 법률」 제13조 제2항에 따른 계약내용에 관한 서면을 받은 날(그 서면을 받은 때보다 재화 등의 공급이 늦게 이루어진 경우에는 재화 등을 공급받거나 재화 등의 공급이 시작된 날을 말합니다)부터 7일 이내에는 청약의 철회를 할 수 있습니다. 다만, 청약철회에 관하여 「전자상거래 등에서의 소비자보호에 관한 법률」에 달리 정함이 있는 경우에는 동 법 규정에 따릅니다. 
                                              
	② 이용자는 재화 등을 배송 받은 경우 다음 각 호의 1에 해당하는 경우에는 반품 및 교환을 할 수 없습니다.
                                              
		1. 이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우(다만, 재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다)
		2. 이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우
		3. 시간의 경과에 의하여 재판매가 곤란할 정도로 재화등의 가치가 현저히 감소한 경우
		4. 같은 성능을 지닌 재화 등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우
                                              
	③ 제2항제2호 내지 제4호의 경우에 “몰”이 사전에 청약철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는 곳에 명기하거나 시용상품을 제공하는 등의 조치를 하지 않았다면 이용자의 청약철회 등이 제한되지 않습니다.
                                              
	④ 이용자는 제1항 및 제2항의 규정에 불구하고 재화 등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행된 때에는 당해 재화 등을 공급받은 날부터 3월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회 등을 할 수 있습니다.
                                              
제16조(청약철회 등의 효과)
                                              
	① “몰”은 이용자로부터 재화 등을 반환받은 경우 3영업일 이내에 이미 지급받은 재화 등의 대금을 환급합니다. 이 경우 “몰”이 이용자에게 재화등의 환급을 지연한때에는 그 지연기간에 대하여 「전자상거래 등에서의 소비자보호에 관한 법률 시행령」제21조의2에서 정하는 지연이자율을 곱하여 산정한 지연이자를 지급합니다.
                                              
	② “몰”은 위 대금을 환급함에 있어서 이용자가 신용카드 또는 전자화폐 등의 결제수단으로 재화 등의 대금을 지급한 때에는 지체 없이 당해 결제수단을 제공한 사업자로 하여금 재화 등의 대금의 청구를 정지 또는 취소하도록 요청합니다.
                                              
	③ 청약철회 등의 경우 공급받은 재화 등의 반환에 필요한 비용은 이용자가 부담합니다. “몰”은 이용자에게 청약철회 등을 이유로 위약금 또는 손해배상을 청구하지 않습니다. 다만 재화 등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행되어 청약철회 등을 하는 경우 재화 등의 반환에 필요한 비용은 “몰”이 부담합니다.
                                              
	④ 이용자가 재화 등을 제공받을 때 발송비를 부담한 경우에 “몰”은 청약철회 시 그 비용을  누가 부담하는지를 이용자가 알기 쉽도록 명확하게 표시합니다.
                                              
제17조(개인정보보호)
                                              
	① “몰”은 이용자의 개인정보 수집시 서비스제공을 위하여 필요한 범위에서 최소한의 개인정보를 수집합니다. 
                                              
	② “몰”은 회원가입시 구매계약이행에 필요한 정보를 미리 수집하지 않습니다. 다만, 관련 법령상 의무이행을 위하여 구매계약 이전에 본인확인이 필요한 경우로서 최소한의 특정 개인정보를 수집하는 경우에는 그러하지 아니합니다.
                                              
	③ “몰”은 이용자의 개인정보를 수집·이용하는 때에는 당해 이용자에게 그 목적을 고지하고 동의를 받습니다. 
                                              
	④ “몰”은 수집된 개인정보를 목적외의 용도로 이용할 수 없으며, 새로운 이용목적이 발생한 경우 또는 제3자에게 제공하는 경우에는 이용·제공단계에서 당해 이용자에게 그 목적을 고지하고 동의를 받습니다. 다만, 관련 법령에 달리 정함이 있는 경우에는 예외로 합니다.
                                              
	⑤ “몰”이 제2항과 제3항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보관리 책임자의 신원(소속, 성명 및 전화번호, 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공받은자, 제공목적 및 제공할 정보의 내용) 등 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」 제22조제2항이 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.
                                              
	⑥ 이용자는 언제든지 “몰”이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 “몰”은 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 “몰”은 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.
                                               
	⑦ “몰”은 개인정보 보호를 위하여 이용자의 개인정보를 취급하는 자를  최소한으로 제한하여야 하며 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 동의 없는 제3자 제공, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다.
                                              
	⑧ “몰” 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다.
                                              
	⑨ “몰”은 개인정보의 수집·이용·제공에 관한 동의 란을 미리 선택한 것으로 설정해두지 않습니다. 또한 개인정보의 수집·이용·제공에 관한 이용자의 동의거절시 제한되는 서비스를 구체적으로 명시하고, 필수수집항목이 아닌 개인정보의 수집·이용·제공에 관한 이용자의 동의 거절을 이유로 회원가입 등 서비스 제공을 제한하거나 거절하지 않습니다.                                
									</textarea>
									<br>
									<h4 class="text-right">위 약관에 동의 합니다.(선택)<input type="checkbox" name='check1' id="check1_3" onclick="check_del()"></h4>
									<hr>
									<h4 class="text-right">모든 약관에 동의 합니다.<input type="checkbox" id='check2' onclick="check_all()"></h4>
								</div>
							</div>
						</div>
					</div>
					<button class="btn btn-primary nextBtn btn-lg pull-right" type="button">다음</button>
				</div>
			</div>
		</div>
		<div class="row setup-content" id="step-2">
			<div class="col-xs-12">
				<div class="col-md-12">
					<h3>회원 정보 입력</h3>
					<br>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="memberId">아이디</label>
						<div class="col-sm-6">
							<input class="form-control" id="memberId" name="memberId" type="text" placeholder="아이디는 영문,숫자조합의 6~12자리의 조합(특수문자제외)" required>
							<p id="idCheck"></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="memberPw">비밀번호</label>
						<div class="col-sm-6">
							<input class="form-control" id="memberPw" name="memberPw" type="password" placeholder="공백없이  영문, 숫자, 특수문자를 조합한 8~15자리의 비밀번호" required onblur="chkPwd();">
							<p class="help-block">숫자, 특수문자 포함 8자 이상</p>
							<p id="pwCheck"></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="inputPasswordCheck">비밀번호확인</label>
						<div class="col-sm-6">
							<input class="form-control" id="memberPw2" name="memberPw2" type="password" placeholder="비밀번호 확인" required oninput="fn_pwCheck2();">
							<p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
							<p id="pwcheck2"></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="inputName">이름</label>
						<div class="col-sm-6">
							<input class="form-control" id="memberName" type="text" placeholder="이름" name="memberName">
							<input class="form-control" id="memberLevel" type="hidden" name="memberLevel" value='2' />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="inputName">휴대폰</label>
						<div class="col-sm-6">
							<input class="form-control" name="memberPhone" id="memberPhone" type="text" placeholder="010-1234-5678" maxlength="15">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="memberAddrress">주소</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="post" placeholder="우편번호" required>
						</div>
						<div class="col-sm-3">
							<input type="button" class="btn btn-warning" onclick="Postcode();" value="주소찾기">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="memberAddress"></label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="memberAddress" name="memberAddress" placeholder="도로명 주소" required>
								<input type="text" class="form-control" id="memberAddressDetail" placeholder="상세주소">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="inputEmail">이메일</label>
						<div class="col-sm-6">
							<input id="JHCheck" type="email" class="form-control" name="memberEmail" placeholder="abc@efg.com" required>
							<p id="emailCheckText"></p>
						</div>
						<div class="col-sm-3">
							<input type="button" class="btn btn-warning" id="emailCheck" name="emailCheck" onclick="emailRequest();" value="이메일 인증">
						</div>
					</div>
					<br>
					<button class="btn btn-primary nextBtn btn-lg pull-right" type="button">다음</button>
				</div>
			</div>
		</div>
		<div class="row setup-content" id="step-3">
			<div class="col-xs-12">
				<div class="col-md-12">
					<h3>Shop 정보 입력</h3>
					<br>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="shopName">상호명</label>
						<div class="col-sm-6">
							<input class="form-control" id="shopName" type="text" name="store_name" placeholder="상호명">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="shopNum">사업자등록번호</label>
						<div class="col-sm-6">
							<input class="form-control" id="shopNum" name="store_num" type="text" placeholder="사업자등록번호">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="shopPhone">샵전화번호</label>
						<div class="col-sm-6">
							<input class="form-control" id="shopPhone" name="store_phone" type="text" placeholder="샵전화번호">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="post">샵 주소</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="shopAddress" placeholder="우편번호" required>
						</div>
						<div class="col-sm-3">
							<input type="button" class="btn btn-warning" onclick="Postcode1()" value="주소찾기">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="shopAddress1"></label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="shopAddress1" name="shopAddress1" placeholder="도로명주소" required>
							<input type="text" class="form-control" id="memberAddressDetail1" name="shopAddressDetail1" placeholder="상세주소">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="inputimage">샵사진</label>
						<div class="col-sm-6">
							<div class="input-group image-preview">
								<input type="text" class="form-control image-preview-filename" name="upload_file" disabled="disabled">
								<span class="input-group-btn">
									<button type="button" class="btn btn-default image-preview-clear" style="display: none;">
										<span class="glyphicon glyphicon-remove"></span>Clear
									</button>
									<div class="btn btn-default image-preview-input">
										<span class="glyphicon glyphicon-folder-open"></span>
										<span class="image-preview-input-title">Browse</span>
										<input type="file" accept="image/png, image/jpeg, image/gif" name="input-file-preview" required/>
									</div>
								</span>
							</div>
						</div>
					</div>
					<br>
					<button class="btn btn-success btn-lg pull-right" type="submit">회원가입</button>
				</div>
			</div>
		</div>
	</form>
</div>
<script>
//주소찾기 스크립트
	function Postcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var fullAddr = ''; // 최종 주소 변수
	            var extraAddr = ''; // 조합형 주소 변수

	            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                fullAddr = data.roadAddress;

	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                fullAddr = data.jibunAddress;
	            }
	            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
	            if(data.userSelectedType === 'R') {
	                //법정동명이 있을 경우 추가한다.
	                if(data.bname !== ''){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있을 경우 추가한다.
	                if(data.buildingName !== '') {
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	            }
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('post').value = data.zonecode; //5자리 새우편번호 사용
	            document.getElementById('memberAddress').value = fullAddr;
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById('memberAddressDetail').focus();
	        }
	    }).open();
	}
</script>
<script>
	$("#JHCheck").blur(function() {
		var email=$("#JHCheck").val();
 		if(email.length!=0) {
 			if(email.match(/([@])/)) {
 				if($('#successEmail').css("display")=="none") {
 					$("#emailAuther").css("display","block");
 				} else {
 					$("#emailAuther").css("display","none");
 				}
 			}
 			else if(email.match(/([!,#,$,%,^,&,*,?,~,-])/)) {
 				alert("온전하지 못한 이메일입니다. ('@'를 제외한 특수문자가 존재합니다.)");
 				$("#JHCheck").val("");
 				$("#JHCheck").focus();
 				return false;
 			} else {
 				alert("온전하지 못한 이메일입니다. 다시 한 번 입력해주세요.");
 				$("#JHCheck").val("");
 				$("#JHCheck").focus();
 			}
 		}
 		return true;
 		$.ajax({
 			url:"${path}/member/JHcheckEmail.do",
 			data:{memberEmail:$('#memberEmail').val()},
 			success:function(data) {
 				if(data == 'true') {
 					alert("사용가능한 이메일입니다.");
 				} else {
 					alert("이메일이 중복되었습니다. 다른 이메일을 입력해주세요.");
 					$("#JHCheck").val("");
 					$("#JHCheck").focus();
 				}
 			}
 		})
 	});
 	function emailRequest() {
 		var nowemail = $('#JHCheck').val();
 		var url="${pageContext.request.contextPath }/member/emailEnd.do?memberEmail="+nowemail;
 		var title="emailAuther";
 		var status="left=500px, top=100px, width=600px, height=200px";
 		var popup=window.open(url,title,status);
 	}
 	function emailcheck() {
 		
 		if($('#successEmail').css("display") == 'none') {
 			alert("이메일을 인증해주세요.");
 			return false;
 		}
 		return true;
 	}
</script>
<script>
//주소찾기 스크립트(샵원장)
	function Postcode1() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var fullAddr = ''; // 최종 주소 변수
	            var extraAddr = ''; // 조합형 주소 변수
	            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                fullAddr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                fullAddr = data.jibunAddress;
	            }
	            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
	            if(data.userSelectedType === 'R'){
	                //법정동명이 있을 경우 추가한다.
	                if(data.bname !== ''){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있을 경우 추가한다.
	                if(data.buildingName !== ''){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	            }
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('shopAddress').value = data.zonecode; //5자리 새우편번호 사용
	            document.getElementById('shopAddress1').value = fullAddr;
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById('memberAddressDetail1').focus();
	        }
	    }).open();
	}
</script>
<script>
	/* 모두 선택/해제 펑션 */
	function check_all() {
		var check1 = document.getElementsByName('check1');
		var check2 = document.getElementById('check2');

		for (var i = 0; i < check1.length; i++) {
			if (check2.checked == true) {
				check1[i].checked = true;
			} else {
				check1[i].checked = false;
			}
		}
	}
	/*모두 선택이후 하나라도 선택해제시 모두선택 버튼 해제*/
	function check_del() {
		var check1 = document.getElementsByName('check1');
		var check2 = document.getElementById('check2');

		for (var i = 0; i < check1.length; i++) {
			if (check2.checked && !check1[i].checked) {
				check2.checked = false;
				break;
			}
		}
	}
	//submit할시 이용약관 확인 펑션
	function fn_enroll_validate() {
		var check1_1 = $("input:checkbox[id='check1_1']").is(":checked");
		var check1_2 = $("input:checkbox[id='check1_2']").is(":checked");
		var check1_3 = $("input:checkbox[id='check1_3']").is(":checked");
		var check2 = $("input:checkbox[id='check2']").is(":checked");

		if (check1_1 == false || check1_2 == false) {
			alert("필수 이용약관을 체크 하세요.");
			$("input:checkbox[id='check1_1']").focus();
			return false;
		}
		return true;
	}
	//아이디 중복검사
	$(function() {
		$('#memberId').blur(function() {
			$.ajax({
				url: "${path}/member/checkIdDuplicate.do",
	            type:"post",
	            data:{memberId:$('#memberId').val()},
	            success : function(data) {
	            	var id=$("#memberId").val();
	                var num = id.search(/[0-9]/g);
	                var eng = id.search(/[a-z]/ig);
	                var spe = id.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	                
	                if(id.length!=0&&data=='true') {
	                	if((id.search(/\s/) != -1)||(id.length < 6 || id.length > 12)||(num < 0 || eng < 0 || spe > 0)) {
	                		$("#idCheck").html("아이디는 영문,숫자조합의 6~12자리의 조합(특수문자제외)");
	                        $("#memberId").focus();
	                        $("#idCheck").css("color","red");
	                        $("#memberId").val("");
	                	} else {
	                		$("#idCheck").css("color","pink");
	                        $("#idCheck").html("해당 아이디는 사용이 가능합니다.");
	                    }
	                } else if(id.length!=0) {
	                	$("#idCheck").html("이미 등록된 아이디입니다.");
	                	$("#memberId").focus();
	                    $("#idCheck").css("color","red");
	                    $("#memberId").val("");
	                }
	            }
	         });
	      });
	   });
	//비밀번호 blur시 비밀번호 유효성 확인
	function chkPwd() {
		var pw = $("#memberPw").val();
	 	var num = pw.search(/[0-9]/g);
	 	var eng = pw.search(/[a-z]/ig);
	 	var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi); 
		if(pw.length!=0&&(pw.search(/\s/) != -1)) {
			$("#pwCheck").html("비밀번호는 공백없이 입력하세요.");
	        $("#pwCheck").css("color","red");
	        $("#memberPw").val("");
	        $("#memberPw").focus();
     	}else if(pw.length!=0&&(pw.length < 8 || pw.length > 15)) {
     		$("#pwCheck").html("비밀번호를 8자 이상 15자 이하로 입력하세요.");
	   		$("#pwCheck").css("color","red");
	    	$("#memberPw").val("");
	    	$("#memberPw").focus();
	 	}else if(pw.length!=0&&(num < 0 || eng < 0 || spe < 0) ) {
	 		$("#pwCheck").html("비밀번호는 영문, 숫자, 특수문자를 조합해야 합니다.");
	    	$("#pwCheck").css("color","red");
	    	$("#memberPw").val("");
	    	$("#memberPw").focus();
		}else if(pw.length!=0) {
			$("#pwCheck").html("올바른 형식의 비밀번호 입니다.");
	    	$("#pwCheck").css("color","pink");
	 	}
	}
	//비밀번호와 비밀번호 확인의 일치 여부 유효성
	$(function(){
	   $("#memberPw2").blur(function(){
	      var p1=$("#memberPw").val();
	      var p2=$("#memberPw2").val();
	   
	      if(p1.length!=0&&p2.length!=0&&p1!=p2){
	         $("#memberPw2").val("");
	         $("#memberPw2").focus();
	         alert("입력하신 비밀번호와 일치하지 않습니다.");
	      }
	   });
	});
	function fn_pwCheck2() {
		var p1=$("#memberPw").val();
	    var p2=$("#memberPw2").val();
	    if(p1==p2) {
	    	$("#pwcheck2").css("color","pink");
	        $('#pwcheck2').html('새비밀번호와 일치합니다.');
	    } else {
	    	$('#pwcheck2').html('');
	    }
	}	
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />