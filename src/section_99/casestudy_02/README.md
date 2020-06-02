# Case Study: Transcoding existing video library (mixed format) to a single, contemporary format suitable for all play back devices, e.g. mp4 or mkv

## 1. Introduction
This is a common home project.  You wish to transcode an entire video library typically comprising mixed formats to use better compression and a modern cross-platform format but do not have the time or energy to do this manually.  No problem! Let's put your server, desktop or Raspberry Pi to good use and transcode your entire library over several days, weeks or perhaps months if your collection is vast.

## 2. Background
It is assumed that you already have many files in several formats.  We will be using [ffmpeg](https://ffmpeg.org/) to do the hard work and robot framework to coordinate the activity.

For this project, I have used the humble Raspberry Pi.  It certainly wasn't chosen for speed.  We are looking for a low-energy solution that simply runs in the background and over time converts your entire library.

## 3. Preparation
### 3.1 Check versions of Python, pip and robot
> `$ python3 --version`<br>
> `$ pip3 --version`<br>
> `$ robot --version`<br>
### 3.2 Installation of ffmpeg (Debian)
> `$ sudo apt update`<br>
> `$ sudo apt install ffmpeg`<br>

>Check installation succeeded and which encoders/decoders are available:<br>
> `$ ffmpeg -version`<br>
> `$ ffmpeg -encoders`<br>
> `$ ffmpeg -decoders`<br>