Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D37A31BC8B
	for <linux-m68k@lists.linux-m68k.org>; Sat, 27 Dec 2025 12:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766837894; cv=none; b=sLP/svLcyCk3gRxopLVn0su2PUMLg4+N5F3n3j28lAhcb3Nu67d1LBTpVPauK8UVZIO9HFqryo1g/aT5nvyi995KP6T6A6uCl7jtk4VbQN37nAiNP2tZVV3oKMikucrd79F2s305puhmRkWPsu++vGENLt28lRAz+DH5+xPZNYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766837894; c=relaxed/simple;
	bh=aTPPRUdelJJPNRSRbq/P3Dh/ezSRl1NcFqsysqipRcI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DyLdRNUTdvqkb3YBHTkCwV7svwSLpb06zefCBpx1nuaj6kyhIZ6Myw0HOG3xSYABIHG9Cj+YbxKQwa/28SYiSFJXjGF3OjQkf+s+bywHBILVhivMLLXvESPoP80xKTUWlXGDSQQnnii6mTW8OHapQujom1BAmLBzlvTcdkZ7Xio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Qyrlj28V; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Qyrlj28V"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47774d3536dso61935515e9.0
        for <linux-m68k@lists.linux-m68k.org>; Sat, 27 Dec 2025 04:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766837891; x=1767442691; darn=lists.linux-m68k.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OB3+8VIsiv4yLcVB9h3kEd58M2RQJv95rPNYEtVMoiQ=;
        b=Qyrlj28VJ9/i0gSJ6XVAz3zlsnytaqUs8Najj6XI8RaOB6ORnKz2nONRtGTKhwYVw/
         zvrychzvY4mWe/1gtiW0GoBwgBtUKXptrjHDvHtRhNB1K+iSplX1US1LWyXxcTN4/poU
         p5RBnt9gYgOBcLHeIX4N1FEt/Nib6SeEYF98yGnEl0YO8FU/cA4xoL5/ZWLUfkmSkeGs
         9ecr/jLrZyUB99wy7W+1Eq0UMhF0e7TD7GGNABzyehhlEZ2FK/JdVRe2tlsjOycWVzI3
         FfubbW/2xVokUGSA4fBtEmpe+CC4Q+ZTc2LqONChTHgBdIYrLCA+MJqx7f+Oq2YIA5FQ
         Jevg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766837891; x=1767442691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OB3+8VIsiv4yLcVB9h3kEd58M2RQJv95rPNYEtVMoiQ=;
        b=fTTrQI/DhkglnuV0vufyGX/UIbormahtlBwO8EtWC0uMuXAVKwQ2H9FpaLvAV1PILj
         g8u3qGKqJ3evLkXbZU2vqsz8xEp1JgnSvJmohvf/lwr3Bjs5SwGtEoA2A876BbyoAnp9
         q3SUTzqv+IdQhKTz6tfvmipsKVEBR6aQP08FuAoRv4zecOYSzSCXkq9aU80hrylFQi8q
         ya14yocgw0v1Ly+X2BGEmr4lfwdUSg529H/VW6yOQiyR9z7yKFnP3V2Qo+SHWd3lyeKv
         Edi29jtK6G6iy8I6icOtdWxBTv3RFqkISW5DFHb5oXsmvkNaCI50zGH3ckWKaad3aF9o
         EJuw==
X-Forwarded-Encrypted: i=1; AJvYcCVcmRbexwRrwZqbKm66DLNtk1492P5B+rDxr4ImLjQ7EX2rLrNWrFLEB6jFID60lnT/yl0KfBT/HVjF@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyKVHjukNoPeu+9h4d1g9pf8xnI4eVYEaACD+vxmnHpB+mVsxpT
	4EeqsGYcdLaLHjyjr3AN1ZHMzREQXduHn3cuVlhfOxc90ojjyVfdD9RKHT5omu+wfe0=
X-Gm-Gg: AY/fxX4w89x4uhs9w3xvchqBF4smTlot6Mzk7KeW4SScV2Ee7jokJGLbBj4D3RV7Foz
	R8PdIKcF3s7RKwpuygj4jFd2CmRQ5FCN5ClVmI+fKoo/Z5LtJ59klgah2XzKFu/kgMREqZcgWOu
	0x3PmXr9zRnvv5n9MQWso0516Ga7K7RgnpxkQHMrLzJ+BXcexGs42g8aR0y+w87NHJJe0cpYPeg
	m9093vuSDAgzrr5nuNi2f+SOAbD7El5K3uNR/5zFvCCUO1tss/AhkTjs4zLTvRz1ImUPio0Ozl3
	fXOTHL6oq3+/Rom6JhlcHVf+FVuaviTYCozKltgp/bXeFvHNyv2o5lkjuVvgahQc77vB4CujDeX
	JIw5ulYz6TECG2Pbo8UoLSDYPEgQWcZBeBkz0tr8irHNb9z8oTE+3bR1bQJP1OHW8fHkFrEUbu0
	QQIN/kg7Li
X-Google-Smtp-Source: AGHT+IFJeR5Bq3e314KIMXwkrZhqd3SM0Gtgef2ZKhyuTvMEsyAQgTg0idlkENoTE/A1RwLAaI6A4g==
X-Received: by 2002:a05:600c:a30f:b0:47d:52ef:c572 with SMTP id 5b1f17b1804b1-47d52efc7bdmr6320155e9.1.1766837890917;
        Sat, 27 Dec 2025 04:18:10 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:18:10 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sat, 27 Dec 2025 09:16:16 -0300
Subject: [PATCH 09/19] m68k: emu: nfcon.c: Migrate to
 register_console_force helper
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251227-printk-cleanup-part3-v1-9-21a291bcf197@suse.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=997;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=aTPPRUdelJJPNRSRbq/P3Dh/ezSRl1NcFqsysqipRcI=;
 b=bFiYD37gtcultSa+DtuWsZDZsqldtTEWNQGlnO3f8qpUTnHo9LyYg6/jnVTrFnBYz5Wno6rCP
 MIg9mT6KNXdApenqW2Pg83sbMRC0cE454dAXf3m0peqNYruoithEiNk
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=

The register_console_force function was introduced to register consoles
even on the presence of default consoles, replacing the CON_ENABLE flag
that was forcing the same behavior.

No functional changes.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 arch/m68k/emu/nfcon.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/emu/nfcon.c b/arch/m68k/emu/nfcon.c
index d41260672e24..3504bbb4aedc 100644
--- a/arch/m68k/emu/nfcon.c
+++ b/arch/m68k/emu/nfcon.c
@@ -110,10 +110,9 @@ static int __init nf_debug_setup(char *arg)
 		/*
 		 * The console will be enabled when debug=nfcon is specified
 		 * as a kernel parameter. Since this is a non-standard way
-		 * of enabling consoles, it must be explicitly enabled.
+		 * of enabling consoles, it must be explicitly forced.
 		 */
-		nf_console.flags |= CON_ENABLED;
-		register_console(&nf_console);
+		register_console_force(&nf_console);
 	}
 
 	return 0;

-- 
2.52.0

