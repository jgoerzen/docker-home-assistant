# home-assistant (hass / homeassistant) image for Docker

This is a home-assistant image for Docker.  Compared to the 
[official image](http://hub.docker.com/r/homeassistant/home-assistant),
this image:

 - Will get automatic security updates to base OS components
   (though not all the additional components home-assistant installs)
 - Has proper support for certbot for free Let's Encrypt SSL
   certificates, thanks to its proper support for cron
 - Properly installs the hass tool (to /usr/local/bin)
 - Runs as the hass user instead of root
 
This is a
[docker-debian-base](https://github.com/jgoerzen/docker-debian-base)
image.  Please see the important instructions at the
docker-debian-base homepage for information on proper
`docker run` paramaters.  The timezone can be set through this system.

The
[home-assistant.io docker installation instructions](https://home-assistant.io/docs/installation/docker/)
mostly still apply as well.  One other difference is that logging will
be to /var/log/homeassistant instead of to /config and stdout.
 
# Copyright

Docker scripts, etc. are
Copyright (c) 2018 John Goerzen
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:
1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.
3. Neither the name of the University nor the names of its contributors
   may be used to endorse or promote products derived from this software
   without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE AUTHORS AND CONTRIBUTORS ``AS IS'' AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
SUCH DAMAGE.

Additional software copyrights as noted.

   
 
