var eventposted = 0

$("#enter_submit").keypress(function(event) {
  if (event.which == 13) {
    event.preventDefault();
    $("form").submit();
  }
});

$(document).ready(function () {
  $(".btn-comment").click(function (event) {
    event.preventDefault();
    $("form").submit();
  });
});


// $("#comment_form").on("submit",function() {
   // e.preventDefault(); // cancel submission
//    window.location.hash = "comment_form";
// });

