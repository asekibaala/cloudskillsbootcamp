import boto3
import sys
 # Get the bucket name from command line argument
if len(sys.argv) < 2:
    print("Usage: python create_bucket.py <bucket_name>")
    sys.exit(1)
bucket_name = sys.argv[1]
 # Create an S3 client
s3 = boto3.client('s3')
 # Create the bucket
response = s3.create_bucket(
    Bucket=bucket_name,
    CreateBucketConfiguration={
        'LocationConstraint': 'us-west-2' # Change this to your desired region
    }
)
 # Print the response
print(response)