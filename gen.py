
import os
import yaml

# Path to the YAML file
YAML_FILE = "courses.yml"

# Load the YAML data
with open(YAML_FILE, "r", encoding="utf-8") as f:
    courses = yaml.safe_load(f)

# Iterate through each course entry
for raw_name, course_data in courses.items():
    complete_name = course_data.get("name", "")
    primary_color = course_data.get("primary_color", "#000000")
    secondary_color = course_data.get("secondary_color", "#FFFFFF")

    # Create a folder for the course and a notes subfolder
    notes_dir = os.path.join(raw_name, "notes")
    os.makedirs(notes_dir, exist_ok=True)

    # Path for the .typ file
    typ_file_path = os.path.join(notes_dir, f"_{raw_name}.typ")

    # Content of the .typ file
    typ_content = f'''// AUTOMATICALLY GENERATED FILE, DO NOT EDIT!
#import "../../global.typ"
#import global: *
#let template(doc) = {{
primary-color.update(rgb("{primary_color}"))
secondary-color.update(rgb("{secondary_color}"))
show: global.template
doc
}}
'''

    # Write to the .typ file
    with open(typ_file_path, "w", encoding="utf-8") as typ_file:
        typ_file.write(typ_content)

    print(f"Generated {typ_file_path}")
