/**
 * ITCAST WEB
 * Created by zhousg on 2016/5/3.
 */
window.onload = function(){
    /*
    * 1.��ʾ������
    * 2.������
    * 3.ɾ��������Ҫ��
    * 4.���ȡ����ť  �ر�  ������
    * */


    /*��ȡ������*/
    var hmWin = document.querySelector('.hm_win');
    /*��ȡ��*/
    var hmWinBox = hmWin.querySelector('.hm_win_box');
    /*��ȡ���е�ɾ����ť*/
    var deleteList = document.querySelectorAll('.deleteBox');

    /*��¼��ǰ������ǰ�����ť*/
    var deleteBtn = null;

    for(var i = 0 ; i < deleteList.length ; i ++){
        deleteList[i].onclick = function(){
            /*1.��ʾ������*/
            hmWin.style.display = "block";
            /*2.������*/
            hmWinBox.classList.add('bounceInDown');
            /*ɾ��������Ҫ��*/
            console.log(this);

            deleteBtn = this;
            var up = deleteBtn.querySelector('.up');
            console.log(up);
            /*�ӹ���*/
            up.style.webkitTransition = "all 1s";
            up.style.transition = "all 1s";
            /*������תԭ��*/
            up.style.webkitTransformOrigin = "0 5px";
            up.style.transformOrigin = "0 5px";
            /*�Ӹı�*/
            up.style.webkitTransform = "rotate(-30deg) translateY(2px)";
            up.style.transform = "rotate(-30deg) translateY(2px)";
        }
    }

    /*4.���ȡ����ť  �ر�  ������*/
    hmWinBox.querySelector('.cancel').onclick = function(){
        hmWin.style.display = "none";
        hmWinBox.classList.remove('bounceInDown');

        /*��ǰ�����*/
        if(deleteBtn){
            var up = deleteBtn.querySelector('.up');
            up.style.webkitTransform = "none";
            up.style.transform = "none";
        }
    }

};
