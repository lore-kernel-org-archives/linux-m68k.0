Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F89B2E736F
	for <linux-m68k@lists.linux-m68k.org>; Sat,  5 Sep 2026 09:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788601633; cv=none; b=iA2ulLtZw7q02zhaX+aYErfqjFG0UYnB8SRvx6108AZOnbiY696dbooBSV5FFrFM2ywVEwYodztj37YPqn1E1lYUpUkpRuxnh+mgHVAK85Zv67P6b/3bWcej4XflAareY8HW6xxUy3zrLc0RyLCH5hxC8iW0WMzaIv9KuadPPbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788601633; c=relaxed/simple;
	bh=zqIZgn7Zgj5WSQepFgJtQ9GMMyKpvR8InLxOiqTa/8o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CWl1W3rtZpZQ/8FwFC5z4+J9cLQ90Pevk1fJFvziBzNnrRXP90dQjLPiMHd6TXHvqMeY3CEhGdAMHjoWU2JQrKI03CwHCr39wkqIqdyesa+fJCWWGplRxJwUvul9yKaFbmXXXqtzo9LKiKLga8opoylbQQfFPWv6Id1z0AAGm1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GT4G0IwR; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GT4G0IwR"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-484374f54d0so1107423f8f.3
        for <linux-m68k@lists.linux-m68k.org>; Sat, 05 Sep 2026 02:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601626; x=1789206426; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RNFfTw1WuaSNgs5HCMSq2uznGZvnZVsIDtneqTMILXg=;
        b=GT4G0IwRzmD/u6h1E4nDdhLwqZ/fYbRSMOBfiDHCUnIEtI64JyXtUfMPe/PkCcyXlG
         sEP0UGB/eJDvNBmPS+pzuQUI9Xp2gmfJMlXa12AAJibbHbTy4OXW1x2KSRstVBFgJ7js
         a94FUoWXwSFek4uWquHkwr8jYym0WzbTU17nYJcNGbefg+0frkyLxZJPHwKEe3F/5+ME
         MM0bDbZ1DJx+T+NmDEslkbR2/VTZYU1XFOQoUAqSgFcwn7VPyMjxT+3TM86AMAQ+s8Os
         39T2m8Epr/UKGSmldUxm/PmxEWH/E02mpHgLI3FTHGtxxtXGmIHS9iAb7cU1QUG6MOM5
         iP8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601626; x=1789206426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RNFfTw1WuaSNgs5HCMSq2uznGZvnZVsIDtneqTMILXg=;
        b=hJX53M/QG5DlaCFk2vpqJsLdeEvFo4wiAQn6gQzLY6kCnR85nFIP0sfcqPVTQD3TnD
         HCMg7+hC3I2pVrkR51zghZ/w4zYzSP/6p2FwiUp6FWXRXMead78qQHrk4ZHIChQ1Vf4O
         QN/oUWYADBoT9M/GFOfgusbyvS5DR2LnO/rGSQL0ROapToTtkuQdvvHT3Z57zEW7LPNT
         vGYen8e3U5An+hDvE7icCJsNYiSTpFXMro+lYTv07f2jzKDcYoEjiu+4sDoeIrHM/0Vn
         CqTqgCtBA/HQ8c1Vub1rOyLnSTmfCMvtQigSNjGC1t86fdwfhJ89lGZy5PavU4ASae7J
         z4dg==
X-Forwarded-Encrypted: i=1; AKwUvBzecxB7zmKauw7OFw/iu8jwl3eWnFU5gF3etf8uItZ9vIAcvHK9cWS2YqIWpew8joUpk1NcbvU13dkf@lists.linux-m68k.org
X-Gm-Message-State: AFuF++nL4BptOF7nug4vgm5sk1nke3IL7aoVucF2iYi021JwqMROzLkK
	behFXCZx/KSxrRIKtKBJYnZW7hXjKLXRiLvAU5cD0hjK7BAVTgdYmlwb
X-Gm-Gg: AYBFou1NztM3KREJpgzE+hPsGx6Akf9Q4gHVM6pBsSiWEyZ5fCf1CzrNwJ1otX/aBNQ
	mTuErAHAmKJ8Qc1doIve7+MA4X7j03oAoTU1yEBRBdqq1WpE+QT5huIoA3Cm90t+mGXlmkupyU1
	dJX3yH0XtCpeLO3pkukKUGBeSCSnRJqYb1Y3xAvzATcaYcbvBfLaPzlak1nB1N+1aD1eueiitTp
	MBrmE2eTu28i5onjIPBFFCmzdDXbtBuLK+jNp3iabAlkIFpcXtqFexiAI64m6oLKPTiRqYUcIoF
	xyvlv7COC83NhFsdnQ77bWQ2KkJAOsIF5qjNPmc9+6cQW6kBcUiKDiOSM/yGRjFEtxv0Dsk1nCp
	OmGU60tr7ojICGgq+gjii5uyi2bRYKIdtEqOQvpB4it0RNzfEmsXINwA6UHhTtL6LVDtaGni0/G
	Dv+QYppSxc0UzQJrn3rdkmngszWeMbAuL0qCXfrTtfl5EtmxmdVw/b0wQZAZfG0xGHTZ8R8Pz3d
	dpNKR1oNkw49BWTsFurvicISvFaUi9bNSUWBtkT+Q4469G9aR2G5b2e9fI1F2BT1nKpe86HBJ+Z
	Fljt1p7xvCkDuzoFT8g0muhm/MLzx2cmN9zE/QhoFfGicCIIe2Je80nc1TsWVDLRySc=
X-Received: by 2002:a05:6000:178e:b0:484:3200:b7a1 with SMTP id ffacd0b85a97d-4858708c88amr21220202f8f.13.1788601625675;
        Sat, 05 Sep 2026 02:47:05 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm14232013f8f.25.2026.09.05.02.47.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 02:47:05 -0700 (PDT)
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
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	linux-ide@vger.kernel.org,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Michael Schmitz <schmitzmic@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v2 3/9] docs: kernel-parameters: Drop the edac_report= entry
Date: Sat,  5 Sep 2026 11:46:43 +0200
Message-Id: <20260905094649.41996-4-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260905094649.41996-1-kmehltretter@gmail.com>
References: <20260905094649.41996-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

edac_report= went away with commit fee27d7d9788 ("EDAC: Delete
edac_stub.c"); nothing parses it any more.

Drop the entry.

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Fixes: fee27d7d9788 ("EDAC: Delete edac_stub.c")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 99d5bb68968a..2a8d862ef30f 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1578,14 +1578,6 @@ Kernel parameters
 			PCI device even when its classcode is not of the
 			UART class.
 
-	edac_report=	[HW,EDAC] Control how to report EDAC event
-			Format: {"on" | "off" | "force"}
-			on: enable EDAC to report H/W event. May be overridden
-			by other higher priority error reporting module.
-			off: disable H/W event reporting through EDAC.
-			force: enforce the use of EDAC to report H/W event.
-			default: on.
-
 	edd=		[EDD]
 			Format: {"off" | "on" | "skip[mbr]"}
 
-- 
2.53.0

