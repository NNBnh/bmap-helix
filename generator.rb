
dwim_exit = {
  normal: "collapse_selection",
  select: "normal_mode",
  insert: "normal_mode"
}

#TODO
# "i" = "extend_line_up"
# "k" = "extend_line_down"
# "j" = "extend_char_left"
# "l" = "extend_char_right"
# "u" = "extend_prev_word_start"
# "U" = "extend_prev_long_word_start"
# "o" = "extend_next_word_end"
# "O" = "extend_next_long_word_end"

# [keys.select."space"]
# "i" = "goto_file_start"
# "I" = "scroll_up"
# "k" = "goto_file_end"
# "K" = "scroll_down"
# "j" = "extend_to_line_start"
# "l" = "extend_to_line_end"
# "u" = "goto_first_nonwhitespace"

target_next = {
  normal: "search_next",
  select: "extend_search_next"
}

target_prev = {
  normal: "search_prev",
  select: "extend_search_prev"
}

dwim_insert = {
  normal: "insert_mode"
  select: ["delete_selection_noyank", "insert_mode"],
  insert: "completion"
}

dwim_paste = {
  normal: "paste_before",
  select: ["delete_selection_noyank", "paste_before"]
}

dwim_shell = {
  normal: "shell_insert_output",
  select: ["delete_selection_noyank", "shell_insert_output"]
}

dwim_select = {
  normal: "select_mode",
  select: "extend_line"
}

map = {
  exit: [dwim_exit],
  area: ["goto_next_buffer", "goto_previous_buffer"],

  up: ["move_line_up", "copy_selection_on_prev_line"],
  down: ["move_line_down", "copy_selection_on_next_line"],
  left: ["move_char_left", "jump_backward"],
  right: "move_char_right", "jump_forward"],
  backward: ["move_prev_word_start", "move_prev_long_word_start"],
  forward: ["move_next_word_end", "move_next_long_word_end"],

  primary: [dwim_insert, "code_action"],
  secondary: ["search", "rsearch"],
  tertiary: ["extend_line", "extend_to_line_bounds"],
  alt_primary: ["replace", "rename_symbol"],
  alt_secondary: ["select_regex", "split_selection"],
  alt_tertiary: ["keep_primary_selection", "remove_primary_selection"],

  time: ["undo", "redo"],
  cut: ["delete_selection", "delete_selection_noyank"],
  in: ["yank"],
  out: [dwim_paste, :todo],

  target: [target_next, target_prev],
  bookmark: [:todo, :todo],
  new: ["add_newline_below", "add_newline_above"],
  play: ["replay_macro", "record_macro"],

  previous: ["decrement", "switch_to_lowercase"],
  next: ["increment", "switch_to_uppercase"],
  code: ["toggle_comments", :todo],
  terminal: ["shell_pipe_to", "shell_pipe"],

  align_left: ["unindent", :todo],
  align_right: ["indent", :todo],
  align_center: ["align_selections", :todo],

  minus: [:todo],
  plus: [:todo],

  num_1: [:todo],
  num_2: [:todo],
  num_3: [:todo],
  num_4: [:todo],
  num_5: [:todo],
  num_6: [:todo],
  num_7: [:todo],
  num_8: [:todo],
  num_9: [:todo],
  num_0: [:todo],

  assign: ["select_register"],
  command: ["command_mode", dwim_shell],

  focus: [dwim_select, "select_all"],
  self: ["flip_selections", "ensure_selections_forward"],
  cycle: ["rotate_selections_forward", "rotate_selections_backward"],
  item: ["rotate_selection_contents_backward", "rotate_selection_contents_forward"],

  movement: [:todo, "match_brackets"],
  local: ["join_selections", :todo],

  advance: {
    advance: [["align_view_center", "align_view_middle", "hover"]], #TODO
    enter: ["split_selection_on_newline"],
    area: ["buffer_picker", "file_picker"],

    up: ["goto_file_start", "scroll_up"],
    down: ["goto_file_end", "scroll_down"],
    left: ["extend_to_line_start", :todo],
    right: ["extend_to_line_end_newline", :todo],
    backward: ["goto_first_nonwhitespace", "page_up"],
    forward: [nil, "page_down"],

    primary: ["surround_add"],
    secondary: ["search_selection"],
    tertiary: ["select_textobject_inner"],
    alt_primary: ["surround_replace"],
    alt_secondary: ["keep_selections", "remove_selections"],
    alt_tertiary: ["shell_keep_pipe"],

    time: ["earlier", "later"],
    cut: ["surround_delete"],

    new: ["open_below", "open_above"],

    previous: ["goto_prev_diag", "goto_first_diag"],
    next: ["goto_next_diag", "goto_last_diag"],
    code: ["format_selections"],

    focus: ["select_textobject_around"],
    self: ["trim_selections"],

    movement: ["symbol_picker", "workspace_symbol_picker"],
    local: [:todo]
  }
}
