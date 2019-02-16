#!/bin/sh

black="#282c34dd"
white="#abb2bfff"
lightred="#e06c75ff"
darkred="#be5046ff"
green="#98c379ff"
lightyellow="#e5c07bff"
darkyellow="#d19a66ff"
blue="#61afefff"
magenta="#c678ddff"
cyan="#56b6c2ff"
guttergrey="#4b5263ff"
commentgray="#5c6370ff"

# Switch to a dedicated lockscreen workspace
i3-msg "workspace "

# The name of the command to run
command="i3lock"

# Specifies which display to draw the unlock indicator and clock on.
# By default, they'll be placed on every screen.
# Note that this number is zero indexed. The ordering is dependent on libxinerama.
screen=0

# Captures the screen and blurs it using the given sigma (radius).
# Images may still be overlaid over the blurred screenshot.
blur=5

# Forces the indicator to always be visible, instead of only showing on activity.
indicator=1

# Displays the clock.
# --force-clock also displays the clock when there's indicator text (useful for
# when the clock is not positioned with the indicator).
# 0 = disable, 1 = --clock, 2 = --force-clock.
clock=1

# Sets the interior circle color while the password is being verified.
insidevercolor=$black

# Sets the interior circle color for during flash for an incorrect password.
insidewrongcolor=$black

# Sets the default "resting" color for the interior circle.
insidecolor=$black

# Sets the ring color while the password is being verified.
ringvercolor=$cyan

# Sets the ring color during the flash for an incorrect password.
ringwrongcolor=$lightred

# Sets the default ring color.
ringcolor=$blue

# Sets the color for the line separating the inside circle, and the outer ring.
linecolor=$black

# Sets the color of the ring 'highlight' strokes that appear upon keypress.
keyhlcolor=$green

# Sets the color of the ring 'highlight' strokes that appear upon backspace.
bshlcolor=$lightred

# Sets the color of the 'separtor', which is at both ends of the ring highlights.
separatorcolor=$guttergrey

# Sets the color of the status text ("verifying...", "wrong!", etc).
textcolor=$white

# Sets the color of the time in the clock.
timecolor=$white

# Sets the format used for generating the time string.
# See strftime(3) for a full list of format specifiers.
timestr='"%H:%M:%S"'

# Sets the font used to render the time string.
timefont='"Hack"'

# Sets the font size for rendering the time string. Defaults to 32.
timesize=32

# Sets the color of the date in the clock.
datecolor=$white

# Sets the format used for generating the date string.
# See strftime(3) for a full list of format specifiers.
datestr='"%Y-%m-%d"'

# Sets the font used to render the date string.
datefont='"Hack"'

# Sets the font size for rendering the date string. Defaults to 14.
datesize=14

# Sets the string to be shown while verifying the password/input/key/etc. Defaults to "verifying…".
veriftext='"verifying…"'

# Sets the string to be shown upon entering an incorrect password. Defaults to "wrong!".
wrongtext='"wrong!"'

# The fontsize of the status text. Defaults to 28.
textsize=28

# The fontsize of the text listing all the active modifiers (caps lock, num lock, etc). Defaults to 14.
modsize=14

# The radius of the circle. Defaults to 90.
radius=90

################################################################################

line="$command \
    --screen=$screen \
    --blur=$blur \
    --insidevercolor=$insidevercolor \
    --insidewrongcolor=$insidewrongcolor \
    --insidecolor=$insidecolor \
    --ringvercolor=$ringvercolor \
    --ringwrongcolor=$ringwrongcolor \
    --ringcolor=$ringcolor \
    --linecolor=$linecolor \
    --keyhlcolor=$keyhlcolor \
    --bshlcolor=$bshlcolor \
    --separatorcolor=$separatorcolor \
    --textcolor=$textcolor \
    --timecolor=$timecolor \
    --timestr=$timestr \
    --timefont=$timefont \
    --timesize=$timesize \
    --datecolor=$datecolor \
    --datestr=$datestr \
    --datefont=$datefont \
    --datesize=$datesize \
    --veriftext=$veriftext \
    --wrongtext=$wrongtext \
    --textsize=$textsize \
    --modsize=$modsize \
    --radius=$radius \
"

if [ $indicator -eq 1 ]; then
    line="$line --indicator"
fi

if [ $clock -eq 1 ]; then
    line="$line --clock"
elif [ $clock -eq 2 ]; then
    line="$line --force-clock"
fi

eval $line
