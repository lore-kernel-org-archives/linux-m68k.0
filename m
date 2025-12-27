Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A4532862A
	for <linux-m68k@lists.linux-m68k.org>; Sat, 27 Dec 2025 12:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766837979; cv=none; b=on4GsfRUSDiQ185TSMM43SLImQUAXO6WI7/0j26gMgv//J5jQDYyhOuj5wZyXilxxuurc2Xro97EfIIITAuaNwRKQ4xBRbXhHYcNwwUknrE99w//LPdeDG0CnJ8sIpJfSx71Bnab5WJxir4n1J7I0saqtCV29Ugi5I7BbjXdQoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766837979; c=relaxed/simple;
	bh=M+RAaPiD4L8bkGcekgUNUpTeF+sJQV6vQniznC8VslM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dWz/IMMNcJTMmMks1bsrlKyHrOoaQZ6rCoNYiRBkQcg7hVSzSFTQ1GrdfPr4k+v0YvQJeB6kML4f7mDJku4SGTTNmd6yGrWOpZZtbLaVIi8LHVJzeAcix9alTQdSx6PaGsH1uOEumvvFF+kFaKcZUIkx3eKXJAu6a5bqNOcP/O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cULt+lLY; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cULt+lLY"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47bdbc90dcaso49503675e9.1
        for <linux-m68k@lists.linux-m68k.org>; Sat, 27 Dec 2025 04:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766837974; x=1767442774; darn=lists.linux-m68k.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ltdd8M4LmPmBXDEHAaMGtcqMVaDk3ISf2NYRX3F1G54=;
        b=cULt+lLYpOgMIF7NcV93/qAG9kWkWlQIH2iuomoGlyeJSKINH6J7F/kcNPg1+j1ZM2
         BoayyvdtGfVeFHPZRBQLID1C3Lyc30QYuDWElzlZp7b53QwaQz2Kx8jPbifCkHQyD1uo
         JVCikhSZv0j7nR6xQ5mMSdwbGmZS62jUnUcYnngRk17OsojvZ++vW9kkWOrjxmFbVZWH
         BCB8ssQwgF0X3+s4rXnOVKY271IF6EkHOCtRONijp8ei2Eh5kZnXqJFMYv03E2PiV0Yb
         QX4ziHExmNN0s8apuoST571kfAORuf3hN6oRHU5HEvA+6MLHYy7i9fiBdhL6wbvz+TJU
         ENuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766837974; x=1767442774;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ltdd8M4LmPmBXDEHAaMGtcqMVaDk3ISf2NYRX3F1G54=;
        b=eby8L8nu/1U/mswjO4/iY7aEvXXUTgAFXJaCQ7bxT4g2iUTjklyh73smxXU9c7A9Qu
         79fx9OxBeX3zzZNvJmBDChi31B4CMFE2a54Z9pawj2UZ+xxLoXlePniGfVrDEnPP7i7Q
         Tvo6JzfuQvGaI5v6VkPI3E24OyGkYFSaPaoScvbXl0AqyjfM6Rn2pL0jH4Porg4isyoT
         jsukwzJ629pqYQ9KMbeaB+Iy/J3xuBr6oqZRV3xsgymAyo5RsUb79g0hK42GrtGRNKWM
         +1JpKu5UoKjwIFfU0CUxgnvsRq4hxbC6TG1uIrA321QhxyKfLkLl7z74uivrU5YBlAMO
         sjDA==
X-Forwarded-Encrypted: i=1; AJvYcCU5cfDphSyzgUa8e+XyOmT1gHsioIdWmamsQqBlwXDEAZ/KvjCy1bSiYFgnX5dirJyxlEyPeJWRwMNk@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxFK/mbBDOQ76DrFM+BoDQC2+rxA3YRoB/OY7LlcHjI2v/6o0MF
	U4eR9dq/vZEeMZLZKRlQe73SiICWOAHMiJr6vIut+jG90JscdmEXUCMuwGHj2OnGlFQ=
X-Gm-Gg: AY/fxX4URZmqmxd3VZrI9hHPLs6GseYtSiHqpGrnW95BB3rl8LLvC0PULnQR1x7NbvP
	W+7O2VgBm/0pg9RMzwl8PxQm1DdUkMWWQg01I7Spa1CMNaTsfdnxNAkWR3D3AHZcCJO4bvk+6Vs
	n/0TrtECKKant7AT1K6x29f4CN1jVk+9nHX6nFYa16eciTeOGMcTSrPiKTAzf+Q8i9l+lkFbP6d
	LrU+JLd+pxxm9OEiJjY0NSZrEp2FK8/FbJXXmDhbjYtYS69dtq3KXW5f3HE57wJD2mvCaHeQlA4
	E3esiAKTfmvXBQZ74KnLtOHZ+/icPk9xB7bRuONL6UdLT/4yctS3I2FBbCUorHw10QcGShGyQMa
	dOGY9K1FzGKg+B84VhlG+68Rp2u4a46pRe1t0dB9YOV3oE4JmSUTA0nW042a98mFv+AJH1bUTAe
	9J7sVhh0k4
X-Google-Smtp-Source: AGHT+IHMLS3VfYivW6iZyjAkGRbHMebp8EGQujmDyd6LpCoRzo/q2pR4OLsY4m1yHd+Dy1qj+iz1Lw==
X-Received: by 2002:a05:600c:5288:b0:47a:75b6:32c with SMTP id 5b1f17b1804b1-47d19532f91mr239061855e9.2.1766837974046;
        Sat, 27 Dec 2025 04:19:34 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:19:33 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sat, 27 Dec 2025 09:16:25 -0300
Subject: [PATCH 18/19] drivers: braille: console: Drop CON_ENABLED console
 flag
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251227-printk-cleanup-part3-v1-18-21a291bcf197@suse.com>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
In-Reply-To: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
To: Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jason Wessel <jason.wessel@windriver.com>, 
 Daniel Thompson <danielt@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>, Petr Mladek <pmladek@suse.com>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 John Ogness <john.ogness@linutronix.de>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Breno Leitao <leitao@debian.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Andreas Larsson <andreas@gaisler.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Laurentiu Tudor <laurentiu.tudor@nxp.com>
Cc: linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kgdb-bugreport@lists.sourceforge.net, linux-serial@vger.kernel.org, 
 netdev@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
 linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 sparclinux@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
 Marcos Paulo de Souza <mpdesouza@suse.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=917;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=M+RAaPiD4L8bkGcekgUNUpTeF+sJQV6vQniznC8VslM=;
 b=VNcSKbW4wn0ZJDPmlW3fCDrj2qqqMiKzMUpnoUVSmYqwNJRukKGa+p9lja5itToGTVwI9LN+2
 mQPFka3TIBIDqDnH2JmGqErVL6l4YMmEx/hbdpLg4Ll2XIa+vBtsfSS
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=

The braille console doesn't take the same path on register_console
that other console drivers. At this point, it only registers the console
and do not receive any printk message, so we can drop the CON_ENABLED.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 drivers/accessibility/braille/braille_console.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/accessibility/braille/braille_console.c b/drivers/accessibility/braille/braille_console.c
index 06b43b678d6e..0b7ec68b305c 100644
--- a/drivers/accessibility/braille/braille_console.c
+++ b/drivers/accessibility/braille/braille_console.c
@@ -360,7 +360,6 @@ int braille_register_console(struct console *console, int index,
 		if (ret != 0)
 			return ret;
 	}
-	console->flags |= CON_ENABLED;
 	console->index = index;
 	braille_co = console;
 	register_keyboard_notifier(&keyboard_notifier_block);

-- 
2.52.0

