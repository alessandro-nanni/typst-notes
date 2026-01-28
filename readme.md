# Prerequisites
- Have python installed (with `pyyaml`)
- Have a github account
- have [Typst](https://github.com/typst/typst) installed
# How to use
## 0. After creating the repository that uses this template, set GitHub pages source to GitHub actions
## 1. Create a `courses.yml` folder or change the existing one
In the file, define a course with a "raw" name, and specify:
- the name;
- the primary color
- the secondary color
```yml
math101:
  name: "Mathematics 101"
  primary_color: "#ff5733"
  secondary_color: "#33c1ff"

cs102:
  name: "Computer Science 102"
  primary_color: "#00aa88"
  secondary_color: "#ffaa00"
```
## 2. Run the `gen.py` file
This will create folders with the specified course name, and the template for each course.
**Do not edit the templates. Or if you do, keep in mind they can be overwritten when re-running the generator script.**
## 3. Create your `.typ` files for each lecture
You will be able to view the pdf of each one, but they wont be uploaded to GitHub.
## 4. Commit and push to create the master PDFs
After committing and pushing, the github action will generate for each course a master doc, combining all the ones in the course's folder.
For each course, you wil be able to view and download the master pdf at `https://<github username>.github.io/<repository name>/<raw course name>.pdf`.
Alternatively, you can see an index at `https://<github username>.github.io/<repository name>/index.html`

## 5. Delete [cs102 folder](https://github.com/alessandro-nanni/typst-notes/tree/main/cs102)
Once you have a course setup, you don't need the example anymore
# Credits
https://github.com/cartabinaria/typst-thesis: original typst building github action.
https://github.com/thenuclearnexus: help with updating the github action.
