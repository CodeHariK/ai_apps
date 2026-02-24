/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./app/**/*.{js,jsx,ts,tsx}", "./components/**/*.{js,jsx,ts,tsx}"],
  presets: [require("nativewind/preset")],
  darkMode: "class",
  theme: {
    extend: {
      colors: {
        primary: "#D1F249",
        "background-light": "#F3F4F6",
        "background-dark": "#0A0A0A",
        "surface-dark": "#161616",
        "surface-light": "#FFFFFF",
      },
      fontFamily: {
        display: ["Inter", "sans-serif"],
      },
      borderRadius: {
        DEFAULT: "0.75rem",
      },
      boxShadow: {
        'glow': '0 0 20px rgba(209, 242, 73, 0.3)',
        'glow-intense': '0 0 40px rgba(209, 242, 73, 0.5)',
      },
    },
  },
  plugins: [],
}

