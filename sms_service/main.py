import time

import requests
import subprocess


class SMSService:
    SMS_API_GATEWAY = "http://localhost:8000/api/alert-management/messages/"

    def __init__(self, sms_check_delay=10, sms_send_delay=2, sms_send_error_delay=10):
        self.sms_check_delay = sms_check_delay
        self.sms_send_delay = sms_send_delay
        self.sms_send_error_delay = sms_send_error_delay

    def get_and_delete_sms(self):
        while True:
            messages = requests.get(self.SMS_API_GATEWAY, params={
                "key": "bc29c1915af2897eb3c473a7cd871f7b51815a7c3eedd85dafc04e3a751080cd"
            }).json()

            for message in messages[:1]:
                for _ in range(3):
                    try:
                        subprocess.run(
                            [
                                "adb", "shell", "service", "call", "isms",
                                "7", "i32", "0", "s16", "com.android.mms.service", "s16",
                                message.get("sms_to_phone_number"), "s16", '"null"', "s16",
                                f"'{message.get('message')}'", "s16", '"null"', "s16", '"null"',
                            ]
                        )
                    except Exception as e:
                        print(f"[!] ERROR [sending message]:: {e}")
                        time.sleep(self.sms_send_error_delay)
                        continue
                        
                    time.sleep(self.sms_send_delay)

            time.sleep(self.sms_check_delay)


SMSService().get_and_delete_sms()
