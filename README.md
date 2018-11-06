# Dongfeng-specification

Specifications of DongFeng Project.

## Content

- `api.md` api spec in [Apiary](https://apiary.io/) Blueprint format
- `DF.png` architecture diagram
- `docker-compose.yaml` for local spinup

## Local Spinup

```bash
docker-compose up
```

## API Endpoint

Base URL: `localhost:8080/api`

| Method | URL | Note |
| --- | --- | --- |
| `GET` | `/` | Health check |
| `POST` | `/login` | login and return all the necessary data required by frontend. |
| `POST` | `/logout` | logout |

## Contact

<route666@live.cn>