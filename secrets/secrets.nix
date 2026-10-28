let
  holographic = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFfUqEkUdemZZ7gbtiIkAFtB438pyzLT9nuv4RhjsniU bdiez19@gmail.com";
  system = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFJSmKCQFaO8bvUqnVZgXKoRqcNBw+Q7sNuopYt9MSnp root@aesthetic";
in {
  "discordo.age".publicKeys = [
    holographic
    system
  ];
  "github.age".publicKeys = [
    holographic
    system
  ];
  "openrouter.age".publicKeys = [
    holographic
    system
  ];
  "twt.age".publicKeys = [
    holographic
    system
  ];
}
