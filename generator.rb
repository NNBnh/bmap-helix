{
  exit: ["collapse_selection"],
  area: ["goto_next_buffer", "goto_previous_buffer"],

  up: ["move_line_up", "copy_selection_on_prev_line"],
  down: ["move_line_down", "copy_selection_on_next_line"],
  left: ["move_char_left", "jump_backward"],
  right: "move_char_right", "jump_forward"],
  backward: ["move_prev_word_start", "move_prev_long_word_start"],
  forward: ["move_next_word_end", "move_next_long_word_end"],

  primary: ["insert_mode", "code_action"],
  secondary: ["search", "rsearch"],
  tertiary: ["extend_line", "extend_to_line_bounds"],
  alt_primary: ["replace", "rename_symbol"],
  alt_secondary: ["select_regex", "split_selection"],
  alt_tertiary: ["keep_primary_selection", "remove_primary_selection"],

  time: ["undo", "redo"],
  cut: ["delete_selection", "delete_selection_noyank"],
  in: ["yank"],
  out: ["paste_before", :todo],

  target: ["search_next", "search_prev"],
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
  command: ["command_mode", "shell_insert_output"],

  focus: ["select_mode", "select_all"],
  self: ["flip_selections", "ensure_selections_forward"],
  cycle: ["rotate_selections_forward", "rotate_selections_backward"],
  item: ["rotate_selection_contents_backward", "rotate_selection_contents_forward"],

  movement: [:todo, "match_brackets"],
  local: ["join_selections", :todo],

  [keys.normal."space"]

  "space" = ["align_view_center", "align_view_middle", "hover"] #TODO
  "ret" = "split_selection_on_newline"
  "tab" = "buffer_picker"
  "S-tab" = "file_picker"

  "i" = ["collapse_selection", "select_mode", "goto_file_start", "normal_mode"]
  "I" = "scroll_up"
  "k" = ["collapse_selection", "select_mode", "goto_file_end", "normal_mode"]
  "K" = "scroll_down"
  "j" = "extend_to_line_start"
  "l" = "extend_to_line_end_newline"
  "u" = ["collapse_selection", "select_mode", "goto_first_nonwhitespace", "normal_mode"]
  "U" = "page_up"
  "O" = "page_down"

  "d" = "surround_add"
  "f" = "search_selection"
  "s" = "select_textobject_inner"
  "e" = "surround_replace"
  "r" = "keep_selections"
  "R" = "remove_selections"
  "w" = "shell_keep_pipe"

  "z" = "earlier"
  "Z" = "later"
  "x" = "surround_delete"

  "n" = "open_below"
  "N" = "open_above"

  "," = ["collapse_selection", "select_mode", "goto_prev_diag", "normal_mode"]
  "lt" = ["collapse_selection", "select_mode", "goto_first_diag", "normal_mode"]
  "." = ["collapse_selection", "select_mode", "goto_next_diag", "normal_mode"]
  "gt" = ["collapse_selection", "select_mode", "goto_last_diag", "normal_mode"]
  "/" = "format_selections"

  "a" = "select_textobject_around"
  "q" = "trim_selections"

  "m" = "symbol_picker"
  "M" = "workspace_symbol_picker"
  "y" = "no_op" #TODO

  [keys.select]

  "esc" = "normal_mode"

  "i" = "extend_line_up"
  "k" = "extend_line_down"
  "j" = "extend_char_left"
  "l" = "extend_char_right"
  "u" = "extend_prev_word_start"
  "U" = "extend_prev_long_word_start"
  "o" = "extend_next_word_end"
  "O" = "extend_next_long_word_end"

  "d" = "change_selection_noyank" #TODO

  "v" = ["delete_selection_noyank", "paste_before"]
  "V" = :todo

  "h" = "extend_search_next"
  "H" = "extend_search_prev"

  ":" = ["delete_selection_noyank", "shell_insert_output"]

  "a" = "extend_line"

  [keys.select."space"]

  "space" = ["align_view_center", "align_view_middle", "hover"] #TODO
  "ret" = "split_selection_on_newline"
  "tab" = "buffer_picker"
  "S-tab" = "file_picker"

  "i" = "goto_file_start"
  "I" = "scroll_up"
  "k" = "goto_file_end"
  "K" = "scroll_down"
  "j" = "extend_to_line_start"
  "l" = "extend_to_line_end"
  "u" = "goto_first_nonwhitespace"
  "U" = "page_up"
  "O" = "page_down"

  "d" = "surround_add"
  "f" = "search_selection"
  "s" = "select_textobject_inner"
  "e" = "surround_replace"
  "r" = "keep_selections"
  "R" = "remove_selections"
  "w" = "shell_keep_pipe"

  "z" = "earlier"
  "Z" = "later"
  "x" = "surround_delete"

  "n" = "open_below"
  "N" = "open_above"

  "," = "goto_prev_diag"
  "lt" = "goto_first_diag"
  "." = "goto_next_diag"
  "gt" = "goto_last_diag"
  "/" = "format_selections"

  "a" = "select_textobject_around"
  "q" = "trim_selections"

  "m" = "symbol_picker"
  "M" = "workspace_symbol_picker"
  "y" = "no_op" #TODO
}
