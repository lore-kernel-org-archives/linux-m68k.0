Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415062;
	b=dorbLB70ykYiXxKOc+qhO2Jcxl7uxLoevXKSqCOnwpPpjkLjJhg7mz5etnQ0WZe5sqAl
	 gQ8FYPablUUkwhoZxYOGY6xjG/JmacpRCRb1q9TOhd8UZPLyM5nfrZN9/yO0zJ+s65zb8
	 nz7s1sPzSxQkwHZ1iwLfKdyCKntoZN0PwJ4X+z4nG7SWjCdooz36kW87CeYol+SgFymDa
	 3/OH2vIKIMVudvo3ag8MW14Evk7Mu2TqLvC/gis4a29xm8/Fu/txN+u+GoS8vVP8Cnjh/
	 9gYwxBuI8jdtwxt5dwkdpxt6EK1abSOs/E/Nk39hM2CUhw5Dcp7Pp4MCfdpfIlAyP3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415062;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=urN55C0hSRid+Cb4EhN5hFHoQJs+a/cKjFFO3dJMiqc=;
	b=sxbvJ3W2ZNtW/xe+0zEdZr6ah5ExQAHrPoL93nK4gnZNhMJotMGsMKgXBw8OWxYF4U3B
	 NPhrd8z7Zr30P6U1o2C/yWei+I8e8nz0EHQs/fOcSugJ+K4lbKYVD+KNf59stQKNh40iJ
	 bo4N36fNdmVMCJW222osWpZ2tgSgMQEubIsRRPktmihZH+ZbyStk4/gG7miKeUxjF5z7A
	 +dz4QNXETzqV7qpLdjffa6tRoj4dszhvGx4qaExvvo5LnATehRUE1gCEnyZiCyNcNBx3s
	 DyHAMN/lQxvYUshkLeE6z9dB5T6nnaZ2lbvfTXEXsA9fhwy6QqHpPxDMiPZBLPqG1jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=belgsruS;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E64606A887
	for <linux-m68k@lists.linux-m68k.org>; Wed, 11 Nov 2026 16:37:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12E64606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=belgsruS
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so26621265e9.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 11 Nov 2026 08:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794415060; x=1795019860; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=urN55C0hSRid+Cb4EhN5hFHoQJs+a/cKjFFO3dJMiqc=;
        b=belgsruSux3cXsdqqjZxNEFWtBi50lK/zbnh2FpWLfkZ1hjlWz2GLgaMD+9TNE5Xbt
         fDv1jFgQq56+oojXn4TIYgk7PHA4Obv7Lfu352MkFdQHrgv6E5eOe11bsccX51qUtnff
         F/065GOTvGBnPpWypGeEeG4oAhL06LCxMzqnMjIg+Br7fgjHdW3VFHaihrKOOR6F+JO5
         prq9oErIDqTHfzwh5EGBYBKzwHFSbgXaZhfNsfx5AL3NCw1H/Orsl3bb/gsaT1GoOmK/
         HxKqPg+x9hJPgT0sivQakoQ7UJ80y9dq6wcrFPxAnQKGSAK/XCWd6gO9cbIl5cQgWxRt
         zEtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415060; x=1795019860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=urN55C0hSRid+Cb4EhN5hFHoQJs+a/cKjFFO3dJMiqc=;
        b=wDbc37IWA9pqQJ4p12bZ/IPcQB7qx2GkKCcvK106ZsPKEIg+hZHas5Eh6GzFKAPnQI
         UknZjmkfRh4n1Zfe0yHurrDICLI1rDwWJYNfAKV5d+gsDScF00cb9BvSjdgYiCw2Gg6h
         u8Nzn28u1Z+XZnDxpN28vgHLFB9HHsMVuq9eJmIOrH6gW0TmFx+A/piA9OMrBzRayBuL
         Qu4prfDn7I1gK8TDrcRL3BPqRQ9C8uIJFIkKLd1LXtMMktD4VbJg7L3NPEeO2z8NLTHw
         MWGnDWRLhFddR3vWSuc8S1D53Vow8JRtHnJLtOtvxKVsrqbSyq9Xer7PydwKb5be6REi
         kMCA==
X-Gm-Message-State: APuU4Z9hux0kPIHDziQtd9poeuSzXT/oTi4AqCoJ6nQnrq/Z0WKq/gU0
	Q2pd1xLxuOgBAfBiEPrUKlEll5PxSiQRKzcQAWKTgw30GcJReUUelx3p
X-Gm-Gg: AYBFou3RzLSMUhXU9iFxy9EZABrGBDD+inD841lR9U2i1d+WFSf2BO5MXfQcG89HkMB
	fm4nAXrPvFw4D2m+lOf2bOcD20YE3919LUDaz/dJ1rLG3Q5CH6UfJGw+T208ubjJDEbZz4Lb7S3
	2wzq/4Yzv0IGDf/JN/GfB/qNAmSqgfXtxfXtal+O1oboO8mJInILMnLh+uAH1V8KjWzz9R4+qbh
	b31ogKmmonRmTtdPDi7H8CQqhRu2q/T11dTGRPEZEH0cbgKFyRXt2NBzVoMOONF/AN5h8qvAb7f
	Mj/GWudEEpnGR19hB5rl2ru0Stfr7DGd7LBXeLH4G3jllYxxrGwwTi11MUNibRKG/MR4ZO5p2CV
	4RxsMVhOjWmSJUnseTS4oRAuNsrWYs1qgWukPWsm5X2X6Voz57QSu93EijWX7xwsAwtnonHHblI
	NhF41DpWV5tC7oVTNJQi+ZoE1WEJp69i3SL9fbCLGA7sBKvBkZgRGLzsAKg7lWAkhsBBEaj9iyQ
	e6H4gkLLQ9gP7gSDANA3tkRGXfo2RqTrjyYoIxwZY4wrVOYxr9e50mI3lmtsNpL448TNizWiAli
	mDxTWgpv0nhL0H3VNCbcHJ6a3Zf9kH9zf9yZKLHO1tfOWaf4RGgD1Ok6QjHT6XLMsJT9jOZO3do
	SJjP9QvJ0tJTe
X-Received: by 2002:a05:600c:3e1a:b0:4a1:ddca:8b66 with SMTP id 5b1f17b1804b1-4ba093b967fmr58000185e9.31.1794415060185;
        Wed, 11 Nov 2026 08:37:40 -0800 (PST)
Received: from gmail.com ([2a01:e11:1403:8620:6e81:13fe:ca06:8db8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e28c882sm91135e9.6.2026.11.11.08.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:37:39 -0800 (PST)
From: Paolo Pisati <p.pisati@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>
Cc: linux-m68k@lists.linux-m68k.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	mfd@lists.linux.dev
Subject: [PATCH v1 3/7] m68k: defconfig: enable WARP_MFD
Date: Wed, 11 Nov 2026 17:37:30 +0100
Message-ID: <20261111163735.227286-4-p.pisati@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111163735.227286-1-p.pisati@gmail.com>
References: <20261111163735.227286-1-p.pisati@gmail.com>
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the CS-Lab Warp multifunction driver in the Amiga and multi
defconfigs, which pata_cswarp now depends on.

Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
---
 arch/m68k/configs/amiga_defconfig | 1 +
 arch/m68k/configs/multi_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/m68k/configs/amiga_defconfig b/arch/m68k/configs/amiga_defconfig
index e2d474e8cb8f..75d91d502545 100644
--- a/arch/m68k/configs/amiga_defconfig
+++ b/arch/m68k/configs/amiga_defconfig
@@ -20,6 +20,7 @@ CONFIG_AMIGA=y
 CONFIG_ZORRO=y
 CONFIG_AMIGA_PCMCIA=y
 CONFIG_ZORRO_NAMES=y
+CONFIG_WARP_MFD=y
 CONFIG_HEARTBEAT=y
 CONFIG_PROC_HARDWARE=y
 CONFIG_AMIGA_BUILTIN_SERIAL=y
diff --git a/arch/m68k/configs/multi_defconfig b/arch/m68k/configs/multi_defconfig
index 1bbd2aa653c0..120dc68d492c 100644
--- a/arch/m68k/configs/multi_defconfig
+++ b/arch/m68k/configs/multi_defconfig
@@ -31,6 +31,7 @@ CONFIG_ZORRO=y
 CONFIG_AMIGA_PCMCIA=y
 CONFIG_ATARI_ROM_ISA=y
 CONFIG_ZORRO_NAMES=y
+CONFIG_WARP_MFD=y
 CONFIG_HEARTBEAT=y
 CONFIG_PROC_HARDWARE=y
 CONFIG_NATFEAT=y
-- 
2.43.0

