FORMAT: 1A

HOST: `https://apis.admin.dongfeng.com/`

# DongFeng Project - Administrator

The API Specification for DongFeng project (Admin panel). Only kindergarten teachers have the access to admin panel.

## Attendance [/attendance]

### Get attendence list. [GET]

Retrieve the attendence list.

* Request (application/json)
  * Headers
      Accepts: application/json
      Authorization: Bearer XYZDSFDSF
  * Body
    {
        "from": "2018-06-20",
        "to": "2018-06-21"
    }

* Response 200 (application/json)
    {
      "count": 100,
      "data": [
        {
            "date": "2018-06-20",
            "attendences": [
                {
                    "id": 1,
                    "name": "HuHu Dog",
                    "attend": true,
                },
                {
                    "id": 2,
                    "name": "HuHu Cat",
                    "attend": false,
                },
                {
                    "id": 3,
                    "name": "HuHu Tiger",
                    "attend": false,
                }
            ]
        },
        {
            "date": "2018-06-21",
            "attendences": [
                {
                    "id": 1,
                    "name": "HuHu Dog",
                    "attend": false,
                },
                {
                    "id": 2,
                    "name": "HuHu Cat",
                    "attend": true,
                },
                {
                    "id": 3,
                    "name": "HuHu Tiger",
                    "attend": false,
                }
            ]
        },
      ]
    }

### Upload attendence list excel. [POST]

* Headers
      Accepts: multipart/form-data
      Authorization: Bearer XYZDSFDSF
* Response 200 (application/json)
    {
        "status": "updated",
        "updatedcount": 100
    }

### Update attendence list. [PUT]

* Headers
      Accepts: multipart/form-data
      Authorization: Bearer XYZDSFDSF
* Body
    {
        id: 3
        "attend": false
    }

* Response 200 (application/json)
    {
        "status": "updated"
    }