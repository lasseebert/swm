[![Dependency Status](https://gemnasium.com/lasseebert/swm.png)](https://gemnasium.com/lasseebert/swm)

# Simple Window Manager

**NOTE**: This repo is not maintained.

SWM is a utility to place and resize windows, written for Ubuntu. It might work with other *nix distributions.

SWM has been confirmed _not_ to work with OS X. Please help fix this :)

## Installation

    $ gem install swm

## Dependencies

Some command line tools are needed:

 - xdotool (for getting window id of current window)
 - wmctrl (for moving and resizing windows)
 - xdpyinfo (for getting screen dimensions)
 - xwininfo (for getting window information)

Install these with apt-get if they are not on your system.

## Usage

SWM is meant to be assigned to shortcuts and will always work on the currently active window.

For example, I have configured my `Super-1` - `Super-4` to place the current window in the four corners of my screen.

### Moving windows

Move windows with the `move` subcommand.
It accepts parameters `x` and `y` which can both be specified in percentages of free screen space.

Examples:

    swm move --x 50 --y 50

Will center the window

    swm move --x 0 --y 100

Will move the window to the top right corner

### Resizing windows

Resize windows with the `resize` command
It accepts `x`, `y`, `width` and `height`.

Example:

    swm resize --x 10 --y 10 --width 80 --height 80

Will resize and move the window so that it has 10% of the screen size to all screen edges.


## Contributing

1. Fork 8t
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
