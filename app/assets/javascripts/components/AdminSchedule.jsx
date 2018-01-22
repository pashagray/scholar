class AdminSchedule extends React.Component {

  constructor(props) {
    super(props);
  }

  render() {
    academic_periods = this.props.academic_periods;
    return (
      <div className="row">
        <div className="col-md-4">
          <AdminScheduleSelector academic_periods={academic_periods} />
        </div>
      </div>
    )
  }
}