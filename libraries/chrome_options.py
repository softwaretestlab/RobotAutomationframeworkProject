from selenium.webdriver.chrome.options import Options


class chrome_options():
    @staticmethod
    def get_chrome_options():
        options = Options()
        options.add_argument("--no-sandbox")
        # options.add_argument("--headless")
        options.add_argument("--disable-extensions")
        options.add_argument("--disable-gpu")
        options.add_argument("--disable-dev-shm-usage")
        options.add_argument("--use-fake-device-for-media-stream")
        options.add_argument("--use-fake-ui-for-media-stream")
        options.add_argument(
            "--auto-select-desktop-capture-source=Entire screen")
        # options.add_argument("--incognito")
        # options.add_argument("--aggressive-cache-discard")
        options.add_experimental_option("prefs", {
            "profile.default_content_setting_values.media_stream_mic": 1,
            "profile.default_content_setting_values.media_stream_camera": 1,
            # "profile.default_content_setting_values.geolocation": 1,
            # "profile.default_content_setting_values.notifications": 1
        })
        return options