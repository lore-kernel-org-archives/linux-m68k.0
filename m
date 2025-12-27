Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E40315764
	for <linux-m68k@lists.linux-m68k.org>; Sat, 27 Dec 2025 12:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766837862; cv=none; b=XzrlReHrXT1x+wdmvFGfYztG1ijq5nSB9lPrElKk7LVpzSDfS1RN4iUyyK/9EUBNKHAd9iQ7/Nln/U1QbJ2ibPU5MO+C3GGGOjI8p8tcMnYJCaBinYOiNAykEMcKSXgdhEP0YGnqFOl5UYDV6+r1p2TbUsmyU7ypKOTZ58X91vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766837862; c=relaxed/simple;
	bh=ZR0iR9pvZGcVZSHwNZDrCThadrViJMyV5/bfGtiN4gw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xr7H51iqkX6jQ7arSY7tIjou8h1VB6cRDvcU0nQrYDY7aj/L1jHfIB7UfDgFua7LRZ4AWqLwSgPank0C1qr1Zhs/44fgihFJOA9YHH7pPW8gQR3O6iinb29Q0KDxlBPTuEUS/xegc8Lh5jWHBB5SH/sH1KWjsiHI7wEAMBF44g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UsgJiZXF; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UsgJiZXF"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso75769295e9.3
        for <linux-m68k@lists.linux-m68k.org>; Sat, 27 Dec 2025 04:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766837858; x=1767442658; darn=lists.linux-m68k.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GvSE1c/4a8QCKCTV5gdf1mCLxf9YZVQyxdWd8z10SmE=;
        b=UsgJiZXFx6V6+077J3LxGFOAja4Lgu9CwDh9I0XyxOy7fI86vS7wsgBwtmJjqH2e1u
         Kds8QWA8vsposAw4qTmw42ZI4isB66OA9itVtw8CDFwWEy5Y+pKj0h+oCPw3eLwVPiBe
         W2Ovxas5Vp2WPWFjAteenyaj6NQbHEJ5xjhX8bo1wjSfyYiRypYAqSR7MJ9a6ucnktG0
         AWgcvrMT1CtA/2B3ZOTPk5S5SjEZBIfpsVDfPy1sJCNz2YodocmKEztsHMZPdX58Y6pk
         57+l/z1awOtai2T9CTgKYsFJunxYWYSTkIDQf4h6XCfgvzTdiSGY8GaatNwkUrEIYQeA
         w3KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766837858; x=1767442658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GvSE1c/4a8QCKCTV5gdf1mCLxf9YZVQyxdWd8z10SmE=;
        b=FdVlmZtDoc2zBE/e5fBrHDVpUGooyxse3S5V04Ffrg2xbSt2I+cP83E/mGjHQTRYSS
         maeKfGaL6Yc+EMnXUKXps36lRfwljCxWwil3fmTQi65qNWUY9fgmAkX38RSEPTNszdL+
         Nog8sgINvU0AcftXiUaF8Pt9tQl2ppOGl6+IE7vlyuwgukIzbf+Er8mesfbGy1kfJa/M
         mqCn28meR+Fqp6Q0FDAxdJWvAgNA5/wZ7qalhvJOmhI+/3T3IZebgGEF89zfHRVwwzI3
         s+2YrRCsDJAWE136GtXSjTwEP2TBEmZWSwkwMKCd6dUYOyXvxdxE55kRhRqYxRjQivJN
         0D1w==
X-Forwarded-Encrypted: i=1; AJvYcCXiqG7iHB3x/tNw40UN8h5gBbR8L33oL0CLXr+lKRAKUdp/LffxwmBpAYyy0AHfJgPaHuO1N+dyd0Xm@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzAvsdW0YZXBjZPvDCBEk+ahwNMUlH85QdhkXFMlDjmwva8ElS0
	IThaFyU6i0G+mp/Fxja2Yi2GGx1HAoBc9kNuG28iBjYCCiLsyeV/7/BST1l1RaEe0EA=
X-Gm-Gg: AY/fxX6/OGODYydDCClT0nBarGvoM6hAgO7XvDiJvKl73AaxP46pkniWrUUbdHWPguN
	IN25OKbmnGTisqsexsgbyig2IouksD3jg+DRcFe5j9K2Im0iFoN1tPlxHhQAN+BTT+ARR6C6Fo/
	5xEpvViXO5j7hp0G10NXSGOZc2MnnZjK/VilYC5Jl4X+RN80xqEQKUJv2Hn743+vjjwIr8pA2or
	u6cxKb3sTF/9IflTWzgy+U3HRLeNpZ6UV0aKNFKNOmzA6kql1an5FTFDJuGMCTp7NU2o6r9rC85
	AkHShJ4qptIIPgZjJXeieRqlS5Io7z69lItWCqQMzRlqtOsDNZR08AktutoGqr/yhn2xrrMPP31
	4g3r5ZdOM5fsf6usTQIQWSVxXmO7ysQnwisXV3rYl5c3Hz9Lf0GTVoY8i+Q8tWI5Vh6GcLlO79H
	U3AlgeBcc1abjWFtsUvbE=
X-Google-Smtp-Source: AGHT+IFc0PxKRmRSwma+5BK2z0BfbuhbWCK5ZAQiNCh/fQVQ/f+EcwX2yper4KDcLK2LLWDZAwXkgQ==
X-Received: by 2002:a05:600c:620c:b0:475:dde5:d91b with SMTP id 5b1f17b1804b1-47d3639489cmr187665015e9.17.1766837853435;
        Sat, 27 Dec 2025 04:17:33 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:17:32 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sat, 27 Dec 2025 09:16:12 -0300
Subject: [PATCH 05/19] printk: Add more context to suspend/resume functions
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251227-printk-cleanup-part3-v1-5-21a291bcf197@suse.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=1815;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=ZR0iR9pvZGcVZSHwNZDrCThadrViJMyV5/bfGtiN4gw=;
 b=tA7/rFTFgz8i0hdAJ53eXVaQiZ32fF9Si88T8AKGgxMwsJDyXHg4gS+HXEQzjoX95zhxiaqSG
 v/P+ZTpJjf2DQdqlDkpPXA8mgBEajKQf1Xila0zWamPBwICGf70zjAA
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=

The new comments clarifies from where the functions are supposed to be
called.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 kernel/printk/printk.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 173c14e08afe..85a8b6521d9e 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2734,7 +2734,8 @@ MODULE_PARM_DESC(console_no_auto_verbose, "Disable console loglevel raise to hig
 /**
  * console_suspend_all - suspend the console subsystem
  *
- * This disables printk() while we go into suspend states
+ * This disables printk() while we go into suspend states. Called by the power
+ * management subsystem.
  */
 void console_suspend_all(void)
 {
@@ -2766,6 +2767,12 @@ void console_suspend_all(void)
 	synchronize_srcu(&console_srcu);
 }
 
+/**
+ * console_resume_all - resume the console subsystem
+ *
+ * This resumes printk() when the system is being restored. Called by the power
+ * management subsystem.
+ */
 void console_resume_all(void)
 {
 	struct console_flush_type ft;
@@ -3553,7 +3560,7 @@ struct tty_driver *console_device(int *index)
 /*
  * Prevent further output on the passed console device so that (for example)
  * serial drivers can suspend console output before suspending a port, and can
- * re-enable output afterwards.
+ * re-enable output afterwards. Called by console drivers.
  */
 void console_suspend(struct console *console)
 {
@@ -3572,6 +3579,7 @@ void console_suspend(struct console *console)
 }
 EXPORT_SYMBOL(console_suspend);
 
+/* Resumes printing on the passed console device. Called by console drivers. */
 void console_resume(struct console *console)
 {
 	struct console_flush_type ft;

-- 
2.52.0

