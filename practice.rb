# create a new Class, User, that has the following attributes:
# - name
# - email
# - password
# create a new Class, Room, that has the following attributes:
# - name
# - description
# - users

# create a new Class, Message, that has the following attributes:
# - user
# - room
# - content

# add a method to user so, user can enter to a room
# user.enter_room(room)
# add a method to user so, user can send a message to a room
# user.send_message(room, message)
# user.ackowledge_message(room, message)
# add a method to a room, so it can broadcast a message to all users
# room.broadcast(message)
class User
    attr_accessor :name, :email, :password
  
    def initialize(name, email, password)
      @name = name
      @email = email
      @password = password
      @rooms = []  
    end
  
    # add a method to user so, user can enter to a room
    def enter_room(room) # user.enter_room(room)
      room.add_user(self)
      @rooms << room unless @rooms.include?(room)
      puts "#{@name} has entered the room #{room.name}."
    end
  
    # add a method to user so, user can send a message to a room
    def send_message(room, content)# user.send_message(room, message)
      if @rooms.include?(room)
        message = Message.new(self, room, content)
        room.broadcast(message)
      else
        puts "Please join the room before sending a message."
      end
    end
  
    # user.ackowledge_message(room, message)
    def acknowledge_message(message)
      puts "#{@name} acknowledged message from #{message.user.name}: #{message.content}"
    end
  end
  
  class Room
    attr_accessor :name, :description, :users
  
    def initialize(name, description)
      @name = name
      @description = description
      @users = [] 
    end
  

    def add_user(user)
      @users << user unless @users.include?(user)
    end
  
    # room.broadcast(message)
    def broadcast(message)
      puts "Broadcasting message in room #{name}: #{message.content}"
      @users.each do |user|
        user.acknowledge_message(message)
      end
    end
  end
  
  class Message
    attr_accessor :user, :room, :content
  
    def initialize(user, room, content)
      @user = user
      @room = room
      @content = content
    end
  end
  
  # Create users
  user1 = User.new("Natasha", "Natasha.lert@bumail.net", "password555")
  user2 = User.new("cutie", "cutie.eiei@gmail.com", "passwordeiei123")
  
  # Create room
  room = Room.new("555", "A place for 555 discussions")
  
  user1.enter_room(room)
  user2.enter_room(room)
  
  user1.send_message(room, "Hello!")
  user2.send_message(room, "Hi!")
  