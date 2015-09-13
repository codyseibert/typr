angular.module("typr").run(["$templateCache", function($templateCache) {$templateCache.put("upload/upload.html","\n<div class=\"row\">\n  <div class=\"col-sm-12 centered\">\n    <h1>Upload Your Code</h1>\n  </div>\n  <div class=\"col-md-6 col-md-push-3 col-md-pull-3\">\n    <typr-upload></typr-upload>\n  </div>\n</div>");
$templateCache.put("upload/upload_directive.html","\n<div class=\"col-sm-12 centered\">\n  <textarea ng-model=\"code\"></textarea>\n</div>\n<div class=\"col-sm-12 centered\">\n  <button ng-click=\"hasCode() &amp;&amp; upload()\" ng-class=\"{disabled: !hasCode()}\" ng-diabled=\"!hasCode()\" class=\"col-sm-12 btn btn-primary\">Upload You Code</button>\n</div>");
$templateCache.put("typing/typing.html","\n<div class=\"row\">\n  <div class=\"col-sm-12 centered\">\n    <h1>Type Your Code!</h1>\n  </div>\n  <div class=\"col-md-6 col-md-push-3 col-md-pull-3 centered\">\n    <typr-typing></typr-typing>\n  </div>\n</div>");
$templateCache.put("typing/typing_directive.html","\n<input autofocus=\"autofocus\" ng-blur=\"blur()\" ng-model=\"text\" ng-keypress=\"keypress($event)\" class=\"type\"/>\n<div class=\"code\"></div>");}]);