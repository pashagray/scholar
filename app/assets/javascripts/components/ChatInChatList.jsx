const ChatInChatList = ({ id, title, unread, lastMessage, selected, handleClick }) => (
  <a onClick={(e) => handleClick(id, e)} href="" className={`ChatInChatList list-group-item list-group-item-action flex-column align-items-start ${selected ? "active" : ""}`}>
    <div className="d-flex w-100 justify-content-between">
      <p className="mb-1">{title}</p>
      <small><span className="badge badge-danger">{unread > 0 ? unread : null}</span></small>
    </div>
    <p className="mb-1"><small>{lastMessage}</small></p>
  </a>
)
