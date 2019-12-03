import "bootstrap";
import $ from 'jquery';
import "selectize"
import "../plugins/flatpickr"

import { toggleNavmenu } from '../plugins/navmenu';
toggleNavmenu();

import { selectize } from '../plugins/selectize';
selectize();

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


