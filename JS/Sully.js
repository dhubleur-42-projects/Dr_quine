let x = 5;

const main = () => {
	if (x <= 0)
		return;
	const fs = require('fs');
	x--;
	const filename = "Sully_" + x + ".js";
	fs.writeFileSync(filename, 'let x =' + x + ';\n\nconst main = ' + main.toString() + ';\n\nmain();\nmodule.exports.main = main;\n', 'utf8');
	const child_process = require('./' + filename);
	child_process.main();
};

main();
module.exports.main = main;
