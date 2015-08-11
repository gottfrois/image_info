* 1.1.1

Now only fetch partial image data to compute its size and type.

Thanks to [vdaubry](https://github.com/vdaubry) the gem now uses typhoeus
stream capability to fetch images and get its size and type, aborting the
request if necessary. Make sure to use typhoeus `v0.7.3` in order to benefit
from this update since there was an issue with previous typhoeus version when
aborting ongoing requests.

Fixes [#1](https://github.com/gottfrois/image_info/issues/1)

Also fix URL encoding issues.

* 1.1.0

- Introduces `width` and `height` method. Fixes [https://github.com/gottfrois/image_info/issues/2](https://github.com/gottfrois/image_info/issues/2)

* 1.0.0

- First release
