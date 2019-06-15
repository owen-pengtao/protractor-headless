// conf.js
exports.config = {
  framework: 'jasmine',
//  seleniumAddress: 'http://127.0.0.1:4444/wd/hub',
  specs: ['test/**/**.js'],
  capabilities: {
    browserName: 'chrome',
    chromeOptions: {
      args: ['--headless', '--disable-gpu', '--no-sandbox', '--disable-extensions', '--disable-dev-shm-usage']
    }
  },
  jasmineNodeOpts: {
    showColors: true,
  }
};
