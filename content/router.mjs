class TemplateCache {
  cache;

  constructor() {
    this.cache = {};
  }

  async get(templateName) {
    if (this.cache[templateName]) return this.cache[templateName];
    const template = await (await fetch("/templates/" + templateName)).text();
    this.cache[templateName] = template;
    return template;
  }
}

/**
 * @typedef {Object} Route
 * @property {string} template
 * @property {string} context
 * @property {string} script
 */

class Router {
  routes;
  templateEngine;
  templateCache;

  /**
   * @param {Object.<string, Route>} routes
   * @param {TemplateRenderer} templateEngine
   */
  constructor(routes, templateEngine) {
    this.routes = routes;
    this.templateEngine = templateEngine;
    this.templateCache = new TemplateCache();
    this.registerLinks();
    window["router"] = this;
  }

  registerLinks() {
    document
      .querySelectorAll("a")
      .forEach((a) => a.addEventListener("click", this.handleLink));
  }

  handleLink(e) {
    let src = e.srcElement;
    while (src.tagName != "A") src = src.parentElement;
    e.preventDefault();
    const href = src.getAttribute("href");
    if (!href || href[0] == "#") return;
    window["router"].request(href);
  }

  async request(url) {
    history.pushState(undefined, undefined, url);
    const matches = url?.match(/\/\d+/);
    const urlSuffix = (matches && matches[0]) || "";
    url = url?.replace(/\/\d+/, "");
    document.querySelector(".nav-current")?.classList.remove("nav-current");
    document
      .querySelector('[href="' + window.location.pathname + '"]')
      ?.classList.add("nav-current");
    const contentContainer = document.querySelector("main > .box");
    const route = this.routes[url];
    if (!route) {
      contentContainer.innerHTML =
        '<div class="alert-box-warning">Error 404 Route konnte nicht gefunden werden!</div>';
      throw new Error("Route " + url + " not found!");
    }
    const context = await (await fetch(route.context + urlSuffix)).json();
    const template = await this.templateCache.get(route.template);
    contentContainer.innerHTML = this.templateEngine.renderTemplate(
      context,
      template
    );
    if (route.script) {
      const script = document.createElement("script");
      script.type = "text/javascript";
      script.src = route.script;
      contentContainer.appendChild(script);
    }
    this.registerLinks();
  }
}

export { Router };
