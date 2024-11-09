FROM ivangabriele/tauri:debian-bullseye-22 

# Set the working directory
WORKDIR /app

# Install pnpm globally
# RUN npm install -g pnpm

# Create a new Tauri application with React and TypeScript
RUN pnpm create tauri-app my-tauri-app --template react-ts

# Change directory to the newly created Tauri app
WORKDIR /app/my-tauri-app

# Install dependencies
RUN pnpm install

# Build the Tauri application
RUN pnpm tauri build

# Run the Tauri application
CMD ["pnpm", "tauri", "build"]
