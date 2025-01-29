from mods.groups import groups
from libqtile.config import Key, Group, Drag, Click
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
mod = "mod4"
terminal = guess_terminal()
keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    Key([mod], "F4",lazy.spawn("brightnessctl -c 'backlight' set 10%+")),
    Key([mod], "F5",lazy.spawn("brightnessctl -c 'backlight' set 10%-")),
    Key([mod], "F2",lazy.spawn("amixer -c 1 -- sset Master playback 5%-")),
    Key([mod], "F3",lazy.spawn("amixer -c 1 -- sset Master playback 5%+")),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key([mod], 'period', lazy.next_screen(), desc='Next monitor'),
    Key([mod], "f", lazy.window.toggle_maximize(), desc="Toggle maximize"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn("kitty"), desc="Launch terminal"),
    Key([mod], "c", lazy.spawn("flameshot gui"), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod,"shift"], "x", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "d", lazy.spawn("rofi -show run -m -1"), desc="Spawn a command using a prompt widget"),
    Key([mod, "shift"], "R", lazy.restart(), desc="Spawn a command using a prompt widget"),
    # Key([mod, "shift"], r, cmd_reload_config(), desc="")
    # Key(
    # [mod],
    # "q",
    # lazy.group["b"].toscreen(),
    # desc="Switch to group {}".format("7"),
    # ),
    # # mod1 + shift + letter of group = switch to & move focused window to group
    # Key(
    #     [mod, "shift"],
    #     "q",
    #     lazy.window.togroup("7", switch_group=True),
    #     desc="Switch to & move focused window to group {}".format("7"),
    # ),
    #
    # Key(
    # [mod],
    # "w",
    # lazy.group["8"].toscreen(),
    # desc="Switch to group {}".format("8"),
    # ),
    # # mod1 + shift + letter of group = switch to & move focused window to group
    # Key(
    #     [mod, "shift"],
    #     "w",
    #     lazy.window.togroup("8", switch_group=True),
    #     desc="Switch to & move focused window to group {}".format("8"),
    # ),
    # Key(
    # [mod],
    # "e",
    # lazy.group["9"].toscreen(),
    # desc="Switch to group {}".format("9"),
    # ),
    # # mod1 + shift + letter of group = switch to & move focused window to group
    # Key(
    #     [mod, "shift"],
    #     "e",
    #     lazy.window.togroup("9", switch_group=True),
    #     desc="Switch to & move focused window to group {}".format("9"),
    # ),
]


# groups = [Group(i) for i in "12345678"]
# groups = [Group(i) for i in "123456789"]

# Doesnt work as intended:
# def letter_to_number(key_pressed):
#     if key_pressed.isalpha():
#         to_number = {
#                 "q":"7",
#                 "w":"8",
#                 "e":"9"
#         }
#         key_want = to_number[key_pressed]
#         return key_want
#     else:
#         return key_pressed
#
#
for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]
