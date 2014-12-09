import * as NProgress from 'nprogress';
import * as $ from 'jquery';

NProgress.configure({ showSpinner: false });

$(document).on('page:fetch',    function() { NProgress.start();  });
$(document).on('page:change',   function() { NProgress.done();   });
$(document).on('page:restore',  function() { NProgress.remove(); });
