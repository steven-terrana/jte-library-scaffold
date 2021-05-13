import mkdocs_gen_files
import os

rootdir = "/docs/libraries"
for library in os.listdir(rootdir):
    file = os.path.join(rootdir, library, "README.md")
    if(os.path.exists(file)): 
      readme = open(file).read()
      with mkdocs_gen_files.open(f"libraries/{library}.md", "w") as f:
        print(readme, file=f)
