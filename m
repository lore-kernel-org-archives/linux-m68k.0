Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3956332573A
	for <linux-m68k@lists.linux-m68k.org>; Sat, 27 Dec 2025 12:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766837959; cv=none; b=ArASwsnpmFgS0XXHyrSG5Zw88CM8f/RpCxXOX0Z1JAHuzwCB0kc/3Okc+L0G2RI6v7IqARaKo0Qe5dNll/iHnrqRO0Nv/oCV0KawawtoDdlBJVQiKP7thC4NcUvrh19QYsTdLPDfm231QHf6erYBfcdTascK0lCterz4K8ujIn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766837959; c=relaxed/simple;
	bh=jiVyzdGaYwwOjViBefbG/4tnbA+IZ6VTt4S6NyPkSWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RMRp4qu44FSVQV/LJdT9OOARGZnH60wF9RDSjw4wN07BPPC6x6x54RJ0FChMFZH/XX7f18aWM4+Ghwomn0S0wBRWHNQn6n91gophsNgiDKR2VeMFDHd+/BPibPN6Flw28OXLWuP08GGFjFe6WSIpv6vL06NXqhVSNEM6GrKSNig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=fail smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Svg5CSa0; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Svg5CSa0"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-477b198f4bcso49248085e9.3
        for <linux-m68k@lists.linux-m68k.org>; Sat, 27 Dec 2025 04:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766837956; x=1767442756; darn=lists.linux-m68k.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ejU77izjbpiitWXY1CFRfcJAx1qt+ylV9tDV0w1mOdk=;
        b=Svg5CSa07r4YTyxfLyIz+gfCf7ixlqfWKrx9AfDQrQHsNQAvfFeDh6TBlABpfn1tTz
         ww5Ieiv0azllYXJRIaE6wkDNhbElde7y+Wvfx5nmUQlW9zVyQlq1SwxqVST0bUVWcRHI
         O1PyWnrD/GNeVKP3bjM1SgpOI86CiszYN0rxkrU7zJf1d58EPcmzb4CothEUMt6FxWbL
         B3G41tYx3bxtc9uYBklSrPPiVMoK7mX9msdc5vrQn41G6LG800A7wsAcJgEqykjMNTPo
         Up+aGpjhmiPmCsUbwjhYbq8T+S12HYuxIbmq5Y6+cOWnzKKDsdKo3NtPzgKFBWPYPje0
         K4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766837956; x=1767442756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ejU77izjbpiitWXY1CFRfcJAx1qt+ylV9tDV0w1mOdk=;
        b=HIHoLPyNtn+8A655zJxszesqMefCEN3OkcTDk8WJ/VlRKuPDdOXKb4mDOsS6TBCNJo
         e6X9QZWtHAaM2g3DVFhcS5bMMbBJ23ji4undmmIMPchafcOkG6eytcqRlmNmmJ05P7QU
         9ylXZtT/SchYgtdWmGnaxClyz/2Qa7/nkDSkyDwYBc1TCIbSLniM5LQgxJoo/JpATgGf
         +H7QrO8atHy0RpAIQnc25qXC6LRR7TtYdY3HdXc8mDl/U7Atrh9tsgRikK8Ptr2ZF6/w
         EuM2p4rRyPEa3SvDllN/ephhd9ZhxSwceUd0WpL0NUSyBCXPeAts4wRl0WfApNjLkcbv
         qQ5A==
X-Forwarded-Encrypted: i=1; AJvYcCW4l8ZQw6Rh7Q0krFWcmAR/BWwN325wKk44mT+yCKX9agTSQG+pctspmYqjpmnxxdjFrseQhQEqvRFi@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxfVJBenshqJ1CTl1ltyx/Qjy9kGmFbK34CddbXB7m7XjtOirOR
	EF41IDkqgVc6s3KFGh7M3+F67hNYptguQoVD4mAzxecrHjgftBiXwtIzKFsLzUI0tcM=
X-Gm-Gg: AY/fxX5F/ssPeMIjXJwKPdNigHKk9HnPMwaT2KZVhgwg6Q6uQzs+IkNf71ikYMXznEK
	eI4k/D/NYuB/MmgkNJ8Hy7iFGeHjKEgTDgLu5YcM5y/6FemCdUb/9YrPdrDpo9hWkPgCs7G/lBG
	0CYbMlpTjjga46PIOrniVvzncEoiXTZigNPzeht26vPxQeVebnyyb+JWVw5BncW7nfxS5BuLZ9c
	8HfF1OqR1+OG7tlS2+I3cwADEHj4xbQ08ETFDPWWVTXtBd+sMmy0hcLzqmzkPk4nuTOiNEH1lvL
	GM20nXFrfPtq0XWmaXkLLKhRliCadpCXI7c8EWS0VYmfonv/cnjvDTkpkcBXapIeb9izUdj+Grc
	rspq6JEoqatd2olTgiEyTHsYNn34GW8jasQeAE6iY+6MwyrssMqpmVKoe849d/rx8DPcgx0HohU
	h6VznKj+O6
X-Google-Smtp-Source: AGHT+IGcVRETU5SGb8qIhgBdGnot/sm969/AEg3tWF/SLDrOBPXwM9NZtaV8oGtTOpkC0w9sxSvHbQ==
X-Received: by 2002:a05:600c:3148:b0:479:3a86:dc1e with SMTP id 5b1f17b1804b1-47d1958e459mr275597435e9.36.1766837955551;
        Sat, 27 Dec 2025 04:19:15 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:19:15 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sat, 27 Dec 2025 09:16:23 -0300
Subject: [PATCH 16/19] drivers: tty: serial: ma35d1_serial: Migrate to
 register_console_force helper
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251227-printk-cleanup-part3-v1-16-21a291bcf197@suse.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=1239;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=jiVyzdGaYwwOjViBefbG/4tnbA+IZ6VTt4S6NyPkSWY=;
 b=Y3ytKQigesyzk6xu3oPXbBS5mHTUJ1mX1rT6WRhai16pDTDKrILE6MzhKcIyuYvYQYYU9QQLY
 +jUI84bHhmDDBPQbqZ6BL7ROSTnYW/5U7XoL9eZmy1wASQ14fgiWD4j
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=

The register_console_force function was introduced to register consoles
even on the presence of default consoles, replacing the CON_ENABLE flag
that was forcing the same behavior.

No functional changes.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 drivers/tty/serial/ma35d1_serial.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/ma35d1_serial.c b/drivers/tty/serial/ma35d1_serial.c
index 285b0fe41a86..d1e03dee5579 100644
--- a/drivers/tty/serial/ma35d1_serial.c
+++ b/drivers/tty/serial/ma35d1_serial.c
@@ -633,7 +633,7 @@ static struct console ma35d1serial_console = {
 	.write   = ma35d1serial_console_write,
 	.device  = uart_console_device,
 	.setup   = ma35d1serial_console_setup,
-	.flags   = CON_PRINTBUFFER | CON_ENABLED,
+	.flags   = CON_PRINTBUFFER,
 	.index   = -1,
 	.data    = &ma35d1serial_reg,
 };
@@ -657,7 +657,7 @@ static void ma35d1serial_console_init_port(void)
 static int __init ma35d1serial_console_init(void)
 {
 	ma35d1serial_console_init_port();
-	register_console(&ma35d1serial_console);
+	register_console_force(&ma35d1serial_console);
 	return 0;
 }
 console_initcall(ma35d1serial_console_init);

-- 
2.52.0

