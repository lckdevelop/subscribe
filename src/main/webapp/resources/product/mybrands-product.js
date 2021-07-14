getMybrands();
getMybrandsProduct();

function getMybrandsProduct() {

	$.ajax({
		url: './product/getMybrandsProduct',
		type: 'get',
		dataType: 'json',
		data: {'pg': window.pg, 'brandNo':window.brandNo},
		success: function(res) {
			
			let list = res.productList;
			plusMsg = '';
			console.log(res);
			for(let i = 0; i < list.length; i++) {
				
				plusMsg +=`<div class="col-lg-3 col-md-6 col-sm-6">`
						+ `				<div class="product__item" style="cursor: pointer">`
						+ `					<div class="product__item__pic set-bg"`
						+ `						onclick="location.href='${window.context}/product/detail/${list[i].categorybrandName}/${list[i].categoryproductName}/${list[i].brandNo}/${list[i].no}'"` 
						+ `                     style="background-image: url(https://subscribe.s3.ap-northeast-2.amazonaws.com/product/${list[i].engname}/${list[i].categoryproductNo}/${list[i].thumbnail}.jpg);">`
						+ `						<ul class="product__hover">`
						+ `							<li><a href="#"><img`
						+ `									src="${window.context}/resources/theme/img/icon/heart.png" alt=""></a></li>`
						+ `							<li><a href="#"><img`
						+ `									src="${window.context}/resources/theme/img/icon/compare.png"`
						+ `									alt=""> <span>Compare</span></a></li>`
						+ `							<li><a href=""><img`
						+ `									src="${window.context}/resources/theme/img/icon/search.png" alt=""></a></li>`
						+ `						</ul>`
						+ `					</div>`
						+ `					<div class="product__item__text">`
						+ `						<h6>${list[i].name}</h6>`
						+ `						<h5>`
						+ `							${list[i].price}&nbsp;원`
						+ `						</h5>`
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
				leftInfo = `<p>총 ${res.recordCount} 개의 상품</p>`;
			else
				leftInfo = `<p>총 ${res.recordCount} 개의 상품 중 ${res.pageSize*(window.pg-1)+1}번 - ${res.pageSize*window.pg}번 상품</p>`;
			
			document.getElementById('product-list-section').innerHTML = plusMsg;
			document.querySelector('.page-num').innerHTML = pagination;
			document.querySelector('.shop__product__option__left').innerHTML = leftInfo;
			
			
		},
		error: function(err) {
			alert('getMybrandsProduct Error');
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
					brands += `<li class="page-block active" onclick="selectBrand(0)"><a>전체</a></li>`;
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
	getMybrandsProduct();
}

function selectBrand(brandNo) {
	window.brandNo = brandNo
	window.pg = 1;
	getMybrands();
	getMybrandsProduct();
}

function moveBrandPage(pg) {
	window.subspg = pg;
	getMybrands();
}