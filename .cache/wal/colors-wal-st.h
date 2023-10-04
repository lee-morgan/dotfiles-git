const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#23110f", /* black   */
  [1] = "#c04e41", /* red     */
  [2] = "#3fb7bc", /* green   */
  [3] = "#3a63ae", /* yellow  */
  [4] = "#6a51c5", /* blue    */
  [5] = "#ca61c1", /* magenta */
  [6] = "#c85959", /* cyan    */
  [7] = "#c8c3c3", /* white   */

  /* 8 bright colors */
  [8]  = "#5a4c4b",  /* black   */
  [9]  = "#c04e41",  /* red     */
  [10] = "#3fb7bc", /* green   */
  [11] = "#3a63ae", /* yellow  */
  [12] = "#6a51c5", /* blue    */
  [13] = "#ca61c1", /* magenta */
  [14] = "#c85959", /* cyan    */
  [15] = "#c8c3c3", /* white   */

  /* special colors */
  [256] = "#23110f", /* background */
  [257] = "#c8c3c3", /* foreground */
  [258] = "#c8c3c3",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
