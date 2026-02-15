#!/bin/bash

# Array of topics (Projects have been filtered out)
topics=(
  "Organizing Code with Objects"
  "Object Constructors"
  "Factory Functions and the Module Pattern"
  "Classes"
  "ES6 Modules"
  "npm"
  "Webpack"
  "Revisiting Webpack"
  "JSON"
  "OOP Principles"
  "Linting"
  "Form Validation with JavaScript"
  "ECMAScript"
  "Asynchronous Code"
  "Working with APIs"
  "Async and Await"
  "Testing Basics"
  "More Testing"
  "A Very Brief Intro to CS"
  "Recursive Methods"
  "Time Complexity"
  "Space Complexity"
  "Common Data Structures and Algorithms"
  "HashMap Data Structure"
  "A Deeper Look at Git"
  "Working with Remotes"
  "Using Git in the Real World"
  "Conclusion"
)

# Initialize counter
count=1

echo "Starting file creation..."
echo "-------------------------"

for topic in "${topics[@]}"; do
  # 1. Convert to lowercase
  # 2. Replace spaces with underscores
  # 3. Remove any special characters (keep only a-z, 0-9, and _)
  clean_name=$(echo "$topic" | tr '[:upper:]' '[:lower:]' | tr ' ' '_' | sed 's/[^a-z0-9_]//g')
  
  # Format: Number_topic_name.txt
  filename="${count}_${clean_name}.txt"
  
  # Create the empty file
  touch "$filename"
  
  echo "Created: $filename"
  
  # Increment counter
  ((count++))
done

echo "-------------------------"
echo "Done! Created $((count-1)) text files."
