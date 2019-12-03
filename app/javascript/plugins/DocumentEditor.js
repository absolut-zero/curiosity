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
    this.goto10El = el.querySelector('.js-go-to-10');

    // Bind event listener methods to class.
    this.onInputUpdate = this.onInputUpdate.bind(this);
    this.onDisplayClick = this.onDisplayClick.bind(this);

    this.init();
  }

  init() {
    this.inputEl.addEventListener('keyup', this.onInputUpdate);
    this.goto10El.addEventListener('click', () => {
      this.inputEl.focus();
      this.inputEl.selectionEnd = 10;
    })
    this.displayEl.addEventListener('click', this.onDisplayClick);
  }

  onDisplayClick(e) {
    const element = e.target;
    const characterIndex = element.dataset.characterIndex;
    this.inputEl.focus();

    if (!characterIndex) {
      return;
    }

    this.inputEl.selectionStart = characterIndex;
    this.inputEl.selectionEnd = characterIndex;
  }

  // Events. Make sure this are all bound in the constructor.
  onInputUpdate(e) {
    let displayHtml = '';

    let characterCounter = 0;

    const concepts = this.inputEl.value.split("\n\n\n");

    concepts.forEach(concept => {
      const conceptLines = concept.split("\n").map(conceptLine => {
        const characterSpans = conceptLine.split('').map(character => {
          characterCounter ++;

          return `<span data-character-index="${characterCounter}">${character}</span>`;
        });
        characterCounter ++;
        return `<div>${characterSpans.join('')}</div>`
      });

      characterCounter += 3;

      displayHtml += `<div style="margin-bottom: 20px; border-bottom: 4px solid grey; padding-bottom:20px">${conceptLines.join('')}</div>`;
    });

    this.displayEl.innerHTML = displayHtml;
  }
}
