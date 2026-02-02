const std = @import("std");

pub fn main() void {
    const input = "Zig 2024!";
    for (input) |char| {
        const category = switch (char) {
            'a'...'z', 'A'...'Z' => "Letters",
            '0'...'9' => "Digit",
            ' ' => "Whitespace",
            else => "Special",
        };
        std.debug.print("Char '{c}' is a {s}\n", .{ char, category });
    }
}
