
// Scenario: You are writing a parser. You need a struct to keep track of where you are in a file.

const std = @import("std");

const Parser = struct {
  source: []const u8, 
  cursor: usize,

  //'self' is a pointer so we can modify 'cursor'
  fn nextChar(self: *Parser) ?u8 {
    if(self.cursor < self.source.len) {
      const char = self.source[self.cursor];
      self.cursor += 1;
      return char;
    }
    return null;
  }
};

pub fn main() void {
  var p = Parser{
    .source = "Zig",
    .cursor = 0,
  };

  while (p.nextChar()) |c| {
    std.debug.print("Char: {c}\n", .{c});
  }
}