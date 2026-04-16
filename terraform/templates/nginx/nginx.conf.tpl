load_module modules/ndk_http_module.so;
load_module modules/ngx_http_set_misc_module.so;
load_module modules/ngx_http_form_input_module.so;
load_module modules/ngx_http_captcha_module.so;

events {}

http {
    upstream backend {
        server ollama:11434;
    }

    server {
        listen 80;

        location = /captcha {
            captcha;
            captcha_secret "${captcha_secret}";
            captcha_font "/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf";
            captcha_width 200;
            captcha_height 60;
            captcha_length 5;
            captcha_expire 600;
        }

        location / {
            set_form_input $$csrf_form csrf;
            set_unescape_uri $$csrf_unescape $$csrf_form;
            set_form_input $$captcha_form captcha;
            set_unescape_uri $$captcha_unescape $$captcha_form;
            set_md5 $$captcha_md5 "${captcha_secret}$${captcha_unescape}$${csrf_unescape}";

            if ($$captcha_md5 != $$cookie_Captcha) {
                return 403;
            }

            proxy_pass http://backend;
            proxy_set_header Host $$host;
            proxy_set_header X-Real-IP $$remote_addr;
        }
    }
}
