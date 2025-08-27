# Code style - Typescript & Javascript

## General

### Immutability
1. Always use immutable methods
2. Immutability has priority over performance
3. Do not use `for` loops, `forEach` and `push` if they may be substituted
   by `map`, `filter`, `reduce`.
4. For side effects and only then forEach() is possible

### Typing
1. Arrays are never optional. If no data, then this property has empty array
   value

### Imports
1. do not use `import type`

### Scripts
1. `yarn test:once` for single run of unit
2. `yarn fix` to run linter

## Unit tests

### General
Unit tests should be as brief as possible, still with 100% coverage, and all
edge cases covered.

### Stack
1. vitest
2. react-testing-library

### Naming
1. Unit tests file names should have `.spec.ts` or `.spec.tsx` extension.
2. Test cases use `it`, not `test` and they are formed in Present Simple with
   no "should" nor "will" e.g. "renders button", "does not render button"

### Mocks
1. All mocks are placed in `mocks.ts` file in the same directory as the test
   file. This is also about results.
2. All mocks should be typed.
3. Mocks are imported to test file with `import * as MOCKS from './mocks.ts`.
4. Do not use `vi.clearAllMocks();` as it is set to auto clear.
5. Do not use "mock" as part of the mock name.

## Code formatting
1. All conditional statements should be wrapped in brackets.
2. Return result from function as early as possible
