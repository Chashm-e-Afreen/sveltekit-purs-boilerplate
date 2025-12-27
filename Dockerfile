FROM node:20-alpine

RUN apk add --no-cache curl && \
    npm install -g pnpm && \
    apk del curl && \
    apk add git && \
    apk add wget && \
    rm -rf /tmp/* /var/cache/apk/* ~/.npm /usr/lib/node_modules/npm/npmrc ~/.config/configstore

ENV NPM_CONFIG_USER_AGENT=pnpm
ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
ENV CI="true"

RUN wget https://github.com/purescript/purescript/releases/download/v0.15.16-7/linux64.tar.gz 
RUN tar -xvf linux64.tar.gz && cp purescript/purs /bin/
RUN npm install -g spago@next 

WORKDIR /app

COPY package.json pnpm-lock.yaml* ./
COPY spago.lock spago.yaml ./

RUN pnpm install

COPY . .
RUN spago build

RUN pnpm build

EXPOSE 4173

CMD ["pnpm", "preview", "--host"]
