Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E319315D50
	for <linux-m68k@lists.linux-m68k.org>; Sat, 27 Dec 2025 12:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766837931; cv=none; b=R0/iobt0R07mV4ZN2V3rQFBSkCpor0ECEmguSHyPXrB0+Aoi79setgexLB+782LuLkI52dwxBNjnDnuVj4/sS3uPMwRrMj/SCjxvgCKRRUZvrW7idfw+gadsaFopWLYpLImBD2YUijc4h3NnxzM34rT/zkovBE20y8++zbBsjvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766837931; c=relaxed/simple;
	bh=9A3Brx5a3gQ0NUhTGZ1ViMT9HfTuP00Tgzee1GwnjVM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G8Mk3B7t7IN0lH22+z0g6B292yCVsBC6edYOOZgY6+XX87RK6eN2rV8KQT4Kj7DYxqRfCiXFhjW8A/yxhGUGTVu7lI0KEzaXJJlirzuA2CwKawm8I7XDFm0K507bkhaKONHs6+fwLvR/wDA7mW1bvPtTeJL3WCt6WZUb/U2+bew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZpFWM/MK; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZpFWM/MK"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so59148925e9.2
        for <linux-m68k@lists.linux-m68k.org>; Sat, 27 Dec 2025 04:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766837928; x=1767442728; darn=lists.linux-m68k.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NC/xlTHSkC5720zy/KPT378kGxggptiwCzT1YNGAqrI=;
        b=ZpFWM/MKcamGG0dkO2aZV99y3Eom/7tu6Ih8ekovWgHCWyDcOmk6bi2m5BXKY0Bn8f
         UDoQrpOXB10sctJzs4QU68APhnvuoZA7H+2DeZw3fzBRaQAYYMKG05iVQbZFCKzB7mJY
         l7ANEFYMRxoY0UGl2pOdwC8OAw/Lp9suBE5iylmvMmG6eelqtY8ISzqAxiMflptNvAcL
         SWLMExkK7Xt6vP6Eh2wjPlqIBacybeVoDw/ozO5CUDTZKWO3KeGG2ggjnNR0w7CAhmcZ
         iIti2tCKeLdaVk9SLuD90kxmUt3gLDevyqKR0pz1NIcXp9ssMFiv2USLc2khQ1ShogRG
         EipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766837928; x=1767442728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NC/xlTHSkC5720zy/KPT378kGxggptiwCzT1YNGAqrI=;
        b=Qpf8Fc8UxbKbB9pKYdxBkfg5D6bQFJjcss7NO7I9Z5QncGW2+CteoC9WYHU6G5/XwD
         WI9IxZK16RtCJdhwFpt5zAnGFC/vOdeP9Vz6VCKhZLU0f+yi91BbLysNV1Bkm7E3GudI
         3r63+tpKVeRLovYXlN+n5w/+G/qyRrb2rsuEowbhcPawWm9mZMiv4KH4uISEDs8b1kh1
         Mqq5yR6JmkNri9C0D3otrC+hJkVPc72Ob1IZXo95UdFaI+2ZBcLa8kFR/uGSPD2c4Xaz
         XkgWkdAmL6a6MZej3L5EYjaVfOb6bCMv2nqTWCzce3tQaCA9A3IcdN1xXN4leX0LEQyd
         /U8w==
X-Forwarded-Encrypted: i=1; AJvYcCWMSbYs9vFrewv1ofm4Ca9NlBz87Ge1cSuGySybShr/bMHy4v5rpDOUaEb2ItPPV/C7dqSy+7pu9+dI@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yw3or3MVo1RCVhkjdDCTA65YL8V7bZzIQUOeClBuOReQaKCc8LU
	xqYjhblAXIK1TmiD0OogcL1VvY3gwsrMIhHc0VmW+PDwHyR/G59BvO/N8fBXdEEbhTA=
X-Gm-Gg: AY/fxX5hEoQnmV1mLGmsKuYWr5A987i+PSdvdc0NbYoRY16nPCGHdIzeH+GuJ1Xw51W
	hvFs02xAji0AO2lWlid3sNPh4iPg8X+l4TNkj7fZBkWablDso2TCZQvek9hiiLqsvWJvZvWBwek
	sJDZvUwSaPG82PY07xBwPHe3ghP/uZCqudXALr/td281AkvVkCsiolL+EpGIJ8KEZRJPaXpvKHt
	YLt3AURmTIx27nPZbZaVw790R9QBjEgyovhjk5s+CLKSM+BsmcneXa45nmezjl//Ozw7hptuMZl
	9oajznX3XdTezIAGq4EczIgEFvf5D55eipS05s9LCxYwicY5nMWPrOrRNYgV+L61pf3bUDRTe0g
	DmKMwX4AcRTutwbanTXaZwROEI/X0a/NblJUPecGRZOZA6qt869R/LjxuIESgFLLF5F1Cj2n7R5
	W+5B0VAJxz
X-Google-Smtp-Source: AGHT+IFbCGvkCxGExFQLBl5yaU008gmiVvRdmeb7k0sjyaCh7Z1nYJocCXv7ZLYKC/Juko66305eyA==
X-Received: by 2002:a05:600c:8183:b0:477:fad:acd9 with SMTP id 5b1f17b1804b1-47d195a9834mr270395745e9.34.1766837927833;
        Sat, 27 Dec 2025 04:18:47 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:18:47 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sat, 27 Dec 2025 09:16:20 -0300
Subject: [PATCH 13/19] um: drivers: mconsole_kern.c: Migrate to
 register_console_force helper
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251227-printk-cleanup-part3-v1-13-21a291bcf197@suse.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=961;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=9A3Brx5a3gQ0NUhTGZ1ViMT9HfTuP00Tgzee1GwnjVM=;
 b=gNLF1CEZIFvupLFUy4kgNSgx2QLue8Fjf3sjVi+zSBhpSIWUfb0laNahgF6qahlq6x3pophwD
 dRykPPu3R/nALZM8P2pCpkq//4oDFgsmNLGc4Tixc+Z0JIXH+9rAGGe
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=

The register_console_force function was introduced to register consoles
even on the presence of default consoles, replacing the CON_ENABLE flag
that was forcing the same behavior.

No functional changes.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 arch/um/drivers/mconsole_kern.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/um/drivers/mconsole_kern.c b/arch/um/drivers/mconsole_kern.c
index ff4bda95b9c7..ce4f4ceb7f27 100644
--- a/arch/um/drivers/mconsole_kern.c
+++ b/arch/um/drivers/mconsole_kern.c
@@ -582,12 +582,11 @@ static void console_write(struct console *console, const char *string,
 
 static struct console mc_console = { .name	= "mc",
 				     .write	= console_write,
-				     .flags	= CON_ENABLED,
 				     .index	= -1 };
 
 static int mc_add_console(void)
 {
-	register_console(&mc_console);
+	register_console_force(&mc_console);
 	return 0;
 }
 

-- 
2.52.0

