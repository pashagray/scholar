class ChatList extends React.Component {
  render() {
    const { chats, handleChatClick, selectedId } = this.props;
    return(
      <div className="ChatList">
        <br/>
        <div className="list-group">
          {chats.map(chat => <ChatInChatList handleClick={handleChatClick} lastMessage={chat.last_message} selected={selectedId === chat.id} key={chat.id} {...chat} />)}
        </div>
      </div>
    )
  }
}
