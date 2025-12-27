Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799D4327BE5
	for <linux-m68k@lists.linux-m68k.org>; Sat, 27 Dec 2025 12:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766837969; cv=none; b=lX7is8qdnjZ22+s7W5nttrAem3gzeogFvwoq4RiJeaFDf0ijfNF8joQqrWjNIKBmLz4gFxVGlGw7kCRrMsioz3pcQyRvCkOpQd2dSbGLrECG4hQCxdxNa7Z9yD+dtoCVJz3HXkkjsrC4yaPyFpAzLpInVcGwrkq7GiCD4I/O8DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766837969; c=relaxed/simple;
	bh=ipo1oJr6oF51GaJ/ypmHdNm6pxSai2H+L3ksWdFz4YE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b9rFKmZXt6uQoQve0nWX+JNM69koYjSVoA0Ainag8Lar9pLtvJf/2dsGgVr22FWwXWm9E5B4Ghz1STOU8lTibngLcPz/mPEmFv8JWvsB5RPHO5EKjVp+HzFKyAREzDaeVbv9FbfBP4t2Ik0hdFm0VKWNEVhDTtr+oMRSN7aI3pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gFOKivmn; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gFOKivmn"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-477632b0621so49222265e9.2
        for <linux-m68k@lists.linux-m68k.org>; Sat, 27 Dec 2025 04:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766837965; x=1767442765; darn=lists.linux-m68k.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PI64KbZN9t1PF6ymgBKKgUkODGeQdgLto8SJvKTSB0M=;
        b=gFOKivmnGNQnSxuQTR8I88BLGmJ7yTZfQMrG+k1+VzSnnMGV1zMcz/nax5jMZzb0gj
         nwvg3c/oXuc0MURhjTsVgUVAWdzqItjXdptg2gA09p8gpjee7CoDEHM8M00cVuKQLyJ0
         uYFpUD4G3uiyhd7XceNaHwV1NzcKCGHVWwcQFek6+8Sh38HccvwCSfXygcIMEX1mHCfW
         EbPX8eKCnykJP5WBKLFfSvowvjTXvBBTILhi0B2DlQTNdeGrA4CmTMiF8ZjzAXnHgs8k
         H30uL7oTeQVk+3oo/pxXUqf9H30MJXBAa2WoF+UCy0975mqNAnulQxg1Qt9rwDJ9iSzU
         DyZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766837965; x=1767442765;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PI64KbZN9t1PF6ymgBKKgUkODGeQdgLto8SJvKTSB0M=;
        b=LAbGoshAFEcHFZ4xCjgQj/d2p54/NUHCZWNE2rN8D7UEbCFzTX/pWhHUgiJ1RyMh9b
         glZ7urREIBvyB+nJFwpshvVB26ptHuoWXz4jEDrCzAGePstmsZWTRaaZADAb2OpDnVd6
         UZbAEAXykd3ywj8Hv46ek6woQjRYyneHkvdpCyooQKJfvLViBKsnx60HildsHm008udX
         fjJM2Qy4T+DvSgwk9OGBUM7umQZHH8QodwvoD6SCEZ+pryOafL+PhFnI6XMj9+L8N5n2
         hs8tatPLUTKlQi8nxngRK0bYNKp78X15yWQyp6l5n9YSXigT/QzxTPGtiF72cNTL6IYa
         HNHg==
X-Forwarded-Encrypted: i=1; AJvYcCXQsRz5dR07GaiNzQCvm4iFmoNMUsIdgmdD/kyN+YD43zQkTmaWN7ncVXrEBK/DLYVQUBDjmrMl2oW1@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwYvLRzKo3fRZL7LKE2oGJnLLBt355M3Ri0pSIfzCOQmBS/P7pP
	nSyaNxMcrv+kmBrh+jZIZylfmqK3cTzYWqCyl99PhvW7VrFbR1qZ465lsrT9v7TJpbQ=
X-Gm-Gg: AY/fxX5hSFt3KdpmcS+s1dl8uWWKI5Dlpk3ztLWK1nZuhUbVaLz47Q6sKvYzxfIxPks
	bf+oJ7la/NoghknG5tUpJGG+eRbOwC/Zxxd9CqcVp8eV0q77i+0vgr3M9QDw91MgIAORK7FWuOp
	q0FU752FA27B/RGza9I+p2wnQOHMGqq5RvDCdnkbvz/QxWq0XV0vRoiPGhuX/Lng2MF/yJOsGZH
	zVwNzzCZRUy7T+e1u+vyB+LUa25EMNhkBcp9eXng+LrZZNlB+ZmybscTxL2EAdDTpkBkBFV97Sp
	S0IBBLw5dZMwtiSJ3QDAihdUkSirZa7fPRc4kFqyHA6ODlLG2Img8l4FT37qQEP0apCoC/kMoJu
	1AYJOPiA57ce27Nn9DlK+sasnF78xNXk/eUb07AVy6ZAq1IOaQCtYSpeN0C3fiMq0or2p56T+cZ
	F8SbNSKZ/n
X-Google-Smtp-Source: AGHT+IEqqHc/Rd2kLfHagj9YhzIrZRGfzwvOOoeUxY4FRXLnI0VACA/N9sgft7uDx22VCc1m3UDX7g==
X-Received: by 2002:a05:600c:190f:b0:475:dd89:acb with SMTP id 5b1f17b1804b1-47d195a72fbmr289900545e9.22.1766837964788;
        Sat, 27 Dec 2025 04:19:24 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:19:24 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sat, 27 Dec 2025 09:16:24 -0300
Subject: [PATCH 17/19] drivers: tty: ehv_bytechan: Migrate to
 register_console_force helper
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251227-printk-cleanup-part3-v1-17-21a291bcf197@suse.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=1183;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=ipo1oJr6oF51GaJ/ypmHdNm6pxSai2H+L3ksWdFz4YE=;
 b=BCXQlMZHiSgf9aACQxFpdYHusJFHrRGAPtAecEP+JmKnj9nHT6kdi2m955mQdUkj992asxAcQ
 YxGwDMjxOJdD2wCUfBrHw1pcuZeGNuCZOOekwLuy8OjtGsDgBHGc3PP
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=

The register_console_force function was introduced to register consoles
even on the presence of default consoles, replacing the CON_ENABLE flag
that was forcing the same behavior.

No functional changes.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 drivers/tty/ehv_bytechan.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/ehv_bytechan.c b/drivers/tty/ehv_bytechan.c
index 69508d7a4135..a2aab48d11ae 100644
--- a/drivers/tty/ehv_bytechan.c
+++ b/drivers/tty/ehv_bytechan.c
@@ -299,7 +299,7 @@ static struct console ehv_bc_console = {
 	.name		= "ttyEHV",
 	.write		= ehv_bc_console_write,
 	.device		= ehv_bc_console_device,
-	.flags		= CON_PRINTBUFFER | CON_ENABLED,
+	.flags		= CON_PRINTBUFFER,
 };
 
 /*
@@ -331,7 +331,7 @@ static int __init ehv_bc_console_init(void)
 	   byte channels here, either, since we only care about one. */
 
 	add_preferred_console(ehv_bc_console.name, ehv_bc_console.index, NULL);
-	register_console(&ehv_bc_console);
+	register_console_force(&ehv_bc_console);
 
 	pr_info("ehv-bc: registered console driver for byte channel %u\n",
 		stdout_bc);

-- 
2.52.0

