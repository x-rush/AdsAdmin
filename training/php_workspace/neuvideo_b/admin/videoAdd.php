<?php
require_once('tpl/header.php');
?>
<?php
include '../system/dbConn.php';

$res=mysqli_query($conn,"select * from videotype");
?>
    <h1>请填写视频信息</h1>
    <form action="doVideoAdd.php" method="post" enctype="multipart/form-data">
    <table class="table table-bordered">
       <tr>
           <th>视频名称</th>
           <td>
                <input type="text" class="form-control" id="exampleInputPassword1" name="videoname" placeholder="videoname">
           </td>
       </tr>
        <tr>
            <th>视频类型</th>
            <td>
                <select class="form-control" name="videotype">
                    <?php
                    while ($row=mysqli_fetch_assoc($res)) {
                        ?>
                        <option value="<?php echo $row['tid'] ?>"><?php echo $row['typename'] ?></option>
                        <?php
                    }
                        ?>
                </select>
            </td>
        </tr>
        <tr>
            <th>视频海报</th>
            <td>
                <input type="file" class="form-control" id="exampleInputPassword1" name="pic" placeholder="videoname">
            </td>
        </tr>
        <tr>
            <th>视频简介</th>
            <td>
                <textarea class="form-control" rows="3" name="videointro"></textarea>
            </td>
        </tr>
        <tr>
            <th>下载地址</th>
            <td>
                <input type="text" class="form-control" id="exampleInputPassword1" name="videoaddress" placeholder="address">
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button type="submit" class="btn btn-default btn-lg active">添加</button>
                <button type="reset" class="btn btn-default btn-lg active">重置</button>
            </td>
        </tr>
    </table>
    </form>



<?php
require_once('tpl/footer.php');
?>