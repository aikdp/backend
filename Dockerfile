#DOCKER EXPENSE PROJECT: backend for localhost
# FROM node:20
# EXPOSE 8080
# ENV DB_HOST="localhost"
# RUN mkdir /opt/server
# WORKDIR /opt/server
# COPY package.json .
# COPY *.js .
# RUN npm install
# CMD ["node", "index.js"]




# #DOCKER EXPENSE PROJECT: backend
# FROM node:20
# EXPOSE 8080
# ENV DB_HOST="mysql"
# RUN mkdir /opt/server
# WORKDIR /opt/server
# COPY package.json .
# COPY *.js .
# RUN npm install
# CMD ["node", "index.js"]


# #DOCKER EXPENSE PROJECT: backend after best practices with root
# FROM node:20.18.0-alpine3.20
# EXPOSE 8080
# ENV DB_HOST="mysql"
# RUN mkdir /opt/server
# WORKDIR /opt/server
# COPY package.json .
# COPY *.js .
# RUN npm install
# CMD ["node", "index.js"]


# #DOCKER EXPENSE PROJECT: backend after best practices 
# FROM node:20.18.0-alpine3.20
# EXPOSE 8080
# ENV DB_HOST="mysql"
# RUN addgroup -S expense && adduser -S expense -G expense && \
#     mkdir /opt/server && \
#     chown -R expense:expense /opt/server
# WORKDIR /opt/server
# COPY package.json .
# COPY *.js .
# RUN npm install
# USER expense
# # EXPOSE 123
# # EXPOSE 808
# # RUN echo "Hello Checking layers"
# CMD ["node", "index.js"]


#Multistage Builds:1st dockerfile (it will deletes) and 2nd dockerfile 
FROM node:20 AS builder     
WORKDIR /opt/server
COPY package.json .
COPY *.js .
RUN npm install


FROM node:20.18.0-alpine3.20
EXPOSE 8080
ENV DB_HOST="mysql"
RUN addgroup -S expense && adduser -S expense -G expense && \
    mkdir /opt/server && \
    chown -R expense:expense /opt/server
WORKDIR /opt/server
#below step added only (copied from 1st dockerfile and 1st dockerfile will delete)
COPY --from=builder /opt/server /opt/server/        
USER expense
CMD ["node", "index.js"]