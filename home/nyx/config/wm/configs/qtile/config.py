from libqtile import bar, layout, qtile, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

mod = "mod4"
terminal = "kitty"
browser = "zen"
discord = "legcord"

colors = [
  "#181c1f",
  "#46464e",
  "#766575",
  "#a79b9f",
  "#b5b9ba",
  "#dfe3e2",
  "#f0f1f3",
  "#f0f0f0",
  "#928f9a",
  "#a58b8a",
  "#dc7538",
  "#ab8791",
  "#b68483",
  "#8f918e",
  "#879296",
  "#969084"
]

keys = [
        # Switch between windows
        Key([mod], "h", lazy.layout.left(), desc = "Move focus to left"),
        Key([mod], "j", lazy.layout.down(), desc = "Move focus down"),
        Key([mod], "k", lazy.layout.up(), desc = "Move focus up"),
        Key([mod], "l", lazy.layout.right(), desc = "Move focus to right"),

        # Move windows between left/right columns or move up/down in current stack
        # Moving out of range in Columns layout will create new column.
        Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc = "Move window to left"),
        Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc = "Move window down"),
        Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc = "Move window up"),
        Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc = "Move window to right"),

        # Grow windows. If current window is on the edge of the screen and direction will be
        # to screen edge, window will shrink
        Key([mod, "control"], "h", lazy.layout.grow_left(), desc = "Grow window to left"),
        Key([mod, "control"], "j", lazy.layout.grow_down(), desc = "Grow window down"),
        Key([mod, "control"], "k", lazy.layout.grow_up(), desc = "Grow window up"),
        Key([mod, "control"], "l", lazy.layout.grow_right(), desc = "Grow window to right"),

        # Toggle between split and unsplit sides of stack.
        # Split = all windows displayed
        # Unsplit = 1 window displayed, like Max layout, but still with
        # multiple stack panes
        Key(
            [mod, "shift"],
            "Return",
            lazy.layout.toggle_split(),
            desc = "Toggle between split and unsplit sides of stack",
        ),
        Key([mod], "Return", lazy.spawn(terminal), desc = "Launch terminal"),
        Key([mod], "r", lazy.next_layout(), desc = "Toggle between layouts"),
        Key([mod], "w", lazy.window.kill(), desc = "Kill focused window"),
        Key(
            [mod],
            "f",
            lazy.window.toggle_fullscreen(),
            desc = "Toggle fullscreen on the focused window",
        ),
        Key([mod], "t", lazy.window.toggle_floating(), desc = "Toggle floating on the focused window"),
        Key([mod, "control"], "r", lazy.reload_config(), desc = "Reload config"),
        Key([mod, "shift"], "p", lazy.shutdown(), desc = "Shutdown qtile"),
        Key([mod], "space", lazy.spawncmd(), desc = "Spawn run launcher"),

        # program keybindings
        Key([mod], "b", lazy.spawn(browser), desc = "Spawn browser"),
        Key([mod], "d", lazy.spawn(discord), desc = "Spawn discord client"),
        
        # audio controls
        Key([mod], "minus", lazy.spawn("pactl set-sink-volume 0 -5%"), desc = "Decrease volume"),
        Key([mod], "equal", lazy.spawn("pactl set-sink-volume 0 +5%"), desc = "Increase volume"),
        Key([mod], "m", lazy.spawn("pactl set-sink-mute 0 toggle"), desc = "Toggle mute"),

        # media controls
        Key([mod], "period", lazy.spawn("playerctl next"), desc = "Next track"),
        Key([mod], "comma", lazy.spawn("playerctl previous"), desc = "Previous track"),
        Key([mod], "p", lazy.spawn("playerctl play-pause"), desc = "Toggle play/pause"),
]

# Add keybindings to switch VTs in wayland.
# We can't check qtile.core.name in default config as it is loaded before qtile.
# We therefore defer the check until the key binding is run by using .when(func=..)
for vt in range(1, 8):
    keys.append(
        Key(
            ["control", "mod1"],
            f"f{vt}",
            lazy.core.change_vt(vt).when(func=lambda: qtile.core.name == "wayland"),
            desc = f"Switch to VT{vt}",
        )
    )

groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend(
        [
            # Mod + group number = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc = "Switch to group {}".format(i.name),
            ),
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group = True),
                desc = "Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # mod + shift + group number = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name)),
        ]
    )

layout_theme = {
  "margin": 8,
  "border_width": 1,
  "border_focus": colors[12],
  "border_normal": colors[2],
}

layouts = [
    # layout.Columns(border_focus_stack = ["#d75f5f", "#8f3d3d"], border_width = 2, margin = 10),
    layout.Columns(**layout_theme),
    layout.Max(margin = 10),
    layout.Bsp(margin = 10),
]

widget_defaults = dict(
    font = "sans",
    fontsize = 12,
    padding = 3,
    foreground = colors[5],
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top = bar.Bar(
            [
                widget.Spacer(length = 24),
                widget.CurrentLayout(),
                widget.Spacer(length = 12),
                widget.GroupBox(),
                widget.Prompt(),
                widget.WindowName(),
                widget.Chord(
                    chords_colors = {
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform = lambda name: name.upper(),
                ),
                # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
                # widget.StatusNotifier(),
                widget.Systray(),
                widget.Volume(
                  unmute_format = "-> vol. {volume}/100",
                  mute_format = "-> vol. 0/100",
                ),
                widget.Clock(format = "%Y/%m/%d %a %I:%M %p"),
                widget.Spacer(length = 24),
            ],
            36,
            margin = [ 8, 12, 0, 12 ],
            # border_width = [2, 0, 2, 0],
            # border_color = ["ff00ff", "000000", "ff00ff", "000000"]
            background = colors[1],
        ),
        # You can uncommend this variable if you see that on X11 floating resize/moving is laggy
        # By default we handle these events delayed to already improve performance, however your system might still be struggling
        # This variable is set to None (no cap) by default, but you can set it to 60 to indicate that you limit it to 60 events per second
        # x11_drag_polling_rate = 60,
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start = lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start = lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = True

floating_layout = layout.Floating(
    float_rules = [
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class = "confirmreset"), # gitk
        Match(wm_class = "makebranch"), # gitk
        Match(wm_class = "maketag"), # gitk
        Match(wm_class = "ssh-askpass"), # ssh-askpass
        Match(wm_class = "branchdialog"), # gitk
        Match(wm_class = "pinentry"), # GPG key password entry
    ]
)

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing focus, should we respect this or not?
auto_minimize = True

# When using the wayland backend, this can be used to configure input devices.
wl_input_rules = None

# xcursor theme (string or None) and size (integer) for Wayland backend
wl_xcursor_theme = None
wl_xcursor_size = 24

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this string
# besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that sugges setting this 
# string if your 
wmname = "LG3D"

