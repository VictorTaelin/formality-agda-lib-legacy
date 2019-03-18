# Agda for Humans

Exploring ideas to make Agda more less scary to newbies. Tweaking it for efficient JS compilations.

```
# must disable the agda-stdlib by editing ~/.agda/defaults
agda --js --compile-dir=node_modules src/Example.agda
node node_modules/jAgda.Example.js
```

### Creating a new project
- This lib goes inside an /src folder
- The main file (for example, Example.agda) must be inside /src
- In the main directory, create a file project_name.agda-lib with the following content:
```
name: project_name
include: src
```

Building the following structure:  
Building the following structure:
```
.  
├── project_name.agda-lib    
├── src    
|   ├── Human   
|   ├── Main_file.agda    
```
