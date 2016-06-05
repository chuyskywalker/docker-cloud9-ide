# Cloud9 IDE in Docker

Run this for a quick browser-based IDE from your docker host.

```
# cd to the directory you want to edit
docker run -ti --rm -v `pwd`:/workspace -p 80:80 chuyskywalker/cloud9-ide
```

Then visit your docker host in your browser.
