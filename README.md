# AWS IoT Keepalive Test #
The purpose of this repository is to determine if AWS IoT applies its message
pricing to protocol-level MQTT keepalive messages.

To this end, it will spin up a MQTT client connected to the IoT broker and
publish a single message. At this point the client will be idle and the only
traffic should be the MQTT client keepalives. It will remain connected until
interrupted by the user.

The timeout in this test is set to **5 seconds** to quickly generate enough data
for the billing report.

## Dependencies ##
You should just need python and virtualenv. On Debian-like distributions, you
can install virtualenv like so:

```
sudo apt-get install python-virtualenv
```

## Usage ##
First, make sure you have a `access key` and `secret key` for your IAM user. See
the documentation [here](http://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html#Using_CreateAccessKey)
on how to create these for your user.

Next, run `make run` from root project directory. This will install all the
python dependencies and run `aws configure` for you. This configuration will
prompt you for the following information:

```
AWS Access Key ID [None]: <ACCESS_KEY>
AWS Secret Access Key [None]: <SECRET_KEY>
Default region name [None]: us-east-1
Default output format [None]: json
```

I recommend using `us-east-1` for your region and `json` for your output
format.

Once the dependencies have been installed and your credentials configured, the
test will begin running.

You can view the published message by using AWS IoT's [web MQTT client](http://docs.aws.amazon.com/iot/latest/developerguide/view-mqtt-messages.html)
and subscribing to the `keepaliveTest` topic. Once the test client connects,
it will publish a single message in this topic containing the ID for the
certificate used for the test.


## Resources ##
This test will create (and destroy) the following resources for IoT:
 * Thing
 * Certificate
 * Policy
 * Thing-Certificate Association
 * Policy-Certificate Association
