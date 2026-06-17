let counter = 0;

function increment() {
  counter++; // set a breakpoint here
  console.log(`Counter: ${counter}`);
}

setInterval(increment, 2000);

console.log(`Started. PID: ${process.pid}`);
console.log("Run node with --inspect flag to enable debugging.");
