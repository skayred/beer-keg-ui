# Description

This is the small application to measure the beer keg weight using Raspberry Pi, HX711 and load cells, and present it on screen.

## Main files

* config.yaml contains the definition of the HX711 sensor - input your DOUT, SCK pins as well as offset and ratio to retrieve the proper weight (refer to the library https://github.com/gandalf15/HX711/tree/master for details).
* state.json contains the current state of application - beer colors and maximum weight of the keg to calculate the percentage.

Keg amount is hardcoded to 2, and keg volume/weight is hardcoded for the 19l Corni keg.

# LICENSE

Copyright 2023 Dmitrii Savchenko

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
