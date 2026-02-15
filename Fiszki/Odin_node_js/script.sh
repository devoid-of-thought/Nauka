#!/bin/bash

# Array of topics (Projects and Headers have been filtered out)
topics=(
  "Introduction: What is NodeJS?"
  "Getting Started"
  "Debugging Node"
  "Environment Variables"
  "Introduction to Frameworks"
  "Introduction to Express"
  "Routes"
  "Controllers"
  "Views"
  "Deployment"
  "Forms and Data Handling"
  "Installing PostgreSQL"
  "Using PostgreSQL"
  "Authentication Basics"
  "Prisma ORM"
  "API Basics"
  "API Security"
  "Testing Routes and Controllers"
  "Testing Database Operations"
  "Conclusion"
)

# Initialize counter
# Change this number if you want to continue the sequence 
# from the previous script (e.g., set to 23)
count=1

echo "Starting Node.js file creation..."
echo "---------------------------------"

for topic in "${topics[@]}"; do
  # 1. Convert to lowercase
  # 2. Replace spaces with underscores
  # 3. Remove special characters (colons, question marks, etc.)
  clean_name=$(echo "$topic" | tr '[:upper:]' '[:lower:]' | tr ' ' '_' | sed 's/[^a-z0-9_]//g')
  
  # Format: Number_topic_name.txt
  filename="${count}_${clean_name}.txt"
  
  # Create the empty file
  touch "$filename"
  
  echo "Created: $filename"
  
  # Increment counter
  ((count++))
done

echo "---------------------------------"
echo "Done! Created $((count-1)) text files."
