const std = @import("std");

const ToolError = error{ OldVersion, SystemFailure };

fn checkToolVersion(v: u32) ToolError!u32 {
    if (v < 10) return ToolError.OldVersion;
    return v;
}

fn setupTool(v: u32) ToolError!void {
    std.debug.print("Step 1: Initializing System...\n", .{});
    errdefer {
        std.debug.print("CLEANUP: De-initializing system due to error!\n ", .{});
    }
    std.debug.print("Step 2: Checking version {d}\n", .{v});
    std.debug.print("Step 3: Tool is ready! \n", .{});
}

pub fn main() !void {
    std.debug.print("--- Testing Success ---\n", .{});
    setupTool(15) catch |err| std.debug.print("Caught: {}\n", .{err});
    setupTool(5) catch |err| std.debug.print("Caught: {}\n", .{err});
}
