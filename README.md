# W[ai]fu

Chatbot Project for the Hack2020 Flutter Hackathon. Uses Dialogflow for auto generated replies, and AWS (Polly, S3, SNS, and more) for Text to Speech.


## Requirements
You will need to have to have set up the AWS and DialogFlow api endpoints before this app will work. For the sake of the hackathon, we have made public APIs so that it can be used for the testing phase.
Note that these APIs will be disabled as soon as the Hackathon voting stage is over!


- [Amazon Polly Setup](https://aws.amazon.com/blogs/machine-learning/build-your-own-text-to-speech-applications-with-amazon-polly/)

## Getting Started
# Step 1
After having having the requirements fulfilled, you need to fill in the `hack2020-Flutter/secrets.json` with your API endpoint for AWS, and modify the file `hack2020-Flutter/assets/ai-bot.....json`. You can happily refactor this file, we just were too lazy honestly!

# Step 2
Next, you can simply 'flutter run' the app.


## Custom Dialogflow Version
In order for this project to run, we have needed to rely on a specific version of the DialogFlowv2 package on `pub.dev`. 
We have luckily found a user that upgraded the dependency of HTTP, which otherwise it would have not worked. Big shoutout to `indigothm`!!

 [Dialogflow](https://github.com/indigothm/flutter_dialogflow)
 
 
## Resources used

[Amazon Polly](https://aws.amazon.com/polly/)


[Dialogflow](https://dialogflow.cloud.google.com/)
