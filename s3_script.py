import boto3

s3 = boto3.client('s3')

def list_buckets():
    response = s3.list_buckets()
    print("S3 Buckets:")
    for bucket in response['Buckets']:
        print(" -", bucket['Name'])

def count_objects(bucket_name):
    total = 0
    response = s3.list_objects_v2(Bucket=bucket_name)
    if 'Contents' in response:
        total = len(response['Contents'])
    print(f"Total objects in '{bucket_name}': {total}")

if __name__ == "__main__":
    list_buckets()
    # Replace with your actual bucket name
    count_objects("amit-static-website-2025")
