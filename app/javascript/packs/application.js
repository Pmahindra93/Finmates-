// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import "../plugins/enter_submit";
import "../plugins/active_sidemenu";
import "../plugins/trix_uploads";




// External imports
import "bootstrap";
import $ from 'jquery';
global.$ = jQuery;
$('.carousel').carousel({
 interval: 4000
})


// document.addEventListener('turbolinks:load', () => {
//   // Call your functions here, e.g:
//   // initSelect2();
