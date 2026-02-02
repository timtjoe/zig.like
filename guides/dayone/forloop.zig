// For iterating over Arrays and Slices 
// Allows looping over two slices. useful for tools that compare data
const std = @import("std");
const tags = [_]u8{'A','B','C'};
const vals = [_]u8{10, 20, 30};

pub fn main() !void {

for(tags, vals) |t, v| {
  std.debug.print("Tag {c} has value {d}\n", .{t, v});
}
}
