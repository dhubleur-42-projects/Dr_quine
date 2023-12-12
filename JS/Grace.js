const fs = require('fs');

/*
	Const definition ~= macro
*/
const FILE_NAME = "Grace_kid.js";
const REQ = "require('fs')";
const CODE = () => {
	fs.writeFileSync(FILE_NAME, 'const fs = require(\'fs\');\n\n/*\n\tConst definition ~= macro\n*/\nconst FILE_NAME = "Grace_kid.js";\nconst REQ = "require(\'fs\')";\nconst CODE = ' + CODE.toString() + ';\n\nCODE();\n', 'utf8');
};

CODE();
