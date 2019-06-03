# build phase

from node:alpine as builder

workdir '/app'

copy package.json .

run npm install

copy . .

run npm run build

# run phase

# use nginx, copy result of npm run build, start nginx

from nginx
copy --from=builder /app/build /usr/share/nginx/html


# to run build env: sudo docker run -8080:80 5987b29ed7ba
