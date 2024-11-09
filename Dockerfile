FROM ivangabriele/tauri:debian-bullseye-22 

# Set the working directory
WORKDIR /app

# Install pnpm globally
# RUN npm install -g pnpm

RUN pnpm create tauri-app my-tauri-app --template react-ts --yes --no-telemetry && \
    cd my-tauri-app && pnpm install

# Change directory to the newly created Tauri app
WORKDIR /app/my-tauri-app

# Build the Tauri application
RUN ls -la

RUN pnpm tauri build


# Run the Tauri application
CMD ["pnpm", "tauri", "build"]
