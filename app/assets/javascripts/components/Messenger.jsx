class Messenger extends React.Component {

  constructor(props) {
    super(props);
    this.state = { currentChatId: null, chats: props.chats }
    this.handleChatClick = this.handleChatClick.bind(this);
    this.handleNewMessage = this.handleNewMessage.bind(this);
    this.resetUncount = this.resetUncount.bind(this);
    this.handleAddChat = this.handleAddChat.bind(this);
  }

  resetUncount(chatId) {
    const chats = this.state.chats
    const newChats = chats.map(chat => chat.id === chatId ? {...chat, unread: 0} : chat)
    this.setState({ chats: newChats })
    count = newChats.reduce((a, o, i, p) => a + o.unread, 0)
    if(count > 0)
      $(".messages-count").html(count)
    else
      $(".messages-count").remove()
  }

  handleChatClick(id, e) {
    e.preventDefault()
    this.setState({ currentChatId: id })
  }

  handleNewMessage(message) {
    const chatId = message.chat_id
    const chats = this.state.chats
    this.setState({ chats: chats.map(chat => chat.id === chatId ? {...chat, last_message: message.content } : chat) })
  }

  handleAddChat(chat) {
    this.setState({ chats: [chat, ...this.state.chats], currentChatId: chat.id })
  }

  render() {
    const { currentUserId, users } = this.props
    const { currentChatId, chats } = this.state
    return(
      <div className="Messenger">
        <div className="row">
          <div className="col-md-4">
            {/*<Button text="Новый чат" handleClick={() => console.log('Clicked')} />*/}
            <CreateChat handleAddChat={this.handleAddChat} users={users} />
            <ChatList chats={chats} selectedId={currentChatId} handleChatClick={this.handleChatClick} />
          </div>
          <div className="col-md-8">
            {currentChatId ? <ChatContainer handleNewMessage={this.handleNewMessage} handleUpdate={this.resetUncount} currentUserId={currentUserId} id={currentChatId} /> : <EmptyChat />}
          </div>
        </div>
      </div>
    )
  }
}
