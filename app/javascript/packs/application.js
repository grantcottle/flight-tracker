require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");
require("stylesheets/application.scss");
require("jquery");
require("packs/airports")
require("easy-autocomplete");
const images = require.context("../images", true);
