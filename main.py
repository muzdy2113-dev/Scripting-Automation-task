import secrets
import string

print("==============================")
print("     PASSWORD GENERATOR")
print("==============================")

try:
    length = int(input("Enter password length (minimum 8): "))

    if length < 8:
        print("Password must be at least 8 characters long.")
    else:
        characters = string.ascii_letters + string.digits + string.punctuation

        password = ''.join(
            secrets.choice(characters) for _ in range(length)
        )

        print("\nYour new password is:", password)

except ValueError:
    print("Please enter a valid number.")
