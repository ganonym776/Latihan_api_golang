FROM golang:alpine3.16 as build-stage

WORKDIR /app

COPY go.mod ./

COPY go.sum ./

RUN go mod download

COPY *.go ./

RUN go build -o /todoList-Pras

# Deployment Stage
FROM alpine

COPY --from=build-stage /todoList-Pras /todoList-Pras

# ENV PORT=3000

CMD [ "/todoList-Pras" ]