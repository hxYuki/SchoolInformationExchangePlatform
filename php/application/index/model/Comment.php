<?php
namespace app\index\model;
use think\Model;

class Comment extends Model
{
    /**
     * this return array of comments on specific seller
     * @author ORIGIN
     * @param int the seller's ID
     * @return array the comments which is not deleted
     */
    public function getComments($sellerId)
    {
        $map=[
            'on_id'=>$sellerId,
            'is_del'=>0
        ];
        $comments=$this
            ->table('sp_user_comments')
            ->where($map)
            ->select();

        return $comments;
    }
    /**
     * this used to publish a comment
     * @author ORIGIN
     * @param int the commented one's ID
     * @param array comment's information
     * @return int 1 for success, 0 for fault
     */
    public function putComments($sellerId,$infos)
    {
        $data=[
            'comment_on_id'=>$sellerId,
            'comment_from_id'=>$infos['from'],
            'comment'=>$infos['content']
        ];
        return $this->table('dl_seller_comment')->insert($data);
    }
    /**
     * this delete a comment(this won't actually delete it in database, but set the flag to deleted)
     * @author ORIGIN
     * @param int the comment's ID
     * @return int 1 for success, 0 for fault
     */
    public function delComments($commentId)
    {
        $m['comment_id']=$commentId;
        $act['is_del']=1;
        
        return $this->table('dl_seller_commnent')->where($m)->update($act);
    }
    /**
     * this add reply on a comment
     * @author ORIGIN
     * @param int the comment's ID
     * @param array a collects of sent infomation, e.g.:
     *              index: replyer_id       is the one's ID which replies this comment
     *              index: replyed_id       is the one's ID which is replied
     *              index: reply_comment    is the one's reply on the comment
     * @return int 1 for success, 0 for fault
     */
    public function replyComment($commentId,$replyInfo)
    {
        $map=[
            'comment_id'=>$commentId,
        ];
        $d=[
            'reply_on_id'=>$commentId,
            'reply_from_id'=>$replyInfo['replyer_id'],
            'reply_to_id'=>$replyInfo['replyed_id'],
            'reply'=>$replyInfo['reply_content']
        ];
        $hasReply=$this->table('dl_seller_comment')->field('comment_has_reply')->where($map)->find();
        if($hasReply['comment_has_reply']==0)
            $this->table('dl_seller_comment')->where($map)->setInc('commeny_has_reply');
        
        return $this->table('dl_seller_comment_reply')->insert($d);
    }
}
