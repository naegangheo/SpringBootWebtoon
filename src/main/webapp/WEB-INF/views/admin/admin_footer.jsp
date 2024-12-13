<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<footer>
    <hr>
    <div class="copy">
        All contents Copyright 2021  NGHeo.co  Inc. all rights reserved<br>
        Contact mail : abc@abc.com  Tel : +82 02 1234 1234	Fax : +82 02 1233 1233 &nbsp;
    </div>
</footer>
<!-- <%--  여기까지 footer  --%> -->
</body>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const toggleHeaders = document.querySelectorAll('.toggle-header');

        toggleHeaders.forEach(header => {
            header.addEventListener('click', function () {
                const targetId = this.getAttribute('data-target');
                const content = document.getElementById(targetId);

                document.querySelectorAll('.toggle-content.visible').forEach(el => {
                    if (el !== content) {
                        el.classList.remove('visible');
                    }
                });

                content.classList.toggle('visible');
            });
        });
    });
</script>

</html>