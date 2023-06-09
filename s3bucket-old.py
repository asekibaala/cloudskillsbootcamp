"""Clean and reusable code using aws boto librairy """
import boto3 #for calling aws resources 
import sys   #pass in arguments at run time

#using functional programming
try:
    def main():
        create_s3bucket(bucket_name)
except Except as e:
    print(e)

def create_s3bucket(bucket_name):
    s3_bucket = boto3.client(
        's3',
    )

    bucket = s3_bucket.create_bucket(
        Bucket = bucket_name,
        ACL = 'private',
    )

    private(bucket)
    bucket_name = sys.argv[1]

    if __name__ == '__main__':
        main()