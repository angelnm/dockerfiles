# Crear la Imagen

Para crear la imagen de nmt-keras se debe utilizar el siguiente comando
```
./build.sh
```

# Utilizar la Imagen
La forma más básica para utilizar este Dockerfile es utilizar el comando

```
./run.sh
```

El cual contiene el siguiente código

```
docker container run --rm --gpus all \
	-v "$(pwd)"/config.py:/opt/nmt-keras/config.py \
	-v "$(pwd)"/datasets:/opt/nmt-keras/datasets \
	-v "$(pwd)"/trained_models:/opt/nmt-keras/trained_models \
	nmt-keras bash -c 'python3 main.py'
```
Este comando substituye el archivo config.py de nmt-keras por el que le suministremos, crea el volumen de datasets y vincula también una carpeta para que podamos acceder a los modelos entrenados.

# Entrenar Múltiples Modelos

Un ejemplo de utilización para entrenar diferentes modelos de forma continuada crear la siguiente función en un fichero shell

```
docker_function () {
        pair=${1}
        docker container run --rm --gpus all \
                -v "$(pwd)"/${pair}/config.py:/opt/nmt-keras/config.py \
                -v "$(pwd)"/datasets:/opt/nmt-keras/datasets \
                -v "$(pwd)"/${pair}/trained_models:/opt/nmt-keras/trained_models \
                nmt-keras bash -c 'python3 main.py 0> trained_models/traza0 1> trained_models/traza1 2> trained_models/traza2'
}

docker_function 'de-en'
docker_function 'es-en'
docker_function 'fr-en'
```
De esta forma se entrenará cada modelo uno después del otro.
