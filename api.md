FORMAT: 1A

HOST: `http://188.166.244.244/api`

# DongFeng Project - Growth Profile

The API Specification for DongFeng project (Growth profile web application). Both parents and teachers have the access to growth profile. However we don't provide features for parents in phase I.

---

## Login with the JWT [/login] [POST]

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
        "avatar": "<https://www.gravatar.com/avatar/D077FC489D5587B5CFFE43DCEB9BA708?s=200>",
        "newuser": false,
        "role": "teacher"
      }
    }

## Get dashboard data [/dashboard] [GET]

Authenticate as a user with the JWT as the credentials. It should return the data for the authenticated user.

* Request (application/json)
  * Headers
      Accepts: application/json
      Authorization: Bearer XYZDSFDSF

* Response 200 (application/json)
    {
      "user_id": "AbcEdxayyedGs",
      "notifications": [
        {
          id: 12,
          user_id: "AgentSmith",
          custom_code: "N7001",
          category: "系统广播",
          details: "{\"title\":\"关于2018年入学名单公布的通知\",\"content\":\"内容略\"}",
          link: "<https://www.dongfeng.edu/notifications/123>",
          time: "2018-06-16T00:00:00.000Z"
        },
        {
          id: 13,
          user_id: "AgentSmith",
          custom_code: "N7001",
          category: "系统广播",
          details: "{\"title\":\"停电通知\",\"content\":\"内容略\"}",
          time: "2018-06-16T00:00:00.000Z"
        },
        {
          id: 14,
          user_id: "AbcEdxayyedGs",
          custom_code: "N1001",
          category: "成长档案",
          details: "{\"title\":\"第一次做手工课，有点紧张\",\"content\":\"内容略\"}",
          link: "<https://www.dongfeng.edu/growthprofile/1>",
          time: "2018-06-16T00:00:00.000Z"
        },
        {
          id: 14,
          user_id: "AbcEdxayyedGs",
          custom_code: "N1003",
          category: "成长档案",
          details: "{\"title\":\"今天去旅游咯\",\"content\":\"内容略\"}",
          link: "<https://www.dongfeng.edu/growthprofile/3>",
          time: "2018-06-16T00:00:00.000Z"
        },
      ]
    }

## Upload user avatar  [/user/upload/] [POST]

Create a permanent link for an image and return it to the user. The final image will be cropped to fit into a square with the smallest of the sides.

* Request (multipart/form-data)
  * Headers
          Content-Type: "multipart/form-data"
          Accepts: application/json
          Authorization: Bearer XYZDSFDSF
  * Body
    image file, the file name should be `image`

    example:
    ```
    <form>
      <input type="file" id="avatar" name="avatar" accept="image/png, image/jpeg">
      ...
    </form>
    ```
* Response 200 (application/json)
  * Body
    {
      "uri": "https://sgp1.digitaloceanspaces.com/dongfeng/1DNcl0ZchHaSbY4PHmckrmvGsQl_go.png"
    }

## Change and persist the user data.[/user/update] [PUT]

* Request (application/json)
  * Headers
      Accepts: application/json
      Authorization: Bearer XYZDSFDSF
  * Body
      {
        name: "HuHu Cat",
        avator: ""
      }

* Response 200 (application/json)
  * Body
      {} (empty)

## Logout completely  [/logout] [POST]

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

## Get templates (Todo). [/growthprofile/{uid}] [GET]

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

## Get growth profile list. (Todo) [GET]

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

## Create growth profile list of a user. (Todo) [POST]

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

## Update / Delete growth profile list of a user. (Todo) [PUT]

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

## Select attendance list [/attendance/{?from,?to,?class,?name}] [GET]

+ Parameters
    + from (optional) - Date from
    + to (optional) - Date to
    + class (optional) - class
    + name (optional) - name

Retrieve the attendance list.

* Request (application/json)
  * Headers
      Accepts: application/json
      Authorization: Bearer XYZDSFDSF
  * QueryParameter
        "from": from date,
        "to": to date",
        "class": class name,
        "name": kid name

* Response 200 (application/json)
    【
        {
            "id": 1,
            "date": "2018-06-20",
            "name": "HuHu Dog",
            "class": "小1班"
        }，
        {
            "id": 2,
            "date": "2018-06-21",
            "name": "HuHu Cat",
            "class": "小2班"
        }，
        {
            "id": 3,
            "date": "2018-06-22",
            "name": "HuHu Tiger",
            "class": "小3班"
        }，
    ]

## Upload attendance list excel. [/attendance] [POST]

* Headers
      Accepts: multipart/form-data
      Authorization: Bearer XYZDSFDSF
* Response 200 (application/json)
    {}

## Select name list [/namelist/{?class,?year}] [GET]

+ Parameters
    + class (optional) - class
    + year (optional) - year

Retrieve the attendance list.

* Request (application/json)
  * Headers
      Accepts: application/json
      Authorization: Bearer XYZDSFDSF
  * QueryParameter
        "class": class name,
        "year": year

* Response 200 (application/json)
    【
        {
            "year": "2018",
            "name": "HuHu Dog",
            "class": "小1班"
        }，
        {
            "year": "2018-06-21",
            "name": "HuHu Cat",
            "class": "小2班"
        }，
        {
            "year": "2018-06-22",
            "name": "HuHu Tiger",
            "class": "小3班"
        }，
    ]