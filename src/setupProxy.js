const proxy = require('http-proxy-middleware');
const process = require('process');

module.exports = function(app) {
    app.use(proxy('/api', { target: `http://${process.env.PROJECT_SERVER_SERVICE_HOST}:${process.env.PROJECT_SERVER_SERVICE_PORT}/` }));
};
