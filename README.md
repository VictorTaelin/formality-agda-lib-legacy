# Agda for Humans

Exploring ideas to make Agda more less scary to newbies. Tweaking it for efficient JS compilations.

```
# must disable the agda-stdlib by editing ~/.agda/defaults
agda --js --compile-dir=node_modules src/Example.agda
node node_modules/jAgda.Example.js
```
