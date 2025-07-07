FROM ubuntu:20.04

# Actualiza el sistema e instala Python y pip
RUN apt-get update && apt-get install -y \
    python3-dev \
    python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Actualiza pip a la última versión
RUN pip3 install --upgrade pip

# New workdir called app
WORKDIR /app

# Copy current files to app
COPY . /app

# Install pip3 libraries from requirements.txt
RUN pip3 --no-cache-dir install -r requirements.txt

CMD ["python3", "src/app.py"]