const MessageInChat = ({ id, content, current, created_at }) => {
  return(
    <div>
      <div className={`MessageInChat ${current ? "current" : ""}`}>
        {content}
      </div>
      &nbsp;
      <small style={{ color: "gray", position: "relative", top: "9px" }}>{moment(created_at).calendar()}</small>
    </div>
  )
}
