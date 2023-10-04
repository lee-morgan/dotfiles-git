static const char norm_fg[] = "#c8c3c3";
static const char norm_bg[] = "#23110f";
static const char norm_border[] = "#5a4c4b";

static const char sel_fg[] = "#c8c3c3";
static const char sel_bg[] = "#3fb7bc";
static const char sel_border[] = "#c8c3c3";

static const char urg_fg[] = "#c8c3c3";
static const char urg_bg[] = "#c04e41";
static const char urg_border[] = "#c04e41";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
