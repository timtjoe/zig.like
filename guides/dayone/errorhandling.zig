const std = @import("std");

const FileError = error{ NotFound, PermissionDenied };


fn getVersion(id: u32) FileError!u32 {
    if (id) |value| {
        return value;
    } else |err| {
        std.debug.print("Failed with error: {}\n", .{err});
    }
}

var middle_name: ?[]const u8 = "Gemini";


// fn prinMiddleName(name) !u32 
pub fn main() !void {
    const id = getVersion(23080);
    if (middle_name) |name| {
        std.debug.print("Hello {s} \n", .{name});
    } else {
        std.debug.print("No middle name found {s}. \n", .{id});
    }
    // std.debug.print("{}", .{id});
}
