# blurhash-bqn

Implementation of the [blurhash](https://blurha.sh/) algorithm in [BQN](https://mlochbaum.github.io/BQN/).

Works as a library but also includes command-line scripts for encoding and decoding blurhashes quickly. The scripts also act as samples.

MIT license.

## Command-line usage

### Encoding

`./bhenc img.ppm` outputs a blurhash with the default components (4,3).

```
Usage:
  bhenc [xcomp ycomp] <img>
      xcomp     x components (1-9; default 4)
      ycomp     y components (1-9; default 3)
      img       image file; only PPM type P6 supported for now
```

To get PPM files, try ImageMagick: `convert img.jpg img.ppm`

### Displaying

`./bhshow "LGFi1MUH=y#M:d5b+*Ex@[or[Q6."` displays a terminal true-color rendering of the blurhash. Requires true-color support from terminal.

### Decoding

`./bhdec "AGFi1MUH:d5b"` creates a 32x32 rendering in the file `out.ppm`.

```
Usage:
  bhdec <blurhash> [[x y] outfile]
      x         x resolution (default 32)
      y         y resolution (default 32)
      blurhash  blurhash
      outfile   output filename (default out.ppm)
```

## Future work

- performance enhancements
- properly document the BQN API
- add browser demo
- support other image formats, probably with external libraries
- add images to readme
