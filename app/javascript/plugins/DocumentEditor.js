/*
  Example safe-executing JS script for Lewagon.
  packs/plugins/myPlugin.js
*/

export const initDocumentEditor = (selector) => {
  const elements = Array.from(document.querySelectorAll(selector));
  return elements.map(el => new DocumentEditor(el));
};

class DocumentEditor {
  // Keep the constructor lean, don't add anything more to this.
  constructor(el) {
    this.el = el;

    this.inputEl = el.querySelector('.js-notes-input');
    this.displayEl = el.querySelector('.js-notes-display');

    // Bind event listener methods to class.
    this.onInputUpdate = this.onInputUpdate.bind(this);

    this.init();
  }

  init() {
    this.inputEl.addEventListener('keyup', this.onInputUpdate);
    this.onInputUpdate();
  }

  // Events. Make sure this are all bound in the constructor.
  onInputUpdate() {
    let displayHtml = '';

    const concepts = this.inputEl.value.split("\n\n\n");

    concepts.forEach(concept => {
      displayHtml += `<div class="document-editor-concept">${concept}</div>`;
    });

    this.displayEl.innerHTML = displayHtml;
  }
}
