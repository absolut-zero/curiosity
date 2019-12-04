const collapsibleContent = () => {
var coll = document.getElementsByClassName("collapsible");
var i;

for (i = 0; i < coll.length; i++) {
  coll[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var content = this.nextElementSibling;
    console.log(coll)
    console.log(content)
    var arrowFolder = this.querySelector('#arrow-folder');
    console.log(arrowFolder);
     if (content.style.maxHeight){
      content.style.maxHeight = null;
    } else {
      content.style.maxHeight = content.scrollHeight + "200px";
    };
    arrowFolder.classList.toggle('fa-caret-down');
    arrowFolder.classList.toggle('fa-caret-right');
  });
};
};

export { collapsibleContent };
