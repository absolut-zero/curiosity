/*
  Example safe-executing JS script for Lewagon.
  packs/plugins/myPlugin.js
*/

window.revisionSession = null;

export const initRevisionSession = (selector) => {
  const elements = Array.from(document.querySelectorAll(selector));
  return elements.map(el => new RevisionSession(el));
};

class RevisionSession {
  // Keep the constructor lean, don't add anything more to this.
  constructor(el) {
    this.el = el;
    this.cardEls = el.querySelectorAll('.js-revision-session-card');
    this.finalCardEl = el.querySelector('.js-final-card');

    this.currentStep = 0;

    // Bind event listener methods to class.
    this.onButtonClick = this.onButtonClick.bind(this);

    this.init();

    window.revisionSession = this;
  }

  init() {
    this.cardEls.forEach(cardEl => {
      const checkAnswerBtnEl = cardEl.querySelector('.js-check-answer-btn');
      const answerEl = cardEl.querySelector('.js-revision-answer');
      const answerResponseEl = cardEl.querySelector('.js-session-answer-response');
      const toolbarEl = cardEl.querySelector('.js-revision-action-toolbar');

      checkAnswerBtnEl.addEventListener('click', () => {
        answerEl.classList.remove('d-none');
        toolbarEl.classList.remove('d-none');

        checkAnswerBtnEl.classList.add('d-none');
        answerResponseEl.disabled = true;
      });
    });
    // // Do whatever you need to do here. Get as spaghetti western as
    // // you want and refactor later.

    // // You can find elements within the element too.
    // // Use the El suffix on variable names that reference an element.
    // const buttonEl = this.el.querySelector('.js-button');

    // // Add event listeners.
    // buttonEl.addEventListener('click', this.onButtonClick);
  }

  synchronizeCardsWithStep() {

  }

  onNextCard() {
    const currentCard = this.cardEls[this.currentStep];
    currentCard.style.transform = 'translateX(5000px) rotate(20deg) translateY(-1000px)';

    this.currentStep ++;

    if (this.currentStep < this.cardEls.length) {
      const newCurrentCard = this.cardEls[this.currentStep];
      // newCurrentCard.style.transform = 'rotate(0)';
    }
    else {
      this.finalCardEl.classList.remove('d-none');
    }

    console.log(this.currentStep);
    console.log(this.cardEls.length);
  }

  // Events. Make sure this are all bound in the constructor.
  onButtonClick(e) {
    e.preventDefault();

    alert('Clicked button!');
  }
}
