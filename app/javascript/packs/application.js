import "bootstrap";
import $ from 'jquery';
import "selectize"
import "../plugins/flatpickr"
import { initRevisionSession } from '../plugins/RevisionSession';
import { toggleNavmenu } from '../plugins/navmenu';
import { selectize } from '../plugins/selectize';

toggleNavmenu();

selectize();


initRevisionSession('.js-revision-session');

function addAutoResize() {
  document.querySelectorAll('textarea').forEach(function (element) {
    element.style.boxSizing = 'border-box';
    var offset = element.offsetHeight - element.clientHeight;
    element.style.height = 'auto';
    element.style.height = element.scrollHeight + offset + 'px';
  });
}

addAutoResize();


