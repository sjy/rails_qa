import {defineConfig} from "vite";
import ViteRails from "vite-plugin-rails";
import WindiCSS from "vite-plugin-windicss";
import FullReload from 'vite-plugin-full-reload'
import StimulusHMR from 'vite-plugin-stimulus-hmr'

export default defineConfig({
    plugins: [
        StimulusHMR(),
        FullReload(['config/routes.rb', 'app/views/**/*'], {delay: 200}),
        ViteRails({
            envVars: {RAILS_ENV: "development"},
            fullReload: {
                additionalPaths: [],
            },
        }),
        WindiCSS({
            root: __dirname,
            scan: {
                fileExtensions: [
                    "erb",
                    "html",
                    "js",
                    "ts",
                    "jsx",
                    "tsx",
                ],
                dirs: ["app/views", "app/frontend"], // or app/javascript, or app/packs
            },
        }),
    ],
});
