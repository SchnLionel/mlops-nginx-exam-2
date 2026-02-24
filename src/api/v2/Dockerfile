FROM python:3.9-slim
COPY . .
RUN pip install fastapi uvicorn joblib numpy scikit-learn pydantic
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
