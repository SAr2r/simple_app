FROM python:3.10-alpine

RUN adduser -D appuser

WORKDIR /home/appuser
USER appuser
RUN pip install --upgrade pip
COPY --chown=appuser:appuser requirements.txt ./
RUN pip install --user -r requirements.txt
CMD ["python", "app.py"]