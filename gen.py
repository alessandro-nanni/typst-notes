
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

    # Create a folder for the course
    os.makedirs(raw_name, exist_ok=True)

    # Path for the .typ file
    typ_file_path = os.path.join(raw_name, f"_{raw_name}.typ")

    # Content of the .typ file
    typ_content = f"""// AUTOMATICALLY GENERATED FILE, DO NOT EDIT!
#import "../global.typ": *

#let primary-color = rgb("{primary_color}")
#let secondary-color = rgb("{secondary_color}")

#let template(doc) = _template(primary-color, secondary-color, doc)

#let important(content) = _important(primary-color, content)
#let i(content) = important(content)

#let annotate(note,body) = _annotate(fill:primary-color, note,body)
#let a(note,body) = annotate(note,body)
"""

    # Write to the .typ file
    with open(typ_file_path, "w", encoding="utf-8") as typ_file:
        typ_file.write(typ_content)

    print(f"Generated {typ_file_path}")
