class TemplateRenderer {
  /**
   * @param {string} template
   * @returns {Function}
   */
  compileTemplate(template) {
    const lines = template.split("\n");
    let compiled =
      "Object.keys(templateContext).forEach(key => eval(`${key} = templateContext.${key}`));\n";
    compiled += 'let templateContent = "";';
    lines.forEach((line) => {
      if (line[0] == "%") {
        compiled += line.substr(1) + "\n";
      } else {
        compiled += "templateContent += `" + line + "\\n`\n";
      }
    });
    compiled += "return templateContent";
    return new Function("templateContext", compiled);
  }

  /**
   * @param {object} context
   * @param {string} template
   */
  renderTemplate(context, template) {
    return this.compileTemplate(template)(context);
  }
}

export { TemplateRenderer };
