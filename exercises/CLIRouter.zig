const std = @import("std");
const Action = enum { Help, Version, Scan };

pub fn getLink(action: Action) []const u8 {
    const message = switch (action) {
        .Help => "https://docs.com",
        .Version => "https://version.com",
        .Scan => "https://scan.com",
    };
    return message;
}
pub fn main() !void {
    const current_action = Action.Scan;
    const url = getLink(current_action);
    std.debug.print("URL: {s} \n", .{url});
}
