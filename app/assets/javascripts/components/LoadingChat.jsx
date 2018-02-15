class LoadingChat extends  React.Component {
  constructor(props) {
    super(props);
    this.state = { badConnection: false };
  }

  componentDidMount() {
    this.timeout = setTimeout(
      () => this.setState({ badConnection: true }), 300
    );
  }

  componentWillUnmount() {
    window.clearTimeout(this.timeout);
  }

  renderLoading() {
    return(
      <div className="LoadingChat">
        <div className="text-center">
          <i className="fa fa-refresh fa-spin"></i>
          &nbsp;
          <span>Загрузка сообщений</span>
        </div>
      </div>
    )
  }

  render() {
    return this.state.badConnection ? this.renderLoading() : <div />
  }
}


