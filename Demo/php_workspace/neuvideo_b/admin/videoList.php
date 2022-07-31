<?php
require_once('tpl/header.php');
?>
<?php
include '../system/dbConn.php';
$res=mysqli_query($conn,"select * from video");
$num=mysqli_num_rows($res);
if (!isset($_GET['page'])){
    $page=1;
}else{
    $page=$_GET['page'];
}
//分移量
$rowpage=5;
if ($num==0){
    echo '无记录';
    exit;
}

if ($num%$rowpage==0){
    $totalpages=$num/$rowpage;
}else{
    $totalpages=ceil($num/$rowpage);
}
$start=($page-1)*$rowpage;
?>

    <table class="table table-bordered">
      <tr>
          <th>序号</th>
          <th>视频名称</th>
          <th>类别</th>
          <th>添加时间</th>
          <th>海报</th>
          <th>操作</th>
      </tr>
        <?php
        if (isset($_GET['key'])){
            $key=trim($_GET['key']);
            $sql="select * from video WHERE videoname LIKE '%{$key}%' limit $start,$rowpage";
        }
        else{
            $sql="select * from video  limit $start,$rowpage";
        }
        $result=mysqli_query($conn,$sql);
        while ($row=mysqli_fetch_assoc($result)) {
            ?>
            <tr>
            <td>
                <?php echo $row['vid'] ?>
            </td>
                <td>
                    <?php echo $row['videoname'] ?>
                </td>
                <td>
                    <?php
                    $tid=$row['tid'];
                    $sql1="select * from videotype WHERE tid='$tid'";
                    $date=mysqli_query($conn,$sql1);
                    $row1=mysqli_fetch_assoc($date);
                    echo $row1['typename'];

                     ?>
                </td>
                <td>
                    <?php echo $row['uploaddate'] ?>
                </td>
                <td>
                    <img width="60px" height="60px" src="pic/<?php echo $row['pic'] ?>" title="<?php echo $row['intro'] ?>">

                </td>
                <td>
                    <a href="videoEdit.php?vid=<?php echo $row['vid'] ?>">修改</a>|<a href="videoDelete.php?vid=<?php echo $row['vid'] ?>">删除</a>
                </td>
            </tr>
            <?php
        }
            ?>
    </table>
    <table align="center" width="70%">
        <tr>
            <td colspan="8" align="center">

                <?php
                echo "共".$num."条记录 分".$totalpages."页 ";
                if (isset($_GET['key'])){
                    $key=$_GET['key'];
                }

                if ($page>1){
                    $first="<a href=?page=1>首页</a>";
                    $pre="<a href=?page=".($page-1).">上一页</a>";
                }else{
                    $first='首页';
                    $pre='前一页';
                }
                if ($page<$totalpages){
                    $last="<a href=?page=$totalpages>尾页</a>";
                    $next="<a href=?page=".($page+1).">下一页</a>";
                }else{
                    $last='尾页';
                    $next='下一页';
                }
                echo $first."&nbsp;".$pre."&nbsp;";
                for ($i=1;$i<=$totalpages;$i++){
                    echo "<a href=?page={$i}>&nbsp;第{$i}页&nbsp;</a>";

                }
                echo  $last."&nbsp;".$next."&nbsp;";
                ?>

            </td>
        <tr>
            <td align="center">
                <form action="" method="get">
                    <input type="text" name="key" >
                    <input type="submit" value="搜索">
                </form>
            </td>
        </tr>

        </tr>
    </table>


<?php
require_once('tpl/footer.php');
?>