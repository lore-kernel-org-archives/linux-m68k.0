Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71CB22687A
	for <linux-m68k@lists.linux-m68k.org>; Mon,  7 Apr 2025 07:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010421; cv=none; b=sxsPVZoupBugSerI6yEO3YlVKvbtoxlquJ5N/yGHnjOjpDp4Sj/7a3YCCH4ZoFkL8IlinP4XdXAk7ljFKMwGQ61itTVSxTknHg3sjdUmIwfHuo2YtxAQNKZELfMvZld9+mmoCi2BarLeT6z4D6ZWqHo/9FgvVj+r8Jezp/iBhZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010421; c=relaxed/simple;
	bh=vB97Q1YPbq16AwOxn+yN6Er1uY//wlkJ2Wtv7a3Qbug=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fc/awIBzmqPWa9iSTFYsnBNLtdBQIqHs7fb5xpCJ7Ie4dOXdrVUKOsz9JwGTmdL40VgH+ca3/tXv6a/Aa53ez5FE/jnStiCnmLdEFYBZV4g7pp6eztAEHe5+8Zkn1apzPk1mWexhnPjxM2zn/171QnC+f72Ws6a3qTi3TPOtOvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=iP/GlRll; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="iP/GlRll"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso20140055e9.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 07 Apr 2025 00:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010417; x=1744615217; darn=lists.linux-m68k.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NZkA1+Q3u+jEfVBi0l7ljj4vwe6IMZ6cjm27iXV9wpo=;
        b=iP/GlRll3bEr0d2l5mf2cIMYQY212TOWvPdJbjQn9s8xxfq0lbbn4ZY+NF6bFr+g6o
         FxZ2itsSM4TLYTJbwXP8qsMlrrOkYJOSD5EunGr3Mm1/pFG81iP3gH4cwvS5s7dYuR4s
         TQxfGQ5Ztk1PJcynXinDGxdpqNDPpW86BVyKegm0e/hHmOJ90rJcKW/SQ5+cbKsppH5a
         8X3hQhwGpkeMyFLtVfNym2KELWejhfF/Z36xUM+PJrb8zNicdVFVbJWyORJOSQ1VklAs
         1zhQ5xTdY2NkLFpJfHniZYfEKqZIqFUWD/wmRnIniUk/i9gFuaWuDqxvMeBGbBBeXv96
         agTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010417; x=1744615217;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NZkA1+Q3u+jEfVBi0l7ljj4vwe6IMZ6cjm27iXV9wpo=;
        b=IJvZryig9r+B7uDGWvQbq41r2An9tEXWGpmeWTIXFdigGXviL7jhrzVfgXlm1t/nmD
         1rqaFXjQr2/iIppewCUmnsTbnqIsKJLyzzF3Pq6zyAow/hv7U6+fgq8k2s2sNRI/9QK6
         wH677Rsgj1bt3epFcYL9MGuAHzklwrl2xzDFF1giwYBhxTf5oIOPYUg41+26DiQvkf6B
         3z/n4/NMM67oW0GoYqXMnli3Xfjz/1q728FqwpzalKs6q9+kZ+r/iv1WluPXpCOO+uxv
         8MXLP53rrvHJXKerdpD8vph5lQgyO9zJXkc21WOlpjAdapUv1s7wEnGz/iDHblaBLQ44
         YpFQ==
X-Gm-Message-State: AOJu0YwWHA5T2iE+3cung9I4HJYmrCFTJVkg6blN9OL1u86HexZnNqMB
	HioUKMw+iBf/tIqi2zNa4NsIbYx65DRZS25Dpg8bb9KhmrvBKEiogOUM5jcW80UlEoI8w2r5Dmf
	RccA=
X-Gm-Gg: ASbGnct0HgO+ypnGdPOQnGPBJZo0RSoe05VTPuRtpQyFB4BBYqAShBvDEjyeTGtucUK
	zLN5pLL0bTsyp4+d1Vs9uFJ+aEB/FHq5HP36rMvPADrxVGvqMucpPRiHAqQk/4+ru4C/Us/GH03
	WXWU6hAtyI8kgBXmdb/83RXc1laVC28Lmxih0y+sV+yNEc318WxmNpjYSDQjOGqA4OIQUwYH4Zt
	ZrSmoC7kTeSeS9IlYx5UVAn37N4Ah1ZS4uI2O+YAcFivGb9DV6hz9qZQH43iXaXsN9B7JEKWajv
	cvBodsBsI2B/pyfDTvaVFTjd5nBjQAaFSORz5A==
X-Google-Smtp-Source: AGHT+IHpPjFFlJDSkBPgrO6I41uexMOHig1BRBPlRgzV6SsR14UibMi/3rCWV6DQ/1uJeGXoDG6rTg==
X-Received: by 2002:a05:600c:4ecc:b0:43d:2313:7b49 with SMTP id 5b1f17b1804b1-43ecf85f4d2mr100415065e9.12.1744010416824;
        Mon, 07 Apr 2025 00:20:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec3669002sm121751175e9.33.2025.04.07.00.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:20:16 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:20:15 +0200
Subject: [PATCH] m68k: coldfire: gpio: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-m68k-v1-1-7fdc9132b6e8@linaro.org>
X-B4-Tracking: v=1; b=H4sIAK5882cC/x3MQQqAIBBA0avErBswpbSuEi2ixhoikzEiiO6et
 HyL/x9IJEwJuuIBoYsTHyGjKguY1jEshDxng1a6VkY3uEQ+ppUjJjpRLtwbt6F1rbdWO+Otg5x
 GIc/3v+2H9/0A+d+MBmYAAAA=
To: Greg Ungerer <gerg@linux-m68k.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1765;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=xpjlcs0Z+gAlZJFbn5AlXbcR6QRO7s3gx9jjA4Yf1Zg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83ywLwPBxfPzoX+y2laB9IHxbDRLfAaKx6afO
 m3U3MGsITSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N8sAAKCRARpy6gFHHX
 chzFD/9187tA+35Bnp9Rx8W4LxG/AeuKg9A73cy0c8KWQhWSdM7ri1UlLP1a9NbaUQtyH0By9oC
 2APZ0yRzXqSfFYP9fK9ZpYEkio/d8gepkwbFdcq1RTKbdManuCywpeHrTFSgCeRle93oLeV2ofV
 4Fnaam5T5+Zc9A7UFqUOqM7xd0fJ+Ra9pfRuZSYTKPp3vf1mfRPSsjePo629D3APbon9HuQV8rn
 eLMrSdZXM8UcgnJE2V60b/O3ANrlia6TT69eCm/giNkX+WCMV05mE/keSk+H7TUea4EH+efyZtR
 5Ycvv0s4Bi/+hI+/0Nh5gygp7khgI07qS9KZd3ygckstGgN/MirZNmYDK0OAZclCtRBGonphGOC
 TbXVVwoU81g20JSUbSMLZyC48lU7atrB9mUelvCzhINdJ8MkFHsG+aPRNuZiyAX2BVWjCDy5OSe
 ttX7s70dOMQVlCvDk1hogR1MYfXblwVVsk/2oQ1REV+JpRFaR0HnJRpklfVNFfkdGvPfJ6XdFxV
 x8GqV+b5JdJCeOxqkRt1lmXLxPXSl+AA29VwFzNiTcGgMY0ZO/LZ+8lLv6g45e6D6azdn/HQjz2
 z70FQNuZ99Uzf0Uo0Nb8qLBv03mX+x4EP1Cu8gH06P23VusZFg0pK4/dFo+xSeZbDhkMg5ikjT/
 d0J+f7HA6IKvfxw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. We're in the process of
converting all GPIO drivers to using the new API. This series converts
all m68k board-file level controllers.
---
 arch/m68k/coldfire/gpio.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/coldfire/gpio.c b/arch/m68k/coldfire/gpio.c
index ca26de257871..30e5a4ed799d 100644
--- a/arch/m68k/coldfire/gpio.c
+++ b/arch/m68k/coldfire/gpio.c
@@ -123,10 +123,12 @@ static int mcfgpio_direction_output(struct gpio_chip *chip, unsigned offset,
 	return __mcfgpio_direction_output(offset, value);
 }
 
-static void mcfgpio_set_value(struct gpio_chip *chip, unsigned offset,
-			      int value)
+static int mcfgpio_set_value(struct gpio_chip *chip, unsigned int offset,
+			     int value)
 {
 	__mcfgpio_set_value(offset, value);
+
+	return 0;
 }
 
 static int mcfgpio_request(struct gpio_chip *chip, unsigned offset)
@@ -158,7 +160,7 @@ static struct gpio_chip mcfgpio_chip = {
 	.direction_input	= mcfgpio_direction_input,
 	.direction_output	= mcfgpio_direction_output,
 	.get			= mcfgpio_get_value,
-	.set			= mcfgpio_set_value,
+	.set_rv			= mcfgpio_set_value,
 	.to_irq			= mcfgpio_to_irq,
 	.base			= 0,
 	.ngpio			= MCFGPIO_PIN_MAX,

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250326-gpiochip-set-rv-m68k-789f77283f78

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

