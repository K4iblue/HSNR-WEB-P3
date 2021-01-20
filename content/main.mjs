import { Router } from "./router.mjs";
import { TemplateRenderer } from "./templateengine.mjs";

const routes = {
  "/": {
    template: "index.tpl",
    context: "/api/dashboard",
    script: "/static/index.js",
  },
  "/edit-employees": {
    template: "edit-employees.tpl",
    context: "/api/edit-employees",
    script: "/static/edit-employees.js",
  },
  "/edit-trainings": {
    template: "edit-trainings.tpl",
    context: "/api/edit-trainings",
    script: "/static/edit-trainings.js",
  },
  "/edit-certificates": {
    template: "edit-certificates.tpl",
    context: "/api/edit-certificates",
    script: "/static/edit-certificates.js",
  },
  "/edit-qualifications": {
    template: "edit-qualifications.tpl",
    context: "/api/edit-qualifications",
    script: "/static/edit-qualifications.js",
  },
  "/participation-employees": {
    template: "participation-employees.tpl",
    context: "/api/participation-employees",
  },
  "/participation-trainings": {
    template: "participation-trainings.tpl",
    context: "/api/participation-trainings",
  },
  "/report-employees": {
    template: "report-employees.tpl",
    context: "/api/report-employees",
  },
  "/report-trainings": {
    template: "report-trainings.tpl",
    context: "/api/report-trainings",
  },
  "/report-certificates": {
    template: "report-certificates.tpl",
    context: "/api/report-certificates",
  },
  "/add-training": {
    template: "add-training.tpl",
    context: "/api/add-training",
    script: "/static/add-training.js"
  },
  "/view-training": {
    template: "view-training.tpl",
    context: "/api/view-training",
  },
  "/edit-training": {
    template: "edit-training.tpl",
    context: "/api/edit-training",
    script: "/static/edit-training.js",
  },
  "/participation-employee": {
    template: "participation-employee.tpl",
    context: "/api/participation-employee",
    script: "/static/participation-employee.js",
  },
  "/participation-training": {
    template: "participation-training.tpl",
    context: "/api/participation-training",
    script: "/static/participation-training.js",
  },
  "/view-employee": {
    template: "view-employee.tpl",
    context: "/api/view-employee",
    script: "/static/participation-employee.js",
  },
};
window["setTitle"] = (title) => {
  document.querySelector("title").innerText = title;
  document.querySelector("h1").innerText = title;
};
window["reload"] = () => window["router"].request(window.location.pathname);
new Router(routes, new TemplateRenderer());
window["router"].request(location.pathname);
