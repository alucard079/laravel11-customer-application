import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';
import vue from '@vitejs/plugin-vue';

export default defineConfig({
    plugins: [
        laravel({
            input: 'resources/js/app.js',
            refresh: true,
        }),
        
        vue({
            template: {
                transformAssetUrls: {
                    base: null,
                    includeAbsolute: false,
                },
            },
        }),
    ],
    server: {
        host: '0.0.0.0',  // Important to allow external access from Docker
        port: 5173,
      },
    // server: {
    //     https: true, // Force HTTPS for the development server
    // },
    // build: {
    //     outDir: 'public/build',
    // },
});
