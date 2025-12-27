Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA6F325712
	for <linux-m68k@lists.linux-m68k.org>; Sat, 27 Dec 2025 12:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766837952; cv=none; b=QF9CgPqExhA01RKX9h1zyARgyKExfP7DjuF+fPxj2iGOnk9a0F15pLb46rnBg1LAq6AiKrIApTmUmmW8c969FHhYHltIBStuPfRGSWFradagTWcoT/72P8PV8F5hXkROsPVdXhvYv3m9ILxQg8hCz9elehjocJyJtYnT9S6FokU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766837952; c=relaxed/simple;
	bh=8apb8xIF3Rmf3METSNa3/bIFoDSqesuSeq+cEdBJRMg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P3u/RPWYFUHfAYs6nzRVBQQpHZS8kqCJzHJKjj3bqVxDo3x8jAv+RqvVRQ4j3ZwuMdUQDhg5l84JDLaSubN77OPDvKkNcT8XmsN0yMMpl6aSVUoTrjDAHzvrxSNEJrimD5cM2uad/akB8DDiZTImDdYtrONdotpoQplP0RIGdD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=fail smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fejKhoF3; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fejKhoF3"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-477632b0621so49221535e9.2
        for <linux-m68k@lists.linux-m68k.org>; Sat, 27 Dec 2025 04:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766837946; x=1767442746; darn=lists.linux-m68k.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Svns8VRTDcd692NVX/iQ+u99f8RURxgaz6jdCSTwtGo=;
        b=fejKhoF3KxdAmKSrmE9GmA1lJ2jXGtbOuJZgHI/xZE9HFjHjfxqx9Pi91gTPAbXBg9
         3FNbmWmTjZm+WfRnyQoXmvJHYfse1LX3Fbe4+PdZjhu1ICCNabRh8z1UCBiVIytZpNJd
         efan4nBkV8lflenhVCg7knsQ/gIhQJSo8KxQXtrWzfFcX4izebF9m5GlJokgQjlb05XQ
         s+v7P4N2XsNvWESM2YABlmcsFDawN3lDa1XeKrTG+O8kHlbN5EXMEPr80nLNcqJ7PtYI
         GIzzFav0WvKWR0loMnp2gzVvvSDf6N0p9a245MfPi4eOxmDjxhe3aLisiWA0H9NaPuzy
         Y2ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766837946; x=1767442746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Svns8VRTDcd692NVX/iQ+u99f8RURxgaz6jdCSTwtGo=;
        b=IzGjTvAfF8CNxejoUmxB5ku9lUR3XFAUvwlAHxAqogLYZsLL7GffWPR6qb9A54eU5E
         +YBS75m5lRGQPB/9+dsqCVzEvnJ/GeM+A5Oxk1HymPLIXpXMFJD122WhYu9Hm9Ggz42t
         UQS7g2XOQEhqBuHk/8/bAL1O/SINKnAET6pobl09Z9upPolULu4k/MfYdMHQ8ujmtV6/
         V5Ps9jxlI5RU545LBfHhaQrb/NSi1heWdMiIcdD8OoewOe4fDHwUnFCZYadAJj18bLY7
         g6FAoXp/G+rqGhYI/9s3pwyrqATv3hrlaMYVkuiJCw0AUZyYUezIVeK1N/H5r9enGTR7
         Z1cQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4BnprYfFceZtyfyea8leJm883iHHdE26e9Hj0dQvrNhyQ9ST8lqs/Cz8S8qMvjqDVCh9fA4zJmJcv@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Ywr61AnL/+A8MKJRf6+m3cMA8Y3Q8FNDjdY1IXQDmzml0QKZ7jP
	rBetGwoeaCrLpnetXrtYukNEQpRCsEZ2vCpnNh9WbGQCe7LfdnE0IwEpwc19ZD/VFEw=
X-Gm-Gg: AY/fxX4PZzJzcD5mrIUm6iSyjyZBm8ulQ5ovRPnlzS2Zj+5CQkTohRJsL2A47Qg82h+
	YnvzIJ8N5pSFP01q7KTPwfeO9Ty7Uh8ihKpuzjyHIGYPUkSDL7pAwQ726+P+rvq0D0b9VXJdytb
	qJppchljL7sAV+jgzEeO2AXRl6KinydWRgWpRDXk3UCjGwrRWOeEXcwShP6f0MEk6hOxdpO4Qp/
	j3yawwl//UomD44qsJ8xB24pTSNl/CFTiYtox+yMZJTCWf/EMiFcUDutdGhlrtfqL5LEpO+xeWT
	vBnUeHsuf1jva0arLzSPQ5z5oGeKJqXFPEFevSEJI1tHcv3mk89FXAU5rlpy4HCGO8oIKz9Yhjj
	CZDEd8aHeMa5qJaGVUY7WBUGu+mWUxcSxbBvzbU+GlnXAqJKaWHl0YdwxunKRJpgvTQlhplTuCA
	7W0tbSzhU7
X-Google-Smtp-Source: AGHT+IFQPHp9+ZXnfJ9gaFXvmbmtROboeRiL3XR0blYfmQMI8wXzbSWqjXdBS1sjkb/JteTKHl2ZOA==
X-Received: by 2002:a05:600c:5303:b0:479:3a86:dc1a with SMTP id 5b1f17b1804b1-47d195c2d7fmr223567305e9.36.1766837946357;
        Sat, 27 Dec 2025 04:19:06 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:19:05 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sat, 27 Dec 2025 09:16:22 -0300
Subject: [PATCH 15/19] drivers: tty: serial: mux.c: Migrate to
 register_console_force helper
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251227-printk-cleanup-part3-v1-15-21a291bcf197@suse.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=1068;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=8apb8xIF3Rmf3METSNa3/bIFoDSqesuSeq+cEdBJRMg=;
 b=SOQn5veC0enOSDBgUA8xgjFU36YeIU5ltm01mWbteI/FsjC7wSIvDCGkCl9Jt9bptuqtwUiUT
 XJt5OJVOiy0DmhgN+BFidqaWmVu/I5CuRGxAmhAzWOivaZFVrPO2ZNN
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=

The register_console_force function was introduced to register consoles
even on the presence of default consoles, replacing the CON_ENABLE flag
that was forcing the same behavior.

No functional changes.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 drivers/tty/serial/mux.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/mux.c b/drivers/tty/serial/mux.c
index b417faead20f..5a2d706b9cbc 100644
--- a/drivers/tty/serial/mux.c
+++ b/drivers/tty/serial/mux.c
@@ -390,7 +390,7 @@ static struct console mux_console = {
 	.write =	mux_console_write,
 	.device =	uart_console_device,
 	.setup =	mux_console_setup,
-	.flags =	CON_ENABLED | CON_PRINTBUFFER,
+	.flags =	CON_PRINTBUFFER,
 	.index =	0,
 	.data =		&mux_driver,
 };
@@ -547,7 +547,7 @@ static int __init mux_init(void)
 		mod_timer(&mux_timer, jiffies + MUX_POLL_DELAY);
 
 #ifdef CONFIG_SERIAL_MUX_CONSOLE
-	        register_console(&mux_console);
+		register_console_force(&mux_console);
 #endif
 	}
 

-- 
2.52.0

