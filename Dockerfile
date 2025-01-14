FROM python:3.11-slim-bookworm

RUN apt-get -y update; apt-get -y install curl git

ADD --chmod=755 https://astral.sh/uv/install.sh /install.sh
RUN /install.sh && rm /install.sh

COPY requirements.txt /requirements.txt

RUN /root/.cargo/bin/uv pip install --system --no-cache -r requirements.txt

COPY main.py /main.py

CMD ["python", "/main.py"]
