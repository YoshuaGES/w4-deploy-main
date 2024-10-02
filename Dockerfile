FROM node:20 AS base

### <JANGAN DIGANTI>
ARG STUDENT_NAME
ARG STUDENT_NIM

ENV NUXT_STUDENT_NAME ${STUDENT_NAME}
ENV NUXT_STUDENT_NIM ${STUDENT_NIM}
### </JANGAN DIGANTI>

# TODO: code disini

# Set working directory
WORKDIR /app

# Salin file package.json dan package-lock.json ke dalam container
COPY package*.json ./

# Install dependencies
RUN npm install

# Salin seluruh isi directory ke dalam container
COPY . .

# Build aplikasi untuk production
RUN npm run build

# Expose port 3000 (sesuaikan dengan aplikasi jika menggunakan port lain)
EXPOSE 3000

# Perintah untuk menjalankan aplikasi
CMD ["npm", "start"]
