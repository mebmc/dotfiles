#!/usr/bin/env just --justfile

default:
  @just --list


token length="128" number="25":
  #!/usr/bin/env python3
  import string, secrets
  alphabet = string.ascii_letters + string.digits
  for i in range({{number}}):
    password = secrets.choice(string.ascii_letters)+''.join(secrets.choice(alphabet) for i in range({{length}}-1))
    print("{:>3.3}: {}".format(str(i), password))
