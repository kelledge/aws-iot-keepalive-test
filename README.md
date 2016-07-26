# AWS IoT Keepalive Test #
The purpose of this repository is to determine if AWS IoT applies its message 
pricing to protocol-level MQTT keepalive messages.

To this end, it will spin up a MQTT client connected to the IoT broker and
publish a single message. At this point the client will be idle and the only
traffic should be the MQTT client keepalives. It will remain connected until
interrupted by the user.

## Usage ##
First, make sure you have a access key and secret key for your IAM user. See
the documentation [http://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html#Using_CreateAccessKey](here)
on how to create them for your user.

Next, run `make run` from root project directory. This will install all the
python dependencies and run `aws configure` for you. This configuration will
promt you for the following infomration:

```
AWS Access Key ID [None]: <ACCESS_KEY>
AWS Secret Access Key [None]: <SECRET_KEY>
Default region name [None]: us-east-1
Default output format [None]: json
```

I recommend using `us-east-1` for your region and `json` for your output 
format.

## Resources ##
This test will create (and destroy) the following resources for IoT:
 * Thing: Named `Test`
 * Certificate: Activated and associated to the above thing.
 * Policy: IoTAdmin: Associated to the above thing.
