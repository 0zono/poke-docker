FROM python:3.11-slim

# Clonar o repositório diretamente (simulando "docker build" com git clone)
RUN apt update && apt install -y git

# Clonar seu repositório diretamente
RUN git clone https://github.com/SEU_USUARIO/SEU_REPOSITORIO.git /app
WORKDIR /app/app

# Instalar dependências
RUN pip install --no-cache-dir -r ../requirements.txt

CMD ["python", "main.py"]
