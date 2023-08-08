# ASCII art generator
Command line utility written in ruby that loads an image from a given input path, transforms the image into an ASCII art and optionally applies filters.

Here is an example:
![example](https://i.stack.imgur.com/V0zRq.png)

## Usage
1. loads the image from given path
2. translates the image into ASCII art
3. optionally apply filters
4. outputs the ASCII art into the console or save to a given destination path

## Filters
All filters are fully optional and can be used together.

### Flip
The flip filter can mirror the image by X or Y axis.

Example:
```
Before:
AB
CD

After X-axis flip:
CD
AB

After Y-axis flip:
BA
DC
```

### Rotate
The rotate filter rotates the image by degrees divisable by 90.

Example:
```
Before:
AB
CD

After 90 degrees rotation:
CA
DB

After -90 degrees rotation:
BD
AC
```
### Scale
This filter scales the image by a given factor.

Example:
```
Before:
AB
CD

After scale with a factor of 4:
AABB
AABB
CCDD
CCDD
```
### Brightness
Adjusts the brightness of the final image.

### Invert
The invert filter creates a negative version of the image.

## Example
```
ascii-gen --src <path> --dst <path> --flip <X | Y> --rotate <number divisble by 90> --scale <0.25 | 1 | 4> --brightness <number> --invert
```
