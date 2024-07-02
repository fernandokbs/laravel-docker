# How to run

* Build the image
```bash
docker build -t laravel-container .
```

* Run the container
```bash
docker run -d --name laravel-container laravel-container
```

* To see the project
```bash
docker run -d -p 8000:8000 --name laravel-container laravel-container
```