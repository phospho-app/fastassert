FROM python:3.11

# Steps are cached with Kaniko in GCP Artifcat registry
# The cache is kept 72 hours (see cloudbuild.yaml)

WORKDIR /src

# Upgrade pip
RUN pip install --upgrade pip

# Copy pyproject.toml and poetry.lock
COPY ./requirements.txt /src/requirements.txt

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy source code
COPY ./app /src/app

# Run the server on port 8000
CMD ["python", "app/main.py", "--model=mistralai/Mistral-7B-Instruct-v0.2"]