# Simple ML Training Project
This project trains a RandomForest model on tabular data.

### Test Unitarios
- Se necesita validar localmente dentro de la carpeta unit_test:
```
cd unit_test
```
```
pytest test_data_loader.py
```
```
pytest test_evaluate.py
```
```
pytest test_model.py
```

### GitHub envs
Hay que aplicar secrets y vars en github actions
- Secrets: ACR_NAME, ACR_USERNAME, ACR_PASSWORD, AZURE_RESOURCE_GROUP, AZURE_STORAGE_CONNECTION_STRING, AZURE_CREDENTIALS
- Variables: MLFLOW_URL, EXPERIMENT_NAME, MODEL_NAME

### Pipelines
Dentro de la carpeta .github/workflows:
- Integration
  - Se ejecuta en cada PR a main
  - Instala librerias y ejecuta test unitarios
- Build
  - Se ejecuta automaticamente cuando se mergea PR a main
  - Entrena un modelo con un dataset que descarga
  - Sube modelo a MlFlow
- Deploy
  - Crea contenedor con imagen de docker con servicio API, en Azure Containers


## Comprobar API
- Para hacer una llamada al modelo ubicado en Azure Containers
- Ubicar bien a que contenedor se llama al mmodelo, en mi caso: http://model-api-guillermo-18077183679.eastus.azurecontainer.io:8080/health
- Ejecutar script api request query_model.py:
```
cd scripts
```
```
python query_model.py
```
- Acceder a:
```
http://model-api-guillermo-18077183679.eastus.azurecontainer.io:8080/metrics
```
- Ver que hay conexion y se esta modificando en cada ejecucion del script Request
