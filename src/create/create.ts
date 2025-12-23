#!/usr/bin/env vite-node
import { execSync } from 'node:child_process';
import { mkdirSync, writeFileSync } from 'node:fs';
import { resolve } from 'node:path';

// Parse command line arguments
const args = process.argv.slice(2);
const name = args[0];
const template = args[1];

class InvalidTemplateError extends Error {}

const availableTemplates: { [Name: string]: string } = {
  'base': 'git@bitbucket.org:kneczaj/typescript-base.git',
  'node': 'git@bitbucket.org:kneczaj/typescript-node.git',
  'react': 'git@bitbucket.org:kneczaj/typescript-react.git',
  'react-graphql': 'git@bitbucket.org:kneczaj/typescript-react-graphql.git'
};

function usage() {
  return `usage: <dir name> <?template>, where template is one of: ${Object.keys(availableTemplates).join(', ')}`;
}

function applyTemplate(template: string) {
  const remote = availableTemplates[template];
  if (!remote) {
    throw new InvalidTemplateError(`No template called ${template}`);
  }
  // Add template remote, fetch, and merge
  execSync(`git remote add template ${remote}`, {
    stdio: 'inherit',
  });
  execSync('git fetch template', { stdio: 'inherit' });
  execSync(`git merge --squash --allow-unrelated-histories template/master`, {
    stdio: 'inherit',
  });
  execSync(`git commit -m "feat: use template ${template}"`, { stdio: 'inherit' });
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

  if (template) {
    applyTemplate(template);
    console.log(`Project "${name}" created successfully using template "${template}"`);
  } else {
    console.log(`Project "${name}" created successfully using no template`);
  }
} catch (error) {
  if (error instanceof Error) {
    console.error('Error creating project:', error.message);
  }
  usage();
  process.exit(1);
}
