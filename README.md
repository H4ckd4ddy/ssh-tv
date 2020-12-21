# SSH-TV
SSH media center :)

Under dev...


### Install

```
git clone https://github.com/H4ckd4ddy/ssh-tv.git
cd ssh-tv
# Place some MP4 files in movies folder
docker build -t ssh-tv .
docker run -v $(pwd)/movies:/movies -p 22:22 -d ssh-tv
```

### Usage 

Just init a SSH session to the server with video name as username