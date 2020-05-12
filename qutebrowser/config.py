'''
Template config.py: https://www.ii.com/qutebrowser-configpy/
'''

import dracula.draw

# Load existing settings made via :set
config.load_autoconfig()

dracula.draw.blood(c, {
    'spacing': {
        'vertical': 6,
        'horizontal': 8
    }
})

#def fs():
#    if c.window.hide_decoration == False:
#         c.window.hide_decoration = True
#    else:
#         c.window.hide_decoration = False    

c.aliases={'o': 'open', 'h': 'home', 'fs': 'fullscreen'}

config.bind('t', 'open -t')
config.unbind('d', mode='normal')
config.unbind('D', mode='normal')
config.bind('w', 'tab-close')
config.bind('z', 'config-cycle tabs.show always switching')
config.bind('h', 'back')
config.bind('l', 'forward')
config.bind('J', 'tab-prev')
config.bind('K', 'tab-next')
config.bind('.', 'tab-next')
config.bind(',', 'tab-prev')
# c.window.hide_decoration = False
