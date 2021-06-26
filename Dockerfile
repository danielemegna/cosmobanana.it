FROM node:lts as builder

COPY . /app
WORKDIR /app
RUN yarn install
RUN yarn build

##########################################

FROM fnichol/uhttpd
COPY --from=builder /app/dist /www
