$(function() {
// 가격 단위에 쉼표 찍어주기
	$(".price_comma").each(function() {
    let text = $(this).text();
    let formattedText = text.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    $(this).text(formattedText);
	});
	
});

// 페이지 진입 시 기본 값
window.addEventListener('DOMContentLoaded', function() {
  showContent('A');
});

function showContent(content) {
  var contentA = document.getElementById("contentA");
  var contentB = document.getElementById("contentB");

  // 내용 숨김
  contentA.style.display = "none";
  contentB.style.display = "none";

  // 선택한 내용 보이기
  if (content === "A") {
    contentA.style.display = "block";
  } else if (content === "B") {
    contentB.style.display = "block";
  }
}

function selectAll(selectAll)  {
  const checkboxes 
       = document.getElementsByName('agree1');
  
  checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked;
  })
}

