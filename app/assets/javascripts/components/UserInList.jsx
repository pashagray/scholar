const UserInList = ({ href, user, handleClick }) => (
  <div className="user-in-list">
    <div className="user-avatar-in-list">
      <img src={user.avatar.thumb.url} />
    </div>
      {user.last_name} {user.first_name} {user.middle_name}
      <p>
        <small>
          <a 
            data-method="post"
            href={href}
          >Привязать к классу</a>
        </small>
      </p>
  </div>
)