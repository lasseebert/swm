# Simple Window Manager

NOTE: THIS IS NOT YET DONE!

SWM is a utility to place and resize windows, written for Ubuntu. It might work with other *nix distributions.

## Installation

    $ gem install swm

## Dependencies

Some command line tools are needed:

 - xdotool (for getting window id if current window)
 - wmctrl (for moving and reizing windows)
 - xdpyinfo (for getting screen dimensions)
 - xwininfo (for getting window information)

Install these with apt-get if they are not on your system.

## Usage

### Moving windows

Move windows with the move subcommand.
It accepts parameters x and y which can both be specified in percentages of free screen space.

Examples:

    swm move --x 50% --y 50%

Will center the window

    swm move --x 0%

Will move the window to the left edge of the sceen, preserving the Y position

There are some predefined constants that can be used to specify position:

 - For X these are: left, middle and right.
 - For Y is is: top, middle, bottom

For example:

    swm move --x right --y middle

Will move the window to the middle of the right edge.


### Resizing windows

Not yet supported

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
