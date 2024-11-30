#!/bin/bash

#function random_hex() {
 #   random_hex=("0xff$(openssl rand -hex 3)")
  #  echo $random_hex
#}

#hyprctl keyword general:col.active_border $(random_hex)  $(random_hex) $(random_hex) $(random_hex) $(random_hex) $(random_hex) $(random_hex) $(random_hex) $(random_hex) $(random_hex)  270deg

# hyprctl keyword general:col.inactive_border $(random_hex) $(random_hex) $(random_hex) $(random_hex) $(random_hex) $(random_hex) $(random_hex) $(random_hex) $(random_hex) $(random_hex)  270deg

#!/bin/bash

function random_hex() {
    echo "0xff000000"  # Black color in hex
}

hyprctl keyword general:col.active_border $(random_hex) 270deg
hyprctl keyword general:col.inactive_border $(random_hex) 270deg
