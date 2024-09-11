
function selectAll(selectAll)  {
  const checkboxes 
       = document.getElementsByName('agree1');
  
  checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked;
  })
}