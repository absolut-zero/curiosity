import "bootstrap";
import $ from 'jquery';
import "selectize"
import "../plugins/flatpickr"

import { initDocumentEditor } from '../plugins/DocumentEditor';

import { initRevisionSession } from '../plugins/RevisionSession';

import { toggleNavmenu } from '../plugins/navmenu';
import { selectize } from '../plugins/selectize';
import 'select2/dist/css/select2.css';

import { initSelect2 } from '../plugins/init_select2';

initSelect2();

toggleNavmenu();

selectize();

initRevisionSession('.js-revision-session');
import { collapsibleContent } from '../plugins/collapsible';
collapsibleContent();

function addAutoResize() {
  document.querySelectorAll('textarea').forEach(function (element) {
    element.style.boxSizing = 'border-box';
    var offset = element.offsetHeight - element.clientHeight;
    element.style.height = 'auto';
    element.style.height = element.scrollHeight + offset + 'px';
  });
}

addAutoResize();

initDocumentEditor('.js-document-editor');
