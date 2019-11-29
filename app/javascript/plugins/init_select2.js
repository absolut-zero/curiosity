import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
   $(document).ready(function() {
    $('.js-example-basic-multiple').select2({ width: '100%' });
});
 };



export { initSelect2 };
