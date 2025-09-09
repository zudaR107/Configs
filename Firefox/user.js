// user.js — portable Firefox preferences (sanitized)
// Source: derived from personal prefs.js, stripped of IDs, timestamps, URLs, and region info.
// Safe to publish in a public repo.

//
// Privacy & telemetry
//
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.server", "");
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("datareporting.policy.dataSubmissionEnabled", false);
user_pref("app.shield.optoutstudies.enabled", false);
user_pref("app.normandy.enabled", false);

//
// HTTPS & security
//
user_pref("dom.security.https_only_mode", true);

//
// New tab / sponsored content
//
user_pref("browser.newtabpage.activity-stream.feeds.system.topstories", false);
user_pref("browser.newtabpage.activity-stream.showSponsored", false);
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);

//
// UI & appearance
//
user_pref("layout.css.prefers-color-scheme.content-override", 1); // 0=OS auto, 1=light, 2=dark
// Fonts (portable; adjust if you want)
user_pref("font.name.serif.x-western", "Ubuntu Mono");
user_pref("font.size.variable.x-western", 14);

//
// Startup behavior
//
user_pref("browser.startup.page", 3); // 0=blank, 1=home, 3=restore previous session

//
// Downloads (portable path)
//
user_pref("browser.download.lastDir", "~/Downloads");

//
// Misc quality-of-life
//
user_pref("pdfjs.enableAltText", true);
user_pref("pdfjs.enableAltTextForEnglish", true);

// (Optional) disable Pocket if you don't use it
user_pref("extensions.pocket.enabled", false);

// (Optional) reduce some URL bar suggestions “tips”
user_pref("browser.urlbar.tipShownCount.searchTip_onboard", 0);
