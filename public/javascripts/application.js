// (function($) {
//   $.ajaxSettings.accepts.html = $.ajaxSettings.accepts.script;
//   
//   $.authenticityToken = function() {
//     return $('#authenticity-token').attr('content');
//   };
//   
//   $(document).ajaxSend(function(event, request, settings) {
//     if (settings.type == 'post') {
//       settings.data = (settings.data ? settings.data + "&" : "")
//           + "authenticity_token=" + encodeURIComponent($.authenticityToken());
//       request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
//     }
//   });
// })(jQuery);
// 
// 
// (function($) {
//   $('form').live('change', function(e) {
//     alert('here')
//   });
// })(jQuery);
