const hashodd = ' #';
const hasheven = '# ';

let size = prompt("Enter size.")

if (size > 0) {
    for (let s = 1; s <= size; s++) {
        if (s % 2 !== 0) {
            console.log(hashodd.repeat(size/2));
        }
            else {
                console.log(hasheven.repeat(size/2));
            }
    }
}
    else {
        window.alert("Not a valid number.");
    }