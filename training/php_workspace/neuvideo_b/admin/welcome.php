<?php
require_once('tpl/header.php');
?>
    <h1>欢迎管理员:<?php
        session_start();
        echo $_SESSION["adminname"];
        ?>访问视频信息管理系统</h1>

<?php
require_once('tpl/footer.php');
?>