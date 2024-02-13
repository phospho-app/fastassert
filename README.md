# FastAssert : check semantic assertions, fast

> **TL;DR :** Check semantic assertion against any input test, and get a Boolean output. It’s faster, cheaper and doesn’t impact your LLM provider rate limit. Applications are Intent Classification, Sentiment Analysis, Content Filtering, etc.

## What is FastAssert?

FastAssert enables run an Open Source LLM locally or through an API specifically design to check the validity of the given assertion against a semantic condition.

This means :

- improved latency (especially if you were using Function Calling)
- reduced cost (especially if you were using Function Calling)
- lower chance to hit the API rate limit of your LLM provider (OpenAI and family)
- no validation error : enforced boolean output

## How does it work?

FastAssert provides you with :

- a server to run locally : takes a text prompt and a text assertion, and returns a boolean
- clients for Python and JavaScript : to call the server and get the boolean result
- a notebook and script to assess the performance of the server in term of accuracy and latency compared to your current implementation and find the optimal model to use

## Common use cases

- Intent Classification : check if the user input is a question, a command, a greeting, etc.
- Sentiment Analysis : detect angry or negative user input
- Detect forbiden content : NSFW, hate speech, violence, etc.
- Detect specific content : competitor mention, personal data, etc.

This tool can be used to build reasoning steps, If/Else branches in LLM workflows or filter unwanted input.

## Requirements

- OS: Linux
- CUDA 12.1
- Min. GPU RAM for inference : 16 GB

## Installation

### Server

Build the container:
```shell
sudo docker build -t fastassert .
```

Run the container:
```shell
sudo docker run --gpus all -p 8000:8000 fastassert
```

Your server is now running on port 8000

### Notebook

Install the required dependancies to run a Jupyter Notebook 
```shell
pip install notebook
```

(Optional) Add a password to secure your notebook
```
jupyter notebook password
```

Launch the notebook in remote access mode
```
jupyter notebook --no-browser --port=8888 --ip=0.0.0.0
```

Open the notebook in your local webbrowser 

```
http://localhost:8888
```

## Examples

### Python client

```python
from assertion import AssertionClient

client = AssertionClient(url="YOUR_FASTASSERT_SERVER_URL")

# user_prompt: str, with the text to check
is_angry = client.assert(
	user_prompt,
	"The user demonstrate anger toward the assistant",
	webhook="",
)

# is_angry: bool
if is_angry:
	print("The user is angry")
else:
	print("Everything is fine")

```

### JavaScript client

```javascript
const client = new AssertionClient("YOUR_FASTASSERT_SERVER_URL");

const userPrompt = "Your user prompt text here";
const assertion = "The user demonstrates anger toward the assistant";

client.assert(userPrompt, assertion).then((isAngry) => {
  if (isAngry) {
    console.log("The user is angry");
  } else {
    console.log("Everything is fine");
  }
});
```

## Wanna try it?

Contact us at [fastassert@phospho.app](mailto:fastassert@phospho.app) to get access to the beta version.
