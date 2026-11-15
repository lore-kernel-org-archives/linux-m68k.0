Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733941;
	b=A9Vk1Xl/IGRhuon0o5yaNWjBOUTFIpmWmdxgRRUzDBzpFLmDvMvg85/7QJdtyXRdtusM
	 eYDfEc10WvLicA7il45U3TVQCsDGbUbPU4JhfmBBEY0eVXXW5eyTl7p4CoKY+OSbYJNNT
	 ZAHDxcL7vFFFsWh2js8MgEgN13QV61zEbbM8SofLyvswr1lvD1CE6tSG/5RzWN45hDtSa
	 FT+R9itbzOZHHP//GXqV7QARxd3opuZF84J0iEgXCAsf8tKi/W+WBdSvVmabiua2JcjBX
	 HJWm0DsX1gaja8lF0AYKfwerdzEnvUvZgG6KYsXbdQDFrPDw0IDBKrUpJXDLun0uNtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6WJFie4wHwA9g4ldBNe7rVwQP1AavfCmBkfuHq7pLEg=;
	b=lKCllRGDo6qi6XLSdZ2nsQEKzcEbrVXj6WKodDnW6r1uEI/7OIfDyViJoCAaYEmI1Fgu
	 /zqig3eGIvZ5Ldvat6BFofg047I6p6+msX0HxOfps7qz1GSh80i/JEya0k+dUtIb6nPFr
	 XOmCtlldx+/IsvLJazIsa0XTkCzREBssgp4ajs4XGr63HABtfAB8HdaUHpWFdGDfrVNe0
	 NcZTOvWbPB1GThr904SdT2Vxsof7aaAXfhOF8+NZQohISacKNl5/LSC+C8PBxkpDq3/1b
	 XgDnCCYkoRwmmLN2QhfOmlbp8HuxE7rESditwxBawFViN+NCypDhmaWP/EqTMeLP2FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y+qyhwAP;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947E0606A31F
	for <linux-m68k@lists.linux-m68k.org>; Sun, 15 Nov 2026 09:12:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 947E0606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y+qyhwAP
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso26898635e9.3
        for <linux-m68k@lists.linux-m68k.org>; Sun, 15 Nov 2026 01:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733940; x=1795338740; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6WJFie4wHwA9g4ldBNe7rVwQP1AavfCmBkfuHq7pLEg=;
        b=Y+qyhwAPcXYjObzbnXYrfpx5w2CHLFBHVpo1KBE2gtpDp8SMFWDbzGs/2iLeASPD74
         I2MYmD5BfWTbVcE8zaS4VNJ36etvZF+4Hd07groYVXRl7oFeQdTqHZ7Cr+1wVMezICl+
         L+vqKQ8DHPgwvzD6Hr3TiY9Jf+kwdg+//trXVd8DIfwh3ne4yP1ydOxWUKLWsz1U50mb
         rMW6lspNbn3L777EPU2UjvSXrhNz8yMEbfphbXX5m3JzugA7X4lwfuvqHq/piDs5nZXo
         YdzbJU+Hz8GtT2RlZXluK8RMG2HP1uYCn2iPDI8vcq8p5C7gHbrUfIJF2ng0QrnZhMt/
         eR+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733940; x=1795338740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6WJFie4wHwA9g4ldBNe7rVwQP1AavfCmBkfuHq7pLEg=;
        b=v00KYHNEwuuzzJ8+B4mbj18fCjZIbNOpR4ePMwLkEFeJc5k8B+o/bO2CdVfDnCuv3m
         HkfeAMFb8Wa9FTLy8U/VCOfpCMfEdC0+EqGc4IDmzBNDT7ydEPP3sY4wU6oQCEba6U2v
         hwk/Jt1Zo7suVm8Ri9a9lkDJYbTqcr2Py1uBoi0K7DOu3qVX8BipdkW3Q6e+6AyPwcXF
         k/qwMryEgUb7yFhjZHDIN3Q9+1hC/eWzN3hq2jT5l33d0zXpSQta8Z7zsLSsCdBJn+RS
         GvEJfUHujY2gxvFFAV8F4h0p5m3moUo5CUqj4rPWQtQq5VZFy8qUP50GpGpnvVLVQmpf
         gJAA==
X-Gm-Message-State: APuU4Z+DR/5CvQ8AnCTHLE4sSEIbwD8lt8dJoexnG49OcIAkGOllNc1R
	fhCGyCPQMRROhRE33Mva5CwNsKnZwB7K70GaEiuik1AqU0zt1IyZULw4
X-Gm-Gg: AYBFou0dyKDhoGEzbAmVQ92AG64opdERFm156SAW8pnxxDRIMpch54jiSRw17UHrnUY
	BY/1DerGaHb05AFPPjfHIQFgLmVrBZatZexMS8Sz/9sazJVkzBHbBstVpXx/XYGi+dyyn/323OZ
	b/zXDk4SPv09is/DSriAtfshzAdnf3ciVnOHOT9M8YjkuaXf1OZGBErIAexzD33sApCI9S4aUlF
	Z0H1RKdOnHAtf9hZv0ZMlr/usLZ+LwdBSapk/e1nbqpij5ll+fGsRiQsRoJb9gm0BAqvKMJmhpk
	yTNPCxNfJg+YSGl/q7xc8EHHcGN5mhYbdi8xihezg4aecn1aOZg5UJvx8nGjtcUNWMs5GKG+Q3O
	ffxXeTKHVq4I0+gRox9pdHRMcRGXNTES0za9jtD6i7JaSUl2TMI1Pakf+7YRdtUpoGMiMa81wZZ
	3eyFH14kv9SMGdrEZ3ZOrAZlL0XCf/+lVliCChbjf/CueQ39eYjVxIr+S+FnnDuHS87wDMNgt62
	a+JB0vBEBl7lzCEK/HrWEiaVqRkKxJAmqnK0DFtEc0LPVDgYnyZ9dg/u4Jb2ROYiPp06Wr5Fmk0
	dQPqYzq+weS+XXyP9ZFkLl/d8XAOmc95aRSfaP3beL6d6Cyu5MqmeVEcYtOmgpPw+bi/V0Vs69t
	2MADpjpk=
X-Received: by 2002:a05:600c:3507:b0:4bb:68c4:2044 with SMTP id 5b1f17b1804b1-4bb68c4240fmr50816565e9.11.1794733939838;
        Sun, 15 Nov 2026 01:12:19 -0800 (PST)
Received: from beelink0 (host86-181-68-246.range86-181.btcentralplus.com. [86.181.68.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5ff2be55sm15778446f8f.28.2026.11.15.01.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:12:19 -0800 (PST)
From: Graeme Harker <graeme.harker@gmail.com>
To: geert@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	tsbogend@alpha.franken.de,
	oak@helsinkinet.fi
Subject: Re: [PATCH] m68k: irq: Fix irq numbering in m68k_setup_user_interrupt()
Date: Sun, 15 Nov 2026 09:12:18 +0000
Message-ID: <20261115091218.433517-1-graeme.harker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113143731.167962-1-graeme.harker@gmail.com>
References: <20261113143731.167962-1-graeme.harker@gmail.com>
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

Eero Tamminen recommended the Hatari emulator to me for testing the
Atari caller, so I have now done that.

Hatari from Git (4894d9a), emulating a Falcon and a TT (68030 with MMU,
68882, 14 MB ST-RAM, 64 MB TT-RAM), booted through Hatari's LILO with
its tools/linux/kernel.config and a small BusyBox initramfs. Kernels:
m68k master 8c9ddebb300c (v7.4-rc2) with and without this patch.

On both machines the two kernels boot to init with the same kernel log
and the same /proc/interrupts apart from the counts:

  Falcon: 4, 8, 12, 13, 14, 15, 21
  TT:     8, 12, 13, 14, 15, 39

all on the "atari" chip, ERR 0. That is what the code suggests:
atari_init_IRQ() puts atari_irq_chip on interrupts 1 to 141 straight
after the call, so on Atari the patch only stops user_irq_chip being
left on interrupt 0.

The Sun-3, VME and Apollo callers are still untested.

Thanks to Eero for the pointer.

Graeme
