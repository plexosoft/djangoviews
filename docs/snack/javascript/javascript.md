# Full Javascript Comprehensive List by Frank Arellano

1. Variable Declaration (var, let, const)
2. Arrow Functions
3. Template Literals
4. Destructuring Assignment
5. Default Parameters
6. Promises and Async/Await
7. Array Methods (map, filter, reduce)
8. Classes and Inheritance
9. JavaScript `async` and `await`
10. JavaScript Promises
11. Spread Operator in Arrays
12. Spread Operator in Objects
13. Rest Parameters
14. Object Literal Enhancements
15. For...of Loop
16. Modules (Import/Export)
17. Ternary Operator
18. Array.find() Method
19. Array.some() Method
20. Nullish Coalescing Operator (??)
21. Array.forEach() Method
22. Array.map() Method
23. Array.filter() Method
24. Array.reduce() Method
25. Using Fetch API for HTTP Requests
26. Async Function with Try-Catch
27. Object.entries()
28. Object.keys() and Object.values()
29. Destructuring Assignment with Arrays
30. Set Data Structure
31. Class Constructor and Methods
32. Getter and Setter in Classes
33. Static Methods in Classes
34. Promise Chaining
35. Immediate Invoked Function Expression (IIFE)
36. Optional Chaining (?.)
37. Template Literals with Expressions
38. Tagged Template Literals
39. Array Destructuring with Swap
40. Function Rest Parameters
41. Using `Array.includes()`
42. Default Destructuring Values
43. Using `Array.every()`
44. Multi-line String Using Template Literals
45. Destructuring Function Parameters
46. JavaScript Modules - Exporting and Importing
47. Using `String.startsWith()` and `String.endsWith()`
48. Using `Object.freeze()`
49. Array `findIndex()` Method
50. JavaScript Proxy
51. Using `Array.slice()`
52. JavaScript `Set` Object
53. JavaScript `Map` Object
54. Dynamic Property Names in Objects
55. Using `String.includes()`
56. Using `Array.splice()`
57. Using `Math` Object
58. Using `Date` Object
59. JavaScript `setTimeout` and `clearTimeout`
60. JavaScript `setInterval` and `clearInterval`
61. Creating a Deep Clone of an Object
62. JavaScript Regular Expressions
63. JavaScript `try...catch` Statement
64. JavaScript Immediately Invoked Arrow Function
65. JavaScript `Array.from()` Method
66. JavaScript `Array.reduceRight()` Method
67. Using `Object.assign()`
68. JavaScript `Promise.all()`
69. JavaScript `Promise.race()`
70. JavaScript `Promise.reject()` and `Promise.resolve()`
71. Object Property Shorthand
72. Using `Array.concat()`
73. Using `String.repeat()`
74. Default Export and Import
75. Destructuring Nested Objects
76. JavaScript `Symbol` Type
77. Using `Array.map()` with `thisArg`
78. JavaScript `Set` Iteration
79. Using `Array.find()` on Objects
80. Multidimensional Array
81. Using `Array.unshift()` and `Array.shift()`
82. JavaScript `this` Keyword
83. JavaScript `for...in` Loop
84. Creating and Throwing Errors
85. JavaScript `Date` Methods
86. Using `Array.sort()`
87. Using `Array.reverse()`
88. Deep Freezing an Object
89. Using `new Function` Syntax
90. JavaScript IIFE with Parameters
91. JavaScript `Map` Iteration
92. JavaScript WeakMap
93. Using `Array.flatMap()`
94. Destructuring with Rest in Function Parameters
95. Using `Object.create()`
96. Using `Array.fill()`
97. JavaScript Arrow Function with Default Parameters
98. JavaScript `Function.bind()`
99. JavaScript Async Generator Functions
100. JavaScript `Promise.allSettled()`

This comprehensive list covers a broad spectrum of JavaScript topics, ranging from basic syntax and operations to advanced concepts and functionalities. It's an excellent resource for learning and reference.

1. **Variable Declaration (var, let, const)**
   ```javascript
   var oldWay = "Global or function scope";
   let blockScope = "Block scope (e.g., inside an if-statement or loop)";
   const constantValue = "Constant value that cannot be reassigned";
   ```
   Explanation: `var` declares a variable with function or global scope, `let` allows for block-level scoping, and `const` is for variables that shouldn't be reassigned.

2. **Arrow Functions**
   ```javascript
   const add = (a, b) => a + b;
   ```
   Explanation: Arrow functions provide a concise syntax for writing functions in JavaScript. They are especially useful for one-liner functions.

3. **Template Literals**
   ```javascript
   let name = "Alice";
   console.log(`Hello, ${name}!`);
   ```
   Explanation: Template literals allow for embedding expressions in strings, using `${}` syntax, which can be more readable than traditional string concatenation.

4. **Destructuring Assignment**
   ```javascript
   const person = { name: "John", age: 30 };
   const { name, age } = person;
   ```
   Explanation: Destructuring allows you to unpack values from arrays or properties from objects into distinct variables.

5. **Default Parameters**
   ```javascript
   function greet(name = "Guest") {
       return `Hello, ${name}!`;
   }
   ```
   Explanation: Default parameters let you set default values for function parameters if no value or undefined is passed.

6. **Promises and Async/Await**
   ```javascript
   const fetchData = () => new Promise(resolve => setTimeout(() => resolve("Data"), 1000));
   async function getData() {
       const data = await fetchData();
       console.log(data);
   }
   ```
   Explanation: Promises are used for asynchronous operations. `async` and `await` are syntactic sugar that make working with Promises more comfortable and readable.

7. **Array Methods (map, filter, reduce)**
   ```javascript
   let numbers = [1, 2, 3, 4, 5];
   let doubled = numbers.map(n => n * 2);
   let even = numbers.filter(n => n % 2 === 0);
   let sum = numbers.reduce((total, n) => total + n, 0);
   ```
   Explanation: JavaScript arrays have built-in methods like `map`, `filter`, and `reduce` for transforming, filtering, and combining array elements.

8. **Classes and Inheritance**
   ```javascript
   class Animal {
       constructor(name) {
           this.name = name;
       }
       speak() {
           console.log(`${this.name} makes a noise.`);
       }
   }

   class Dog extends Animal {
       speak() {
           console.log(`${this.name} barks.`);
       }
   }
   ```
   Explanation: ES6 introduced class syntax as syntactic sugar over JavaScript's existing prototype-based inheritance, making object creation more straightforward.

9. **JavaScript `async` and `await`**
    ```javascript
    async function fetchData() {
        try {
            const response = await fetch('https://api.example.com/data');
            const data = await response.json();
            console.log(data);
        } catch (error) {
            console.error('Error:', error);
        }
    }
    ```
    Explanation: The `async` function declaration defines an asynchronous function, which returns an `AsyncFunction` object. When `await` is used, it pauses the execution of the function until the Promise is resolved.

10. **JavaScript Promises**
    ```javascript
    const myPromise = new Promise((resolve, reject) => {
        const condition = true;
        if (condition) {
            resolve('Promise is resolved successfully.');
        } else {
            reject('Promise is rejected');
        }
    });

    myPromise.then(result => console.log(result))
             .catch(error => console.log(error));
    ```
    Explanation: A `Promise` in JavaScript is used for asynchronous operations. It represents a value that may be available now, in the future, or never.

11. **Spread Operator in Arrays**
    ```javascript
    let arr1 = [1, 2, 3];
    let arr2 = [...arr1, 4, 5]; // [1, 2, 3, 4, 5]
    ```
    Explanation: The spread operator `...` allows an iterable like an array to be expanded in places where zero or more arguments or elements are expected.

12. **Spread Operator in Objects**
    ```javascript
    let obj1 = { a: 1, b: 2 };
    let obj2 = { ...obj1, c: 3 }; // { a: 1, b: 2, c: 3 }
    ```
    Explanation: The spread operator can also be used to copy properties from one object to another, making it useful for merging objects.

13. **Rest Parameters**
    ```javascript
    function sum(...numbers) {
        return numbers.reduce((acc, current) => acc + current, 0);
    }
    ```
    Explanation: Rest parameters allow a function to accept an indefinite number of arguments as an array.

14. **Object Literal Enhancements**
    ```javascript
    let name = "Tom";
    let age = 25;
    let person = { name, age }; // { name: "Tom", age: 25 }
    ```
    Explanation: In ES6, if an object property name is the same as the variable name, you can use this shorthand syntax.

15. **For...of Loop**
    ```javascript
    let iterable = [10, 20, 30];
    for (let value of iterable) {
        console.log(value);
    }
    ```
    Explanation: The `for...of` loop creates a loop iterating over iterable objects, including: built-in String, Array, array-like objects, and more.

16. **Modules (Import/Export)**
    ```javascript
    // In file math.js
    export const add = (a, b) => a + b;

    // In another file
    import { add } from './math.js';
    ```
    Explanation: ES6 modules allow you to break up your code into separate files, improving organization and reusability.

17. **Ternary Operator**
    ```javascript
    let isMember = true;
    let discount = isMember ? 10 : 0;
    ```
    Explanation: The ternary operator is a shorthand for the `if-else` statement and is great for simple conditional assignments.

18. **Array.find() Method**
    ```javascript
    let array = [1, 2, 3, 4, 5];
    let found = array.find(element => element > 3); // 4
    ```
    Explanation: `Array.find()` returns the value of the first element in the provided array that satisfies the provided testing function.

19. **Array.some() Method**
    ```javascript
    let array = [1, 2, 3, 4, 5];
    let hasLargeNumbers = array.some(element => element > 4); // true
    ```
    Explanation: `Array.some()` tests whether at least one element in the array passes the test implemented by the provided function.

20. **Nullish Coalescing Operator (??)**
    ```javascript
    let foo = null;
    let bar = foo ?? 'default value'; // 'default value'
    ```
    Explanation: The nullish coalescing operator `??` returns the right-hand operand when the left-hand operand is `null` or `undefined`.

21. **Array.forEach() Method**
    ```javascript
    let numbers = [1, 2, 3, 4, 5];
    numbers.forEach(number => console.log(number));
    ```
    Explanation: `forEach()` method executes a provided function once for each array element. It's a way to iterate over an array.

22. **Array.map() Method**
    ```javascript
    let numbers = [1, 2, 3, 4, 5];
    let squared = numbers.map(number => number * number); // [1, 4, 9, 16, 25]
    ```
    Explanation: `map()` creates a new array populated with the results of calling a provided function on every element in the calling array.

23. **Array.filter() Method**
    ```javascript
    let numbers = [1, 2, 3, 4, 5];
    let evenNumbers = numbers.filter(number => number % 2 === 0); // [2, 4]
    ```
    Explanation: `filter()` creates a new array with all elements that pass the test implemented by the provided function.

24. **Array.reduce() Method**
    ```javascript
    let numbers = [1, 2, 3, 4, 5];
    let sum = numbers.reduce((total, number) => total + number, 0); // 15
    ```
    Explanation: `reduce()` executes a reducer function on each element of the array, resulting in a single output value.

25. **Using Fetch API for HTTP Requests**
    ```javascript
    fetch('https://api.example.com/data')
        .then(response => response.json())
        .then(data => console.log(data))
        .catch(error => console.error('Error:', error));
    ```
    Explanation: Fetch API provides a JavaScript interface for accessing and manipulating parts of the HTTP pipeline, such as requests and responses.

26. **Async Function with Try-Catch**
    ```javascript
    async function fetchData() {
        try {
            let response = await fetch('https://api.example.com/data');
            let data = await response.json();
            console.log(data);
        } catch (error) {
            console.error('Error:', error);
        }
    }
    ```
    Explanation: `async` functions enable writing promise-based code as if it were synchronous, but without blocking the execution thread.

27. **Object.entries()**
    ```javascript
    const object = { a: 1, b: 2, c: 3 };
    for (const [key, value] of Object.entries(object)) {
        console.log(`${key}: ${value}`);
    }
    ```
    Explanation: `Object.entries()` returns an array of a given object's own enumerable string-keyed property [key, value] pairs.

28. **Object.keys() and Object.values()**
    ```javascript
    const object = { a: 1, b: 2, c: 3 };
    console.log(Object.keys(object)); // ["a", "b", "c"]
    console.log(Object.values(object)); // [1, 2, 3]
    ```
    Explanation: `Object.keys()` returns an array of a given object's property names, and `Object.values()` returns an array of a given object's own enumerable property values.

29. **Destructuring Assignment with Arrays**
    ```javascript
    let [first, , third] = [1, 2, 3];
    console.log(first, third); // 1, 3
    ```
    Explanation: Destructuring on arrays allows you to unpack values from array elements into distinct variables.

30. **Set Data Structure**
    ```javascript
    let mySet = new Set([1, 2, 3, 4, 4]);
    console.log(mySet); // Set(4) {1, 2, 3, 4}
    ```
    Explanation: A `Set` is a collection of values where each value must be unique. It's useful for creating a collection with no duplicates.

31. **Class Constructor and Methods**
    ```javascript
    class Person {
        constructor(name) {
            this.name = name;
        }
        greet() {
            console.log(`Hello, my name is ${this.name}!`);
        }
    }
    let person = new Person("Alice");
    person.greet(); // "Hello, my name is Alice!"
    ```
    Explanation: Classes in JavaScript provide a much more clear and concise way to create objects and deal with inheritance.

32. **Getter and Setter in Classes**
    ```javascript
    class Person {
        constructor(name) {
            this._name = name;
        }
        get name() {
            return this._name;
        }
        set name(value) {
            this._name = value;
        }
    }
    let person = new Person("Bob");
    console.log(person.name); // "Bob"
    person.name = "Charlie";
    console.log(person.name); // "Charlie"
    ```
    Explanation: Getters and setters allow you to define Object Accessors (Computed Properties).

33. **Static Methods in Classes**
    ```javascript
    class MathUtil {
        static sum(a, b) {
            return a + b;
        }
    }
    console.log(MathUtil.sum(5, 5)); // 10
    ```
    Explanation: Static methods are called without instantiating their class and cannot be called through a class instance.

34. **Promise Chaining**
    ```javascript
    new Promise((resolve, reject) => {
        setTimeout(() => resolve(1), 1000);
    }).then(result => {
        console.log(result); // 1
        return result * 2;
    }).then(result => {
        console.log(result); // 2
        return result * 3;
    }).then(result => {
        console.log(result); // 6
        return result * 4;
    });
    ```
    Explanation: Promise chaining is a syntax that allows you to chain together multiple asynchronous operations in a sequence.

35. **Immediate Invoked Function Expression (IIFE)**
    ```javascript
    (function() {
        console.log("This function runs right away");
    })();
    ```
    Explanation: IIFE is a JavaScript function that runs as soon as it is defined. It's a common pattern for encapsulating code.

36. **Optional Chaining (?.)**
    ```javascript
    const user = {
        name: "Alice",
        address: {
            street: "123 Main St",
            city: "Wonderland"
        }
    };
    console.log(user?.address?.city); // "Wonderland"
    ```
    Explanation: Optional chaining (`?.`) permits reading the value of a property located deep within a chain of connected objects without having to expressly validate each reference.

37. **Template Literals with Expressions**
    ```javascript
    let a = 5;
    let b = 10;
    console.log(`Fifteen is ${a + b} and not ${2 * a + b}.`);
    ```
    Explanation: Template literals allow expressions to be embedded, which can include arithmetic operations or function calls.

38. **Tagged Template Literals**
    ```javascript
    function highlight(strings, ...values) {
        let str = '';
        strings.forEach((string, i) => {
            str += string + (values[i] || '');
        });
        return str;
    }
    let brand = "Fancy";
    let item = "Shoes";
    console.log(highlight`New! ${brand} ${item}`);
    ```
    Explanation: Tagged templates allow you to parse template literals with a function, giving you control over the string output.

39. **Array Destructuring with Swap**
    ```javascript
    let a = 1, b = 2;
    [a, b] = [b, a];
    console.log(a, b); // 2, 1
    ```
    Explanation: Array destructuring can be used to swap the values of two variables easily.

40. **Function Rest Parameters**
    ```javascript
    function sum(...numbers) {
        return numbers.reduce((a, b) => a + b, 0);
    }
    console.log(sum(1, 2, 3, 4)); // 10
    ```
    Explanation: Rest parameters allow a function to accept an indefinite number of arguments as an array.
Continuing with the journey into JavaScript, here's the next set of 10 snippets:

41. **Using `Array.includes()`**
    ```javascript
    let fruits = ["apple", "banana", "mango", "orange"];
    if (fruits.includes("banana")) {
        console.log("Banana is in the list!");
    }
    ```
    Explanation: `Array.includes()` method checks if an array includes a certain value among its entries, returning `true` or `false`.

42. **Default Destructuring Values**
    ```javascript
    const { a = 10, b = 5 } = { a: 3 };
    console.log(a); // 3
    console.log(b); // 5
    ```
    Explanation: When destructuring an object, you can assign default values that will be used if the property is not found.

43. **Using `Array.every()`**
    ```javascript
    const numbers = [1, 30, 39, 29, 10, 13];
    const isBelowThreshold = (currentValue) => currentValue < 40;
    console.log(numbers.every(isBelowThreshold)); // true
    ```
    Explanation: `Array.every()` tests whether all elements in the array pass the test implemented by the provided function.

44. **Multi-line String Using Template Literals**
    ```javascript
    let multiLineString = `This is a string
    that spans across
    multiple lines`;
    console.log(multiLineString);
    ```
    Explanation: Template literals in ES6 allow for multi-line strings without the need for concatenation.

45. **Destructuring Function Parameters**
    ```javascript
    function drawES6Chart({size = 'big', cords = { x: 0, y: 0 }, radius = 25} = {}) {
        console.log(size, cords, radius);
        // do some chart drawing
    }
    drawES6Chart({
        cords: { x: 18, y: 30 },
        radius: 30
    });
    ```
    Explanation: You can destructure object parameters in a function, allowing for more flexible function signatures.

46. **JavaScript Modules - Exporting and Importing**
    ```javascript
    // file math.js
    export const add = (x, y) => x + y;
    export const subtract = (x, y) => x - y;

    // file main.js
    import { add, subtract } from './math.js';
    console.log(add(2, 3)); // 5
    console.log(subtract(5, 2)); // 3
    ```
    Explanation: ES6 modules allow you to export and import functions, objects, or primitive values from/to different files, which helps in maintaining a modular codebase.

47. **Using `String.startsWith()` and `String.endsWith()`**
    ```javascript
    const str = "Saturday night plans";
    console.log(str.startsWith("Sat")); // true
    console.log(str.endsWith("plans")); // true
    ```
    Explanation: These methods determine whether a string starts or ends with the characters of a specified string.

48. **Using `Object.freeze()`**
    ```javascript
    const obj = { name: "John" };
    Object.freeze(obj);
    obj.name = "Jane"; // This will not change the name property
    console.log(obj); // { name: "John" }
    ```
    Explanation: `Object.freeze()` method freezes an object, preventing new properties from being added to it and existing properties from being removed or changed.

49. **Array `findIndex()` Method**
    ```javascript
    const fruits = ["apple", "banana", "cantaloupe", "blueberries"];
    const index = fruits.findIndex(fruit => fruit === "blueberries");
    console.log(index); // 3
    ```
    Explanation: `findIndex()` returns the index of the first element in the array that satisfies the provided testing function.

50. **JavaScript Proxy**
    ```javascript
    const handler = {
        get: (obj, prop) => prop in obj ? obj[prop] : `Property doesn't exist!`
    };
    const p = new Proxy({}, handler);
    p.a = 1;
    console.log(p.a); // 1
    console.log(p.b); // Property doesn't exist!
    ```
    Explanation: The `Proxy` object enables you to create a proxy for another object, which can intercept and redefine fundamental operations for that object.

51. **Using `Array.slice()`**
    ```javascript
    let numbers = [1, 2, 3, 4, 5];
    let sliced = numbers.slice(1, 4); // [2, 3, 4]
    ```
    Explanation: `Array.slice()` method returns a shallow copy of a portion of an array into a new array object.

52. **JavaScript `Set` Object**
    ```javascript
    let mySet = new Set();
    mySet.add(1);
    mySet.add(5);
    mySet.add(5); // This will not be added as Set only allows unique values
    console.log(mySet); // Set(2) {1, 5}
    ```
    Explanation: The `Set` object lets you store unique values of any type. It's an iterable collection.

53. **JavaScript `Map` Object**
    ```javascript
    let myMap = new Map();
    myMap.set('key1', 'value1');
    myMap.set('key2', 'value2');
    console.log(myMap.get('key1')); // 'value1'
    ```
    Explanation: A `Map` object holds key-value pairs and remembers the original insertion order of the keys.

54. **Dynamic Property Names in Objects**
    ```javascript
    let dynamic = 'flavor';
    let item = {
        [dynamic]: 'chocolate'
    };
    console.log(item.flavor); // 'chocolate'
    ```
    Explanation: ES6 allows you to use computed property names in object initializers, enabling dynamic property names.

55. **Using `String.includes()`**
    ```javascript
    let text = "Hello world, welcome to the universe.";
    let result = text.includes("world"); // true
    ```
    Explanation: `String.includes()` method determines whether one string may be found within another string.

56. **Using `Array.splice()`**
    ```javascript
    let fruits = ['apple', 'banana', 'melon', 'orange'];
    fruits.splice(2, 1, 'grape'); // Removes 'melon' and adds 'grape'
    console.log(fruits); // ['apple', 'banana', 'grape', 'orange']
    ```
    Explanation: `Array.splice()` changes the contents of an array by removing or replacing existing elements and/or adding new elements in place.

57. **Using `Math` Object**
    ```javascript
    console.log(Math.random()); // Returns a random number between 0 and 1
    console.log(Math.max(1, 3, 2)); // 3
    console.log(Math.min(1, 3, 2)); // 1
    ```
    Explanation: The `Math` object provides a lot of mathematical functionality like generating random numbers, finding max/min values, etc.

58. **Using `Date` Object**
    ```javascript
    let now = new Date();
    console.log(now.toString()); // Current date and time
    ```
    Explanation: The `Date` object is used to work with dates and times in JavaScript.

59. **JavaScript `setTimeout` and `clearTimeout`**
    ```javascript
    let timeoutId = setTimeout(() => console.log("This will run after 2 seconds"), 2000);
    clearTimeout(timeoutId); // This will prevent the function inside setTimeout from running
    ```
    Explanation: `setTimeout` sets a timer which executes a function or specified piece of code once the timer expires.

60. **JavaScript `setInterval` and `clearInterval`**
    ```javascript
    let intervalId = setInterval(() => console.log("This will run every 3 seconds"), 3000);
    clearInterval(intervalId); // This will stop the function inside setInterval from running
    ```
    Explanation: `setInterval` sets a timer which repeatedly calls a function or executes a code snippet, with a fixed time delay between each call.

61. **Creating a Deep Clone of an Object**
    ```javascript
    const obj = { a: 1, b: { c: 2 } };
    const objClone = JSON.parse(JSON.stringify(obj));
    objClone.b.c = 3;
    console.log(obj.b.c); // 2 (original object remains unchanged)
    ```
    Explanation: Using `JSON.stringify()` and `JSON.parse()` can create a deep clone of an object. It's a quick way but has limitations like not copying functions or circular references.

62. **JavaScript Regular Expressions**
    ```javascript
    const regex = /hello/;
    const str = "hello world";
    const result = regex.test(str); // true
    ```
    Explanation: Regular expressions are patterns used to match character combinations in strings. In JavaScript, regular expressions are also objects.

63. **JavaScript `try...catch` Statement**
    ```javascript
    try {
        nonExistentFunction();
    } catch (error) {
        console.error(error); // ReferenceError: nonExistentFunction is not defined
    }
    ```
    Explanation: The `try...catch` statement marks a block of statements to try and specifies a response should an exception be thrown.

64. **JavaScript Immediately Invoked Arrow Function**
    ```javascript
    ((name) => {
        console.log(`Hello, ${name}`);
    })("Alice");
    ```
    Explanation: This is an example of an immediately invoked function expression (IIFE) using arrow function syntax.

65. **JavaScript `Array.from()` Method**
    ```javascript
    const set = new Set(['a', 'b', 'c']);
    const array = Array.from(set);
    console.log(array); // ['a', 'b', 'c']
    ```
    Explanation: `Array.from()` creates a new, shallow-copied Array instance from an array-like or iterable object, like a Set.

66. **JavaScript `Array.reduceRight()` Method**
    ```javascript
    const array = [[0, 1], [2, 3], [4, 5]];
    const flattened = array.reduceRight((accumulator, currentValue) => accumulator.concat(currentValue), []);
    console.log(flattened); // [4, 5, 2, 3, 0, 1]
    ```
    Explanation: Similar to `reduce()`, `reduceRight()` applies a function against an accumulator and each value of the array (from right-to-left) to reduce it to a single value.

67. **Using `Object.assign()`**
    ```javascript
    const target = { a: 1, b: 2 };
    const source = { b: 4, c: 5 };
    const returnedTarget = Object.assign(target, source);
    console.log(target); // { a: 1, b: 4, c: 5 }
    console.log(returnedTarget); // { a: 1, b: 4, c: 5 }
    ```
    Explanation: `Object.assign()` is used to copy all enumerable own properties from one or more source objects to a target object.

68. **JavaScript `Promise.all()`**
    ```javascript
    let promise1 = Promise.resolve(3);
    let promise2 = 42;
    let promise3 = new Promise((resolve, reject) => {
        setTimeout(resolve, 100, 'foo');
    });
    Promise.all([promise1, promise2, promise3]).then(values => {
        console.log(values); // [3, 42, "foo"]
    });
    ```
    Explanation: `Promise.all()` is used for executing multiple promises in parallel and wait until all of the promises are resolved.

69. **JavaScript `Promise.race()`**
    ```javascript
    let promise1 = new Promise((resolve, reject) => setTimeout(resolve, 500, 'one'));
    let promise2 = new Promise((resolve, reject) => setTimeout(resolve, 100, 'two'));
    Promise.race([promise1, promise2]).then(value => {
        console.log(value); // "two" - the fastest promise wins the race
    });
    ```
    Explanation: `Promise.race()` method returns a promise that fulfills or rejects as soon as one of the promises in an iterable fulfills or rejects, with the value or reason from that promise.

70. **JavaScript `Promise.reject()` and `Promise.resolve()`**
    ```javascript
    let promise1 = Promise.resolve('Success');
    promise1.then(value => console.log(value)); // "Success"

    let promise2 = Promise.reject(new Error('Failed'));
    promise2.catch(error => console.error(error)); // Error: Failed
    ```
    Explanation: `Promise.resolve()` and `Promise.reject()` are quick ways to return a promise that is resolved with a given value or rejected with a given reason.

71. **Object Property Shorthand**
    ```javascript
    const x = 1, y = 2;
    const obj = { x, y };
    console.log(obj); // { x: 1, y: 2 }
    ```
    Explanation: In ES6, when declaring object properties, if the property name is the same as the variable name, you can use this shorthand syntax.

72. **Using `Array.concat()`**
    ```javascript
    let array1 = ['a', 'b', 'c'];
    let array2 = ['d', 'e', 'f'];
    let array3 = array1.concat(array2);
    console.log(array3); // ["a", "b", "c", "d", "e", "f"]
    ```
    Explanation: `Array.concat()` is used to merge two or more arrays, without changing the existing arrays, and returns a new array.

73. **Using `String.repeat()`**
    ```javascript
    let chorus = "na ";
    console.log(chorus.repeat(5)); // "na na na na na "
    ```
    Explanation: `String.repeat()` constructs and returns a new string which contains the specified number of copies of the string on which it was called, concatenated together.

74. **Default Export and Import**
    ```javascript
    // In file math.js
    const add = (x, y) => x + y;
    export default add;

    // In another file
    import add from './math.js';
    console.log(add(2, 3)); // 5
    ```
    Explanation: Default exports are used when there's only a single value or entity being exported from a module. They can be imported with any name.

75. **Destructuring Nested Objects**
    ```javascript
    const user = {
        id: 339,
        name: 'Fred',
        age: 42,
        education: {
            degree: 'Masters'
        }
    };
    const { education: { degree } } = user;
    console.log(degree); // Masters
    ```
    Explanation: Destructuring can be used to extract properties from nested objects.

76. **JavaScript `Symbol` Type**
    ```javascript
    let sym1 = Symbol('foo');
    let sym2 = Symbol('foo');
    console.log(sym1 === sym2); // false
    ```
    Explanation: `Symbol` is a primitive data type of JavaScript, representing a unique token. Symbols are guaranteed to be unique.

77. **Using `Array.map()` with `thisArg`**
    ```javascript
    const numbers = [1, 4, 9];
    const roots = numbers.map(function(num) { return Math.sqrt(num) }, this);
    console.log(roots); // [1, 2, 3]
    ```
    Explanation: `Array.map()` can take a second argument, `thisArg`, which allows you to pass a context (`this` value) to the function.

78. **JavaScript `Set` Iteration**
    ```javascript
    let mySet = new Set(['apple', 'banana', 'orange']);
    for (let item of mySet) {
        console.log(item);
    }
    ```
    Explanation: Sets are iterable and can be iterated over using loops like `for...of`.

79. **Using `Array.find()` on Objects**
    ```javascript
    const inventory = [
        {name: 'apples', quantity: 2},
        {name: 'bananas', quantity: 0},
        {name: 'cherries', quantity: 5}
    ];
    const result = inventory.find(({ name }) => name === 'cherries');
    console.log(result); // { name: 'cherries', quantity: 5 }
    ```
    Explanation: `Array.find()` is very versatile and can be used to find an element in an array of objects, based on some property.

80. **Multidimensional Array**
    ```javascript
    let matrix = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9]
    ];
    console.log(matrix[1][1]); // 5
    ```
    Explanation: JavaScript supports multidimensional arrays, arrays of arrays, which can be used to represent complex data structures like matrices.

81. **Using `Array.unshift()` and `Array.shift()`**
    ```javascript
    let array = [1, 2, 3];
    array.unshift(0); // Add to the beginning
    console.log(array); // [0, 1, 2, 3]
    array.shift(); // Remove from the beginning
    console.log(array); // [1, 2, 3]
    ```
    Explanation: `Array.unshift()` adds one or more elements to the beginning of an array and returns the new length of the array, while `Array.shift()` removes the first element from an array and returns that removed element.

82. **JavaScript `this` Keyword**
    ```javascript
    const person = {
        firstName: "John",
        lastName: "Doe",
        fullName: function() {
            return this.firstName + " " + this.lastName;
        }
    };
    console.log(person.fullName()); // "John Doe"
    ```
    Explanation: In JavaScript, `this` refers to the object it belongs to. Inside a method, `this` refers to the owner object.

83. **JavaScript `for...in` Loop**
    ```javascript
    const object = { a: 1, b: 2, c: 3 };
    for (const key in object) {
        console.log(`${key}: ${object[key]}`);
    }
    ```
    Explanation: The `for...in` statement loops through the properties of an object. The block of code inside the loop will be executed once for each property.

84. **Creating and Throwing Errors**
    ```javascript
    function checkNumber(num) {
        if (isNaN(num)) {
            throw new Error("Not a number");
        }
    }
    try {
        checkNumber('a');
    } catch (e) {
        console.log(e.message); // "Not a number"
    }
    ```
    Explanation: You can create a new error and throw it using the `throw` statement. It's often used in conjunction with `try...catch` for error handling.

85. **JavaScript `Date` Methods**
    ```javascript
    const now = new Date();
    console.log("Year: " + now.getFullYear());
    console.log("Month: " + now.getMonth()); // Note: January is 0
    console.log("Day: " + now.getDate());
    console.log("Hours: " + now.getHours());
    console.log("Minutes: " + now.getMinutes());
    console.log("Seconds: " + now.getSeconds());
    ```
    Explanation: The `Date` object contains numerous methods that allow you to retrieve and manipulate the date and time.

86. **Using `Array.sort()`**
    ```javascript
    let numbers = [4, 2, 5, 1, 3];
    numbers.sort((a, b) => a - b);
    console.log(numbers); // [1, 2, 3, 4, 5]
    ```
    Explanation: `Array.sort()` sorts the elements of an array in place and returns the sorted array. The default sort order is ascending.

87. **Using `Array.reverse()`**
    ```javascript
    let numbers = [1, 2, 3, 4, 5];
    numbers.reverse();
    console.log(numbers); // [5, 4, 3, 2, 1]
    ```
    Explanation: `Array.reverse()` reverses an array in place. The first array element becomes the last, and the last array element becomes the first.

88. **Deep Freezing an Object**
    ```javascript
    function deepFreeze(object) {
        Object.keys(object).forEach(name => {
            let prop = object[name];
            if (typeof prop === 'object' && prop !== null)
                deepFreeze(prop);
        });
        return Object.freeze(object);
    }
    const obj = { a: { b: 2 } };
    deepFreeze(obj);
    obj.a.b = 3; // The operation will fail silently in non-strict mode
    console.log(obj); // { a: { b: 2 } }
    ```
    Explanation: `Object.freeze()` only freezes the immediate properties of an object. `deepFreeze` recursively freezes each property which is of type object.

89. **Using `new Function` Syntax**
    ```javascript
    let sum = new Function('a', 'b', 'return a + b');
    console.log(sum(2, 6)); // 8
    ```
    Explanation: The `Function` constructor creates a new Function object. It's a way to define functions dynamically, but not recommended due to security and performance issues.

90. **JavaScript IIFE with Parameters**
    ```javascript
    (function(a, b) {
        console.log(a + b); // 3
    })(1, 2);
    ```
    Explanation: An Immediately Invoked Function Expression (IIFE) can also take parameters. This pattern is often used to avoid polluting the global scope.

91. **JavaScript `Map` Iteration**
    ```javascript
    let myMap = new Map();
    myMap.set('a', 'alpha');
    myMap.set('b', 'beta');
    myMap.set('g', 'gamma');

    myMap.forEach((value, key) => {
        console.log(`${key}: ${value}`);
    });
    ```
    Explanation: Maps are iterable, and you can use the `forEach()` method to loop through each key-value pair.

92. **JavaScript WeakMap**
    ```javascript
    let weakMap = new WeakMap();
    let obj = {};
    weakMap.set(obj, 'data');
    console.log(weakMap.get(obj)); // 'data'
    obj = null; // Now 'obj' and its associated data can be garbage collected
    ```
    Explanation: A `WeakMap` is a collection of key-value pairs with weakly held keys, which means keys are subject to garbage collection if there is no other reference to the object anymore.

93. **Using `Array.flatMap()`**
    ```javascript
    let arr = [1, 2, 3, 4];
    let mapped = arr.flatMap(x => [x, x * 2]);
    console.log(mapped); // [1, 2, 2, 4, 3, 6, 4, 8]
    ```
    Explanation: `Array.flatMap()` method first maps each element using a mapping function, then flattens the result into a new array.

94. **Destructuring with Rest in Function Parameters**
    ```javascript
    function sum(first, second, ...others) {
        console.log(others); // [3, 4, 5]
        return first + second;
    }
    console.log(sum(1, 2, 3, 4, 5)); // 3
    ```
    Explanation: In function parameters, the rest syntax can be used to represent an indefinite number of arguments as an array.

95. **Using `Object.create()`**
    ```javascript
    const person = {
        isHuman: false,
        printIntroduction: function() {
            console.log(`My name is ${this.name}. Am I human? ${this.isHuman}`);
        }
    };
    const me = Object.create(person);
    me.name = 'Alice'; // "name" is a property set on "me", but not on "person"
    me.isHuman = true; // inherited properties can be overwritten
    me.printIntroduction(); // My name is Alice. Am I human? true
    ```
    Explanation: `Object.create()` creates a new object, using an existing object as the prototype of the newly created object.

96. **Using `Array.fill()`**
    ```javascript
    let array = new Array(5).fill(0);
    console.log(array); // [0, 0, 0, 0, 0]
    ```
    Explanation: `Array.fill()` changes all elements in an array to a static value, from a start index (default 0) to an end index (default array.length).

97. **JavaScript Arrow Function with Default Parameters**
    ```javascript
    const greet = (name = 'Guest') => `Hello, ${name}!`;
    console.log(greet('Alice')); // "Hello, Alice!"
    console.log(greet());         // "Hello, Guest!"
    ```
    Explanation: Arrow functions can have default parameters, which are used when no value or undefined is passed to the function.

98. **JavaScript `Function.bind()`**
    ```javascript
    const module = {
        x: 42,
        getX: function() {
            return this.x;
        }
    };
    const unboundGetX = module.getX;
    console.log(unboundGetX()); // The function gets invoked at the global scope
    const boundGetX = unboundGetX.bind(module);
    console.log(boundGetX()); // 42
    ```
    Explanation: `bind()` method creates a new function that, when called, has its `this` keyword set to the provided value, with a given sequence of arguments preceding any provided when the new function is called.

99. **JavaScript Async Generator Functions**
    ```javascript
    async function* asyncGenerator() {
        let i = 0;
        while (i <= 3) {
            await new Promise(resolve => setTimeout(resolve, 100));
            yield i++;
        }
    }

    (async () => {
        for await (let num of asyncGenerator()) {
            console.log(num);
        }
    })();
    ```
    Explanation: Async generator functions enable you to work with asynchronous data streams. They return an AsyncGenerator object.

100. **JavaScript `Promise.allSettled()`**
    ```javascript
    const promises = [
        Promise.resolve(33),
        new Promise(resolve => setTimeout(() => resolve(66), 0)),
        99,
        Promise.reject(new Error('an error'))
    ];

    Promise.allSettled(promises)
        .then(results => results.forEach((result) => console.log(result.status)));
    ```
    Explanation: `Promise.allSettled()` returns a promise that resolves after all of the given promises have either resolved or rejected, with an array of objects describing the outcome of each promise.
