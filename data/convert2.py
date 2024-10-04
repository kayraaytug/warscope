import os
import csv
import json

# Function to convert a single CSV file to JSON with notes
def csv_to_json_with_notes(csv_file_path, json_file_path):
    try:
        with open(csv_file_path, mode='r', encoding='utf-8') as csv_file:
            reader = csv.reader(csv_file)
            headers = next(reader)  # First row for keys
            values = next(reader)  # Second row for values
            notes = next(reader)  # Third row for notes

            # Create dictionary from headers and values
            data_dict = {headers[i]: values[i] for i in range(len(headers))}
            
            # Add notes as a separate array in the JSON
            data_dict['notes'] = notes

        # Save the resulting JSON to a file
        with open(json_file_path, 'w', encoding='utf-8') as json_file:
            json.dump(data_dict, json_file, ensure_ascii=False, indent=4)
        print(f"Converted {csv_file_path} to {json_file_path}")
    
    except Exception as e:
        print(f"Error processing {csv_file_path}: {e}")

# Function to convert all CSV files in the directory
def convert_all_csv_to_json_with_notes_in_directory(directory):
    for root, dirs, files in os.walk(directory):
        for file in files:
            if file.endswith(".csv"):
                csv_file_path = os.path.join(root, file)
                json_file_path = os.path.splitext(csv_file_path)[0] + ".json"
                csv_to_json_with_notes(csv_file_path, json_file_path)

# Call the function on the current directory where the script is located
current_directory = os.getcwd()
convert_all_csv_to_json_with_notes_in_directory(current_directory)
