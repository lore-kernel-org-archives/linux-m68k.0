Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793895496;
	b=5NJx4ZsfDzlIHpX3MF4jLpIzIOjbPjBsnSqDXzKtNz6JIcgO7AhVrrtn9hpWf9ke01FS
	 yUrxP1sPpPsgpMBhfBc5hu+enTQQ/ZrpB2VeXqIEWeOEKlLDvd3snpI7bO6TTqDOCTaUx
	 tY4itUARMh5fci16WrY5aJcRO4d6VMi4m8q1l2JydEqlTosF40C9DF5yh5Xo/ZrV2rMxL
	 AeGBzg8iFtHQPcDFXi2yII6cyNkTt7Rz3dS8BqL4AhVwaPZS8GgovKKUXBvwr009IaYfJ
	 e6/n1zyyJIK3Jf1W8nOv035xQDD82ld74+gZWy5h49N3bF2xrYSnGqLWaTGbCnQ2cDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793895496;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ikLnWdGJaSoPH/U14jM7TYXHq4I/0yZY+vfKoep/y3s=;
	b=BfAIL0GBAlIIzhDVIAk34oA/n8aKgFFKAYrwLR0ZMbaR39bFiXuLiNEbuUAKzSV1CQa1
	 OS6qxt7sQADioqENgRZLfPSYEE7rA8wSjHctrUtc8XoUMyohMIRCxtHP8lsXoKG1ZKHGD
	 dHuXZL1r8DRHnoeBpJMBFD9UpRejTNNRxPhOh52Ei+kK9sVpni2Y5GCpVfyFd7jb99mhC
	 z0ZAhRT44b/LFjiQ1LMWwpuMPhginsw64QbxRtOpejvMBmlEXgQerswAZi1/Ytg9xt6eg
	 pp9rHzjykaYv+Czw4nGa116ntJ/mP/+JwFLyXFSee7jMlCm21rGUl2UFpSpEp/39emw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DI2wJQer;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF32606A339
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Nov 2026 16:18:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EF32606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DI2wJQer
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cdb684859cbso189914a12.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 05 Nov 2026 08:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793895495; x=1794500295; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ikLnWdGJaSoPH/U14jM7TYXHq4I/0yZY+vfKoep/y3s=;
        b=DI2wJQer0TZGTiZacX0o/H8PtsXcAO4rFdMrWCDFsD1Q0OObcFXwcOCftDD3Uo0yl4
         /pD4DLRJPa6+iUSDQSTjHuAD9+N08xGtbFehinAQ+vkBsNJdYA+qiwll0dQs202HUokn
         cW/ETOti3T8S7mFZkili5KO8krWOpHpy3IyA4n2dizBUw+rBbhjISaocqpX8oc+iwrhJ
         5cB/aZwCbftKWRzaryQj+piUIz8tZ1/ct468wVS/N5DfeOpq/dL3T47OXG/pm2gafyUf
         cdAe358ZFzsjSGRYSBaRDnAXCOStsX2f9UdBUeV0U0ZO0C8anKUBmItaNgpu4adtdgpu
         7WAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793895495; x=1794500295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ikLnWdGJaSoPH/U14jM7TYXHq4I/0yZY+vfKoep/y3s=;
        b=o2aZoM7Gy90wqlCiLMMoHBRU74SIFTDtGxeMBYfFfDswTW7FdzKKVs0eXFtAyKR99e
         /XZv6Bh0bH57tmRbmgvRxayYaVQAwNsfpj9NBl4Y3g0PyW+HA4YV/6IvhtNX0PvSZGPI
         8f5PI5G9a4PEBeiTwUzUhKA64RUaUNSIGeYa9FW8NCPrrmPVl+RRfwtHrIl69htQ66bF
         ot3fcqGJymLc4pvL+q+chCKZz+89cIKsf6htkxxNNdpl2rbc05wfSd9LcRLXLa6+dVZ0
         9rH2NoSN2T1jAPk1i0soJzeX+1JqvHVlRHszmb8dBcEYC31JkjuMGuyelv+cfQZi7aFS
         djrw==
X-Forwarded-Encrypted: i=1; AKwUvBxmKmbZf8tm12VW5lD60DQziPJpkFpLjCAzQAEX8SpZuwnjhjcUoogq969o8Sq2aQYhq4Y9yQs9Q0uD@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z9MtiTHJkN+Q7Q8V4gMKJTCMgYEfbWLIPnPv7zhFOcRjdofwTrh
	1SzqNiL87S6SaHhnm31l3eVHaV400Qa/cDKYIXRdzyn++spKjnN5krbI
X-Gm-Gg: AYBFou0Ru35bj6GqttWI2qsXPLCzxWiywNixd/W627TaoOf815RRRFmKy3SdfqkxdXW
	AWFnHsJATO8sGq2vWSomt7/ZQQbJwiN3i9Gt+3ANPRA8tbtf8IJRtEvLW0aFcfQ+aavnNIf1W6c
	HCPBu534FMnvKHWXMAWAkxzUGloZ1ytjdTJmi+kJC9ScyExNoZb1qxR0KAmD0M5233AvBcFDkQ9
	sbSEY8xlaBwvxy07qux/f+o73wioXedbg10uGwoZtMuOdumv2s54fQyx6Yu+KC1OEFbLjhSwlA7
	+OyLY+cY2S+hfev/vPnlXZyS6sMfFzIPxYLIUOiFsF9d5vjFsX8nXKLnUVyz3pWCvo3CqMisOyz
	RJJtnQbXRi2LitzpDDKAqTZlkxAYytHDqWgPajbGbGwPYo/DL8Sj/qDjsUKGT50so05V4o4ny5B
	wbb1iA7CaRmtPzfX8zBCQ8ap0V5VzbuauVW+OxR6t23lYj1sXM+L+x/0JGi9oHFPYXKjEJ5ULP1
	IQ9dUZiM05OqXwOpnBI+q4MvLnPQpsBV5ji41/KwvD0losniUW1bGa4tDFwJiZs+QloyVR/sVuQ
	m2J0gEho5rSCqShD/fGcOqihztDgM4SEYl1d4scx8X5ztVqNzPeollOIjjLHkz3qc4Cu9LVbXBB
	+uvGYXtEYLbCWjJGxFWmqvezX45osgiyQiVhgCIZ1IICs
X-Received: by 2002:a17:90b:1d45:b0:3ac:a521:95c with SMTP id 98e67ed59e1d1-3ae897eb4c7mr16890646a91.58.1793895495413;
        Thu, 05 Nov 2026 08:18:15 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3287a60sm4981556a91.13.2026.11.05.08.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:18:14 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: daniel.lezcano@kernel.org,
	tglx@kernel.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	geert@linux-m68k.org,
	laurent@vivier.eu,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 8/8] MAINTAINERS: Add entry for goldfish timer driver
Date: Thu,  5 Nov 2026 16:17:02 +0000
Message-ID: <20261105161702.3515900-9-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
In-Reply-To: <20261105161702.3515900-1-visitorckw@gmail.com>
References: <20261105161702.3515900-1-visitorckw@gmail.com>
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

There is currently no MAINTAINERS entry for the goldfish timer driver.
Add one and list myself as maintainer, as I already maintain the same
driver in U-Boot [1].

Link: https://source.denx.de/u-boot/u-boot/-/commit/909f717eaf29 [1]
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..13688df0e060 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2078,6 +2078,12 @@ M:	Jiaxun Yang <jiaxun.yang@flygoat.com>
 S:	Supported
 F:	drivers/rtc/rtc-goldfish.c
 
+ANDROID GOLDFISH TIMER DRIVER
+M:	Kuan-Wei Chiu <visitorckw@gmail.com>
+S:	Maintained
+F:	drivers/clocksource/timer-goldfish.c
+F:	include/clocksource/timer-goldfish.h
+
 ANLOGIC DR1V90 CRU DRIVER
 M:	Junhui Liu <junhui.liu@pigmoral.tech>
 S:	Maintained
-- 
2.56.0.398.g882cbad275-goog

