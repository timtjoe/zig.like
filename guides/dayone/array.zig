const std = @import("std");

// fixed size array
const data = [5]u8{1,2,3,4,5};

// single item pointer
var x: u8 = 10;
const ptr = &x;

//slice
const array = [_]u8{"h","e","l","l","o"};
const slice: []const u8 = array[0..2];

pub fn main() !void {
  std.debug.print("Pointer {}", .{ptr.*});
}