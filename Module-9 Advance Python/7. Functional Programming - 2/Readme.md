# Important
```python
Flatten the list
array = [ [1, [ [ 2 ] ], [ [ [ 3 ] ] ], [ [ 4 ], 5 ] ]]
result = lambda x: sum(map(result, x), [ ] ) if isinstance(x, list) else [x]
print(result(array))
```
 