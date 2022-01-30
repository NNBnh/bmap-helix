def dwim_insert(main_cmd, ins_cmd = nil)
  if ins_cmd.nil?
    {
      normal: ["collapse_selection", main_cmd],
      select: ["delete_selection_noyank", main_cmd]
    }
  else
    {
      normal: ["collapse_selection", main_cmd],
      select: ["delete_selection_noyank", main_cmd],
      insert: ins_cmd
    }
  end
end

def dwim_movement(cmd)
  {
    normal: cmd,
    select: cmd.gsub(/\A(move_|go|)/, "extend_")
  }
end

action_map = {
  exit: [
    {
      normal: "collapse_selection",
      select: "normal_mode",
      insert: "normal_mode"
    }
  ],
  area: ["goto_next_buffer", "goto_previous_buffer"],

  up: [dwim_movement("move_line_up"), "copy_selection_on_prev_line"],
  down: [dwim_movement("move_line_down"), "copy_selection_on_next_line"],
  left: [dwim_movement("move_char_left"), "jump_backward"],
  right: [dwim_movement("move_char_right"), "jump_forward"],
  backward: [dwim_movement("move_prev_word_start"), dwim_movement("move_prev_long_word_start")],
  forward: [dwim_movement("move_next_word_end"), dwim_movement("move_next_long_word_end")],

  primary: [dwim_insert("insert_mode", "completion"), "code_action"],
  secondary: ["search", "rsearch"],
  tertiary: ["extend_line", "extend_to_line_bounds"],
  alt_primary: ["replace", "rename_symbol"],
  alt_secondary: ["select_regex", "split_selection"],
  alt_tertiary: ["keep_primary_selection", "remove_primary_selection"],

  time: ["undo", "redo"],
  cut: ["delete_selection", "delete_selection_noyank"],
  in: ["yank"],
  out: [dwim_insert("paste_before"), :todo],

  target: [dwim_movement("search_next"), dwim_movement("search_prev")],
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

  num_1: [:not_todo],
  num_2: [:not_todo],
  num_3: [:not_todo],
  num_4: [:not_todo],
  num_5: [:not_todo],
  num_6: [:not_todo],
  num_7: [:not_todo],
  num_8: [:not_todo],
  num_9: [:not_todo],
  num_0: [:not_todo],

  assign: ["select_register"],
  command: ["command_mode", dwim_insert("shell_insert_output")],

  focus: [
    {
      normal: "select_mode",
      select: "extend_line"
    },
    "select_all"
  ],
  self: ["flip_selections", "ensure_selections_forward"],
  cycle: ["rotate_selections_forward", "rotate_selections_backward"],
  item: ["rotate_selection_contents_backward", "rotate_selection_contents_forward"],

  movement: [:todo, "match_brackets"],
  local: ["join_selections", :todo],

  advance: {
    advance: [["align_view_center", "align_view_middle", "hover"]], #TODO
    enter: ["split_selection_on_newline"],
    area: ["buffer_picker", "file_picker"],

    up: ["goto_file_start", "scroll_up"], #TODO
    down: ["goto_file_end", "scroll_down"], #TODO
    left: [dwim_movement("goto_line_start"), :todo],
    right: [dwim_movement("goto_line_end_newline"), :todo],
    backward: ["goto_first_nonwhitespace", "page_up"], #TODO
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

key_map = {
# up: "up",
# down: "down",
# left: "left",
# right: "right",
# pgup: "pageup",
# pgdn: "pagedown",
# home: "home",
# end: "end",

# back: "backspace",
# delete: "del",
  advance: "space",
  enter: "ret",
  area: "tab",
  exit: "esc",

  up: "i",
  down: "k",
  left: "j",
  right: "l",
  backward: "u",
  forward: "o",

  primary: "d",
  secondary: "f",
  tertiary: "s",
  alt_primary: "e",
  alt_secondary: "r",
  alt_tertiary: "w",

  time: "z",
  cut: "x",
  in: "c",
  out: "v",

  target: "h",
  bookmark: "b",
  new: "n",
  play: "p",

  previous: [",", "lt"],
  next: [".", "gt"],
  code: ["/", "?"],
  terminal: ["`", "~"],

  align_left: ["[", "{"],
  align_right: ["]", "}"],
  align_center: ["\\", "|"],

  minus: ["minus", "_"],
  plus: ["=", "plus"],

  num_1: ["1", "!"],
  num_2: ["2", "@"],
  num_3: ["3", "#"],
  num_4: ["4", "$"],
  num_5: ["5", "percent"],
  num_6: ["6", "^"],
  num_7: ["7", "&"],
  num_8: ["8", "*"],
  num_9: ["9", "("],
  num_0: ["0", ")"],

  assign: ["'", '"'],
  command: ["semicolon", ":"],

  focus: "a",
  self: "q",
  cycle: "g",
  item: "t",

  movement: "m",
  local: "y",
}

key_map.each do |meaning, keys|
  if keys.is_a?(String)
    if keys.length == 1
      keys = [keys, keys.upcase]
    else
      keys = [keys, "S-#{keys}"]
    end
  end

  key = keys[0]
  key_shift = keys[1]
  key_alt = "A-#{key}"
  key_alt_shift = "A-#{key_shift}"

  actions = action_map[meaning]

  normal_action = actions[0][:normal] || actions[0] || "no_op"
  normal_action_shift = actions[1][:normal] || actions[1] || "no_op"
  select_action = actions[0][:select] || normal_action || "no_op"
  select_action_shift = actions[1][:select] || normal_action_shift || "no_op"
  insert_action = actions[0][:insert] || normal_action || "no_op"
  insert_action_shift = actions[1][:insert] || normal_action_shift || "no_op"

  {
    key => normal_action,
    key_shift => normal_action_shift,
    key_alt => normal_action,
    key_alt_shift => normal_action_shift
  }

  {
    key => select_action,
    key_shift => select_action_shift,
    key_alt => select_action,
    key_alt_shift => select_action_shift
  }

  {
    key => insert_action,
    key_shift => insert_action_shift,
    key_alt => insert_action,
    key_alt_shift => insert_action_shift
  }
end
