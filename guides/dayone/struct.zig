const ToolResult = struct {
  id: u32,
  found_errors: usize,
  file_name: []const u8,
};

var my_result = ToolResult{
  .id = 1,
  .found_errors = 0,
  .file_name = "main.zig",
};

my_result.found_errors += 1;