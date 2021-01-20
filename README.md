# Simple Swig Example

I've found the using [Swig](http://www.swig.org/tutorial.html) to create a Python wrapper over C++ libraries is **VERY** helpful.

There were a few (small) kinks on the way, so I created this small repo to show a minimal example, namely:
 - a reasonable `Makefile`
 - how to use the C++ standard library (like, `std::vector`) in your interface:
    - the proper `swig` command
    - the proper `.i` file

### Instructions

Clone, and run `make`.

Launch a python shell:

```python
>>> import mylib
>>>
>>> mylib.foo(4, 8)
12
>>>
>>> mylib.bar(7, 9)
(7, 9)
>>>
>>> mylib.print_stuff("ryan", "dash", 7, 3.14)
ryan
dash
7
3.14
>>>
```

It's that easy.
