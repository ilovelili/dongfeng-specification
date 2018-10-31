FORMAT: 1A

HOST: `https://apis.dongfeng.com/`

# DongFeng Project - Growth Profile

The API Specification for DongFeng project (Growth profile web application). Both parents and teachers have the access to growth profile. However we don't have features for parents in phase I.

## Login [/login]

### Login with the JWT [POST]

Authenticate as a user with the JWT as the credentials. It should return the data for the authenticated user.

* Request (application/json)
  * Headers
      Accepts: application/json
      Authorization: Bearer XYZDSFDSF

* Response 200 (application/json)
    {
      "id": 1,
      "user": {
        "name": "HuHu Cat",
        "email": "huhucat@gmail.com",
        "avatar": "/img/profile.jpg",
        "newuser": false,
        "role": "teacher"
      },
      "teachers_online": 2,
      "notifications": {
        "count": 13,
        "admin": [
          {
            id: 12,
            notification_code: N0001,
            title: "关于2018年入学名单公布的通知",
            content: "内容略"
            time: "2018-06-16T00:00:00.000Z"
          },
          {
            id: 13,
            notification_code: N0001,
            title: "停电通知",
            content: "内容略"
            time: "2018-06-16T00:00:00.000Z"
          }
        ]
        "teacher": [
          {
            id: 27,
            user_id: "ABCDEFGHIJK",
            notification_code: N1001,
            title: "今天去旅游咯",
            time: "2018-06-15T00:00:00.000Z"
          }
        ],
        "user": [
          {
            id: 69,
            user_id: "AAABBBCCCDD",
            notification_code: N1001,
            title: "第一次做手工课，有点紧张",
            time: "2018-06-15T00:00:00.000Z"
          }
        ]
      }
    }

### Update the user [PUT]

Change and persist the user data.

* Request (application/json)
  * Headers
      Accepts: application/json
      Authorization: Bearer XYZDSFDSF
  * Body
      {
        id: 1,
        name: "HuHu Cat",
      }

* Response 200 (application/json)
  * Body
      {
        status: "updated"
      }

## Upload [/upload/]

### Update the user avatar [POST]

Create a permanent link for an image and return it to the user. The final image will be cropped to fit into a square with the smallest of the sides.

* Request (application/json)
  * Headers
          Accepts: application/json
          Authorization: Bearer XYZDSFDSF
  * Body
    {
      "image": "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAA ..."
    }

* Response 200 (application/json)
  * Body
    {
      url: "...alicloud.com/xxx.png"
    }

## Logout [/logout]

### Logout completely [POST]

Remove the user session from the back-end and send them to the homepage.

* Request (application/json)
  * Headers
      Accepts: application/v1+json
      Authorization: Bearer XYZDSFDSF

* Response 200 (application/json)
  * Body
    {
      "logout": true
    }

## Growth Profiles [/growthprofile/{uid}]

### Get templates. [GET]

Retrieve growth profile templates.

* Request (application/json)
  * Headers
      Accepts: application/json
      Authorization: Bearer XYZDSFDSF
  * Body
    {
      "limit": 10 // optional. How many data rows return
    }

* Response 200 (application/json)
    [
      {
        id: 1,
        title: "Light",
        content: "html content"
      },
      {
        id: 2,
        title: "Dark",
        content: "html content"
      },
      {
        id: 3,
        title: "Rainbow",
        content: "html content"
      },
    ]

### Get growth profile list. [GET]

Retrieve the growth profile list published by the user.

* Request (application/json)
  * Headers
      Accepts: application/json
      Authorization: Bearer XYZDSFDSF
    {
      "id": 60, // user id
      "limit": 10 // optional. How many data rows return
    }

* Response 200 (application/json)
    [
      {
        id: 60,
        title: "第一次做手工课，有点紧张",
        content: "html content",
        template_id: 10, // growth profile template
        time: "2018-06-15T00:00:00.000Z"
      },
      {
        id: 27,
        title: "今天去旅游咯",
        content: "html content",
        template_id: 11,
        time: "2018-06-15T00:00:00.000Z"
      }
    ]

### Create growth profile list of a user. [POST]

* Request (application/json)
  * Headers
      Accepts: application/json
      Authorization: Bearer XYZDSFDSF
    {
      {
        id: 60, // user id
        title: "第一次做手工课，有点紧张",
        content: "html content",
        template_id: 10
      }
    }

* Response 200 (application/json)
    {
        template_id: 13
        status: "created"
    }

### Update / Delete growth profile list of a user. [PUT]

* Request (application/json)
  * Headers
      Accepts: application/json
      Authorization: Bearer XYZDSFDSF
    {
      {
        id: 60,
        title: "第一次做手工课，有点紧张",
        content: "html content",
        template_id: 10
        enabled: false
      }
    }

* Response 200 (application/json)
  {
    template_id: 13
    status: "updated"
  }
