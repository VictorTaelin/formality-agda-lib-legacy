# Agda for Humans

Exploring ideas to make Agda more practical and less scary to novices and tweaking it for efficient Agda-to-JS compilations.

```
# must disable the agda-stdlib by editing ~/.agda/defaults
agda --js --compile-dir=node_modules -i src Example.agda
node node_modules/jAgda.Example.js
```
