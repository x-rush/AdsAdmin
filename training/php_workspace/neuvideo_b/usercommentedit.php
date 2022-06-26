<?php
require_once('tpl/head.php');
include_once('./system/dbConn.php');
//var_dump($_GET);
?>

<div class="container">

    <div class="row row-offcanvas row-offcanvas-right">

        <div class="col-xs-12 col-sm-9">

            <div class="row">

                <form action="docommentedit.php" method="post">
                <div class="col-xs-12 col-lg-12 mlist">
                    <div class="form-group">

                        <p class="form-control-static">评论内容</p>
                    </div>
                    <div class="form-group">
                        <input type="hidden" name="cid" value="<?php echo $_GET['cid'] ?>">
                        <input type="text" name="content" value="<?php
                        include 'system/dbConn.php';
                        $cid=$_GET['cid'];
                        $row=mysqli_fetch_assoc(mysqli_query($conn,"select * from comments WHERE cid='$cid'"));
                        echo $row['content'];
                        ?>" class="form-control" id="inputPassword2">
                    </div>
                    <button type="submit" class="btn btn-default">修改</button>
                </div>
                
                </form>
            </div>

        </div>
       
    </div>
 
    <script type="text/javascript">
        function edit() {
            $("#Edit_content");
        }
    </script>
</div>
<?php
require_once('tpl/foot.php');
?>
