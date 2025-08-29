#!/usr/bin/env vite-node
import { execSync } from 'node:child_process';
import { mkdirSync, writeFileSync } from 'node:fs';
import { resolve } from 'node:path';

// Parse command line arguments
const args = process.argv.slice(2);
const name = args[0];
const template = args[1];

const availableTemplates = ['base', 'node'];

// Validate arguments
if (!name || !template) {
  console.error(
    `usage: <dir name> <template>, where template is one of: ${availableTemplates.join(', ')}`,
  );
  process.exit(1);
}

if (!availableTemplates.includes(template)) {
  console.error(
    `usage: <dir name> <template>, where template is one of: ${availableTemplates.join(', ')}`,
  );
  process.exit(1);
}

try {
  // Create directory and navigate to it
  mkdirSync(name);
  const projectPath = resolve(name);
  process.chdir(projectPath);

  // Initialize git repository
  execSync('git init', { stdio: 'inherit' });

  // Create and commit LICENSE file
  writeFileSync('LICENSE', '');
  execSync('git add LICENSE', { stdio: 'inherit' });
  execSync('git commit -m "Initial commit"', { stdio: 'inherit' });

  // Add template remote, fetch, and merge
  execSync('git remote add template git@github.com:kneczaj/template-base-ts.git', {
    stdio: 'inherit',
  });
  execSync('git fetch template', { stdio: 'inherit' });
  execSync(`git merge --squash --allow-unrelated-histories template/${template}`, {
    stdio: 'inherit',
  });
  execSync(`git commit -m "feat: use template ${template}"`, { stdio: 'inherit' });

  console.log(`✅ Project "${name}" created successfully using template "${template}"`);
} catch (error) {
  if (error instanceof Error) {
    console.error('❌ Error creating project:', error.message);
  }
  process.exit(1);
}
