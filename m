Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E26369206
	for <linux-m68k@lists.linux-m68k.org>; Thu, 10 Sep 2026 01:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789003995; cv=none; b=T7PZjFc5wp21N4hC7WGgAVzGk11LpbHHjV0oGABjC9zMwsxRffwVYQ6TcZ+pHOk7Jrj46DNjd1buVY4WUy3cOvBxWUq/LTBg83erXvZKmtlGuj1tmHzZq1XJh0eRcplW4AW6znAg9MUKw+DUKft4E8/ODJP7aaa5Z+kTY8MAtlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789003995; c=relaxed/simple;
	bh=ZYFLiiSEbPgU0+ZjsS1KNzdvmrfyUGct38CSb+7KC10=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dcWClUBpnYnDyJq6rJ03dzLtE4icpZAePXsQ6Iv+c7Egxno0h24GB97PKABVQotXJLn1jaUDdD2f6ZzRFLkN50OIqMb0lceIhILYDTosyDDjVU6YfLmI+c48hzjCgArnPtbW223f9oJwb5fnUdfYfDhQ2KgHjBZ/vtKILw4Kszc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S50X2D2e; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S50X2D2e"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so81384895e9.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 09 Sep 2026 18:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789003988; x=1789608788; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7gFP28iKq1M/HJk3t4X9byGhtWcmOOGCTOZxmuDlWN0=;
        b=S50X2D2eHmfj/p6LpSatFSXkBC9kWppVZydLA/JVByTejZgcfU5Bi9pXXNBnje8a/h
         w0KnYw1z4iXk0diUemJyw5Swx3f8vV9NvGslxvM3ZS1sHetBilUgCY3BkDQ4AgjE4kbB
         kBeZMekNRjlHHwv/vTveoY17r/wMwQ4tLAnkaAAcYcZdreFt8haZ6J1fZ0dhCfJ0kQWQ
         Vm6MGjZ+yEAta/9m15gaiEcRuJiUvMF9pEjeKWfVCOEyfAoWrc293oiTLHKnX70VhULk
         4Di/kIIrbm4LV16hE9fpe7wOadmPxBU2+C/2hT8D35iVVXkL2b4Xt1yfIKSaYkst5ndA
         vfnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789003988; x=1789608788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7gFP28iKq1M/HJk3t4X9byGhtWcmOOGCTOZxmuDlWN0=;
        b=T1il9NyzqnBA/dF7GwaxqkRFNETLo3ge3Ke4nkJSpFMH4yfYKA4hEOoQWxXtmFLeRm
         oN6x8lpgbGosUvjUSCIvPqSKd1oVc58UYbXAbJyuCyL2iAVzSelE4wv44l7z6/PUuji+
         AwlDMe4KJtpu6R0AlcUPNfQqKPhOOALsKm/tLXs8Vi7c5PdaRDnYJJihTxYCSr208+IH
         CrUthnyOnliEe0D88400zZEEGQ1oeGpkZli6YECrNqyrXvbixyNlawQoRSkGXwF3rfNp
         CciluLHNkIIFpbMbE6dyeDxm9HanyYfpz6fb2sCBMDK5Bet9YLxiSs5sV6dRyVhmNAxj
         V8uw==
X-Forwarded-Encrypted: i=1; AKwUvByX60uiWShtccOI/L/nDKLymCy6v96hSBCgsN1DpzE1gnD7NuRZzrasEJM7q7LSqSwthXhDhl/UAMU5@lists.linux-m68k.org
X-Gm-Message-State: AFuF++nnW4QIQ9j+rcr9YWP4oqry4VYE/1MkdJOYjP8i145A8j7FEvxi
	OtzdOwZLFojCT5i8fA3o+/UrnlncnutfnPC4VJHj+AIk7NOkIfFLYYcN
X-Gm-Gg: AYBFou0PP8SfFtPHDAFcXINv0HkXq0HBy8Rn+nSEedsxNSoFV9zx+8RfPRuS7Z9D7LM
	t5SqSER/nJOwVFYiWJBbZ391ev/uPROxQgRcYxoCezHzxf1oP4pD9WVEO257ie1IWPJIdNFtk+A
	rJvA7m1052ESkgQKFxywRVDNvPH6sqV0/TOvUugc8uCKVTrcBFp3+oQaKZ/5MqIJR4YAlw6Ac0H
	862kpfrUtWUVtKgResNHX+sr34k/wY1W/DsUXgLbh2bAPKOQMg74jyMzOMT0E/ZbH14EU/E4ZHV
	bgGJ0mT5K9PVvgkN7GLhHwsTNmg89hbGDxYWmq0yqM8SrFPzasmhnWzY6NdtjQKMiRs/X3ADIgR
	/wdIisqpxHERyn9PNlB0+qoh0+yQW94lgf5qCi+9R4ecJinadgWMf2ZqXNvURbiPJ83/wVp3ru1
	VUMmXT5lvaQ5PTlK+eof0Qc1UGABR33E+dcAGSWoJQn6TMNasmhdWPwH/0FSOrJRKkRE+pvbBFx
	xLae67CVB3+WXYA9EYYgUAf5IrQtFtcFjIScNC75LNut2DsCZU8Qb8QfZyDmAHgy72esd69KvF6
	2JTmYGnEl9IVtbk+eJBv1KZzMNKuBZ9ZmWDQO+zkGU0Z4+Na3rn9IJi4YaakKzyAj3VZbPcw69t
	86ASLhrjHqYyC
X-Received: by 2002:a05:600c:6305:b0:49d:2803:22fe with SMTP id 5b1f17b1804b1-49d28032d49mr11185475e9.32.1789003988252;
        Wed, 09 Sep 2026 18:33:08 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b090-6201-5565-e933-e630-1831.310.pool.telefonica.de. [2a02:3100:b090:6201:5565:e933:e630:1831])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26d4e3f3sm35852735e9.15.2026.09.09.18.33.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 18:33:07 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Steve Wahl <steve.wahl@hpe.com>,
	Dimitri Sivanich <dimitri.sivanich@hpe.com>,
	Mike Travis <mike.travis@hpe.com>,
	Tony Luck <tony.luck@intel.com>,
	linux-edac@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Tony Lindgren <tony@atomide.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-omap@vger.kernel.org,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Michael Schmitz <schmitzmic@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v3 8/8] docs: kernel-parameters: Drop the pcmv= entry
Date: Thu, 10 Sep 2026 03:32:45 +0200
Message-Id: <20260910013245.8619-9-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260910013245.8619-1-kmehltretter@gmail.com>
References: <20260910013245.8619-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pcmv= went away with commit 7aeffbf2ddec ("pcmcia: remove unused
pxa/sa1100 drivers"); nothing parses it any more.

Drop the entry.

Fixes: 7aeffbf2ddec ("pcmcia: remove unused pxa/sa1100 drivers")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
---
 Documentation/admin-guide/kernel-parameters.txt | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 48dd273eaf6c..4864e37005be 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5311,8 +5311,6 @@ Kernel parameters
 		nomsi	Do not use MSI for native PCIe PME signaling (this makes
 			all PCIe root ports use INTx for all services).
 
-	pcmv=		[HW,PCMCIA] BadgePAD 4
-
 	pd_ignore_unused
 			[PM]
 			Keep all power-domains already enabled by bootloader on,
-- 
2.53.0
