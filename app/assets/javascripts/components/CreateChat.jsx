class CreateChat extends React.Component {

  constructor(props) {
    super(props);
    this.id = "create-chat"
    this.inputId = `${this.id}-input`
    this.state = { query: '', users: props.users }
    this.handleInputChange = this.handleInputChange.bind(this);
    this.handleOptionClick = this.handleOptionClick.bind(this);
    this.addChat = this.addChat.bind(this);
  }

  handleInputChange(e) {
    this.setState({query: e.target.value});
  }

  handleOptionClick(id, e) {
    e.preventDefault()
    $('#create-chat').modal('hide')
    fetch("/my/chats", {
      body: JSON.stringify({user_id: id}),
      cache: 'no-cache',
      credentials: 'same-origin',
      headers: {
        'content-type': 'application/json'
      },
      method: 'POST'
    }).then(response => response.json())
    .catch(error => console.error('Error:', error))
    .then(res => this.addChat(res.chat, id));
  }

  addChat(chat, userId) {
    this.props.handleAddChat(chat);
    this.setState({ users: this.state.users.filter(user => user.id !== userId ) })
  }

  renderUsers() {
    return(
      <div>
        <div className="text-center">
          <p>
            <b>Пользователи</b>
          </p>
        </div>
        <div className="list-group">
          {this.state.users.map(user => 
            <Option 
              key={user.id}
              id={user.id}
              title={`${user.last_name} ${user.first_name}`}
              handleClick={this.handleOptionClick}
            />) 
          }
        </div>
      </div>
    ) 
  }

  renderNothing() {
    return(
      <div className="alert alert-warning text-center" style={{ marginBottom: 0 }}>
        <h2>
          <i className="fa fa-child" />
        </h2>
        <p>Некого добавлять.</p>
      </div>
    )
  }

  render() {
    return(
      <div>
        <div
          id={this.id}
          className="modal fade"
          aria-hidden="true"
          tabIndex="-1" 
        >
          <div className="modal-dialog" role="document">
            <div className="modal-content">
              <div className="modal-body">
                {this.state.users.length > 0 ? this.renderUsers() : this.renderNothing()}
              </div>
            </div>
          </div>
        </div>
        <button 
          className="btn btn-outline-primary btn-block"
          data-target={`#${this.id}`}
          data-toggle="modal"
          type="button"
        >
        Создать новый диалог
        </button>
      </div>
    )
  }
}