FROM python:3.11-slim

RUN apt update && apt install -y git

# Clonar o repositório (ajuste para seu repo depois)
RUN git clone https://github.com/0zono/pokedex-docker.git /app

# Copia os requisitos da raiz do repositório para dentro do container
WORKDIR /app
COPY requirements.txt .

# Instala dependências
RUN pip install --no-cache-dir -r requirements.txt

# Define diretório da aplicação
WORKDIR /app/app

# Executa a aplicação
CMD ["python", "main.py"]
