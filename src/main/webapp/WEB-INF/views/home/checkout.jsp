<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="context" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Male_Fashion Template">
    <meta name="keywords" content="Male_Fashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Male-Fashion | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
    rel="stylesheet">
    
    <!-- Css Styles -->
    <link rel="stylesheet" href="${context}/resources/theme/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${context}/resources/theme/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${context}/resources/theme/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${context}/resources/theme/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="${context}/resources/theme/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${context}/resources/theme/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${context}/resources/theme/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${context}/resources/theme/css/style.css" type="text/css">
    <link rel="stylesheet" href="${context}/resources/custom/css/custom.css" type="text/css">
    <link rel="stylesheet" href="${context}/resources/custom/css/table.css" type="text/css">
    <link rel="stylesheet" href="${context}/resources/custom/css/ionicons.min.css">
	<link rel="stylesheet" href="${context}/resources/custom/css/style.css">
	<link rel="stylesheet" href="${context}/resources/custom/css/modal2.css">
	
	<!-- ???????????? -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	
	<!-- ?????? ?????? -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="${context}/resources/theme/js/send-notice.js"></script>
    
 	<style>
 	.pt::after{
 	content: none;
 	}
 	</style>
	
	<script type="text/javascript">
	
	$(document).ready(function(){
		alterdeliveryselect();
		selectCheckoutInfo();
		selectUserInfo();
		selectTotal();
		selectContent();
		clickCouponEvent();
		selectPoint();
		clickTarEvent();
		savedeliveraddress();
	});
	
	function savedeliveraddress() {
		$('.savedeliveradd').click(function(){
			var address = $('#address_input_1').val() + " " + $('#address_input_2').val() + " " + $('#address_input_3').val();
			console.log(address)
			$.ajax({
				method : 'GET',
				url : '${pageContext.request.contextPath}/checkout/savedeliveradd/'+ address
			});
		});
	}
	
	function clickTarEvent() {
		$('.selecttar').click(function(){
			console.log($(this).attr('myval'));
			document.getElementById('storeNo').value = $(this).attr('myval');
			$.ajax({
				method : 'GET',
				url : '${pageContext.request.contextPath}/checkout/depttarget/'+ $(this).attr('myval')
			}).done(function( data ) { 
				//???????? ?????? ????????????
				displayTarget(data);
			});
		});
	}
	
	function displayTarget(data) {
		var mytable ='';
	    mytable += '<div class="card text-center"><div class="card-body" ><p class="card-text">'+ data.name +'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+ data.address+'</p></div></div>';
		$('#displayTarget').html(mytable);
	}
	
	function selectPoint() {
		$.ajax({
			method : 'GET',
			url : '${pageContext.request.contextPath}/checkout/selectpoint'
		}).done(function( data ) { 
			displayPoint(data);
		});
		
	}
	
	function displayPoint(data) {
		var mytable ='';
		 mytable += '<tr><td class="pt">'+data.amount+'</td> <td class="pt">';
	     mytable += '<div class="input-group"><input type="text" id = "usepoint"  class="usepoint form-control input-number"></div></td><td class="pt">';
	     mytable += '<button class="pointbtn btn btn-outline-dark" style="border-radius: 20px" data-toggle="modal" data-target="#applypoint">????????? ??????</button></td><td class="pt"></td></tr>';
		$('#pointcontent').html(mytable);
		
		clickPointEvent()
	}
	
	function clickPointEvent() {
		$('.pointbtn').click(function(){
			$.ajax({
				method : 'GET',
				url : '${pageContext.request.contextPath}/checkout/applypoint/'+ $("#usepoint").val()
			}).done(function( data ) { 
				displayTotalList(data);
				payforButtonEvent(data);
				payforButtonKaKaoEvent(data);
				payforButtonPaykoEvent(data);
				selectDisablePoint();
			});
		});
	}
	
	function selectDisablePoint() {
		$.ajax({
			method : 'GET',
			url : '${pageContext.request.contextPath}/checkout/selectpoint'
		}).done(function( data ) { 
			displayPointDisable(data);
		});
		
	}
	
	function displayPointDisable(data) {
		var mytable ='';
		mytable += '<tr class="alert" role="alert"><td>'+data.amount+'</td> <td class="quantity">';
	    mytable += '<div class="input-group">&nbsp;&nbsp;&nbsp;&nbsp;<img src="${context}/resources/custom/img/checkicon.png" style="height: 30px; width: 30px;" class="img-fluid"></div></td><td>';
	    mytable += '????????? ?????? ??????</td><td></td></tr>';
		$('#pointcontent').html(mytable);
	}
	
	function clickCouponEvent() {
		$('#couponselectbtn').click(function(){
			//console.log($(".couponselect option:selected").val());
			//?????? ?????? ??????
			$.ajax({
				method : 'GET',
				url : '${pageContext.request.contextPath}/checkout/coupondisplay/' + $(".couponselect option:selected").val()
			}).done(function( data ) { 
				displayCoupon(data);
				selectdcproduct(data);
				console.log(data);
			});
		});
	}
	
	function displayCoupon(data) {
		var mytable ='';
	    mytable += '<div class="col-md-4 border-right"><div class="d-flex flex-column align-items-center"><img src="https://subscribe.s3.ap-northeast-2.amazonaws.com/brand/' + data.brandengname + '.jpg" style="width: 60px; height: 60px"><br><span class="d-block" style="font-size: 13px">' + data.brandname + '</span><span class="text-black-50" style="font-size: 11px">' + data.brandengname + '</span></div></div>';
	    mytable += '<div class="col-md-8"><div>';
	    mytable += '<div class="d-flex flex-row justify-content-end off"><h1 style="color: #B1B1B1; font-size: 50px">' + data.typetemp + '</h1><span style="color: #B1B1B1;">OFF</span></div>';
	    mytable += '<div class="d-flex flex-row justify-content-between off px-3 p-2" style="color: #B1B1B1; font-size: 13px">~ ' + data.duetimetemp + '</div>';
	    mytable += '</div> </div>';
		$('#displaycoupon').html(mytable);
	}
	
	function selectdcproduct(dcproduct) {
			$.ajax({
				method : 'GET',
				url : '${pageContext.request.contextPath}/checkout/selectdcproduct/' + dcproduct.no
			}).done(function( data ) { 
				displayDCproduct(data);
			});
	}
	
	function displayDCproduct(data) {
		var mytable ='';
	    mytable += '<br><br><div class="card text-center"><div class="card-body" ><p class="card-text">'+ data.name +'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+ data.productPrice.toLocaleString() +'???&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button id="applydcbtn" myval = "'+ data.productNo +'" couval = "'+data.couponNo+'" class="btn btn-outline-dark" style="border-radius: 20px" data-toggle="modal" data-target="#applycoupon">?????? ??????</button></p></div></div>';
		$('#displaydcproduct').html(mytable);
		applyDiscount();
	}
	
	function applyDiscount() {
		$('#applydcbtn').click(function(){
			$.ajax({
				method : 'GET',
				url : '${pageContext.request.contextPath}/checkout/applyDiscount/' + $(this).attr('myval') + '/' + $(this).attr('couval')
			}).done(function() { 
				displayDCproductDone();
				selectTotal();
			});
		});
	}
	
	function displayDCproductDone() {
		var mytable ='';
	    mytable += '<br><br><div class="card text-center" style="background-color: #F2F2F2"><div class="card-body" ><p class="card-text"> <img src="${context}/resources/custom/img/checkicon.png" style="height: 30px; width: 30px;" class="img-fluid"></p></div></div>';
		$('#displaydcproduct').html(mytable);
	}
	
	function selectContent() {
		$.ajax({
			method : 'GET',
			url : '${pageContext.request.contextPath}/cart/cartinfo', 
		}).done(function( data ) {
			window.sendlist = data;
		 	displayContentList(data);
		});
	}
	
	function displayContentList(data) {
		var mytable = "";
	  	$.each( data, function( key, val ) {
	    	mytable += '<tr><td class="product__cart__item">';
	    	mytable += '<div class="product__cart__item__pic"><img src="https://subscribe.s3.ap-northeast-2.amazonaws.com/product/'+ val['brandengname'] +'/'+ val['categoryproductNo'] +'/'+ val['thumbnail'] +'.jpg" style="width: 150px; height: 150px"><div>';
	    	mytable += '<div class="product__cart__item__text"><h6>' + val['name'] + '</h6><p> ????????? : ' + val['productsize'] + '</p></div></td>';
	    	mytable += '<td class="quantity__item"><div class="quantity"><div class="pro-qty-2">';
	    	mytable += '<input type="text" value="' + val['qty'] + '">';
	    	mytable += '<td class="cart__price">' + val['memberPrice'].toLocaleString() + '???</td>';
			});
	 
			$('#contentdisplay').html(mytable);
			selectTotal();
	}
	
	function selectTotal() {
		$.ajax({
			method : 'GET',
			url : '${pageContext.request.contextPath}/checkout/totalinfo', 
		}).done(function( data ) {
			displayTotalList(data);
		});
	}
	
	function selectUserInfo(){
		$.ajax({
			method : 'GET',
			url : '${pageContext.request.contextPath}/checkout/userInfo', 
		}).done(function( data ) {
		 	displayUserList(data);
		});
	}
	
	function selectCheckoutInfo(){
		$.ajax({
			method : 'GET',
			url : '${pageContext.request.contextPath}/checkout/checkoutInfo', 
		}).done(function( data ) {
		 	displayCheckList(data);
		});
	}
	
	function displayTotalList(data) {
	    var dcprice = data.memberPrice - data.productPrice;
		var mytable = "";
	  	mytable += '<li>?????? <span>' + data.memberPrice.toLocaleString() + '???</span></li>';
	  	mytable += '<li>?????? ?????? <span> -' + dcprice.toLocaleString() + '???</span></li>';
	  	mytable += '<li>?????? ?????? <span>' + data.productPrice.toLocaleString() + '???</span></li>';
	 
		$('#displayTotal').html(mytable);
	}
	
	function displayUserList(data) {
		var mytable = "";
	  	$.each( data, function( key, val ) {
	  		mytable += '<div class="col-lg-3"><div class="checkout__input"><p>??????<span>*</span></p>';
	  		mytable += '<input type="text" value="' + val['name'] + '" disabled="disabled"></div></div>';
	  		mytable += '<div class="col-lg-4"><div class="checkout__input"><p>?????????<span>*</span></p>';
	  		mytable += '<input type="email" value="' + val['email'] + '" disabled="disabled"></div></div>';
	  		mytable += '<div class="col-lg-5"><div class="checkout__input"><p>????????? ??????<span>*</span></p>';
	  		mytable += '<input type="text"  value="' + val['phone'] + '" disabled="disabled"></div></div>';
			});
	 
			$('.displayUserInfo').html(mytable);
	}
	
	function displayCheckList(data) {
		var mytable = "";
	  	$.each( data, function( key, val ) {
	  		mytable += '<li>' + val['name'] + '&nbsp;(' + val['qty'] + ')<span>' + val['memberPrice'].toLocaleString() + ' ???</span></li>';
			});
	 
			$('#displayCheckout').html(mytable);
	}
	
	function alterdeliveryselect(){
		$('.selectdelivery').hide();
		$('.selectdirect').hide();
		$('.deliverybutton').click(function(){
			$.ajax({
				method : 'GET',
				url : '${pageContext.request.contextPath}/checkout/selectdeliver', 
			});
			window.direct = false;
			$('.selectdirect').hide();
		    $('.selectdelivery').show();
		  });
	    $('.directbutton').click(function(){
	    	$.ajax({
				method : 'GET',
				url : '${pageContext.request.contextPath}/checkout/selectdirect', 
			});
	    	window.direct = true;
			$('.selectdelivery').hide();
		    $('.selectdirect').show();
		});
	    $('#savedel').click(function(){
			$('.selectdelivery').hide();
		});
	    $('#savedir').click(function(){
			$('.selectdirect').hide();
		});
	}
	
	/* ?????? ?????? ?????? */
	function payforButtonEvent(data){
		var IMP = window.IMP; 
        IMP.init('imp77559548');
		$("#check_module").click(function () { 
			
	        IMP.request_pay({
	            pg: 'inicis', //inicis
	            pay_method: 'card',
	            merchant_uid: 'merchant_' + new Date().getTime(),
	            name: '?????????: ?????? ??????',
	            amount: 100,
	            m_redirect_url: 'https://www.yourdomain.com/payments/complete'
	         
	        }, function (rsp) {
	            console.log(rsp);
	            if (rsp.success) {
	            	location.href="/subscribe/checkoutcomplete";
	                var msg = '????????? ?????????????????????.';
	                //msg += '??????ID : ' + rsp.imp_uid;
	                //msg += '?????? ??????ID : ' + rsp.merchant_uid;
	                //msg += '?????? ?????? : ' + rsp.paid_amount;
	                //msg += '?????? ???????????? : ' + rsp.apply_num;
	            	if (window.direct == true) sendToAdminPickup();
	            } else {
	                var msg = '????????? ?????????????????????.';
	            }
	        });
	    });
	}
	
	function payforButtonKaKaoEvent(data){
		var IMP = window.IMP; 
        IMP.init('imp77559548');
		$("#kakao_module").click(function () { 
			IMP.request_pay({
			    pg : 'kakaopay',
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '?????????:???????????????',
			    amount : 100
			}, function(rsp) {
			    if ( rsp.success ) {
			    	location.href="/subscribe/checkoutcomplete";
	                var msg = '????????? ?????????????????????.';
	                //msg += '??????ID : ' + rsp.imp_uid;
	                //msg += '?????? ??????ID : ' + rsp.merchant_uid;
	                //msg += '?????? ?????? : ' + rsp.paid_amount;
	                //msg += '?????? ???????????? : ' + rsp.apply_num;
	            	if (window.direct == true) sendToAdminPickup()
			    } else {
			    	location.href="/subscribe/checkoutcomplete";
			        var msg = '????????? ?????????????????????.';
			        msg += '???????????? : ' + rsp.error_msg;
			        
			    }
			});
		});
	}
	
	function payforButtonPaykoEvent(data){
		var IMP = window.IMP; 
        IMP.init('imp77559548');
		$("#payko_module").click(function () { 
			IMP.request_pay({
			    pg : 'payco.AUTOPAY',
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '?????????:???????????????',
			    amount : data.productPrice
			}, function(rsp) {
			    if ( rsp.success ) {
			    	jQuery.ajax({
			    		url: "/payments/complete", //cross-domain error??? ???????????? ????????? ??????????????????
			    		type: 'POST',
			    		dataType: 'json',
			    		data: {
				    		imp_uid : rsp.imp_uid
				    		//?????? ????????? ???????????? ????????? ?????? ??????
			    		}
			    	}).done(function(data) {
			    		//[2] ???????????? REST API??? ?????????????????? ??? ?????????????????? ???????????? ??????
			    		if ( everythings_fine ) {
			    			location.href="/subscribe/checkoutcomplete";
			    			var msg = '????????? ?????????????????????.';
			    		} else {
			    			//[3] ?????? ????????? ????????? ?????? ???????????????.
			    			//[4] ????????? ????????? ????????? ????????? ?????? ????????? ?????????????????????????????????.
			    		}
			    	});
			    } else {
			        var msg = '????????? ?????????????????????.';
			        msg += '???????????? : ' + rsp.error_msg;
			        
			    }
			});
			
		});
	}
	
	/* ?????? api ?????? */
	function execution_address(){
		 new daum.Postcode({
		        oncomplete: function(data) {
		        	// ??? ????????? ?????? ????????? ?????? ????????? ????????????.
	                // ???????????? ????????? ?????? ?????? ????????? ??????('')?????? ????????????, ?????? ???????????? ?????? ??????.
	                var addr = ''; // ?????? ??????
	                var extraAddr = ''; // ???????????? ??????
	 
	                //???????????? ????????? ?????? ????????? ?????? ?????? ?????? ?????? ????????????.
	                if (data.userSelectedType === 'R') { // ???????????? ????????? ????????? ???????????? ??????
	                    addr = data.roadAddress;
	                } else { // ???????????? ?????? ????????? ???????????? ??????(J)
	                    addr = data.jibunAddress;
	                }
	 
	                // ???????????? ????????? ????????? ????????? ???????????? ??????????????? ????????????.
	                if(data.userSelectedType === 'R'){
	                    // ??????????????? ?????? ?????? ????????????. (???????????? ??????)
	                    // ???????????? ?????? ????????? ????????? "???/???/???"??? ?????????.
	                    if(data.bname !== '' && /[???|???|???]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // ???????????? ??????, ??????????????? ?????? ????????????.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // ????????? ??????????????? ?????? ??????, ???????????? ????????? ?????? ???????????? ?????????.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
		                // ???????????? ???????????? ???????????? ????????? ?????????
		                    addr += extraAddr;
	                
	                } else {
	                	addr += ' ';
	                }
	 
	                // ??????????????? ?????? ????????? ?????? ????????? ?????????.
	                $("#address_input_1").val(data.zonecode);
		            $("#address_input_2").val(addr);
		            // ???????????? ????????? disabled ?????? ?????? ??? ????????? ???????????? ????????? ????????????.
		            $("#address_input_3").attr("readonly",false);
		            $("#address_input_3").focus();
		 
		 
		        }
		    }).open();  
   }
	
	//?????? 
	var selectedDay;
	var selectedResult = '';

		"use strict";

		document.addEventListener('DOMContentLoaded', function(){
	    var today = new Date(),
	        year = today.getFullYear(),
	        month = today.getMonth(),
	        monthTag =["January","February","March","April","May","June","July","August","September","October","November","December"],
	        day = today.getDate(),
	        days = document.getElementsByTagName('td'),
	        setDate,
	        daysLen = days.length;
	// options should like '2014-01-01'
	    function Calendar(selector, options) {
	        this.options = options;
	        this.draw();
	    }
	    
	    Calendar.prototype.draw  = function() {
	        this.getCookie('selected_day');
	        this.getOptions();
	        this.drawDays();
	        var that = this,
	            reset = document.getElementById('reset'),
	            pre = document.getElementsByClassName('pre-button'),
	            next = document.getElementsByClassName('next-button');
	            
	            pre[0].addEventListener('click', function(){that.preMonth(); });
	            next[0].addEventListener('click', function(){that.nextMonth(); });
	            reset.addEventListener('click', function(){that.reset(); });
	        while(daysLen--) {
	            days[daysLen].addEventListener('click', function(){that.clickDay(this); });
	        }
	    };
	    
	    Calendar.prototype.drawHeader = function(e) {
	        var headDay = document.getElementsByClassName('head-day'),
	            headMonth = document.getElementsByClassName('head-month');

	            e?headDay[0].innerHTML = e : headDay[0].innerHTML = day;
	            headMonth[0].innerHTML = monthTag[month] +" - " + year;        
	     };
	    
	    Calendar.prototype.drawDays = function() {
	        var startDay = new Date(year, month, 1).getDay(),
	            nDays = new Date(year, month, 0).getDate(),
	    
	            n = startDay;
	        for(var k = 0; k <42; k++) {
	            days[k].innerHTML = '';
	            days[k].id = '';
	            days[k].className = '';
	        }

	        for(var i  = 1; i <= nDays ; i++) {
	            days[n].innerHTML = i; 
	            n++;
	        }
	        
	        for(var j = 0; j < 42; j++) {
	            if(days[j].innerHTML === ""){
	                
	                days[j].id = "disabled";
	                
	            }else if(j === day + startDay - 1){
	                if((this.options && (month === setDate.getMonth()) && (year === setDate.getFullYear())) || (!this.options && (month === today.getMonth())&&(year===today.getFullYear()))){
	                    this.drawHeader(day);
	                    days[j].id = "today";
	                }
	            }
	            if(selectedDay){
	                if((j === selectedDay.getDate() + startDay - 1)&&(month === selectedDay.getMonth())&&(year === selectedDay.getFullYear())){
	                days[j].className = "selected";
	                this.drawHeader(selectedDay.getDate());
	                }
	            }
	        }
	    };
	    
	    Calendar.prototype.clickDay = function(o) {
	        var selected = document.getElementsByClassName("selected"),
	            len = selected.length;
	        if(len !== 0){
	            selected[0].className = "";
	        }
	        o.className = "selected";
	        selectedDay = new Date(year, month, o.innerHTML);
	        this.drawHeader(o.innerHTML);
	        this.setCookie('selected_day', 1);
	        
				$(".selecttime").click(function () {
					console.log(month + 1);
					var monthtemp = month + 1;
					var time = $(this).attr('myval');
					var result = year + "-" + monthtemp + "-" + o.innerHTML + "-" + time;
					console.log(result);
					document.getElementById('reserveDate').value = result;
					$.ajax({
						method : 'GET',
						url : '${pageContext.request.contextPath}/checkout/selecttime/' + result 
					});
				});
	    };
	    
	    Calendar.prototype.preMonth = function() {
	        if(month < 1){ 
	            month = 11;
	            year = year - 1; 
	        }else{
	            month = month - 1;
	        }
	        this.drawHeader(1);
	        this.drawDays();
	    };
	    
	    Calendar.prototype.nextMonth = function() {
	        if(month >= 11){
	            month = 0;
	            year =  year + 1; 
	        }else{
	            month = month + 1;
	        }
	        this.drawHeader(1);
	        this.drawDays();
	    };
	    
	    Calendar.prototype.getOptions = function() {
	        if(this.options){
	            var sets = this.options.split('-');
	                setDate = new Date(sets[0], sets[1]-1, sets[2]);
	                day = setDate.getDate();
	                year = today.getFullYear();
	                month = setDate.getMonth();
	        }
	    };
	    
	     Calendar.prototype.reset = function() {
	         month = today.getMonth();
	         year = today.getFullYear();
	         day = today.getDate();
	         this.options = undefined;
	         this.drawDays();
	     };
	    
	    Calendar.prototype.setCookie = function(name, expiredays){
	        if(expiredays) {
	            var date = new Date();
	            date.setTime(date.getTime() + (expiredays*24*60*60*1000));
	            var expires = "; expires=" +date.toGMTString();
	        }else{
	            var expires = "";
	        }
	        document.cookie = name + "=" + selectedDay + expires + "; path=/";
	    };
	    
	    Calendar.prototype.getCookie = function(name) {
	        if(document.cookie.length){
	            var arrCookie  = document.cookie.split(';'),
	                nameEQ = name + "=";
	            for(var i = 0, cLen = arrCookie.length; i < cLen; i++) {
	                var c = arrCookie[i];
	                while (c.charAt(0)==' ') {
	                    c = c.substring(1,c.length);
	                    
	                }
	                if (c.indexOf(nameEQ) === 0) {
	                    selectedDay =  new Date(c.substring(nameEQ.length, c.length));
	                    
	                }
	            }
	        }
	    };
	    var calendar = new Calendar();
	        
	}, false);

	</script>
</head>

<body>
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <div class="offcanvas-menu-overlay"></div>
    <div class="offcanvas-menu-wrapper">
        <div class="offcanvas__option">
            <div class="offcanvas__links">
                <a href="#">Sign in</a>
                <a href="#">FAQs</a>
            </div>
            <div class="offcanvas__top__hover">
                <span>Usd <i class="arrow_carrot-down"></i></span>
                <ul>
                    <li>USD</li>
                    <li>EUR</li>
                    <li>USD</li>
                </ul>
            </div>
        </div>
        <div class="offcanvas__nav__option">
            <a href="#" class="search-switch"><img src="${context}/resources/theme/img/icon/search.png" alt=""></a>
            <a href="#"><img src="${context}/resources/theme/img/icon/heart.png" alt=""></a>
            <a href="#"><img src="${context}/resources/theme/img/icon/cart.png" alt=""> <span>0</span></a>
            <div class="price">$0.00</div>
        </div>
        <div id="mobile-menu-wrap"></div>
        <div class="offcanvas__text">
            <p>Free shipping, 30-day return or refund guarantee.</p>
        </div>
    </div>
    <!-- Offcanvas Menu End -->

    <!-- Header Section Begin -->
    <header class="header">
    	<jsp:include page="/WEB-INF/views/home/header1.jsp" flush="false" />
        <jsp:include page="/WEB-INF/views/home/header2.jsp" flush="false" />
    </header>
    <!-- Header Section End -->

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <div class="breadcrumb__links">
                            <a href="#">?????? ??????</a>
                            <a href="#">????????? ??????</a>
                            <span>?????? ??????</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="checkout__form">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <h6 class="checkout__title">?????? ??????</h6>
                            <div class="displayUserInfo row">
                                
                            </div>
                            
                            <h6 class="checkout__title" style="margin-top: 100px">?????? ?????? ??????</h6>
                            <div style="text-align: center; margin-top: 60px">
                            <button type="button" class="deliverybutton btn btn-outline-dark" style="user-select: auto;">?????? ??????</button>
                            <button type="button" class="directbutton btn btn-outline-dark" style="user-select: auto;">?????? ??????</button>
                            </div>
                            <!-- ?????? ?????? -->
                            <div class="selectdelivery">
	                            <div class="row" style="margin-top: 70px;">
	                            	<div class="col-lg-7">
		                            	<div class="checkout__input">
			                                <p>????????? ??????<span>*</span></p>
			                                <input type="text" id="address_input_1" disabled="disabled">
			                            </div>
		                            </div>
		                            <div class="col-lg-4">
			                            <div class="checkout__input">
			                            	<button type="button" class="site-btn" onclick="execution_address()" style="margin-top: 36px">?????? ??????</button>
			                            </div>
		                            </div>
	                            </div>
	                             <div class="row">
	                            	<div class="col-lg-7">
		                            	<div class="checkout__input">
			                                <input type="text" id="address_input_2" disabled="disabled">
			                            </div>
		                            </div>
		                            <div class="col-lg-5">
			                            <div class="checkout__input">
			                                <input type="text" id="address_input_3">
			                            </div>
		                            </div>
	                            </div>
	                            <div class="checkout__input__checkbox">
	                                <label for="acc">
	                                    ????????? ?????? ?????? ??????
	                                    <input type="checkbox" id="acc">
	                                    <span class="checkmark"></span>
	                                </label>
	                            </div>
	                            <div style="text-align: center; margin-top: 30px">
	                            	<button type="button" class="savedeliveradd btn btn-outline-dark" data-toggle="modal" data-target="#savedeliver">????????? ??????</button>
	                            </div>
	                            
	                            <div class="modal fade" id="savedeliver" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
							      <div class="modal-dialog modal-dialog-centered" role="document">
							        <div class="modal-content rounded-0">
							          <div class="modal-body p-4 px-5">
							
							            
							            <div class="main-content text-center">
							                
							                <div class="warp-icon mb-4">
							                  <img src="${context}/resources/custom/img/checkicon.png" style="height: 50px; width: 50px; margin-top: 15px" class="img-fluid">
							                </div>
							                  <label>???????????? ?????????????????????.</label>
							                  <div class="d-flex">
							                    <div class="mx-auto">
							                    <button id="savedel" class="btn btn-outline-dark" data-dismiss="modal">??????</button>
							                    </div>
							                  </div>
							            </div>
							
							          </div>
							        </div>
							      </div>
							    </div>
                            </div>
                            
                            <!-- ?????? ?????? ?????? -->
                            <div class="selectdirect">
	                           <div class="checkout__input" style="margin-top: 60px">
									<div class="containers">
									<div style="text-align: center;">
							            <button type="submit" class="site-btn" data-toggle="modal" data-target="#selecttarget">?????? ?????? ??????</button>
							        </div>
							        <div id="displayTarget" style="margin-top: 40px">
							       
							        </div>
							        <div class="modal fade" id="selecttarget" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
									  <div class="modal-dialog modal-dialog-centered" role="document">
									    <div class="modal-content">
									      <div class="modal-header img" style="background-image: url(${context}/resources/custom/img/bg-1.jpeg);">
									      
									      </div>
									      <div class="modal-body pt-md-0 pb-5 px-4 text-center">
									      	
											<div class="row" style="margin-top: 80px">
												<div class="col-md-4">
													<input type="button" class="selecttar btn btn-outline-dark" value="????????? ?????? " myval = '1' data-dismiss="modal">
												</div>
												<div class="col-md-4">
													<input type="button" class="selecttar btn btn-outline-dark" value="????????? ?????? " myval = '2' data-dismiss="modal">
												</div>
												<div class="col-md-4">
													<input type="button" class="selecttar btn btn-outline-dark" value="????????? " myval = '3' data-dismiss="modal">
												</div>
											</div>
											<div class="row">
												<div class="col-md-4">
													<input type="button" class="selecttar btn btn-outline-dark" value="??????????????? " myval = '4' data-dismiss="modal">
												</div>
												<div class="col-md-4">
													<input type="button" class="selecttar btn btn-outline-dark" value="????????? " myval = '5' data-dismiss="modal">
												</div>
												<div class="col-md-4">
													<input type="button" class="selecttar btn btn-outline-dark" value="????????? " myval = '6' data-dismiss="modal">
												</div>
											</div>
											<div class="row">
												<div class="col-md-4">
													<input type="button" class="selecttar btn btn-outline-dark" value="???????????? " myval = '7' data-dismiss="modal">
												</div>
												<div class="col-md-4">
													<input type="button" class="selecttar btn btn-outline-dark" value="????????? " myval = '8' data-dismiss="modal">
												</div>
											</div>
									      </div>
									    </div>
									  </div>
									</div>
										<div class="rows">
											<div class="col-md-12" style=" margin-top: 30px">
											<p>?????? ?????? ??????<span>*</span></p>
												<div class="elegant-calencar d-md-flex">
													<div class="wrap-header d-flex align-items-center">
											      <p id="reset">reset</p>
										        <div id="header" class="p-0">
									            <div class="pre-button d-flex align-items-center justify-content-center"><i class="fa fa-chevron-left"></i></div>
									            <div class="head-info">
									                <div class="head-day"></div>
									                <div class="head-month"></div>
									            </div>
									            <div class="next-button d-flex align-items-center justify-content-center"><i class="fa fa-chevron-right"></i></div>
										        </div>
										      </div>
										      <div class="calendar-wrap">
										        <table id="calendar">
									            <thead>
									                <tr>
									                    <th>Sun</th>
									                    <th>Mon</th>
									                    <th>Tue</th>
									                    <th>Wed</th>
									                    <th>Thu</th>
									                    <th>Fri</th>
									                    <th>Sat</th>
									                </tr>
									            </thead>
									            <tbody>
								                <tr>
								                  <td></td>
								                  <td></td>
								                  <td></td>
								                  <td></td>
								                  <td></td>
								                  <td></td>
								                  <td></td>
								                </tr>
								                <tr>
								                  <td></td>
								                  <td></td>
								                  <td></td>
								                  <td></td>
								                  <td></td>
								                  <td></td>
								                  <td></td>
								                </tr>
								                <tr>
								                  <td></td>
								                  <td></td>
								                  <td></td>
								                  <td></td>
								                  <td></td>
								                  <td></td>
								                  <td></td>
								                </tr>
								                <tr>
								                  <td></td>
								                  <td></td>
								                  <td></td>
								                  <td></td>
								                  <td></td>
								                  <td></td>
								                  <td></td>
								                </tr>
								                <tr>
								                  <td></td>
								                  <td></td>
								                  <td></td>
								                  <td></td>
								                  <td></td>
								                  <td></td>
								                  <td></td>
								                </tr>
								                <tr>
								                  <td></td>
								                  <td></td>
								                  <td></td>
								                  <td></td>
								                  <td></td>
								                  <td></td>
								                  <td></td>
								                </tr>
									            </tbody>
										        </table>
										      </div>
										    </div>
											</div>
										</div>
									</div>
							</div>
							
							<div class="checkout__input" style="margin-top: 60px">
			                    <p>?????? ?????? ??????<span>*</span></p>
								<div class="col-md-12 mb-3">
									<div class="row">
										<div class="col-md-2">
											<input type="button" class="selecttime btn btn-outline-dark" value="10:00 " myval="10:00:00" data-toggle="modal" data-target="#savedirect">
										</div>
										<div class="col-md-2">
											<input type="button" class="selecttime btn btn-outline-dark" value="10:30 " myval="10:30:00" data-toggle="modal" data-target="#savedirect">
										</div>
										<div class="col-md-2">
											<input type="button" class="selecttime btn btn-outline-dark" value="11:00 " myval="11:00:00" data-toggle="modal" data-target="#savedirect">
										</div>
										<div class="col-md-2">
											<input type="button" class="selecttime btn btn-outline-dark" value="11:30 " myval="11:30:00" data-toggle="modal" data-target="#savedirect">
										</div>
										<div class="col-md-2">
											<input type="button" class="selecttime btn btn-outline-dark" value="12:00 " myval="12:00:00" data-toggle="modal" data-target="#savedirect">
										</div>
										<div class="col-md-2">
											<input type="button" class="selecttime btn btn-outline-dark" value="12:30 " myval="12:30:00" data-toggle="modal" data-target="#savedirect">
										</div>
									</div>
								</div>
								<div class="col-md-12 mb-3">
									<div class="row">
										<div class="col-md-2">
											<input type="button" class="selecttime btn btn-outline-dark" value="13:00 " myval="13:00:00" data-toggle="modal" data-target="#savedirect">
										</div>
										<div class="col-md-2">
											<input type="button" class="selecttime btn btn-outline-dark" value="13:30 " myval="13:30:00" data-toggle="modal" data-target="#savedirect">
										</div>
										<div class="col-md-2">
											<input type="button" class="selecttime btn btn-outline-dark" value="14:00 " myval="14:00:00" data-toggle="modal" data-target="#savedirect">
										</div>
										<div class="col-md-2">
											<input type="button" class="selecttime btn btn-outline-dark" value="14:30 " myval="14:30:00" data-toggle="modal" data-target="#savedirect">
										</div>
										<div class="col-md-2">
											<input type="button" class="selecttime btn btn-outline-dark" value="15:00 " myval="15:00:00" data-toggle="modal" data-target="#savedirect">
										</div>
										<div class="col-md-2">
											<input type="button" class="selecttime btn btn-outline-dark" value="15:30 " myval="15:30:00" data-toggle="modal" data-target="#savedirect">
										</div>
									</div>
								</div>
								<div class="col-md-12 mb-3">
									<div class="row">
										<div class="col-md-2">
											<input type="button" class="selecttime btn btn-outline-dark" value="16:00 " myval="16:00:00" data-toggle="modal" data-target="#savedirect">
										</div>
										<div class="col-md-2">
											<input type="button" class="selecttime btn btn-outline-dark" value="16:30 " myval="16:30:00" data-toggle="modal" data-target="#savedirect">
										</div>
										<div class="col-md-2">
											<input type="button" class="selecttime btn btn-outline-dark" value="17:00 " myval="17:00:00" data-toggle="modal" data-target="#savedirect">
										</div>
										<div class="col-md-2">
											<input type="button" class="selecttime btn btn-outline-dark" value="17:30 " myval="17:30:00" data-toggle="modal" data-target="#savedirect">
										</div>
										<div class="col-md-2">
											<input type="button" class="selecttime btn btn-outline-dark" value="18:00 " myval="18:00:00" data-toggle="modal" data-target="#savedirect">
										</div>
										<div class="col-md-2">
											<input type="button" class="selecttime btn btn-outline-dark" value="18:30 " myval="18:30:00" data-toggle="modal" data-target="#savedirect">
										</div>
									</div>
								</div>
			                </div>
			                <div class="modal fade" id="savedirect" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
							      <div class="modal-dialog modal-dialog-centered" role="document">
							        <div class="modal-content rounded-0">
							          <div class="modal-body p-4 px-5">
							
							            
							            <div class="main-content text-center">
							                
							                <div class="warp-icon mb-4">
							                  <img src="${context}/resources/custom/img/checkicon.png" style="height: 50px; width: 50px; margin-top: 15px" class="img-fluid">
							                </div>
							                  <label>?????? ????????? ?????????????????????.</label>
							                  <div class="d-flex">
							                    <div class="mx-auto">
							                    <button id="savedir" class="btn btn-outline-dark" data-dismiss="modal">??????</button>
							                    </div>
							                  </div>
							            </div>
							
							          </div>
							        </div>
							      </div>
							    </div>
			            </div>
			            <h6 class="checkout__title" style="margin-top: 100px">?????? ?????? ??????</h6>
			            <div class="shopping__cart__table">
	                        <table>
	                            <thead>
	                                <tr>
	                                    <th>??????</th>
	                                    <th>??????</th>
	                                    <th>??????</th>
	                                    <th></th>
	                                </tr>
	                            </thead>
	                            <tbody id = "contentdisplay">
	                             
	                            </tbody>
	                        </table>
	                    </div>
	                    <h6 class="checkout__title" style="margin-top: 100px">?????? & ?????????</h6>
	                    <div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
				        <div class="wrapper wrapper--w680">
				            <div class="card card-4">
				                <div class="card-body">
				                            <br><label class="label">????????? ??????</label><hr>
				                            <div class="rs-select2 js-select-simple select--no-search">
				                                <select class="couponselect" id="couponselect">
				                                <c:forEach items="${couponlist}" var="dto">
				                                  <option value="${dto.no}">${fn:escapeXml(dto.title)}</option>
				                                 </c:forEach>
				                                </select>
				                                <div class="select-dropdown"></div>
				                                &nbsp;&nbsp;<button id="couponselectbtn" class="btn btn-outline-dark">?????? ??????</button>
				                                <br><br>
				                                
						                    <div class="d-flex justify-content-center row">
										        <div class="col-md-6">
										            <div class="coupon p-3 bg-white" style="box-shadow: 5px 8px 10px #d6d5d533"> 
										                <div class="row no-gutters" id="displaycoupon">
										                    
										                </div>
										            </div>
										        </div>
										    </div>
										    <div id="displaydcproduct">
											 
											</div>
											 <br><br>
										    <label class="label">????????? ??????</label><hr>
												<div class="container">
			                                    <div class="row">
			                                       <div class="col-md-12">
			                                          <div class="table-wrap">
			                                             <table class="table">
			                                               <thead class="thead-primary">
			                                                 <tr>
			                                                   <th>?????? ?????????</th>
			                                                   <th>????????? ?????????</th>
			                                                   <th>????????? ??????</th>
			                                                   <th></th>
			                                                 </tr>
			                                               </thead>
			                                               <tbody id="pointcontent">
			                                                 
			                                               </tbody>
			                                             </table>
			                                          </div>
			                                       </div>
			                                    </div>
			                                 </div>
						                </div>
				                    </div>
				            </div>
				        </div>
				    </div>
				    	<input type="hidden" id="reserveDate" name="reserveDate">
				    	<input type="hidden" id="storeNo" name="storeNo">
			            <h6 class="checkout__title" style="margin-top: 100px">?????? ??????</h6>
			            <div style="text-align: center; margin-top: 30px">
			             <button id="check_module" class="btn btn-outline-dark" style="border-radius: 20px">?????? ??????</button>
			             <button id="kakao_module" class="btn btn-outline-dark" style="border-radius: 20px">????????? ?????? ??????</button>
			             <button id="payko_module" class="btn btn-outline-dark" style="border-radius: 20px">????????? ?????? ??????</button>
			            </div>
			            <div style="text-align: center; margin-top: 30px"><br><br><br>
			            <button type="submit" class="site-btn">?????? ????????????</button>
			            </div>
                        </div>
                        
                        <div class="col-lg-4 col-md-6">
                           
                            <div class="checkout__order" style="position:sticky; top: 30px;">
                                <h4 class="order__title">?????? ??????</h4>
                                <div class="checkout__order__products">??????&nbsp;(??????)<span>??????</span></div>
                                <ul class="checkout__total__products">
                                    <div id="displayCheckout">
                                    
                                    </div>
                                </ul>
                                <ul class="checkout__total__all">
                                    <div id="displayTotal">
                                    
                                    </div>
                                </ul>
                            
                            </div>
                        </div>
                    </div>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->
    
    <div class="modal fade" id="applycoupon" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
							      <div class="modal-dialog modal-dialog-centered" role="document">
							        <div class="modal-content rounded-0">
							          <div class="modal-body p-4 px-5">
							
							            
							            <div class="main-content text-center">
							                
							                <div class="warp-icon mb-4">
							                  <img src="${context}/resources/custom/img/checkicon.png" style="height: 50px; width: 50px; margin-top: 15px" class="img-fluid">
							                </div>
							                  <label>?????? ????????? ?????????????????????.</label>
							                  <div class="d-flex">
							                    <div class="mx-auto">
							                    <button id="savedel" class="btn btn-outline-dark" data-dismiss="modal">??????</button>
							                    </div>
							                  </div>
							            </div>
							
							          </div>
							        </div>
							      </div>
							    </div>
    
    <div class="modal fade" id="applypoint" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
							      <div class="modal-dialog modal-dialog-centered" role="document">
							        <div class="modal-content rounded-0">
							          <div class="modal-body p-4 px-5">
							
							            
							            <div class="main-content text-center">
							                
							                <div class="warp-icon mb-4">
							                  <img src="${context}/resources/custom/img/checkicon.png" style="height: 50px; width: 50px; margin-top: 15px" class="img-fluid">
							                </div>
							                  <label>????????? ????????? ?????????????????????.</label>
							                  <div class="d-flex">
							                    <div class="mx-auto">
							                    <button id="savedel" class="btn btn-outline-dark" data-dismiss="modal">??????</button>
							                    </div>
							                  </div>
							            </div>
							
							          </div>
							        </div>
							      </div>
							    </div>

    <!-- Footer Section Begin -->
    <footer class="footer">
        <jsp:include page="/WEB-INF/views/home/footer.jsp" flush="false" />
    </footer>
    <!-- Footer Section End -->

    <!-- Search Begin -->
    <div class="search-model">
        <div class="h-100 d-flex align-items-center justify-content-center">
            <div class="search-close-switch">+</div>
            <form class="search-model-form">
                <input type="text" id="search-input" placeholder="Search here.....">
            </form>
        </div>
    </div>
    <!-- Search End -->

    <!-- Js Plugins -->
    <script src="${context}/resources/theme/js/jquery-3.3.1.min.js"></script>
    <script src="${context}/resources/theme/js/bootstrap.min.js"></script>
    <script src="${context}/resources/theme/js/jquery.nice-select.min.js"></script>
    <script src="${context}/resources/theme/js/jquery.nicescroll.min.js"></script>
    <script src="${context}/resources/theme/js/jquery.magnific-popup.min.js"></script>
    <script src="${context}/resources/theme/js/jquery.countdown.min.js"></script>
    <script src="${context}/resources/theme/js/jquery.slicknav.js"></script>
    <script src="${context}/resources/theme/js/mixitup.min.js"></script>
    <script src="${context}/resources/theme/js/owl.carousel.min.js"></script>
    <script src="${context}/resources/theme/js/main.js"></script>
    <script src="${context}/resources/theme/js/jquery.min.js"></script>
    <script src="${context}/resources/theme/js/popper.js"></script>
    <script src="${context}/resources/custom/js/select2.min.js"></script>
    
    <!-- JQUERY -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>          
	
</body>

</html>