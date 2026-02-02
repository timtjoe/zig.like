const std = @import("std");

const ParserError = error{ InvalidToken, UnexpectedEOF };

fn parseToken(id: u32) ParserError!u32 {
    if (id == 0) return ParserError.InvalidToken;
    if (id == 99) return ParserError.UnexpectedEOF;
    return id * 10;
}
pub fn main() !void {
    const tokens = [_]u32{ 0, 1, 99, 5 };

    for (tokens) |token| {
        if (parseToken(token)) |t| {
            std.debug.print("Result: {d}", .{t});
        } else |err| {
            if (err == error.InvalidToken) {
                std.debug.print("Skipping invalid...\n", .{});
                continue; //Move to the next token
            }
            if (err == error.UnexpectedEOF) {
                std.debug.print("Reaching end of file unexpectedly.\n", .{});
                return err; //Exit main with the error
            }
        }
    }
}
