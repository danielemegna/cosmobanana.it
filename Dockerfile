FROM node:14.17.5 as builder

COPY . /app
WORKDIR /app
RUN yarn install
RUN yarn build

##########################################

FROM fnichol/uhttpd
COPY --from=builder /app/dist /www
