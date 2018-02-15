class ChatBar extends React.Component {

  constructor(props) {
    super(props);
  }

  render() {
    return(
      <div className="row">
        <div className="col-md-9">
        </div>
        <div className="col-md-3">
          <Button text="Общих файлов нет"/>
        </div>
      </div>
    )
  }
}
