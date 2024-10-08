const hash = '#';

let num = prompt("Enter a number between 1 and 8.");
if (num > 8) {
    window.alert("Number too big!");
}
if (num < 1) {
    window.alert("Number too small!");
}
if (num > 0 && num < 9) {
    for (let stacks = 1; stacks <= num; stacks++) {
    console.log(hash.repeat(stacks));
    }
}