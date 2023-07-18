import {defineConfig} from 'vite-plugin-windicss'

export default defineConfig({
  theme: {
    container: {
      center: true,
    },
    extend: {
      colors: {
        primary: {},
        secondary: {},
      },
    },
  },
  plugins: [],
  variants: {},
});