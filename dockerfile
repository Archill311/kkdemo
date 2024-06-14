FROM node:18.18.0


WORKDIR /app 
COPY package*.json ./  


RUN npm install  


COPY . .  


ENV NODE_ENV prod
RUN npm run build  


EXPOSE 3000  


CMD ["npm", "start"]  
