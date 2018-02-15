class ChatContainer extends React.Component {

  constructor(props) {
    super(props);
    this.state = { loading: true, messages: [], id: props.id }
  }

  componentDidMount() {
    this.loadMessages()
  }

  componentDidUpdate() {
    if(this.props.id !== this.state.id)
      this.loadMessages()
  }

  loadMessages() {
    this.setState({ loading: true, messages: [], id: this.props.id })
    fetch(`/my/chats/${this.props.id}/messages`, {
      credentials: 'include'  
    }).then(res => res.json())
    .catch(error => console.error('Error:', error))
    .then(res => this.setState({loading: false, messages: res}));
  }

  render() {
    const { currentUserId } = this.props;
    const { id, loading, messages } = this.state
    return(
      <div className="Chat">
       { loading ? <LoadingChat /> : <Chat handleMount={this.props.handleUpdate} handleNewMessage={this.props.handleNewMessage} id={id} currentUserId={currentUserId} messages={messages} /> }
      </div>
    )
  }
}
