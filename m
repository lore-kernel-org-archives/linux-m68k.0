Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA46322C63
	for <linux-m68k@lists.linux-m68k.org>; Sat, 27 Dec 2025 12:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766837941; cv=none; b=ozkF0SrB2+ZoUZK1ir/aEPqIqO6QWCk4Jg0F74nLx5b+Fm5b8r6TXXqfAjYnkI/6/e1UaS8KIRLaAGpjomiYPSxqvSbku75wYCZDQ7eAW9+t24djZqVs9LLvHItzUQPuMljlGfn+cpewsTLvSyXgVzdnYsuAE44EZ4jJlO9rX+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766837941; c=relaxed/simple;
	bh=go1Xoe57mzaY/mIQIq5f3pHcbzGWVFe1Pe8aCGM93yA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qLLkQkM/CMqTkHP/Q15zIQdQ/eQwaT5+2/BxcV5H0ribr7tSxj2UbjTrWpJRPScHa6/3k8sZ2lIP1yoSRK8oRkcDD3SS2tB2ch+Cqb2y63ROoktU1mYZRDsmlzVrXEXeS5y+XDvxaJknBc5lV3fsS6aZB+5zr/IumQ9awUYhZUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=fail smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MSh+rf+V; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MSh+rf+V"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-47d3ffa5f33so9274765e9.2
        for <linux-m68k@lists.linux-m68k.org>; Sat, 27 Dec 2025 04:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766837937; x=1767442737; darn=lists.linux-m68k.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jl/uMa7F0AxGo9UgKbw3ayYmv5/eAGkPJCpV4UBsG/A=;
        b=MSh+rf+Vx6xCDXCF/M27pQK8uGusuZ6iay//K/U2yQ3AyEcixCURjkboR/1AB5bI66
         CU7SIGWKxSENMPtC1xlk6S7NmQ1GQImitpTwFO1u8ZftJfNgnez0yNLMiOW6+afgzh/u
         eAgF57xOJZMPSqSwi4dOaSSgnhGS05ToJrpB9puqUcVfUEopBKzXUEfRnnwrfv8trwsY
         UA5MPB3w4B8xY/ohMXTt5UJQIyst5xI1QGRtSAJB+IPw+BPprHayeUFX2HltGeiTz8J3
         NYXWQM0hyobepMucDGhbc7IVjjkUAwKg1OQPiG4ZoFK4e3sXHbgIUkUzomBxIGCMruKy
         mTbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766837937; x=1767442737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jl/uMa7F0AxGo9UgKbw3ayYmv5/eAGkPJCpV4UBsG/A=;
        b=jk2N5WuvvlS8Zy0bD6+TpOLgdoqdypSokUdCF7vCfNbS76Cs1rVXiZ1KL72bzeicCt
         MIWxQBMbZZRBwjuACPvcUt9omCy2eyw21W3M/H7yOmbiOGzZNSaBy5yja6/tdPqbsU87
         DIb0MXfni/F+boDQbkftNsoGiddlk4IF+GgOPq9aNo04Fcktrp56OHEqqxhtuS0IbW7j
         BkQC+pt6tyur/mI3AsuzkeUGnoBfMLnQ7FxaqNqkCNNvex7oc4greLpNqQ3/dVjXVRSm
         9uSJp6X1DNbVCAlfib5X8LR2qhYJ2DXeuTDGC51D3U8nCbQjF7807hIrQuMWI2SsfNE8
         TXDg==
X-Forwarded-Encrypted: i=1; AJvYcCWoGcQR0829y6vF90ZkcNR6piLhqw9bIthwq/LVi1D2i5+BBI4pW6KsmyABnkh3xX0sGayvd6qIZKyk@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyK4FHdb+S0mWv9FrjYHu01iIpSkjaUa7+P3dbOaZ7qLaYQvsPl
	dELpW+s5kbn973CBZddhL3vxyg2CvcRS6rJA15K41SWlwqEYVna8CBnDk/btTRtuGWk=
X-Gm-Gg: AY/fxX5ZuJyqfybfamxK4CpIiB/he2QXuwc/jp2dfh1z5IkJcbFBM3PMKhhV1m9TCC6
	KHQpFroy3KNpW6rA+9cwg6Ra3MSJSIx3E9rwMW3DLzZYzt4TWlVyEsR0QQabYL6jsU1wTvKhEKq
	ipwNfwKVK/4dL5Zmm2xcvmMg4HyBL4ceqwQdbyLLZZxQFcVU19UeIWYf8VlnUTF2zM6YoCVsNb4
	pjv2vj3YQ5X/N68zxTj3nEHdQXaQQLrmB3/YwCLVs1hGT/5eO5Gy9UtpEDV3eDS1uvqL5CZP1r0
	bgpRBcV9UtK1bZalxZqBeDxDkbkfRTT8IDPBAdFqdgza7DgulQkNqQgBUTtUER8M5uvZYBS+pBy
	Tk3LlMysg8+VO0hd4wnf2X3HtvLBDyQRMLamExfx6VqfF37p21R3+y3LBN2ha0nQ7AVuQq2tyjm
	ZY5hOGp/sA
X-Google-Smtp-Source: AGHT+IEilNPw9ykBXsWasfDesGg5n0pMdngWI0y9wCDnaTUFF7DpZ4wL0dzMcGNMkGv8jBn79QEjlQ==
X-Received: by 2002:a05:600c:5249:b0:456:1a69:94fa with SMTP id 5b1f17b1804b1-47d1954a128mr290319795e9.13.1766837937081;
        Sat, 27 Dec 2025 04:18:57 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:18:56 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sat, 27 Dec 2025 09:16:21 -0300
Subject: [PATCH 14/19] drivers: hwtracing: stm: console.c: Migrate to
 register_console_force helper
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251227-printk-cleanup-part3-v1-14-21a291bcf197@suse.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=940;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=go1Xoe57mzaY/mIQIq5f3pHcbzGWVFe1Pe8aCGM93yA=;
 b=2O7MS+wSbmBy5GHviNZc0eUrBGjBqbDvdZl/gWh/gmVWu32K1VqnWzIxEikovOvxtxQ1Ut5k4
 SCkXkL827NRAROp5vOzN3LiFx30TLjgXwQqt3ej5ptdr+YtakhrR7Rs
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=

The register_console_force function was introduced to register consoles
even on the presence of default consoles, replacing the CON_ENABLE flag
that was forcing the same behavior.

No functional changes.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 drivers/hwtracing/stm/console.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/stm/console.c b/drivers/hwtracing/stm/console.c
index 097a00ac43a7..d3ae633e3bf1 100644
--- a/drivers/hwtracing/stm/console.c
+++ b/drivers/hwtracing/stm/console.c
@@ -42,8 +42,8 @@ static int stm_console_link(struct stm_source_data *data)
 
 	strcpy(sc->console.name, "stm_console");
 	sc->console.write = stm_console_write;
-	sc->console.flags = CON_ENABLED | CON_PRINTBUFFER;
-	register_console(&sc->console);
+	sc->console.flags = CON_PRINTBUFFER;
+	register_console_force(&sc->console);
 
 	return 0;
 }

-- 
2.52.0

