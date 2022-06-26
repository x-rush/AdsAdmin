<?php
require_once('tpl/header.php');
?>

    <form class="form-inline" action="doadd_type.php" method="post">
        <div class="form-group">
            <label class="sr-only" for="exampleInputAmount">视频种类</label>
            <div class="input-group">
                <div class="input-group-addon">视频</div>
                <input type="text" name="typename" class="form-control" id="exampleInputAmount" >
                <div class="input-group-addon">种类</div>
            </div>
        </div>
        <button type="submit" class="btn btn-primary">添加</button>
    </form>


<?php
require_once('tpl/footer.php');
?>