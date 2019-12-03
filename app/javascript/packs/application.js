import "bootstrap";
import $ from 'jquery';
import "selectize"
import "../plugins/flatpickr"
import 'select2/dist/css/select2.css';

import { toggleNavmenu } from '../plugins/navmenu';
toggleNavmenu();

import { selectize } from '../plugins/selectize';
selectize();

import { initSelect2 } from '../plugins/init_select2';

initSelect2();

function addAutoResize() {
  document.querySelectorAll('textarea').forEach(function (element) {
    element.style.boxSizing = 'border-box';
    var offset = element.offsetHeight - element.clientHeight;
    element.style.height = 'auto';
    element.style.height = element.scrollHeight + offset + 'px';
  });
}

addAutoResize();


