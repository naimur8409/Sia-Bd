<script src="{{asset('template')}}/assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="{{asset('template')}}/assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="{{asset('template')}}/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- apps -->
    <!-- apps -->
    <script src="{{asset('template')}}/dist/js/app-style-switcher.js"></script>
    <script src="{{asset('template')}}/dist/js/feather.min.js"></script>
    <script src="{{asset('template')}}/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="{{asset('template')}}/dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="{{asset('template')}}/dist/js/custom.min.js"></script>
    <!--This page JavaScript -->
    <script src="{{asset('template')}}/assets/extra-libs/c3/d3.min.js"></script>
    <script src="{{asset('template')}}/assets/extra-libs/c3/c3.min.js"></script>
    <script src="{{asset('template')}}/assets/libs/chartist/dist/chartist.min.js"></script>
    <script src="{{asset('template')}}/assets/libs/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
    <script src="{{asset('template')}}/assets/extra-libs/jvector/jquery-jvectormap-2.0.2.min.js"></script>
    <script src="{{asset('template')}}/assets/extra-libs/jvector/jquery-jvectormap-world-mill-en.js"></script>
    <script src="{{asset('template')}}/dist/js/pages/dashboards/dashboard1.min.js"></script>
    
@yield('script')
    <script type="text/javascript">
        $('.toast').toast('show');
        window.setTimeout(function() {
        $(".alert").fadeTo(500, 0).slideUp(500, function(){
            $(this).remove(); 
            });
        }, 2000);
    </script>
    