package ProjectEnd.dao.comment;

import ProjectEnd.entities.Comment;

import java.util.List;

public interface CommentDAO {
    public  boolean insertComment(Comment comment);
    public List<Comment> getListComment(Integer offset, Integer maxResult);
    public Comment getCommentById(int commentId);
    public boolean deleteComment(int commentId);
    public List<Comment> getListCommentByProductId(int productId);
    public Long totalComment();
}
