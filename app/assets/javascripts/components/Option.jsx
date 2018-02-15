const Option = ({ id, title, handleClick }) => (
  <a onClick={(e) => handleClick(id, e)} href="" className={"ChatInChatList list-group-item list-group-item-action flex-column align-items-start"}>
    <div className="d-flexjustify-content-between">
      <p className="mb-1">{title}</p>
    </div>
  </a>
)