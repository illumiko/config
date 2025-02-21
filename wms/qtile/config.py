from libqtile import bar, layout, widget, hook

# from libqtile.backend.wayland import InputConfig
import os
import subprocess
from mods.keys import keys, groups
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

#######################################
# Defaults
#######################################

# a0 - active followed by priority number; 0 being highest
# b0 - block
theme = 1
colors = {}
if theme == 0:
    colors = {
        "a": "#ca4958",
        "a2": "#8d9f67",
        "a_": "#222222",
        "fg": "#181616",
        "bg": "#f2ebbc",
        # "b0":"#427b58",
        # "b0":"#076678",
        "b1": "#8f3f71",
    }
elif theme == 1:
    colors = {
        "a": "#c4746e",
        "a2": "#829173",
        "a_": "#222222",
        "bg": "#181616",
        "fg": "#aaaeaa",
        # "b0":"#427b58",
        # "b0":"#076678",
        "b1": "#8f3f71",
    }
gap = 15
wallpaper = "~/dotfiles/wallpaper/Wallpaper/not_anime/old japanese town.png"
default_padding = 10

default_bg = "#222222"
primary = "#ff5563"

#######################################
# Keybinds
#######################################


#######################################
# Workspace
#######################################
# groups = [ Group("a"), Group("b"), Group("c"), ]

#######################################
# Layouts
#######################################

layouts = [
    layout.Bsp(margin=15, border_width=3, border_focus="#ffffff"),
    layout.Zoomy(border_width=5),
    layout.MonadTall(margin=10, border_width=5),
    layout.MonadWide(margin=10, border_width=5),
    layout.Floating(border_width=5),
    # layout.Columns(border_focus_stack=["#d75f5f", "#8f3d3d"], border_width=4),
    # layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Matrix(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(
    #     bg_color = default_bg,
    #     active_bg = primary,
    #     active_fg = default_bg,
    #     fontsize = 15
    # ),
    # layout.VerticalTile(),
]


#######################################
# Bars || Screen || Widgets
#######################################

widget_defaults = dict(
    # font="Maple Mono NF",
    font="Comic Code Medium",
    # font = "Monofur Nerd Font",
    fontsize=20,
    padding=5,
)
extension_defaults = widget_defaults.copy()


def widgets():
    def get_ram_capacity_linux():
        with open("/proc/meminfo", "r") as meminfo:
            for line in meminfo:
                if "MemTotal" in line:
                    ram_kb = int(line.split()[1])
                    ram_gb = ram_kb / (1024 * 1024)  # Convert KB to GB
                    return round(ram_gb, 0)

    wid = []
    if get_ram_capacity_linux() == 16:
        wid = [
            widget.CurrentScreen(
                active_text="  ",
                inactive_text="  ",
                active_color=colors["a2"],
                background=colors["bg"],
            ),
            widget.TextBox(
                fmt=" ", foreground=colors["a"], fontsize=20, background=colors["bg"]
            ),
            widget.CurrentLayout(
                padding=default_padding,
                foreground=colors["fg"],
                background=colors["bg"],
            ),
            widget.Spacer(length=gap),
            widget.GroupBox(
                active=colors["a"],
                highlight_method="line",
                # highlight_color = [ colors['fg'], colors['fg']],
                this_current_screen_border=colors["a"],
                center_aligned = True,
                hide_unused = True,
                this_screen_border=colors["a_"],
                other_current_screen_border=colors["a2"],
                other_screen_border=colors["a_"],
                background=colors["bg"],
            ),
            widget.Prompt(background=colors["a"], foreground=colors["bg"]),
            # widget.Pomodoro(),
            widget.WindowName(foreground=colors["a2"]),
            widget.Chord(
                chords_colors={
                    "launch": ("#ff0000", "#ffffff"),
                },
                name_transform=lambda name: name.upper(),
            ),
            # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
            # widget.StatusNotifier(),
            widget.Spacer(length=gap),
            widget.TextBox(
                fmt="󰕾",
                markup=True,
                foreground=colors["a"],
                fontsize=20,
                background=colors["bg"],
            ),
            widget.Volume(foreground=colors["fg"]),
            widget.Spacer(length=gap),
            widget.TextBox(
                fmt="󰃶",
                markup=True,
                foreground=colors["a"],
                fontsize=20,
                background=colors["bg"],
            ),
            widget.Clock(
                format="%Y-%m-%d %a", foreground=colors["fg"], background=colors["bg"]
            ),
            widget.Spacer(length=gap),
            widget.TextBox(
                fmt="",
                markup=True,
                foreground=colors["a"],
                background=colors["bg"],
                fontsize=20,
            ),
            widget.Clock(
                format="%I:%M %p", foreground=colors["fg"], background=colors["bg"]
            ),
            widget.Spacer(length=gap),
            # widget.BatteryIcon(scale=1),
            # widget.TextBox(
            #     fmt="󱊣",
            #     foreground = colors['a'],
            # ),
            # widget.Battery(
            #     # padding = default_padding,
            #     format = '{percent:2.0%}',
            #     discharge_char = '󰂌',
            #     full_char = '󱊣',
            #     charge_char = '󰂄',
            #     empty_char = '󰂎',
            #     show_short_text = True,
            #     foreground=colors['fg']
            # ),
            # widget.Spacer(length=gap),
            # widget.TextBox(
            #     fmt="󰂌",
            #     foreground = colors['a'],
            # ),
            # widget.Battery(
            #     format = '{hour:d}:{min:02d}',
            #     foreground=colors['fg']
            # ),
            # widget.QuickExit(),
        ]
    elif get_ram_capacity_linux() == 7:
        wid = [
            widget.CurrentScreen(
                active_text="  ",
                inactive_text="  ",
                active_color=colors["a2"],
                background=colors["bg"],
            ),
            widget.TextBox(
                fmt=" ", foreground=colors["a"], fontsize=20, background=colors["bg"]
            ),
            widget.CurrentLayout(
                padding=default_padding,
                foreground=colors["fg"],
                background=colors["bg"],
            ),
            widget.Spacer(length=gap),
            widget.GroupBox(
                active=colors["a"],
                highlight_method="line",
                # highlight_color = [ colors['fg'], colors['fg']],
                this_current_screen_border=colors["a"],
                center_aligned = True,
                hide_unused = True,
                this_screen_border=colors["a_"],
                other_current_screen_border=colors["a2"],
                other_screen_border=colors["a_"],
                background=colors["bg"],
            ),
            widget.Prompt(background=colors["a"], foreground=colors["bg"]),
            # widget.Pomodoro(),
            widget.WindowName(foreground=colors["a2"]),
            widget.Chord(
                chords_colors={
                    "launch": ("#ff0000", "#ffffff"),
                },
                name_transform=lambda name: name.upper(),
            ),
            # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
            # widget.StatusNotifier(),
            widget.Spacer(length=gap),
            widget.TextBox(
                fmt="󰕾",
                markup=True,
                foreground=colors["a"],
                fontsize=20,
                background=colors["bg"],
            ),
            widget.Volume(foreground=colors["fg"]),
            widget.Spacer(length=gap),
            widget.TextBox(
                fmt="󰃶",
                markup=True,
                foreground=colors["a"],
                fontsize=20,
                background=colors["bg"],
            ),
            widget.Clock(
                format="%Y-%m-%d %a", foreground=colors["fg"], background=colors["bg"]
            ),
            widget.Spacer(length=gap),
            widget.TextBox(
                fmt="",
                markup=True,
                foreground=colors["a"],
                background=colors["bg"],
                fontsize=20,
            ),
            widget.Clock(
                format="%I:%M %p", foreground=colors["fg"], background=colors["bg"]
            ),
            widget.Spacer(length=gap),
            widget.TextBox(
                fmt="󱊣",
                foreground=colors["a"],
            ),
            widget.Battery(
                # padding = default_padding,
                format="{percent:2.0%}",
                discharge_char="󰂌",
                full_char="󱊣",
                charge_char="󰂄",
                empty_char="󰂎",
                show_short_text=True,
                foreground=colors["fg"],
            ),
            widget.Spacer(length=gap),
            widget.TextBox(
                fmt="󰂌",
                foreground=colors["a"],
            ),
            widget.Battery(format="{hour:d}:{min:02d}", foreground=colors["fg"]),
        ]

    return wid


screens = [
    Screen(
        wallpaper=wallpaper,
        wallpaper_mode="fill",
        bottom=bar.Bar(widgets(), 30, background=colors["bg"]),
    ),
    Screen(
        wallpaper = wallpaper,
        wallpaper_mode = "fill",
        bottom=bar.Bar(widgets(), 30,background=colors['bg']))
]


dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
        Match(title="dunst"),
        Match(title="Dunst"),
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
# wl_input_rules = {
#         "type:keyboard": InputConfig(
#             kb_repeat_delay=290,
#             kb_repeat_rate=70,
#             kb_options = "caps:backspace",
#             sensitivity = 0.5,
#
#             ),
# }

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"


# I wrote the hook below auto minimize = True line in the default config file.
# This doesn't matter. But if you are new and confused, now you know :)

#
# Autostart
#


@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser("~/dotfiles/wms/qtile/autostart.sh")
    subprocess.Popen([home])
    subprocess.run(
        [
            "systemctl",
            "--user",
            "import-environment",
            "XDG_SESSION_PATH",
            "WAYLAND_DISPLAY",
        ]
    )
