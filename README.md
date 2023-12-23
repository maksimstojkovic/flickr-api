# Flickr API Test App

Rails app which searches Flickr users and returns their public photos.

Flickr API information is stored in `config/application.yml` (Figaro config file, excluded in `.gitignore`) with the following format:
```
FLICKR_API_KEY: <api-key>
FLICKR_SHARED_SECRET: <secret>
```
