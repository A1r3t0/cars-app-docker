# Используем официальный образ Node.js
FROM node:18

# Устанавливаем рабочую директорию
WORKDIR /app

COPY package*.json ./

# Очищаем кэш npm
RUN npm cache clean --force

# Устанавливаем зависимости
RUN npm install

# Копируем остальные файлы проекта
COPY . .

# Открываем порт, на котором будет работать Angular CLI
EXPOSE 4200

ENV NG_CLI_ANALYTICS=false

# Запускаем Angular приложение
CMD ["npm", "start", "--", "--host", "0.0.0.0"]

