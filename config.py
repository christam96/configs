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

c.aliases={'o': 'open'}

# c.window.hide_decoration = False
