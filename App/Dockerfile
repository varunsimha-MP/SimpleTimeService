# BASE IMAGE (SMALL SIZE)
FROM python:3.11-slim

# CREATE NON-ROOT USER
RUN useradd -m appuser

# WORKDIR
WORKDIR /app

# COPY FILES
COPY requirements.txt .

# INSTALL DEPENDENCIES
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# SWITCH TO NON-ROOT USER
USER appuser

# RUN APPLICATION
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]