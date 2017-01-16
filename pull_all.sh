find . -maxdepth 1 -type d | xargs -I {} git -C {} pull origin
