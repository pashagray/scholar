class AssignSupervisorToStudyGroup extends React.Component {

  constructor(props) {
    super(props);
    this.id = `assign-supervisor-to-study-group-${this.props.study_group_id}`
    this.inputId = `${this.id}-input`
    this.state = { query: '' }
    this.handleInputChange = this.handleInputChange.bind(this);
  }

  handleInputChange(e) {
    this.setState({query: e.target.value});
  }

  renderUsers() {
    return(
      <div>
        <div className="text-center">
          <p>
            <b>Учителя</b>
          </p>
        </div>
        {this.props.users.map(user => 
          <UserInList 
            key={user.id}
            user={user}
            href={`/admin/study_groups/${this.props.study_group_id}/assign_supervisor?user_id=${user.id}`}
          />) 
        }
      </div>
    ) 
  }

  renderNothing() {
    return(
      <div className="alert alert-warning text-center" style={{ marginBottom: 0 }}>
        <h2>
          <i className="fa fa-child" />
        </h2>
        <p>Некого добавлять. Не найдено ни одного учителя в школе.</p>
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
                {this.props.users.length > 0 ? this.renderUsers() : this.renderNothing()}
              </div>
            </div>
          </div>
        </div>
        <button 
          className="btn btn-primary float-right"
          data-target={`#${this.id}`}
          data-toggle="modal"
          type="button"
        >
          <i className="fa fa-plus"></i>
        </button>
      </div>
    )
  }
}