// Switch with enum

const Command = enum { build, test_run, clean };

const input = Command.build;

const message = switch (input) {
    .build => "Compiling project...",
    .test_run => "Running test suite...",
    .clean => "Removing artifacts...",
};
