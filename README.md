# Simple Window Manager

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

    swm move --x 50% --y 50%

Will center the window

    swm move --x 0%

Will move the window to the left edge of the sceen, preserving the Y position

There are some predefined constants that can be used to specify position:

 - For X these are: `left`, `middle` and `right`.
 - For Y it is: `top`, `middle`, `bottom`.

For example:

    swm move --x right --y middle

Will move the window to the middle of the right edge.


### Resizing windows

Resize windows with the `resize` command
It accepts `x1`, `x2`, `y1`, `y2` as the four corners of the window.

Example:

    swm resize --x1 10% --x2 90% --y1 10% --y2 90%

Will resize and move the window so that it has 10% of the screen size to all screen edges.


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
