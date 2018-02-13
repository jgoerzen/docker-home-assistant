# home-assistant (hass / homeassistant) image for Docker

This is a home-assistant image for Docker.  Compared to the 
[official image](http://hub.docker.com/r/homeassistant/home-assistant),
this image:

 - Is based on a newer version of Debian
 - Will get automatic security updates to base OS components
 - Does not require the use of backports
 - Is much smaller
 - Has proper support for certbot for free Let's Encrypt SSL
   certificates, thanks to its proper support for cron
 - Properly installs the hass tool
 
# Analysis of 3rd-party software in upstream Docker

Upstream builds a number of packages outside of Docker.  

 - ffmpeg:
   [ffmpeg component](https://home-assistant.io/components/ffmpeg/),
   added by
   [PR 5322](https://github.com/home-assistant/home-assistant/pull/5322).
   Included in this image.
 - libcec: for Raspberry Pi hardware, added by
   [PR 5230](https://github.com/home-assistant/home-assistant/pull/5230). Possibly
   used by the
   [hdmi_cec](https://home-assistant.io/components/hdmi_cec/)
   component.  There is no python3-libcec in Debian, and this module
   is unlikely to be used by users of this Docker image, so not
   included.
 - openalpr: for license-plate recognition.  Apparently added by
   [PR 5506](https://github.com/home-assistant/home-assistant/pull/5506).
   Appears to be used by the
   [openalpr_local](https://home-assistant.io/components/image_processing.openalpr_local/)
   component.  Included in this image.
 - phantomjs: added by
   [PR 5368](https://github.com/home-assistant/home-assistant/pull/5368),
   says it is required by the alarm.com component.  As this is not in
   Debian and an edge case, not included here.
 - ssocr: added by
   [PR 8028](https://github.com/home-assistant/home-assistant/pull/8028),
   used to read from physical seven-segments display using the
   [seven_segments](https://home-assistant.io/components/image_processing.seven_segments/)
   component.  Not available in Debian and not included here.
 - telldus/tellstick: added by
   [PR 4680](https://github.com/home-assistant/home-assistant/pull/4680),
   used by the
   [tellduslive](https://home-assistant.io/components/tellduslive/)
   component.  Not available in Debian and not included here.
   
 
