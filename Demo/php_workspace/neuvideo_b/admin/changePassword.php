<?php
require_once('tpl/header.php');
?>

    <form action="dochangePassword.php" method="post">
        <div class="form-group">
            <label for="exampleInputEmail1">原密码</label>
            <input type="password" class="form-control" id="exampleInputEmail1" name="Password" placeholder="Password">
        </div>
        <div class="form-group">
            <label for="exampleInputPassword1">新密码</label>
            <input type="password" class="form-control" id="exampleInputPassword1" name="newPassword" placeholder="NewPassword">
        </div>
        <div class="form-group">
            <label for="exampleInputPassword1">再次输入新密码</label>
            <input type="password" class="form-control" id="exampleInputPassword1" name="rePassword" placeholder="RePassword">
        </div>
        <button type="submit" class="btn btn-default">提交</button>
    </form>


<?php
require_once('tpl/footer.php');
?>