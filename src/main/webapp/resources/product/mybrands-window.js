getMybrands();
getMybrandsWindow();

function getMybrandsWindow() {

	$.ajax({
		url: './product/getMybrandsWindow',
		type: 'get',
		dataType: 'json',
		data: {'pg': window.pg, 'brandNo':window.brandNo},
		success: function(res) {
			
			let list = res.windowList;
			plusMsg = '';
			console.log(res);
			for(let i = 0; i < list.length; i++) {
				
				plusMsg +=`<div class="col-lg-2 col-md-6 col-sm-6">`
						+ `				<div class="product__item" style="cursor: pointer">`
						+ `					<div class="product__item__pic set-bg"`
						+ `						onclick="location.href=''"` 
						+ `                     style="background-image: url(https://file.mk.co.kr/meet/neds/2017/05/image_readtop_2017_315338_14944817612877919.jpg);">`
						+ `					</div>`
						+ `					<div class="product__item__text">`
						+ `						<div>`
						+ `                     	<h6 class="window-title">`
						+ `							${list[i].title}`
						+ `							</h6>`
						+ `                     <div style="color: #c8c8c8; font-size: 12px"><i class="fas fa-tshirt"></i>&nbsp;${list[i].cnt}</div>`
						+ `                     </div>`
						+ `						<h6 class="window-brandname">`
						+ `							${list[i].brandName}`
						+ `						</h6>`
						+ `						<p style="color: #c8c8c8; font-size: 10px">`
						+ `							${list[i].storeName}`
						+ `						</p>`
						+ `					</div>`
						+ `				</div>`
						+ `			</div>` ;
			
			}
			
			if (list.length == 0) {
				plusMsg = '<div class="col-md-12 text-center">'
						+ `		<img src="${window.context}/resources/product/noitem.png">`
						+ '</div>'
			}
			

			let pagination = '';
			
			if (res.startPage == 1) {
				pagination += ``;
			} else {
				pagination += `<li class='prev'><a onclick='move(${res.startPage-1})'>이전</a></li>`;
			}
			
			for (let i = res.startPage; i < res.endPage + 1; i++) {
				if (res.page == i) {
					pagination += `<li class='active page-block'><a onclick="move(${i})">${i}</li>`;
				} else {
					pagination += `<li class='page-block'><a onclick='move(${i})'>${i}</a></li>`;
				}
			}
			
			if (res.endPage == res.totalPage) {
				pagination += ``;
			} else {
				pagination += `<li class='next'><a onclick='move(${res.endPage+1})'>다음</a></li>`;
			}
			
			let leftInfo = '';
			
			if (res.recordCount == 0)
				leftInfo = `<p>총 ${res.recordCount} 개의 게시물</p>`;
			else
				leftInfo = `<p>총 ${res.recordCount} 개의 게시물 중 ${res.pageSize*(window.pg-1)+1}번 - ${res.pageSize*window.pg}번</p>`;
			
			document.getElementById('product-list-section').innerHTML = plusMsg;
			document.querySelector('.page-num').innerHTML = pagination;
			document.querySelector('.shop__product__option__left').innerHTML = leftInfo;
			
			
		},
		error: function(err) {
			alert('getMybrandsWindow Error');
		}
	});
}

function getMybrands() {
	
	$.ajax({
		url: './product/getMybrands',
		type: 'get',
		dataType: 'json',
		data: {'pg': window.subspg, 'brandNo':window.brandNo},
		success: function(res) {
			
			let list = res.brandList;
			let brands = '';
			
			if (res.startPage == 1) {
				if(window.brandNo == 0) {
					brands += `<li class="active" onclick="selectBrand(0)"><a>전체</a></li>`;
				} else {
					brands += `<li class="page-block"><a onclick="selectBrand(0)">전체</a></li>`;
				}
			} else {
				brands += `<li class='prev'><a onclick='moveBrandPage(${res.startPage-1})'>&lt;</a></li>`;
			}
			
			for(let i = 0; i < list.length; i++) {
				
				if (list[i].no == window.brandNo) {
					brands += `<li class='active page-block'><a onclick="selectBrand(${list[i].no})">${list[i].name}</li>`;
				} else {
					brands += `<li class='page-block'><a onclick='selectBrand(${list[i].no})'>${list[i].name}</a></li>`;
				}

			}
			
			if (res.endPage == res.totalPage) {
				brands += ``;
			} else {
				brands += `<li class='next'><a onclick='moveBrandPage(${res.endPage+1})'>&gt;</a></li>`;
			}
			
			document.querySelector('.mysubs').innerHTML = brands;
			
		},
		error: function(err) {
			alert('getMybrands Error!');
		}
	});
}

function move(pg) {
	window.pg = pg;
	getMybrandsWindow();
}

function selectBrand(brandNo) {
	window.brandNo = brandNo
	window.pg = 1;
	getMybrands();
	getMybrandsWindow();
}

function moveBrandPage(pg) {
	window.subspg = pg;
	getMybrands();
}