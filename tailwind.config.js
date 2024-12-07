/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    colors: {
      'black-dark': 'rgba(24, 24, 24, 1)',
      'black-light': 'rgba(39, 38, 38, 1)',
      'purple-dark':'rgba(104, 51, 205, 1)',
      'purple-light': 'rgba(167,139,250,255)',
      'white':'rgba(255, 255, 255, 1)',
    },
    extend: {
      height: {
        '1/10': '10%',
        '1/8': '12.5%',
      },
    },
  },
  plugins: [],
}

