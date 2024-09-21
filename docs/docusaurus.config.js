import { themes as prismThemes } from "prism-react-renderer";

const github = {
  username: "InnoverseTeam",
  repo: "innoverse-docker",
};

const config = {
  title: "Innoverse Docker Docs",
  tagline: "An official Docker Compose setup for self-hosting a Innoverse server.",
  favicon: "img/favicon.ico",

  // GitHub Pages deployment configuration
  url: `https://${github.username.toLowerCase()}.github.io`,
  baseUrl: `/${github.repo}/`,
  organizationName: github.username,
  projectName: github.repo,

  onBrokenLinks: "warn",
  onBrokenMarkdownLinks: "warn",

  i18n: {
      defaultLocale: "en",
      locales: ["en"],
  },

  presets: [
      [
          "classic",
          {
              docs: {
                  routeBasePath: "/",
                  sidebarPath: "./sidebars.ts",
                  editUrl: `https://github.com/${github.username}/${github.repo}/tree/main/docs/`,
              },
              blog: false,
              pages: false,
              theme: {
                  customCss: "./src/css/custom.css",
              },
          },
      ],
  ],

  themeConfig: {
      navbar: {
          title: "Innoverse Docker Docs",
          logo: {
              alt: "Docusaurus Logo",
              src: "img/logo.svg",
          },
          items: [
              {
                  href: `https://github.com/${github.username}/${github.repo}`,
                  label: "GitHub",
                  position: "right",
              },
          ],
      },
      prism: {
          additionalLanguages: ["bash"],
          theme: prismThemes.github,
          darkTheme: prismThemes.dracula,
      },
  },
};

export default config;
