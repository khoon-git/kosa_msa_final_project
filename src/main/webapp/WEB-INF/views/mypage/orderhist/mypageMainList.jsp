<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="app" value="${pageContext.request.contextPath}" />
<sec:authentication property="principal.user.user_id" var="principal_user_id" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <style>
        .hidden {
            display: none !important;
        }

        div#bannerWrap {
            background: rgb(240, 246, 234);
            padding: 20px;
            margin-bottom: 15px;
            border-radius: 5px;
        }

        p.quickmenu {
            font-size: 20px;
            font-weight: bold;
            margin-left: 15px;
        }

        .quickbtn_group {

            display: inline-flex;
            justify-content: flex-start;
            width: 100%;
            margin-left: 10px;
            align-items: center;
        }

        .quick_btn {
            border: 1px solid #ddd;
            padding: 2px 14px 4px 14px;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            border-radius: 5px;
            background: #fff;
            margin-right: 5px;
        }

        p.quickmenu {
            margin-right: 50px;
        }
        
        img.ic_img {
    	 width: 30px;
    	}

        table {
            width: 500px;
        }

        .hide {
            display: none;
        }

        .show {
            display: table-row;
        }

        .item td {
            cursor: pointer;
        }

        .cus-wrap h3 {
            margin-bottom: 20px;
            color: #333;
            font-size: 22px;
            font-weight: 700;
            line-height: 29px;
        }
        
        .cus-wrap .tblwrap table td {
		    font-size: 15px;
		    line-height: 15px;
		    border-bottom: 1px solid #eee;
		}

        .tblwrap table td {
            color: #333;
            line-height: 22px;
        }

        .basic-border-one {
            border: 1px solid #eee;
            background: white;
            padding: 15px;
            margin-bottom: 15px;
            border-radius: 5px;
            min-height: 45px;
        }

        tr.show {
            background: #f8f8f8;
		}
		
		 p.oneaone-p {
            margin-left: 10px;
            margin-bottom: 21px;
        }

        .oneaone-div {
            text-align: end;
            font-size: 14px;
            margin-bottom: 6px;
            margin-right: 5px;
        }
        .myinfo-area .myname {
    		top: 0px !important;
		}
        
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    <script src="//image.hmall.com/p/js/co/jquery-3.4.1.min.js"></script><!-- jQuery Plugin -->
    <script src="//image.hmall.com/p/js/co/jquery.easing.min.js"></script><!-- jQuery UI Effect -->
    <script src="//image.hmall.com/p/js/co/jquery-ui.1.12.1.min.js"></script><!-- jQuery UI js -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
   
    <!-- includeScript -->
    <script type="text/javascript">
        var gaMktgUrl = "";
        var gaMktg3 = "";


        $(document).ready(function () {
            bannerOpen();
        });
     

        function bannerClick() {
            var gaLabel = "'" + gaMktg3 + "'";
            GA_Event('???????????????', '????????? ??????', gaLabel);
            location.href = gaMktgUrl; 
        }


        function openWindow(url) {
            window.open(url, "_blank");
        }
        _TRK_PI_ = "MYPAGE";
        
    	/*
    	 * ????????? ?????? ?????? with ????????? ??????
    	 * !! ????????????????????? ????????? ?????? ?????? ?????? ????????? ????????? ??????????????? ??????
    	 */
    	function InsertReview(prd_board_id, prd_id){
    		var token = $("input[name='_csrf']").val();
    		var header = "X-CSRF-TOKEN";
    		
    		//var parentObj = $(obj).closest("dd");

    		var val_cur_user='${principal_user_id}';
    		var val_prd_board_id = prd_board_id;
    		var val_prd_id = prd_id;
    		// ????????????????????? prd_board_id ???????
    				
    		
    		
    		// insert ??? ?????? ??????, goto checkValidReview controller
    		$.ajax({
    			url : "${app}/r/checkValidReview",
    			method : "POST",
    			data : {
    				user_id : val_cur_user,
    				prd_board_id : prd_board_id,
    				prd_id : val_prd_id
    			},
    			dataType : "json",
    			beforeSend : function(xhr) {
    				xhr.setRequestHeader(header, token);
    			},
    			success : function(data) {
    				//alert(JSON.stringify(data));
    				if (data.ReviewFlag == "Already") {
    					alert('?????? ?????????????????? ????????? ????????????????????????');
    				} else if(data.ReviewFlag == "Possible"){
    					
    					let popUrl = "${app}/r/insert/" + val_cur_user+ "?prd_board_id=" + prd_board_id + "&&prd_id="+prd_id;
    					console.log(popUrl);
    					let popOption = "width = 600px, height=700px, top=300px, left=300px, scrollbars=yes";
    					window.open(popUrl,"?????? ??????",popOption);
    					
    				} else if(data.ReviewFlag == "Impossible"){
    					alert('???????????? ??????????????? ?????? ????????? ???????????????.');
    				}
    			}
    		});
    	}
    </script>
</head>
                <!-- 
                    * ???????????? ?????? ?????????
                        - TOP CLASS ?????? : topclass-lv
                        - DIAMOND ?????? : diamond-lv
                        - PLATINUM ?????? : platinum-lv
                        - GOLD ?????? : gold-lv
                        - SILVER ?????? : silver-lv
                    -->
                <c:if test="${grade == 1}">
                <div class="myinfo-area silver-lv">
                </c:if>
                <c:if test="${grade == 2}">
                <div class="myinfo-area gold-lv">
                </c:if>
                <c:if test="${grade == 3}">
                <div class="myinfo-area platinum-lv">
                </c:if>
                <c:if test="${grade == 4}">
                <div class="myinfo-area diamond-lv">
                </c:if>
                <c:if test="${grade == 5}">
                <div class="myinfo-area topclass-lv">
                </c:if>
                    <div>
                        <p class="myname"><em>${usernm}</em></a>
                        </p>
                        <div class="rating">
                        	<c:if test="${grade == 1}">
                            	<span class="silver-lv"><i class="icon"></i><em>??????</em></span>
                             </c:if>
                            <c:if test="${grade == 2}">
                            	<span class="gold-lv"><i class="icon"></i><em>??????</em></span>
                            </c:if>
                            <c:if test="${grade == 3}">
                            	<span class="platinum-lv"><i class="icon"></i><em>????????????</em></span>
                            </c:if>
                            <c:if test="${grade == 4}">
                            	<span class="diamond-lv"><i class="icon"></i><em>???????????????</em></span>
                            </c:if>
                            <c:if test="${grade == 5}">
                            	<span class="topclass-lv"><i class="icon"></i><em>VIP</em></span>
                            </c:if>
                        </div>
                        <!-- //.rating -->
                    </div>
                    <ul class="infowrap">
                        <li>
                            <a onclick="getCouponList();">
                                <span class="link"><b>${coupon_cnt}</b>???</span>
                                <span class="txt">?????? ??????</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript://" onclick="doSearchUPntMainPop()">
                                <span class="link">
                                    <b>${reserves}</b>P</span>
                                <span class="txt">?????????</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript://" onclick="doSearchUPntMainPop()">
                                <span class="link">
                                    <b>${balances}</b>???</span>
                                <span class="txt">?????????</span>
                            </a>
                        </li>
                    </ul>
                    <!-- //.infowrap -->

                </div>
                <!-- //.myinfo-area -->
                
 


                <h3 class="title22">
                    ?????? ????????????
                    <div class="btngroup abs">
                        <a href="${app}/mypage/odslist" class="btn atext"><span>????????????</span><i
                                class="arrow right"></i></a>
                    </div>
                </h3>
                <!-- ?????? ???????????? ???????????? ??????????????? ?????? ?????? -->
                <div class="order-list">
                            <div class="order-list">                          
                            <c:if test = "${fn:length(list) == 0}">
                           	  <div class="nodata" >
				      			<span class=" bgcircle"><i class="icon nodata-type7"></i></span>
				      			<p>?????? 14????????? ????????? ????????? ????????????.</p>
				      		</div>                            
                            </c:if>
                            <c:if test = "${fn:length(list) > 0}">
                            <c:forEach var="orderDTO" items="${list}">                                                 
                                <dl>
                                    <dt>
                                        <div class="date">
                                            <span><fmt:formatDate value="${orderDTO.order_date}" type= "date"/> (???????????? : <c:out value="${orderDTO.prd_order_id}"/>)</span>
                                        </div>
                                        <div class="abs">
                                            <a href="${app}/mypage/od?orderNo=${orderDTO.prd_order_id}"
                                                class="btn alink"><span>??????/?????? ??????</span></a>
                                        </div>
                                    </dt>
                                    <!-- ????????? ?????? -->
                                    <c:forEach items="${orderDTO.orderDetailList}" var="detailDTO">
                                    <dd class="btn-col2">                            
                                        <a href="${app}/p/${detailDTO.prd_board_id}">
 										<span class="img"><img
                                                    src="${detailDTO.upload_path}"
                                                    alt="${detailDTO.prd_nm}"
                                                    onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&AR=0')" />
                                            </span>
                                            <div class="box">
	
                                                <span class="state">
                                                    ${detailDTO.order_flag}
                                                    <em class="color-999">
                                                    </em>
                                                </span>
                                                <span class="tit">${detailDTO.prd_nm}</span>
                                                <div class="info">
                                                    <ul>
                                                        <li>${detailDTO.all_option}</li>
                                                        <li>${detailDTO.prd_count} ???</li>
                                                    </ul>
                                                </div>
                                                <span class="price">
                                                    <strong>${detailDTO.prd_price}</strong>???
                                                </span>
                                            </div>
                                        </a>
                                      <c:if test="${detailDTO.order_flag == '????????????' || detailDTO.order_flag == '???????????????'}">
                                        <div class="btngroup">
                                            <button class="btn btn-linelgray small30" type="button"
                                                onClick="location.href='${app}/mypage/oc?orderDetailNo=${detailDTO.prd_orderdetail_id}&orderNo=${orderDTO.prd_order_id}'"><span>????????????</span>
                                            </button>
                                        </div>
                                       </c:if>
                                       <c:if test="${detailDTO.order_flag == '????????????'}">
                                        <div class="btngroup">
                                            <button class="btn btn-linelgray small30" type="button"
                                                onClick="location.href='${app}/mypage/oc?orderDetailNo=${detailDTO.prd_orderdetail_id}&orderNo=${orderDTO.prd_order_id}'"><span>????????????</span>
                                            </button>                                      
                                        </div>
                                       </c:if>
                                       <c:if test="${detailDTO.order_flag == '????????????'}">
                                        <div class="btngroup">
                                            <button class="btn btn-linelgray small30" type="button"
                                                onClick="location.href='${app}/mypage/oc?orderDetailNo=${detailDTO.prd_orderdetail_id}&orderNo=${orderDTO.prd_order_id}'"><span>????????????</span>
                                            </button>
                                        </div>
                                       </c:if>
                                       <c:if test="${detailDTO.order_flag == '????????????'}">
                                        <div class="btngroup">
                                            <button class="btn btn-linelgray small30" type="button"
                                                onClick="InsertReview('${detailDTO.prd_board_id}','${detailDTO.prd_id}')"><span>???????????????</span>
                                            </button>
                                             <button class="btn btn-linelgray small30" type="button"
                                                 onClick="window.open('${app}/mypage/exchangePopup?detailid=${detailDTO.prd_orderdetail_id}','????????????','width=588,height=724')"><span>????????????</span>
                                            </button>
                                            <button class="btn btn-linelgray small30" type="button"
                                                onClick="window.open('${app}/mypage/returnPopup?detailid=${detailDTO.prd_orderdetail_id}','????????????','width=588,height=724')"><span>????????????</span>                                      
                                            </button>
                                        </div>
                                       </c:if>                                                          
                                    </dd>
                                    </c:forEach>
                                    
                                    <!--?????? flag ?????? ?????? ??????  -->
                                    <script> 
										$(".state:contains('????????????')").css({color:"#ff5340"});																													
										$(".state:contains('????????????')").css({color:"#3abbd5"});
										$(".state:contains('????????????')").css({color:"#03c75a"});
										$(".state:contains('????????????')").css({color:"#3abbd5"});
										$(".state:contains('???????????????')").css({color:"#737373"});
										$(".state:contains('????????????')").css({color:"#737373"});
										$(".state:contains('????????????')").css({color:"#03c75a"});
										$(".state:contains('????????????')").css({color:"#737373"});
										$(".state:contains('????????????')").css({color:"#03c75a"});
									</script>	
                                    
                                </dl>
                            </c:forEach>
                            </c:if>
                            </div>
                   
                    <!-- list ?????? ?????? end -->
                </div>
                  

                
                <h3 class="title22">
                    ?????? ?????? ??????
                    <div class="btngroup abs">        
                        <a href="${app}/cs/qna" class="btn atext"><span>????????????</span><i class="arrow right"></i></a>
                    </div>
                </h3>
                <c:if test = "${fn:length(qlist) > 0}">      	 
                  <div class="tblwrap tbl-list">
                  <script type="text/javascript">
                    $(function () {
                        var article = (".recruit .show");
                        $(".recruit .item  td").click(function () {
                            var myArticle = $(this).parents().next("tr");
                            if ($(myArticle).hasClass('hide')) {
                                $(article).removeClass('show').addClass('hide');
                                $(myArticle).removeClass('hide').addClass('show');
                            }
                            else {
                                $(myArticle).addClass('hide').removeClass('show');
                            }
                        });
                    });  
                </script>
           
                <table class="recruit">
                    <caption>???????????? ????????????</caption>
                    <colgroup>
                        <col style="width:125px">
                        <col style="width:250px">
                        <col style="width:120px">
                        <col style="width:120px">
                        <col style="width:100px">
                    </colgroup>
                    <thead>
                        <tr>
                            <th scope="col">?????? ??????</th>
                            <th scope="col">??????</th>
                            <th scope="col">?????????</th>
                            <th scope="col">?????????</th>
                            <th scope="col">????????????</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach items="${qlist}" var="qlist">
                        <tr class="item">
                            <td class="txt-center"><span>${qlist.type}</span></td>
                            <td class="nowrap, txt-center">${qlist.title}</td>
                            <td class="txt-center"><span class="date"><fmt:formatDate value="${qlist.ins_dt}" type="date" /></span></td>
                            <td class="txt-center"><span class="date"><fmt:formatDate value="${qlist.ans_ins_dt}" type="date" /></span></td>
                            <td class="txt-center"><span>
                            	<c:if test="${qlist.ans_yn eq '0'.charAt(0)}">?????????</c:if>
                            	<c:if test="${qlist.ans_yn eq '1'.charAt(0)}">????????????</c:if>
                            </span></td>
                        </tr>
                        <tr class="hide">
                        	<td colspan="1" style="text-align: center; letter-spacing: 1px">
                        		<div class="basic-border-one">?????? ??????</div>
                        		<div class="basic-border-one">?????? ??????</div>
                        	</td>
                            <td colspan="4">
                                <div class="basic-border-one">
                                    ${qlist.content}
                                </div>
                                <div class="basic-border-one">
                                    ${qlist.ans_content}
                                </div>
                            </td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
             </c:if>
              <c:if test = "${fn:length(qlist) == 0}"> 
                <div class="pdlist-wrap col4">                    
                    <div class="nodata">
                        <p>?????? ????????? ????????? ????????????.</p>                        
                    </div>
                </div>
              </c:if>  
                <!--<div id="divRcmmItem" class="product-wrap pdslide">
					</div>					                     -->
                <div class="list-head" id="divRcmmItem" style="display:none;">
                    <h3 class="title22">Hmall ????????????</h3>
                </div>
                <div id="rcmmSectArea" class="pdlist-wrap col4">
                </div>
            </div>
        </div>
        <!-- // .contents -->
    </div>
    </div>
    <!-- ?????? ?????? ?????? -->
	<div class="ui-modal pop-pec007-01" id="pec007-01" tabindex="-1" role="dialog" aria-label="?????? ??????" style="z-index: 1041; display: none;">
                <div class="ui-modal-dialog" role="document">
                    <div class="content">
                        <p class="ui-title">?????? ??????</p>
                        <div class="content-body">
                            <div class="mycoupon-body">
                                <div class="coupon-list">
                                    
                                    
                                </div>

                            </div>
							
                        </div>
                        <!-- //.content-body -->

                        <button class="btn btn-close" data-dismiss="modal"><i class="icon xico"></i><span class="hiding">????????? ??????</span></button>
                    </div>
                    <!-- //.content -->
                </div>
                <!-- //.ui-modal-dialog -->
	</div>


</main>
<script>
/* ?????? ????????? ???????????? */
function getCouponList() {
	
	var coupon_id = $("#divCopnInfArea input[name='coupon_id']").val();
	
	
    $.ajax({
		method : "get",
		url : "${app}/coupon/selectCouponList",
		dataType:"json",
		async: true,
		contentType: "application/json",
		success : function(couponList) {
			$(".coupon-list").empty();
			couponList.map((coupon) => {
				
	        	var addCouponHtml = "";
	        	addCouponHtml += "<div class='coupon-box'>";
	        	addCouponHtml += "	<input type='hidden' name='coupon_id' value='"+coupon.coupon_id+"'>";
	        	addCouponHtml += "	<input type='hidden' name='coupon_nm' value='"+coupon.coupon_nm+"'>";
	        	addCouponHtml += "	<input type='hidden' name='coupon_price' value='"+coupon.coupon_price+"'>";
                addCouponHtml += "	<input type='hidden' name='coupon_min_price' value='"+coupon.coupon_min_price+"'>";
                addCouponHtml += "	<input type='hidden' name='coupon_valid_dt' value='"+coupon.coupon_valid_dt+"'>";
                addCouponHtml += "	<input type='hidden' name='user_id' value=''>";
                addCouponHtml += "	<input type='hidden' name='coupon_active' value='"+coupon.coupon_active+"'>";
                addCouponHtml += "	<div class='coupon'>";
                addCouponHtml += "		<p class='discount'><strong>"+priceToString(coupon.coupon_price)+"</strong><b>???</b></p>";
                addCouponHtml += "		<div class='coupon-info'>";
                addCouponHtml += "			<p class='title'><strong>"+coupon.coupon_nm+"</strong></p>";
                addCouponHtml += "			<ul class='coupon-info-list'>";
                addCouponHtml += "				<li>??????: "+moment(coupon.coupon_valid_dt).format('YYYY-MM-DD')+"</li>";
                addCouponHtml += "			</ul>";
                addCouponHtml += "			<p class='type' style='line-height: 20px; color: #ff5340; font-size: 13px;'>???????????? : "+Math.floor(moment.duration(moment(coupon.coupon_valid_dt).diff(moment())).asDays())+"???</p>";
                addCouponHtml += "		</div>";
                addCouponHtml += "	</div>";
                addCouponHtml += "	<div class='coupon-bg'><div></div><div></div></div>";
                addCouponHtml += "</div>";
                
                $(".coupon-list").append(addCouponHtml);
	        }); // end map
	        
	    },
		error: function(error) {
			console.log(error);
		}
	
    });
    
    $('#pec007-01').modal('show');

}



function priceToString(price) {
    return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}
</script>
</html>