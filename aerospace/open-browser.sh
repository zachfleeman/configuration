#!/bin/bash
bid=$(plutil -convert json -o - -- "$HOME/Library/Preferences/com.apple.LaunchServices/com.apple.launchservices.secure.plist" 2>/dev/null \
  | python3 -c "
import sys, json
for h in json.load(sys.stdin).get('LSHandlers', []):
    if h.get('LSHandlerURLScheme') == 'https':
        print(h.get('LSHandlerRoleAll', 'com.apple.Safari'))
        break
else:
    print('com.apple.Safari')
" 2>/dev/null)
open -b "${bid:-com.apple.Safari}"
