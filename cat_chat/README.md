#Cat Chat
##Description
I was part of a three-person team that created a chat application. I wrote the backend for our application, which is the code in this repository. To use the chat application, go <a href="http://KeithReynoldsWorld.github.io"> here</a>.

Trello: <a href="https://trello.com/b/Kfe43YYp/team-number-one">Here</a>

Hackpad: <a href="https://hackpad.com/Team-Number-One-m4KVoajsYKX">Here</a>
##Features
- Usernames
- All messages can be seen by other users in real time
- Timestamped messages
- Basic swear word filter
- Multiple chatrooms
- Statistics about top chatroom, active users, and top ten users
- A chatbot that responds when users type "amiright", "is anyone here?", "meow", and "woof."

##Instructions
###To make a new message:
- Send a `POST` request to https://cat-chat-1.herokuapp.com/messages as a JSON object with the following parameters:

```
	 user: "string"
	 chatroom: "string"
	 message: "text"
```
- The response will be in JSON format with the following parameters:

```
	 id: integer
	 user: "string"
	 chatroom: "string"
	 message: "text"
	 created_at: timestamp
```
	
###To view all messages:
- Send a `GET` request to https://cat-chat-1.herokuapp.com/messages. The response will be in JSON format with the following parameters:

```
	 id: integer
	 user: "string"
	 chatroom: "string"
	 message: "text"
	 created_at: timestamp
```
###To view all messages from a particular chatroom
- Send a `GET` request to https://cat-chat-1.herokuapp.com/chatrooms/<chatroom_name>. The response will be in JSON format with the following parameters.

```
	 id: integer
	 user: "string
	 message: "text"
	 created_at: timestamp
```

###To view the statistics:
- Send a `GET` request to https://cat-chat-1.herokuapp.com/stats. The response will be in the following format:

```
{
	topTenUsers: [ 
		{
			user: "string",
			message_count: integer
		}
	],
	mostPopularChatroom: {
		name: "string",
		message_count: integer
	},
	recentlyActiveUsers: [
		"name",
		"name",
		"name"
	]
}
```
###To create a new chatroom:
- Send a `POST` request to https://cat-chat-1.herokuapp.com/chatrooms/create with the parameter of "name" as a string

###To view a list of chatrooms:
- Send a `GET` request to https://cat-chat-1.herokuapp.com/chatrooms. The response will be an array of chatroom names as strings.

###To view a list of users:
- Send a `GET` request to https://cat-chat-1.herokuapp.com/users. The response will be in JSON format with the following parameters:

```
		id: integer,
		name: "string",
		created_at: timestamp,
		updated_at: timestamp
```

###To view all messages from a specific user:
- Send a `GET` request to https://cat-chat-1.herokuapp.com/users/user_name. The response will be in JSON format with the following parameters:

```
{
    name: "string",
    messages: [
        {
            message: "string",
            chatroom: "string",
            created_at: timestamp
        }
    ]
}
```