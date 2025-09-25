# Imagen base oficial de MLflow
FROM ghcr.io/mlflow/mlflow:latest

# Carpeta para artefactos y base de datos
RUN mkdir -p /mlflow/artifacts

# Puerto que expondrá MLflow
EXPOSE 5000

# Comando por defecto: arranca el servidor de MLflow
CMD ["mlflow", "server", "--host", "0.0.0.0", "--port", "5000", "--backend-store-uri", "sqlite:///mlflow.db", "--default-artifact-root", "/mlflow/artifacts"]
