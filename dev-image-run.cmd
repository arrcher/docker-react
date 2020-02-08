set PWD=c:\Users\atcherno\sources\docker-lrn\project\react-aws\frontend

docker run -p 3000:3000 --rm -v /app/node_modules -v %PWD%:/app  arrcher/frontend
