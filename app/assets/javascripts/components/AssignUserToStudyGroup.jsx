class AssignUserToStudyGroup extends React.Component {

  constructor(props) {
    super(props);
    this.id = `assign-user-to-study-group-${this.props.study_group_id}`
    this.inputId = `${this.id}-input`
    this.state = { query: '' }
    this.handleInputChange = this.handleInputChange.bind(this);
  }

  handleInputChange(e) {
    this.setState({query: e.target.value});
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
                {/*<input
                  id={this.inputId}
                  className="form-control"
                  value={this.state.query}
                  onChange={this.handleInputChange}
                />
                <hr />*/}
                <div className="text-center">
                  <p>
                    <b>Ученики без класса</b>
                  </p>
                </div>
                {this.props.users.map(user => 
                  <UserInList 
                    key={user.id}
                    user={user}
                    href={`/admin/study_groups/${this.props.study_group_id}/assign_student?user_id=${user.id}`}
                  />) 
                }
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