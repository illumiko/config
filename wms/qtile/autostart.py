# You should've imported the below in your config.py
import os
import subprocess
# I wrote the hook below auto minimize = True line in the default config file.
# This doesn't matter. But if you are new and confused, now you know :)

@hook.subscribe.startup_once
def autostart():
    home = os.expanduser('~/dotfiles/qtile/autostart.sh')
    subprocess.Popen([home])

