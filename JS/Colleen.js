/*
	Thx JS .toString() method
*/

function print_itself(){
	console.log(print_itself.toString());
}

(function main(){
    console.log("/*\n\tThx JS .toString() method\n*/\n");
	print_itself();
	console.log("\n(" + main.toString() + ")()");
})()
