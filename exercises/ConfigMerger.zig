const std = @import("std");

const LogLevel = enum { Info, Debug, Error };
const Config = struct {
    version: u32,
    level: LogLevel,
};

fn mergeConfig(user: ?Config, default: Config) Config {
    if (user) |u| {
        return u;
    } else {
        return default;
    }
}

pub fn main() !void {
    const def = Config{ .version = 1, .level = .Info };
    const user_pref: ?Config = null;

    const final_config = mergeConfig(user_pref, def);
    std.debug.print("Final Version: {}\n", .{final_config.version});
}
