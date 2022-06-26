<?php
require_once('tpl/header.php');
?>
<?php
include '../system/dbConn.php';
$res=mysqli_query($conn,"select * from comments");

?>
    <form>
        <h1 align="center">留言列表</h1>
    <table class="table">
       <tr>
           <th>序号</th>
           <th>内容</th>
           <th>评论人</th>
           <th>发表时间</th>
           <th>操作</th>
       </tr>
        <?php
        while ($row=mysqli_fetch_assoc($res)) {
            ?>
         <tr>
             <td>
                 <?php echo $row['cid'] ?>
             </td>
             <td>
                 <?php echo $row['content'] ?>
             </td>
             <td>
                 <?php
                 $uid=$row['uid'];
                 $usrs=mysqli_fetch_assoc(mysqli_query($conn,"select * from users WHERE uid='$uid'"));
                 echo $usrs['uname'] ?>
             </td>
             <td>
                 <?php echo $row['cdate'] ?>
             </td>
             <td>
                 <a href="docommentdelete.php?cid=<?php echo $row['cid'] ?>">删除</a>
             </td>
         </tr>
            <?php
        }
            ?>
    </table>
    </form>

<?php
require_once('tpl/footer.php');
?>