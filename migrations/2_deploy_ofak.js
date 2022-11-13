var demo = artifacts.require("demo");
var sanctioned = artifacts.require("sanctioned");

module.exports = function (deployer) {
  deployer.deploy(sanctioned);
  deployer.deploy(demo);
};
