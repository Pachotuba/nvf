// Basic Node.js process for debugging
// Run with: node --inspect debug-server.js
// Or with: node --inspect-brk debug-server.js (breaks on first line)

let counter = 0;

function main() {
  console.log(
    `[${new Date().toISOString()}] Server running - Counter: ${counter}`,
  );

  // Simulate some work
  processData();

  counter++;
}

function processData() {
  // Simple function to set breakpoints in
  const data = {
    timestamp: Date.now(),
    value: Math.random() * 100,
    status: "active",
  };

  console.log("Data processed:", data);
  return data;
}

// Run main function every 2 seconds
setInterval(main, 5000);

// Handle graceful shutdown
process.on("SIGINT", () => {
  console.log("\nServer shutting down gracefully...");
  process.exit(0);
});

console.log("Debug server started on PID:", process.pid);
console.log("Attach debugger with: node inspect localhost:9229");
console.log("Press Ctrl+C to stop");
