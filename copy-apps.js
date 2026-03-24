const fs = require('fs');
const path = require('path');

const srcBasePath = 'c:\\Users\\HP-PC\\Desktop\\quickserve\\apps';
const dstBasePath = 'c:\\Users\\HP-PC\\Desktop\\quickserve-web\\apps';

const apps = ['web-admin', 'web-consumer', 'web-vendor', 'web-rider'];
const excludeDirs = ['node_modules', '.next', '.vercel', '.git', 'dist'];
const excludeFiles = ['.log'];

function copyDir(src, dst) {
  if (!fs.existsSync(dst)) {
    fs.mkdirSync(dst, { recursive: true });
  }

  const entries = fs.readdirSync(src, { withFileTypes: true });

  entries.forEach(entry => {
    const srcPath = path.join(src, entry.name);
    const dstPath = path.join(dst, entry.name);

    if (entry.isDirectory()) {
      if (!excludeDirs.includes(entry.name)) {
        copyDir(srcPath, dstPath);
      }
    } else {
      if (!excludeFiles.some(pattern => entry.name.endsWith(pattern))) {
        fs.copyFileSync(srcPath, dstPath);
      }
    }
  });
}

console.log('Starting file copy...');
apps.forEach(app => {
  const srcPath = path.join(srcBasePath, app);
  const dstPath = path.join(dstBasePath, app);
  
  console.log(`Copying ${app}...`);
  if (fs.existsSync(srcPath)) {
    copyDir(srcPath, dstPath);
    console.log(`✓ ${app} copied`);
  } else {
    console.log(`✗ ${app} source not found`);
  }
});

console.log('\nAll done!');
console.log('Result:');
fs.readdirSync(dstBasePath).forEach(item => {
  console.log(`  - ${item}`);
});
