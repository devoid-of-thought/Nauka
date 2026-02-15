#!/bin/bash

# Array of topics (Project: Homepage has been filtered out)
topics=(
  "Transforms"
  "Transitions"
  "Keyframes"
  "Introduction to Web Accessibility"
  "The Web Content Accessibility Guidelines (WCAG)"
  "Semantic HTML"
  "Accessible Colors"
  "Keyboard Navigation"
  "Meaningful Text"
  "WAI-ARIA"
  "Accessibility Auditing"
  "Introduction to Responsive Design"
  "Natural Responsiveness"
  "Responsive Images"
  "Media Queries"
)

# Initialize counter
# Note: If you want to continue numbering from where the previous script ended,
# change "1" below to the next number (e.g., 29).
count=1

echo "Starting file creation..."
echo "-------------------------"

for topic in "${topics[@]}"; do
  # 1. Convert to lowercase
  # 2. Replace spaces with underscores
  # 3. Remove parentheses and other special chars (keeping a-z, 0-9, and _)
  # 4. Collapse multiple underscores if any occur
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
