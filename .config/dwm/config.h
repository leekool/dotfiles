/* alt-tab configuration */
static const unsigned int tabModKey 		= 0x40;	/* if this key is hold the alt-tab functionality stays acitve. This key must be the same as key that is used to active functin altTabStart `*/
static const unsigned int tabCycleKey 		= 0x17;	/* if this key is hit the alt-tab program moves one position forward in clients stack. This key must be the same as key that is used to active functin altTabStart */
static const unsigned int tabPosY 			= 1;	/* tab position on Y axis, 0 = bottom, 1 = center, 2 = top */
static const unsigned int tabPosX 			= 1;	/* tab position on X axis, 0 = left, 1 = center, 2 = right */
static const unsigned int maxWTab 			= 550;	/* tab menu width */
static const unsigned int maxHTab 			= 50;	/* tab menu height */

/* appearance */
static unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int gappx     = 10;        /* gaps between windows */
static unsigned int snap      = 32;       /* snap pixel */
static const int swallowfloating = 0;  /* 1 means swallow floating windows by default */
static int showbar            = 1;        /* 0 means no bar */
static int topbar             = 1;        /* 0 means bottom bar */
static int linepx             = 2;        /* 0 means no underline */
static const char *fonts[]          = { "Cozette:size=14" };
static const char dmenufont[]       = "Cozette:size=14";
// static const char *fonts[]          = { "Tamzen:pixelsize=19" };
// static const char dmenufont[]       = "Tamzen:pixelsize=19";
static char normbgcolor[]     = "#000000";
static char normbordercolor[] = "#222222";
static char normfgcolor[]     = "#bbbbbb";
static char ltsbgcolor[]      = "#bbbbbb";
static char selfgcolor[]      = "#efefef";
static char selbordercolor[]  = "#3d3d3d";
static char selbgcolor[]      = "#800000";
static char *colors[][4] = {
       /*               fg           bg           border   */
       [SchemeNorm]  = { normfgcolor, normbgcolor, normbordercolor },
       [SchemeSel]   = { selfgcolor,  selbgcolor,  selbordercolor  },
       [SchemeTitle] = { normfgcolor, normbgcolor, normbordercolor  },
       [SchemeLts] =   { normfgcolor, ltsbgcolor,  normbordercolor  },
};

/* tagging */
static const char *tags[] = { "Ⅰ", "Ⅱ", "Ⅲ", "Ⅳ", "Ⅴ", "Ⅵ" };
// static const char *tags[] = { "I", "II", "III", "IV", "V", "VI", "VII" };
/* static const char *tags[] = { "а", "б", "в", "г", "д", "е", "ё" }; */

typedef struct {
	const char *name;
	const void *cmd;
} Sp;

const char *spumpv[] = {"umpv", NULL };
const char *spmusic[] = {"alacritty", "-c", "music", "-e", "music", NULL };
const char *spterm[] = {"alacritty", "--class", "spterm", "-o", "window.dimensions.columns=120", "-o", "window.dimensions.lines=34", NULL };

static Sp scratchpads[] = {
	/* name          cmd  */
	{"spmusic", spmusic},
	{"spterm",  spterm},
	{"spumpv",  spumpv},
};

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class | instance | title | tags mask | isfloating | isterminal | noswallow | monitor | scratchkey */
	{ "Gimp",     NULL,   NULL,           0, 1, 0,  0, -1, },
	{ NULL,       "alacritty",   NULL,    0, 0, 1, -1, -1, },
	{ NULL,       NULL,   "Event Tester", 0, 1, 0,  1, -1, },
	{ NULL,       NULL,   "Media viewer", 0, 1, 0,  0, -1, },
	{ NULL,       NULL,   "floating",     0, 1, 1,  0, -1, },
	{ "music",    NULL,   NULL,    SPTAG(0), 1, 1,  0, -1, },
	{ "spterm",   NULL,   NULL,    SPTAG(1), 1, 1,  0, -1, },
	{ NULL,      "umpv",  NULL,    SPTAG(2), 1, 1,  0, -1, },
};

/* layout(s) */
static float mfact     = 0.50; /* factor of master area size [0.05..0.95] */
static int nmaster     = 1;    /* number of clients in master area */
static int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int attachbelow = 1;    /* 1 means attach after the currently active window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "⇲",        tile },    /* first entry is default */
	{ "⇱",        bstack },
	{ "[M]",      monocle }, /* maximised */
	{ "∃",        NULL },    /* no layout function means floating behavior */
	{ NULL,       NULL },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|Mod1Mask,              KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

#define TERMINAL "alacritty"
/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }
#define TSHCMD(cmd) SHCMD(TERMINAL " " cmd)

#define STATUSBAR "dwmblocks"

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-fn", dmenufont, "-nb", normbgcolor, "-nf", normbordercolor, "-sb", selfgcolor, "-sf", normbgcolor, NULL };
static const char *termcmd[]  = { "alacritty", NULL };

/*
 * Xresources preferences to load at startup
 */
ResourcePref resources[] = {
		{ "normbgcolor",        STRING,  &normbgcolor },
		{ "normbordercolor",    STRING,  &normbordercolor },
		{ "normfgcolor",        STRING,  &normfgcolor },
		{ "ltsbgcolor",         STRING,  &ltsbgcolor },
		{ "selbgcolor",         STRING,  &selbgcolor },
		{ "selbordercolor",     STRING,  &selbordercolor },
		{ "selfgcolor",         STRING,  &selfgcolor },
		{ "borderpx",          	INTEGER, &borderpx },
		{ "snap",          		INTEGER, &snap },
		{ "showbar",          	INTEGER, &showbar },
		{ "topbar",          	INTEGER, &topbar },
		{ "nmaster",          	INTEGER, &nmaster },
		{ "resizehints",       	INTEGER, &resizehints },
		{ "mfact",      	 	FLOAT,   &mfact },
};

#include <X11/XF86keysym.h>
#include "patch/shift-tools.c"
static Key keys[] = {
	/* modifier                     key        function        argument */
	
	/* spawning programs */
	{ MODKEY,           XK_r,      spawn,          {.v = dmenucmd } },
	{ MODKEY,           XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },

	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.01} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.01} },
	{ MODKEY|Mod1Mask,              XK_h,      setcfact,       {.f = +0.25} },
	{ MODKEY|Mod1Mask,              XK_l,      setcfact,       {.f = -0.25} },

	{ MODKEY,           XK_Return, zoom,          {0} },
	{ MODKEY,                       XK_q,	   view,           {0} },
	{ MODKEY|Mod1Mask,              XK_q,      quit,           {0} },
	{ MODKEY|Mod1Mask,              XK_c,      killclient,     {0} },

	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|Mod1Mask,              XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_minus,  setgaps,        {.i = -1 } },
	{ MODKEY,                       XK_equal,  setgaps,        {.i = +1 } },

	// { MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	// { MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	// { MODKEY|Mod1Mask,              XK_comma,  tagmon,         {.i = -1 } },
	// { MODKEY|Mod1Mask,              XK_period, tagmon,         {.i = +1 } },

	// { MODKEY,           XK_e,      spawn,          TSHCMD("lfp") },
	// { MODKEY|ShiftMask, XK_m,      spawn,          TSHCMD("neomutt") },
	// { MODKEY,           XK_s,      spawn,          SHCMD("$BROWSER > /dev/null") },
	// { MODKEY|ShiftMask, XK_s,      spawn,          SHCMD("tabbed -c vimb -p misc -e") },
	// { MODKEY|ShiftMask, XK_t,      spawn,          SHCMD("telegram-desktop") },
	// { MODKEY,           XK_x,      spawn,          SHCMD("slock") },
	// { MODKEY,           XK_y,      spawn,          SHCMD("dmenu_search") },
	/* scratchpads */
	// { MODKEY,           XK_m,      togglescratch,  {.ui = 0 } }, /* cmus     */
	{ MODKEY,           XK_o,      togglescratch,  {.ui = 1 } }, /* terminal */
	// { MODKEY,           XK_u,      togglescratch,  {.ui = 2 } }, /* umpv     */
	{ MODKEY,                       XK_Left,   shiftview,      {.i = -1} },
	{ MODKEY,                       XK_Right,  shiftview,      {.i = +1} },
	{ MODKEY|Mod1Mask,              XK_Left,   shifttag,       {.i = -1} },
	{ MODKEY|Mod1Mask,              XK_Right,  shifttag,       {.i = +1} },
	{ Mod1Mask,                     XK_Tab,    altTabStart,    {0} },
	{ MODKEY|Mod1Mask,              XK_Return,                spawn, SHCMD("sh runterminal.sh") },
	{ MODKEY,                       XK_s,                     spawn, SHCMD("sh screenshotssh.sh box") },
	{ MODKEY|Mod1Mask,              XK_s,                     spawn, SHCMD("sh screenshotssh.sh window") },
	{ MODKEY,                       XK_e,                     spawn, SHCMD("sh runemacs.sh") },
	{ MODKEY,                       XK_c,                     spawn, SHCMD("sh xcolor.sh") },
	{ 0,                            XF86XK_MonBrightnessUp,   spawn, SHCMD("xbacklight -inc 5") },
	{ 0,                            XF86XK_MonBrightnessDown, spawn, SHCMD("xbacklight -dec 5") },
	{ 0,                            XF86XK_AudioMute,         spawn, SHCMD("amixer -D pulse set Master toggle && kill -44 $(pidof dwmblocks)") },
	{ 0,                            XF86XK_AudioRaiseVolume,  spawn, SHCMD("amixer -D pulse set Master 5%+ && kill -44 $(pidof dwmblocks)") },
	{ 0,                            XF86XK_AudioLowerVolume,  spawn, SHCMD("amixer -D pulse set Master 5%- && kill -44 $(pidof dwmblocks)") },
	/* tags */
	{ MODKEY,           XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask, XK_0,      tag,            {.ui = ~0 } },
	TAGKEYS(            XK_1,                      0)
	TAGKEYS(            XK_2,                      1)
	TAGKEYS(            XK_3,                      2)
	TAGKEYS(            XK_4,                      3)
	TAGKEYS(            XK_5,                      4)
	TAGKEYS(            XK_6,                      5)
	TAGKEYS(            XK_7,                      6)
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        cyclelayout,    {.i = +1 } },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[0]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button1,        sigstatusbar,   {.i = 1} },
	{ ClkStatusText,        0,              Button2,        sigstatusbar,   {.i = 2} },
	{ ClkStatusText,        0,              Button3,        sigstatusbar,   {.i = 3} },
	{ ClkStatusText,        0,              Button4,        sigstatusbar,   {.i = 4} },
	{ ClkStatusText,        0,              Button5,        sigstatusbar,   {.i = 5} },
	{ ClkStatusText,        ShiftMask,      Button1,        sigstatusbar,   {.i = 6} },
	{ ClkStatusText,        ShiftMask,      Button3,        sigstatusbar,   {.i = 7} },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

