
Server for http://topics.tiye.me
------

Stupid server of topics.

### API:

* GET `/topics`

Get topics. No token required.

* Delete `/topics/:id`

Delete topic, needs token.

* POST `/topic`

Create topic, need token.

```coffee
title: ''
url: ''
```

* PUT `/topic/:id`

Update topic, needs token:

```coffee
title: ''
url: ''
```

### License

MIT