class Chat extends React.Component {

  constructor(props) {
    super(props);
    this.state = { messages: props.messages, value: "", inputHeight: "60px" }
    this.addMessage = this.addMessage.bind(this)
    this.scrollToBottom = this.scrollToBottom.bind(this)
    this.handleInputChange = this.handleInputChange.bind(this)
  }

  componentDidMount() {
    const { id, handleMount } = this.props;
    // this.scrollToBottom();
    handleMount(id);
    this.setupSubscription(id, this);
  }

  componentWillUnmount() {
    App.chat.unsubscribe();
  }

  componentDidUpdate() {
    this.scrollToBottom();
  }

  handleInputChange(e) {
    this.setState({ value: e.target.value })
  }

  handleEnterPress(e) {
    if (e.key === 'Enter') {
      this.submitMessage()
    }
  }

  addMessage(data) {
    this.setState({ messages: [...this.state.messages, data.message] })
    this.props.handleNewMessage(data.message)
  }

  submitMessage(e) {
    e.preventDefault()
    if(this.state.value.length === 0) { return }
    fetch(`/my/chats/${this.props.id}/add_message`, {
      body: JSON.stringify({content: this.state.value}),
      cache: 'no-cache',
      credentials: 'same-origin',
      headers: {
        'content-type': 'application/json'
      },
      method: 'POST'
    }).then(response => response.json())
    .catch(error => console.error('Error:', error))
    .then(res => this.setState({value: ""}));
  }

  setupSubscription(id, comp) {
    App.chat = App.cable.subscriptions.create({ channel: "ChatChannel", id: id }, {
      connected() {},

      disconnected() {},

      received(data) {
        comp.addMessage(data)
      }
    });
  }

  scrollToBottom() {
    this.chatBottom.scrollIntoView({ behaviour: 'smooth' })
  }

  renderMessages() {
    const { messages } = this.state;
    return(
      <div className="Chat">
        <ChatBar />
        <div className="ChatView">
          <div className="ChatMessages">
            {messages.map(m => <MessageInChat current={m.user_id === this.props.currentUserId} key={m.id} {...m} /> )}
          </div>
          <div ref={(el) => { this.chatBottom = el }}></div>
        </div>
        <form onSubmit={(e) => this.submitMessage(e)}>
          <div className="row">
            <div className="col-md-9">
              <textarea style={{height: this.state.inputHeight}} className="form-control" value={this.state.value} onChange={this.handleInputChange} />
            </div>
            <div className="col-md-3">
              <button style={{height: this.state.inputHeight}} className="btn btn-primary btn-block">Отправить</button>
            </div>
          </div>
        </form>
      </div>
    )
  }

  renderEmpty() {
    return(
      <div className="alert alert-info text-center">
        <h2><i className="fa fa-comment"></i></h2>
        <p>Сообщений еще нет. Начните первым!</p>
        <div ref={(el) => { this.chatBottom = el }}></div>
      </div>
    )
  }

  render() {
    return this.props.messages.length > 0 ? this.renderMessages() : this.renderEmpty()
  }
}