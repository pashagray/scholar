class AdminScheduleSelector extends React.Component {

  constructor(props) {
    super(props);
  }

  render() {
    return(
      <div className="form-group">
        <select className="form-control">
          { this.props.academic_periods.map(ap => <option value={ap.id}>{ap.title}</option>) }
        </select>
      </div>
    )
  }
}