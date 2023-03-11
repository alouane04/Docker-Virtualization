FROM debian:buster

# Updating the package list and upgrading the packages and download the wget.
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y wget

# Downloading the cadvisor binary file from the github repository.
RUN wget https://github.com/google/cadvisor/releases/download/v0.47.0/cadvisor-v0.47.0-linux-amd64

# Renaming the file to cadvisor
RUN mv cadvisor-v0.47.0-linux-amd64 cadvisor

# Giving the permission to the cadvisor file to be executed.
RUN chmod +x cadvisor

# Running the cadvisor file.
CMD ["./cadvisor"]
