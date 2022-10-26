<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<div class="container-fluid p-0">
      <footer id="footer" class="light">
        <div id="copyrights">
          <div class="container">
            <div class="row col-mb-30">
              <div class="col-md-6 text-center text-md-start">
                Copyrights &copy; 2022 All Rights Reserved by TripPlanDuck Inc.<br />
                <div class="copyright-links"><a href="#" id="termconditions" >이용약관</a> / <a href="#" id="privacy" >개인정보처리방침</a></div>
              </div>
              <div class="col-md-6 text-center text-md-end">
                <div class="d-flex justify-content-center justify-content-md-end">
                  <a href="#" class="social-icon si-small si-borderless si-facebook">
                    <i class="icon-facebook"></i>
                    <i class="icon-facebook"></i>
                  </a>
                  <a href="#" class="social-icon si-small si-borderless si-twitter">
                    <i class="icon-twitter"></i>
                    <i class="icon-twitter"></i>
                  </a>
                  <a href="tripplanduck@gmail.com" class="social-icon si-small si-borderless si-gplus">
                    <i class="icon-gplus"></i>
                    <i class="icon-gplus"></i>
                  </a>
                  <a href="https://github.com/yeorii/tripplanduck" class="social-icon si-small si-borderless si-github">
                    <i class="icon-github"></i>
                    <i class="icon-github"></i>
                  </a>
                </div>
                <div class="clear"></div>
                <i class="icon-envelope2"></i> info@TripPlanDuck.com <span class="middot">&middot;</span>
                <i class="icon-headphones"></i> +82-02-1234-5678
              </div>
            </div>
          </div>
        </div>
      </footer>
      <!-- #footer end -->
    </div>
    <!-- #wrapper end -->

    <!-- Go To Top -->
    <div id="gotoTop" class="icon-angle-up"></div>
    
    <!-- Bootstrap JS -->
    <script
      src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
      integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
      crossorigin="anonymous"
    ></script>
    
    <!-- jQuery js -->  
  	<script src="${ path }/js/common/jquery-3.6.0.min.js"></script>
    
    <!-- JavaScripts -->
    <script src="${ path }/js/common/plugins.min.js"></script>

    <!-- Footer Scripts -->
    <script src="${ path }/js/common/functions.js"></script>
    
    <!-- Channel Plugin Scripts -->
	<script>
	  (function() {
	    var w = window;
	    if (w.ChannelIO) {
	      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
	    }
	    var ch = function() {
	      ch.c(arguments);
	    };
	    ch.q = [];
	    ch.c = function(args) {
	      ch.q.push(args);
	    };
	    w.ChannelIO = ch;
	    function l() {
	      if (w.ChannelIOInitialized) {
	        return;
	      }
	      w.ChannelIOInitialized = true;
	      var s = document.createElement('script');
	      s.type = 'text/javascript';
	      s.async = true;
	      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
	      s.charset = 'UTF-8';
	      var x = document.getElementsByTagName('script')[0];
	      x.parentNode.insertBefore(s, x);
	    }
	    if (document.readyState === 'complete') {
	      l();
	    } else if (window.attachEvent) {
	      window.attachEvent('onload', l);
	    } else {
	      window.addEventListener('DOMContentLoaded', l, false);
	      window.addEventListener('load', l, false);
	    }
	  })();
	  ChannelIO('boot', {
	    "pluginKey": "b7214735-b11e-471f-b325-cdde97321fc7"
	  });
	</script>
	<!-- End Channel Plugin -->
	
<script>
	$(document).ready(function () {
		$('#privacy').click(function (e) {
			e.preventDefault();
			location.href = '${path}/common/privacy';
		});
		
		$('#termconditions').click(function (e) {
			e.preventDefault();
			location.href = '${path}/common/termconditions';
		});
		
	});
</script>
  </body>
</html>