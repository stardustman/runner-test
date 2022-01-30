import os

# Iterate loop to read and print all environment variables
print("The keys and values of all environment variables:")
for key in os.environ:
    print(key, '=>', os.environ[key])

# Print the value of the particular environment variable
print("The value of HOME is: ", os.getenv('VIDEO_LINK'))