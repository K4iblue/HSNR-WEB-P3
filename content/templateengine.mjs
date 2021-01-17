function firstChar(string) {
  return string.replace(/\s*/, '')[0];
}

class TemplateRenderer {
  /**
   * @param {string} template
   * @returns {Function}
   */
  compileTemplate(template) {
    const lines = template.split("\n");
    let compiled =
      "Object.keys(templateContext).forEach(key => eval(`${key} = templateContext.${key}`));\n";
    compiled += 'let templateContent = "";\n';
    lines.forEach((line) => {
      if (firstChar(line) == "%") {
        compiled += line.replace(/\s*%\s*/, '') + "\n";
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
