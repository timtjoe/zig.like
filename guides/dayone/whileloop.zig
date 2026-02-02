// Used for traditional looping, also for Error Handling and Optional Unwrapping

// Standard loop
var i: usize = 0;
while (i < 10) : (i += 1) {
  // The : (i += 1) part is the "continue expression"
  // It runs at the end of every loop iteration
}

// You can keep trying an operation untils it succeeds or return a specific error
while(readData()) |payload| {
  // Use the payload
} else |err| {
  // Handle the error that broke the loop
}