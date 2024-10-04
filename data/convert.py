import os
import pandas as pd

# Get the directory where the script is located
script_dir = os.path.dirname(os.path.abspath(__file__))

# Iterate over all files in the same directory
for filename in os.listdir(script_dir):
    if filename.endswith(".csv"):  # Only process CSV files
        # Construct the full path to the file
        csv_path = os.path.join(script_dir, filename)
        
        # Read the CSV file
        df = pd.read_csv(csv_path)
        
        # Convert DataFrame to JSON
        json_data = df.to_json(orient="index", force_ascii=False)
        
        # Create a corresponding JSON file
        json_filename = filename.replace(".csv", ".json")
        json_path = os.path.join(script_dir, json_filename)
        
        # Write the JSON data to a file
        with open(json_path, 'w', encoding='utf-8') as json_file:
            json_file.write(json_data)
        
        print(f"Converted {filename} to {json_filename}")

print("Conversion completed.")
