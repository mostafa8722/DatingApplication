enum LoadState{
  loading,
  loaded,
  error,
  none,
}


enum UserState{
  login,
  logout
}

enum UserViewMode{
  show,
  editable
}

enum ActionMode{
  like,
  favorite,
  block,
  contact,
  likedMe,
  seenMyProfile,
}

enum MessageType{
  chat,
  file,
  kiss,
  gift,
  gif,
  date
}

enum MessageStatus{
  seen,
  sent,
  pending,
  error
}

enum CallStatus{
  ringing,
  calling,
  inCall,
  end,
  none,
}