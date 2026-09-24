Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743E33AD50F
	for <linux-m68k@lists.linux-m68k.org>; Thu, 24 Sep 2026 11:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790248753; cv=none; b=fpN+xO0ZU1N/TRUygKm1JNjZWDBXJZJGPVPLaXXrzS6IEZlLPdYB7WyC+yk76gYsVnKNcJPuErrYKYhNF40/uxMk7CGTtZdbtRwy3hWqXNTyZ3pv6vGGBlCchtenlfjKDn6ct2LeddwC+3zAJv8YkFX7LLpMNbUoT0Bc0/sXFE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790248753; c=relaxed/simple;
	bh=CLS9B+9lh4IbJB3wLue7CooZ1P+HJ0GtbcrV+OO8OSs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f889sWpr+Ptc7LaVTQf3A4p6zrmD1AoZd0JGsNBWajnQT8vLw2fha/pWevrErB40DHFBTTL2/z6ZTg/4o5HazeZ6QX3K1413kyAcSR+1FZMR4Xvq9Q1UOIbVBBXs6mRHNz2Lguytlj+Y9FF0aSvI5yDdXK7wJzoKsNEPqw9LUQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=Fc/xuIyj; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="Fc/xuIyj"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd4b43b20bso9443525ad.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 24 Sep 2026 04:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1790248749; x=1790853549; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FV0VdW7HwixvjdTRE0p4MejtpY9br5Zjd0AQ97dpeNs=;
        b=Fc/xuIyjP1QYGLyPRFJnLntM5Pi85Sa6eZg71g+hT3n4qTKINZk9lFZjQObhidlBQ8
         eSCsEnlAzQxwcDkGNH53wrux13PWQYOBHVeS2dSO/nULLz3BYCIOWABSsnyvy2A+wPTQ
         Sn+EMye1bmp6jWpSKzBSBLrgBjDJxMsWDtpQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790248749; x=1790853549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FV0VdW7HwixvjdTRE0p4MejtpY9br5Zjd0AQ97dpeNs=;
        b=WyK0cAp8up/41FyL1RtUMAyNpLFcstFZSIrW++i/26xG3gyK/v2CbUyzon8Aqr3zrC
         0C0X0O2kr/kXkfoCd2edsPA8WiqrYs6k2gu0EQ+Cyx7l6uEjnhTfOtC4TayoAkVxpnJH
         9OCACGobt3syJsPZOEeetnSnTLJu2aa5Ny4OpAqBpQNyYvgNv1jjacCchrdDNtndN8S/
         SvsNH+JyvejWGi55SQDvgsECn32IgiSZWNfw6ZbGlh34CaHylanuU1dLFqEElobh68iP
         NfQtGw4k5+VpyrttPYVHdFVQyo+1jbn9wXz+QqLvIPQMQsmhQsQZBp95LTmrqqQU6jd3
         96yQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRtI9Dlw+fnwBRXU87dZxuphppbEYR/7F9uxC9eCDcFX8fmh0jTzUJI2QNxir0GN7OV2aW91kHkC9o@lists.linux-m68k.org
X-Gm-Message-State: AFuF++myVQrdTzB3vPOPKZL8wtZT0eeBiND/N34KdvlpsLdTwtBFsIn4
	gTOz8a5kOqnU53qCNBBql/Kl8z1QW1dN0cZd+La1G6bVEZj4gHp5634F1ADcNfv+dYM=
X-Gm-Gg: AYBFou2EvNKP0xkP+/f3WQAEd4i3rx0mpBztozuRZHoA5Rvi5S/z2bHfqz7rPJvDJks
	D1dfXm9lnp4R1GP9J0EkxxWdOhugfEA4e41ZHmH5MhWDZNE/wsyAFY/7WwXHHBLUKyXUdLffnUE
	ZJue3WcAmCHzQiZTPFpJMoovuOleW81Xz5W1d0lOxu9Rrj2gj0ZsicF11irBWggKETCeVTaSXki
	NKWuscrsbFh2U6Z/M4wm6fwvwWNgl6BuRMk/D7Wl2ZLjsP6LeMDwGSfPyJzxbaQJ3pgjKOYOsya
	EygXDPmg4MntvvDz4QmG33rgLMv1L6D5CfRUCjizM0RDLDNty9R9qR7XMbwRU+sQcN6aBu5UHr1
	lsrm9vLtRcjajGySoJaTj1ODBg3iPHBMLVDuL9TnbpD9kVQB1P9Pug4AcCghKTfZvkK43JgA90R
	WdhfO8w0W/+VHHIZmitXEsODyWNXetQ4pvrzqNABGOqJMf2oTnK4Kk5wQ2lvdyZSp0ONoYD/CTQ
	Rq3Ke+6j3murAUvPj1CzDLAb0UZTgbUTlKfJxY=
X-Received: by 2002:a17:903:984:b0:2dd:c100:4246 with SMTP id d9443c01a7336-2df7e13c585mr17844415ad.42.1790248748593;
        Thu, 24 Sep 2026 04:19:08 -0700 (PDT)
Received: from shiro (p1935159-ipxg00g01sizuokaden.shizuoka.ocn.ne.jp. [153.129.99.159])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2df6a5c18c1sm24683465ad.36.2026.09.24.04.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:19:08 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
To: sammy@sammy.net,
	geert@linux-m68k.org,
	linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 0/2] Make sun3 work again.
Date: Thu, 24 Sep 2026 20:18:49 +0900
Message-ID: <20260924111851.3501100-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Short version: Have a QEMU fork that can emulate all of the supported
m68k machines via the magic of LLM. LLM also fixed the ones that had
bit rotten. This series makes sun3 work again. Commits are cleaned
up but I have intentially left most of the comments intact as the LLM
debugged it not me.

Longer version:

I am reworking some stuff in my m68k tree and have added SMP etc.
I wanted something to test I haven't regressed all of the other
machines so I gave claude the qemu and kernel sources and told
it "emulate all of the supported m68k machines, try to boot
their native OS first, netbsd if there is a port and then linux."

It took a few weeks from what I remember (emulating 030 macs is
hard apparently...) but it was able to do it mostly. Some of the
natives OSes use the MMU in weird ways and it gave up trying to
model some of that in QEMU. It's pretty sure it can boot Linux
on anything with an m68k CPU now. It even created Palm Pilot
emulators and tested the 68000 Palm Pilot support.

While doing the QEMU work it also fixed up some of the machines
so they work again. I sent a patch for Apollo a few weeks ago.

This series fixes sun3 to the point you should be able to get
something to print out over serial.

With some further patches to add a real serial driver and
it gets to my nolibc based userspace:
https://gist.github.com/fifteenhex/e97322216d5e85e7a54a2adfcba08e32

The real serial driver is a lot of code so I have kept that
out of this series.

Daniel Palmer (2):
  m68k: sun3: register RAM with memblock and set the low pfn limits
  m68k: sun3: add an early boot console over the PROM

 arch/m68k/sun3/config.c | 46 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

-- 
2.55.0

