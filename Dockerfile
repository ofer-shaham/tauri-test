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
# Create the AppImage
RUN pnpm tauri build --target=appimage

# Create an output directory for artifacts
RUN mkdir -p /app/output

# Copy the AppImage to the output directory
RUN cp src-tauri/target/release/my-tauri-app-*.AppImage /app/output/

# Set the command to keep the container running (optional)
CMD ["tail", "-f", "/dev/null"]
