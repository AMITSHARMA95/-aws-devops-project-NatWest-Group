import csv

def analyze_csv(file_path, threshold):
    with open(file_path, newline='') as csvfile:
        reader = csv.DictReader(csvfile)
        print(f"Students with average grade above {threshold}:")
        for row in reader:
            grades = list(map(float, row['grade'].split(',')))
            average = sum(grades) / len(grades)
            if average > threshold:
                print(f"- {row['name']} (Avg: {average:.2f})")

# Run the function
file_path = 'students.csv'
threshold = 85
analyze_csv(file_path, threshold)

