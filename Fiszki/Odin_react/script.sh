#!/bin/bash

# Array of topics (Projects have been filtered out)
topics=(
  "Introduction To React"
  "Setting Up A React Environment"
  "React Components"
  "What Is JSX?"
  "Rendering Techniques"
  "Keys In React"
  "Passing Data Between Components"
  "Introduction To State"
  "More On State"
  "How To Deal With Side Effects"
  "Class Based Components"
  "Component Lifecycle Methods"
  "Introduction To React Testing"
  "Mocking Callbacks And Components"
  "Type Checking With PropTypes"
  "React Router"
  "Fetching Data In React"
  "Styling React Applications"
  "Managing State With The Context API"
  "Reducing State"
  "Refs And Memoization"
  "Conclusion"
)

# Initialize counter
# Change this number if you want to continue the sequence 
# from the previous script (e.g., set to 16)
count=1

echo "Starting React file creation..."
echo "------------------------------"

for topic in "${topics[@]}"; do
  # 1. Convert to lowercase
  # 2. Replace spaces with underscores
  # 3. Remove special characters (like '?' in "What Is JSX?")
  clean_name=$(echo "$topic" | tr '[:upper:]' '[:lower:]' | tr ' ' '_' | sed 's/[^a-z0-9_]//g')
  
  # Format: Number_topic_name.txt
  filename="${count}_${clean_name}.txt"
  
  # Create the empty file
  touch "$filename"
  
  echo "Created: $filename"
  
  # Increment counter
  ((count++))
done

echo "------------------------------"
echo "Done! Created $((count-1)) text files."
