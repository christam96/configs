/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 3;        /* border pixel of windows */
static const unsigned int gappx     = 40;        /* gaps between windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const unsigned int systraypinning = 0;   /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayspacing = 2;   /* systray spacing */
static const int systraypinningfailfirst = 1;   /* 1: if pinning fails, display systray on the first monitor, False: display systray on the last monitor*/
static const int showsystray        = 1;     /* 0 means no systray */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "Noto Sans Mono:size=10" };
static const char dmenufont[]       = "monospace:size=10";
static const char col_black[]       = "#222222"; /* For more colours, search "hex to rgb" */
static const char col_yellow[] 	    = "#f0c674";
static const char col_gray_dark[]   = "#bbbbbb";
static const char col_gray_light[]  = "#eeeeee";
static const char col_cyan[]        = "#6790EB";
static const char col_orange[]      = "#EA8A66";
static const char col_pink[]        = "#fe8193";
static const char col_salmon[]      = "#f35e4b";
static const char col_white[]       = "#FFFFFF";
static const unsigned int baralpha = 0xd0;
static const unsigned int borderalpha = OPAQUE;
static const char *colors[][3]      = {

/*
 * Notes:
 * SchemesNorm fg - Bar text colour
 * SchemeSel bg - Bar colour
 */
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray_dark, col_black, col_cyan },
	[SchemeSel]  = { col_black, col_white,  col_yellow },
};
static const unsigned int alphas[][3]      = {
	/*               fg      bg        border     */
	[SchemeNorm] = { OPAQUE, baralpha, borderalpha },
	[SchemeSel]  = { OPAQUE, baralpha, borderalpha },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 *  use tags mask to point an application to a specific workspace
	 */
	/* class                       instance    title      tags mask      isfloating   monitor */
	{ "Gimp",                      NULL,       NULL,       0,            0,           -1 },
	{ "Xfce4-terminal",            NULL,       NULL,       0,            1,           -1 },
	{ "firefox",                   NULL,       NULL,       0,            0,           -1 },
	{ "Arcolinux-welcome-app.py",  NULL,       NULL,       0,            1,           -1 },
};

/* layout(s) */
static const float mfact     = 0.50; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod1Mask
#define CTRL control
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_black, "-nf", col_gray_dark, "-sb", col_cyan, "-sf", col_gray_light, NULL };
static const char *rofi[]  = { "rofi", "-show", "run", NULL };
static const char *filecmd[]  = { "nautilus", NULL };
static const char *firefox[]  = { "firefox", NULL };
static const char *termite[]  = { "termite", NULL };
static const char *emacs[]  = { "emacs", NULL };
static const char *screenshot[]  = { "gscreenshot", NULL };
static const char *dropdown[]  = { "xfce4-terminal", "--drop-down", NULL };
static const char *volumeinc[]  = { "amixer", "-D", "pulse", "sset", "Master", "5%+", NULL };
static const char *volumedec[]  = { "amixer", "-D", "pulse", "sset", "Master", "5%-", NULL };
static const char *togglemute[]  = { "amixer", "sset", "Master", "toggle", NULL };
static const char *playerctlprev[]  = { "playerctl", "previous", NULL };
static const char *toggleplay[]  = { "playerctl", "play-pause", NULL };
static const char *playerctlnext[]  = { "playerctl", "next", NULL };

#include "selfrestart.c"
#include "shiftview.c"

static Key keys[] = {

	{ MODKEY,                       XK_w,      spawn,          {.v = firefox } },
	{ MODKEY,                       XK_Menu,   spawn,          {.v = termite } },
	{ MODKEY,                       XK_e,      spawn,          {.v = emacs } },
	{ MODKEY,                       XK_space,  spawn,          {.v = dropdown } },
	{ MODKEY|ShiftMask,		        XK_j,	   rotatestack,	   {.i = +1 } },
	{ MODKEY|ShiftMask,     		XK_k,	   rotatestack,	   {.i = -1 } },
	{ 0,                            XK_F2,     spawn,          {.v = volumedec } },
	{ 0,                            XK_F3,     spawn,          {.v = volumeinc } },
	{ 0,                            XK_F4,     spawn,          {.v = togglemute } },
	{ 0,                            XK_F6,     spawn,          {.v = playerctlprev } },
	{ 0,                            XK_F7,     spawn,          {.v = toggleplay } },
	{ 0,                            XK_F8,     spawn,          {.v = playerctlnext } },
	{ 0,                            XK_Print,  spawn,          {.v = screenshot } },

	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_p,      spawn,          {.v = rofi } },
	{ MODKEY|ControlMask,           XK_Return, spawn,          {.v = filecmd } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_Tab,    focusstack,     {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_Tab,    focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_Right,  focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_Left,   focusstack,     {.i = -1 } },	
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_minus,  setgaps,        {.i = -1 } },
	{ MODKEY,                       XK_equal,  setgaps,        {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_equal,  setgaps,        {.i = 0  } },
	{ MODKEY,                       XK_Return, zoom,           {0} },
	/*{ MODKEY,                       XK_Tab,    view,           {0} },*/	
	{ MODKEY,            		XK_q,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	/*{ MODKEY,                       XK_space,  setlayout,      {0} },*/
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_grave,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_r,      self_restart,   {0} },
        /*{ MODKEY|ShiftMask,		XK_space,  shiftview,	   { .i = 1 } },*/
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
};

/* IF YOU HAVE A AZERTY KEYBOARD USE THESE CODES
	TAGKEYS(                        XK_ampersand,              0)
	TAGKEYS(                        XK_eacute,                 1)
	TAGKEYS(                        XK_quotedbl,               2)
	TAGKEYS(                        XK_apostrophe,             3)
	TAGKEYS(                        XK_parenleft,              4)
	TAGKEYS(                        XK_section,                5)
	TAGKEYS(                        XK_egrave,                 6)
	TAGKEYS(                        XK_exclam,                 7)
	TAGKEYS(                        XK_ccedilla,               8)
*/

/* THESE ARE THE ORIGINAL QWERTY KEYBOARD CODES
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
*/

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	/*{ ClkStatusText,        0,              Button1,        spawn,          {.v = bashtop } },*/
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = filecmd } },
	/*{ ClkStatusText,        0,              Button3,        spawn,          {.v = calendar } },*/
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};
