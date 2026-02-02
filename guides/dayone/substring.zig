const std = @import("std");

// Simulation of a tool that extracts a "tag" from a string
pub fn main() !void {
    const line = "TAG:HeaderData";
    const tag = line[0..3];
    const content = line[4..line.len];

    std.debug.print("Tag: {s} (Length: {})\n", .{tag, tag.len});
    std.debug.print("Content: {s} (Length: {})\n", .{content, content.len});
}