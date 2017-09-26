# Useful Java Conventions
## Type Conversion
#### `char` and `int`
1. `char` to `int`: `int n = c - '0'`.
1. `int` to `char`: `char c = (char)a`.
#### `String` and `int`
1. `String` to `int`: `int result = Integer.parseInt("123");`.
1. `int` to `String`: `String result = 1 + "";`.
#### `long` and `int`
1. `long` to `int`: `long l = (long) int;`. (bit will lose if overflow)
1. `int` to `long`: `Long.valueOf(int)`.
#### `long` and `int`

## Data Structure methods
#### ArrayList
1. `size()` Return the length of the arraylist.
1. `add(int index, E element)` Insert an element at the specified index
