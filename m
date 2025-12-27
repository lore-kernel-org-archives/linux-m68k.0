Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7B8322A2E
	for <linux-m68k@lists.linux-m68k.org>; Sat, 27 Dec 2025 12:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766837922; cv=none; b=tqUPFoh33pe33Sx7TiX72Dqc4XpIyUmyjLQSm8MNCoGKsfqshOHl6hjIvfrplw4kWV9Q9BaEsUSR9lxPRQexuDEE1FUKfzt4FzXiLyIU6mCHz0jPUuwQ7Th5oXBl4o+hbBKvYOdZq9CBr1W0UyizblqrXOmovJay6cpw7Z+bQko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766837922; c=relaxed/simple;
	bh=rI7fN9M4UYBhm41SNkDmrXmROIuX+aCv9rIYYOtlo+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Od9CsVbdnFJEuMzUdr5clyzf7DPwnCXKDG6hgKJuzRik+/yj6/N7PVqRmB+fGqqddlg2G87dqzg4SiGv/3tzJ2iZN5FCUdWnu8ndvfLU95sSiNzeUGYjc1z2aJpjLGm+CP+/jep0cDhIee1C8yBrfx9/sMWR7TlqUmF00aN3xqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=g1OSz62j; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="g1OSz62j"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47774d3536dso61937395e9.0
        for <linux-m68k@lists.linux-m68k.org>; Sat, 27 Dec 2025 04:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766837919; x=1767442719; darn=lists.linux-m68k.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zBuTaAePekdaKhl7Nr4xkMCH+YbgmQZc5bDJsdsSluc=;
        b=g1OSz62jfdAVn5mbUfn2twrNcDWlxSPc8xf+o717ldFBWnc2h3zd2QkC7+XoPo9/Ko
         JUZ6On0PAIA8hiWuNjhPJ48WNDvg3XoB+TAcsJMaCzZ2/mzFiDg3z33z2RkU6afFcHoE
         TDF5/o88H7ZJoaIjuWHGEWuJ/eunHzHBCBn50QuxghGHCHPHi5euInHnrJe2RNudyf6c
         DKj8mkuF7SZPqwVbNvLUoOKiiHaqMYzezMuDuLOFx+2hBaLNYC225HID3YkqmX3hOUe5
         oHWKwAAuep7wiDJlja6SIPwOWbEIDksWyf1W882anPXNmNvP73zKhuTchXfyitdVUEzA
         R6jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766837919; x=1767442719;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zBuTaAePekdaKhl7Nr4xkMCH+YbgmQZc5bDJsdsSluc=;
        b=dxC63wgU0YKE8CkHKtA7KW6KLclWGFgLdyno8KGo5OcftKbcGjnZ7S7PNRXLVRQvfn
         ecaBH+Y+aHiOW+1aHWoNFWbt9X71H5iGShjTbW66ubMdY06Qa5dFdrynMSVoDjo0dGGy
         NqYBto4f//RC4SpnBVvRzykVXIEmzw8rUq8gyf4uQx8wSZ2nBj4omORZkCNH9laf1z3v
         4ahXiZPOEYZwnapQElrbHPhioJWR0OaOGSjrD3FBxN4UhfjYdNHxlQm063KAQkxCVddD
         V5GP+sg15vxvLpP/0gDFTHSsQdlRYxMgifR+eHa8WRpiQOQmQZpQ56ShQ9o0aZbxWFpx
         oF5g==
X-Forwarded-Encrypted: i=1; AJvYcCV2maOl3ika58kSPCWwGkwFsU/GfAhqNzq0V0OVyT3aSqTBVssZYMY+1ZZB81mCcEYU3VBlIGCcgKy7@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyYogrII0dmtnA7rYrqeXZj5BUDaB/+Y1K/T+SXYuz+BaWwBinp
	fWiJn8Holm5qMJBj71YlSuwO2j4C2ieydUKt9yKalb5VHen7IQDgWEpZUhmwO4ogmp8=
X-Gm-Gg: AY/fxX5jtSs17pYQOKhy2mLsZj5/FGCHpXRFq8Njsu1trPdlsRVMTFDOSRZrLzArWEj
	NGZ+jXfV3Zgmt1sNyS+0A2uT26HOYRMxe8AWchXVNo1Fio3sWqol/VhmOcB2LbrM2eqwkBiwplp
	svfCjJrjCjFiQdOq56xSOuJqflPtEJT/sdCE/I0SZKwGoExslsRLVUMbpTGAt8ibKflZOrtqE0G
	dWBoRBQXhqDWqbgiWiNXI2b7EAp8bsyb0akzNxk/BimxgCgz8DDzDe61bLNqrJUxGjdg7Z/OqyN
	y5bgW1XJJsPV8C8Q7+nCLvxuO6NwUfLbAQU+dnrjaFDrm5tQoZF4fr1sg4FY8ob0brOIiLMGKnB
	8jPpXt9THWizjquvi+VGC5DcxSqYsplJGkI++jGvLZ5H2FWqRBp8d9gK24VNYaVkSVAm4vIxStl
	yWWp+bEtyx
X-Google-Smtp-Source: AGHT+IEaiNWrbXUQR9Xr4SWeWCswjY7G2xsTNDPKS34qx+Z9cd/RVKqDItuoVsaN7WK8NMfB3mQH/w==
X-Received: by 2002:a05:600c:3799:b0:477:a71c:d200 with SMTP id 5b1f17b1804b1-47be29e87c1mr231953365e9.11.1766837918587;
        Sat, 27 Dec 2025 04:18:38 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:18:38 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sat, 27 Dec 2025 09:16:19 -0300
Subject: [PATCH 12/19] sparc: kernel: btext: Migrate to
 register_console_force helper
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251227-printk-cleanup-part3-v1-12-21a291bcf197@suse.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=1119;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=rI7fN9M4UYBhm41SNkDmrXmROIuX+aCv9rIYYOtlo+M=;
 b=bcNrmzf90N/BodrKZ64tr7qsRPh416urxDwc2BxCBqWgNmTslPpP/9rT1ZURe+mv3PmWaFnbq
 xnM5PWTrVU8APb7FwkkZf2fGZ3Hw2PsJVWl1KwMiIyJjzl33goH6hX9
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=

The register_console_force function was introduced to register consoles
even on the presence of default consoles, replacing the CON_ENABLE flag
that was forcing the same behavior.

No functional changes.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 arch/sparc/kernel/btext.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/sparc/kernel/btext.c b/arch/sparc/kernel/btext.c
index 2bf558a0c568..951de7733632 100644
--- a/arch/sparc/kernel/btext.c
+++ b/arch/sparc/kernel/btext.c
@@ -301,7 +301,7 @@ static void btext_console_write(struct console *con, const char *s,
 static struct console btext_console = {
 	.name	= "btext",
 	.write	= btext_console_write,
-	.flags	= CON_PRINTBUFFER | CON_ENABLED | CON_BOOT | CON_ANYTIME,
+	.flags	= CON_PRINTBUFFER | CON_BOOT | CON_ANYTIME,
 	.index	= 0,
 };
 
@@ -320,7 +320,7 @@ int __init btext_find_display(void)
 	ret = btext_initialize(node);
 	if (!ret) {
 		btext_clearscreen();
-		register_console(&btext_console);
+		register_console_force(&btext_console);
 	}
 	return ret;
 }

-- 
2.52.0

