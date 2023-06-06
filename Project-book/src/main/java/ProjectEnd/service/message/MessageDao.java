package ProjectEnd.service.message;

import ProjectEnd.entities.Message;

import java.util.List;

public interface MessageDao {
    public boolean insertMessage(Message message);
    public List<Message> getMessage(Integer offset, Integer maxResult);
    public Long totalMessage();
    public Message getMessageById(Long messId);
    public boolean updateMessage(Message message);
    public boolean deleteMessage(Long messId);

}
