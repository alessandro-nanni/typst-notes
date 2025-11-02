import os, yaml

# Load course info from YAML
with open("courses.yml", "r", encoding="utf-8") as f:
  courses = yaml.safe_load(f)

for raw_name, course_data in courses.items():
  folder = raw_name
  if not os.path.isdir(folder):
      continue

  full_name = course_data.get("name", raw_name)
  output_file = os.path.join(folder, f"{raw_name}.typ")

  # Find all typ files in folder except the one named after the folder itself
  includes = []
  for file in sorted(os.listdir(folder)):
      if file.endswith(".typ") and file != f"{raw_name}.typ":
          includes.append(f'#include "{file}"')

  # Build content
  content = (
      '#import "../global.typ": *\n'
      f'#show: course-template.with(["{full_name}"])\n\n'
      + "\n".join(includes) + "\n"
  )

  # Write the generated file
  with open(output_file, "w", encoding="utf-8") as f:
      f.write(content)
  print(f"Generated {output_file}")
