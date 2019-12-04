/*
  Example safe-executing JS script for Lewagon.
  packs/plugins/myPlugin.js
*/

const toggleNavmenu = () => {
  const element = document.querySelector('.js-navmenu');
  new NavMenu(element);

};

class NavMenu {
  // Keep the constructor lean, don't add anything more to this.
  constructor(el) {
    this.el = el;
    // Bind event listener methods to class.
    this.onButtonClick = this.onButtonClick.bind(this);

    this.init();
  }

  init() {
    // Do whatever you need to do here. Get as spaghetti western as
    // you want and refactor later.

    // You can find elements within the element too.
    // Use the El suffix on variable names that reference an element.
    const buttonEl = document.querySelector('.js-navbtn');

    // Add event listeners.
    buttonEl.addEventListener('click', this.onButtonClick);
  }

  // Events. Make sure this are all bound in the constructor.
  onButtonClick(e) {
    e.preventDefault();
    const navToggle = document.querySelector('.js-navmenu');
    navToggle.classList.toggle('active');
    const contentToggle = document.querySelector('.page-content');
    contentToggle.classList.toggle('active');
    const arrowToggle = document.querySelector('#arrow');
    arrowToggle.classList.toggle('fa-angle-double-left');
    arrowToggle.classList.toggle('fa-angle-double-right');
  }
}

export { toggleNavmenu };
