const std = @import("std");
const LinterError = error{ LockedFile, WriteProtected };

fn runLinter(is_locked: bool) LinterError!void {
    std.debug.print("Locking file...\n", .{});
    errdefer {
        std.debug.print("UNLOCKING FILE (Safety)\n", .{});
    }
    if (is_locked) return LinterError.LockedFile;
    std.debug.print("Linter finished successfully\n", .{});
}

pub fn main() !void {
    runLinter(false) catch |err| std.debug.print("Caught: {}\n", .{err});
    runLinter(true) catch |err| std.debug.print("Caught: {}\n", .{err});
}