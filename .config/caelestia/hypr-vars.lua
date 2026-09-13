return {
  shadowEnabled       = false,

  workspaceGaps       = 20,
  windowGapsIn        = 3,
  windowGapsOut       = 5,
  singleWindowGapsOut = 10,

  ------------------
  ---- KEYBINDS ----
  ------------------

  -- WINDOW FOCUS
  hl.bind("SUPER + H", hl.dsp.focus({ direction = "l" })),
  hl.bind("SUPER + J", hl.dsp.focus({ direction = "d" })),
  hl.bind("SUPER + K", hl.dsp.focus({ direction = "u" })),
  hl.bind("SUPER + L", hl.dsp.focus({ direction = "r" })),

  hl.bind("SUPER + SHIFT + H", hl.dsp.window.move({ direction = "l" })),
  hl.bind("SUPER + SHIFT + J", hl.dsp.window.move({ direction = "d" })),
  hl.bind("SUPER + SHIFT + K", hl.dsp.window.move({ direction = "u" })),
  hl.bind("SUPER + SHIFT + L", hl.dsp.window.move({ direction = "r" })),

  -- MAXIMIZE
  hl.bind("SUPER + SHIFT + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" })),

  -- Modifier only, the actual binds will be mod + 0-9. These should be strings and not arrays.
  kbGoToWs                   = "SUPER",
  kbGoToWsGroup              = "CTRL + SUPER",
  kbMoveWinToWs              = "SUPER + SHIFT",
  kbMoveWinToWsGroup         = "CTRL + SUPER + ALT",

  -- All the following binds can be either an array of binds to bind multiple keys, or a single string.

  -- Workspaces
  kbMoveWinToWsSpecial       = { "SUPER + SHIFT + Minus", "CTRL + SUPER + SHIFT + Up" },
  kbMoveWinFromWsSpecial     = "SUPER + SHIFT + Down",
  kbMoveWinToWsNext          = { "SUPER + ALT + mouse_down", "SUPER + SHIFT + BRACKETRIGHT", "CTRL + SUPER + SHIFT + Right" },
  kbMoveWinToWsPrev          = { "SUPER + ALT + mouse_up", "SUPER + SHIFT + BRACKETLEFT", "CTRL + SUPER + SHIFT + Left" },
  kbNextWs                   = { "SUPER + mouse_down", "SUPER + BRACKETRIGHT", "SUPER + Page_Down" },
  kbPrevWs                   = { "SUPER + mouse_up", "SUPER + BRACKETLEFT", "SUPER + Page_Up" },
  kbNextWsGroup              = "CTRL + SUPER + mouse_down",
  kbPrevWsGroup              = "CTRL + SUPER + mouse_up",

  -- Window Group
  kbWindowCycleNext          = "ALT + TAB",
  kbWindowCyclePrev          = "SHIFT + ALT + TAB",
  kbWindowGroupCycleNext     = "CTRL + ALT + TAB",
  kbWindowGroupCyclePrev     = "CTRL + SHIFT + ALT + TAB",
  kbUngroup                  = "SUPER + U",
  kbToggleGroup              = "SUPER + Comma",
  kbGroupLockActive          = "SUPER + SHIFT + Comma",

  -- Window Actions
  kbWindowDecreaseWidth      = { "SUPER + CTRL + Minus", "SUPER + ALT + Left" },
  kbWindowIncreaseWidth      = { "SUPER + CTRL + Equal", "SUPER + ALT + Right" },
  kbWindowDecreaseHeight     = { "SUPER + ALT + Minus", "SUPER + ALT + Up" },
  kbWindowIncreaseHeight     = { "SUPER + ALT + Equal", "SUPER + ALT + Down" },

  kbMoveWindow               = "SUPER + Z",
  kbResizeWindow             = "SUPER + X",
  kbCenterWindow             = "CTRL + SUPER + Backslash",
  kbNormalizeWindow          = "CTRL + SUPER + ALT + Backslash",
  kbWindowPip                = "SUPER + ALT + Backslash",
  kbPinWindow                = "SUPER + P",
  kbWindowFullscreen         = "SUPER + F",
  kbWindowBorderedFullscreen = "SUPER + ALT + F",
  kbToggleWindowFloating     = "SUPER + ALT + Space",
  kbCloseWindow              = "SUPER + Q",

  -- Special workspaces toggles
  kbSpecialWs                = "SUPER + S",
  kbSystemMonitorWs          = "CTRL + SHIFT + Escape",
  kbMusicWs                  = "SUPER + M",
  kbCommunicationWs          = "SUPER + D",
  kbTodoWs                   = "SUPER + R",

  -- Apps
  kbTerminal                 = "SUPER + RETURN",
  kbBrowser                  = "SUPER + B",
  kbEditor                   = "SUPER + C",
  kbFileExplorer             = "SUPER + E",
  kbAudioSettings            = "CTRL + ALT + V",

  -- Utilities
  kbScreenshot               = "Print",
  kbScreenshotFreeze         = "SUPER + SHIFT + S",
  kbScreenshotRegion         = "SUPER + SHIFT + ALT + S",
  kbRecord                   = "CTRL + ALT + R",
  kbRecordSound              = "SUPER + ALT + R",
  kbRecordRegion             = "SUPER + SHIFT + ALT + R",
  kbColorPicker              = "SUPER + SHIFT + C",

  -- Media
  kbMediaToggle              = "CTRL + SUPER + Space",
  kbMediaNext                = "CTRL + SUPER + Right",
  kbMediaPrev                = "CTRL + SUPER + Left",
  kbMediaStop                = "CTRL + SUPER + Backspace",
  kbVolumeMute               = "SUPER + SHIFT + M",

  -- Misc
  kbLauncher                 = "ALT + Space",
  kbSession                  = "SUPER + SHIFT + Q",
  kbShowSidebar              = "SUPER + N",
  kbClearNotifs              = "CTRL + ALT + C",
  kbShowPanels               = "SUPER + K",
  kbLock                     = "SUPER + ALT + L",
  kbRestoreLock              = "SUPER + ALT + L",
  kbSleep                    = "SUPER + SHIFT + L",

  -- Clipboard and emoji picker
  kbClipboard                = "SUPER + V",
  kbClipboardDel             = "SUPER + ALT + V",
  kbClipboardPasteLatest     = "CTRL + SHIFT + ALT + V",
  kbEmoji                    = "SUPER + Period",
}
