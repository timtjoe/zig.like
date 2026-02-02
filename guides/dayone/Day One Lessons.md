Welcome to Day 1 of your Zig journey. Because you are building **developer tools**, you cannot afford "magic." In many languages, things happen behind your back (garbage collection, hidden allocations, or complex exception unwinding).

In Zig, **"Only what you see is what you get."** ---

## 📘 Chapter 1: The Philosophy of Control

Zig has no hidden control flow. If a line of code doesn't look like a function call, it isn't one. There are no operator overloads and no property getters.

### 1.1 Variables and Constants

* `const`: Immutable. Use this by default.
* `var`: Mutable. Use this only when the value must change.
* **Static Typing:** You must specify types, but Zig can often infer them.

```zig
const std = @import("std");

pub fn main() void {
    const version: u32 = 1; // Unsigned 32-bit integer
    var tool_name = "Linter"; // Inferred as a null-terminated byte array
    // version = 2; // This would cause a COMPILE error.
}

```

### 1.2 Integer Types

For tooling, you’ll deal with specific bit-widths (parsing binary formats or protocols).

* Signed: `i8`, `i16`, `i32`, `i64`, `i128`.
* Unsigned: `u8`, `u16`, `u32`, `u64`, `u128`.
* Platform-dependent: `usize` (the size of a pointer, essential for indexing arrays).

**Exercise 1:** Create a constant representing a port number (`65535`) and a mutable variable representing the number of files processed. Choose the most memory-efficient integer types.

---

## 📘 Chapter 2: Error Handling (The Union)

In developer tools, things fail: files are missing, permissions are denied, or syntax is wrong. Zig handles this with **Error Unions**.

### 2.1 Error Sets and `!`

An error set is like an `enum`. An Error Union is a type that is either an error OR a value.

```zig
const FileError = error{ NotFound, PermissionDenied };

fn getVersion(id: u32) FileError!u32 {
    if (id == 0) return FileError.NotFound;
    return id;
}

```

### 2.2 `try`, `catch`, and `if (err)`

* `try`: If the function returns an error, return that error immediately to the caller.
* `catch`: Provide a fallback value if an error occurs.
* `if (expression) |value|`: Unwraps the "good" value if it exists.

### 2.3 `errdefer`

This is critical for tooling. It executes code **only if** the function returns an error. This is perfect for cleaning up partial state before bailing out.

**Exercise 2:** Write a function `checkToolVersion(v: u32) !u32`. If `v` is less than 10, return `error.OldVersion`. Otherwise, return `v`. In `main`, call it using `try` and then again using `catch` to provide a default value of `0`.

---

## 📘 Chapter 3: Pointers and Slices

In C, pointers are dangerous. In Zig, they are strictly categorized to prevent bugs.

### 3.1 Pointer Types

1. Single-item pointer (`*T`): Points to exactly one item. No pointer arithmetic allowed.
2. Many-item pointer (`[*]T`): Points to unknown number of items (like C).
3. Slice (`[]T`): A pointer + a length. **This is what you will use 90% of the time.**

### 3.2 Pointer Safety

Zig does not allow `null` pointers by default. If you need a pointer that can be null, you must use an **Optional Pointer** (`?*T`).

**Exercise 3:** Create a slice of integers. Use a `for` loop to iterate through it and print the index and the value. Use `std.debug.print("Index: {} Value: {}\n", .{i, val});`.

---

## 📘 Chapter 4: Control Flow Structures

### 4.1 `switch` (The Powerhouse)

Zig's `switch` is an expression and must be exhaustive (you must handle all cases).

```zig
const category = switch (file_extension) {
    .json, .yaml => "Config",
    .zig, .c => "Source",
    else => "Unknown",
};

```

### 4.2 Loops: `for` and `while`

* `for`: Used for iterating over arrays/slices.
* `while`: Used for general loops. Can also unwrap optionals.

---

## 🏁 Day 1 Comprehensive Exam

**Part A: Theory**

1. Explain why Zig does not have `try/catch` blocks like Java or Python.
2. What is the difference between `usize` and `u64`?
3. What is the memory size of a slice `[]u8` on a 64-bit system? (Hint: it contains a pointer and a length).

**Part B: Implementation**
Write a single Zig file that does the following:

1. Defines an error set named `ParserError` with `InvalidToken` and `UnexpectedEOF`.
2. Creates a function `parseToken(id: u32) ParserError!u32`.
* If `id` is 0, return `InvalidToken`.
* If `id` is 99, return `UnexpectedEOF`.
* Otherwise, return `id * 10`.


3. In `main`, create an array of `u32` containing `{0, 1, 99, 5}`.
4. Iterate through the array. For each number:
* Call `parseToken`.
* If it succeeds, print the result.
* If it fails with `InvalidToken`, print "Skipping invalid."
* If it fails with `UnexpectedEOF`, stop the loop entirely.



---

## 🎯 Verification: How do I know I'm ready?

You have mastered Day 1 if:

* [ ] You can explain to a peer why `try` is just "syntax sugar" for a return.
* [ ] You can write a `switch` statement that handles an `enum` without using `else`.
* [ ] You understand that a slice is just a "window" into memory, not a copy of the data.

**Next Step:** Once you finish the exam, would you like me to review your code or move on to **Day 2: Explicit Memory & Allocators**?