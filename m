Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68CE184F
	for <linux-m68k@lists.linux-m68k.org>; Sun,  5 Jan 2025 07:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736061301; cv=none; b=hP0P5E/m+vCRwpBKDH5Nfue6jtlKhcyJoVphhK3E1VAYA8URNFI9ZMGjO9Xk+PSoOnY3QN3kw/pY1kkqr6yz3Awc9lZqMAcjizVF/+DiBwPj9cUeSvf1aKquP6gbANiyi3PHt9Hg2+DcjPvQWTnbITl5s8Rk8brqOeTa8rUg8Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736061301; c=relaxed/simple;
	bh=mtXvMVwNI5RTcPWx9YRrRRyl1ar3NOHKGMcmnxAAfKI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EsjXbgr0t//V9EL6EDMvf4ITfoVarIKzDtzwypYB5prdi6CjbXLCU+M+ps4bEBqBkVZs7dKT39KZ5Gxe5LYVliaNlIxv9+ylX4sgKZ6vN+vlAALeOSa+oOb6chUXkgdZQgnsrq1yTfPupPuXVit9zi8tzlOD5ywwlmGlqMFdccs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=J2e0gltH; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="J2e0gltH"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2163dc5155fso185667545ad.0
        for <linux-m68k@lists.linux-m68k.org>; Sat, 04 Jan 2025 23:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1736061298; x=1736666098; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9TP/RC1+W7op7tLb9boh41q09LHWGrqC5AT8VNbl2SE=;
        b=J2e0gltHNYydT2kD0uFGpBJ4O9FPckz5CcvvYAIUgtfSPlFFxVTw926Bkrcri3leta
         5diQaaI9/Bfm3wY8nb2IfpU4MIuGDQQ9ethGQ5yg66+fpP/SJt7hiYColjUXj3l7iRid
         7irALwtyHiL5mL8n7KoywXavWUR8LAgIIAm5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736061298; x=1736666098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9TP/RC1+W7op7tLb9boh41q09LHWGrqC5AT8VNbl2SE=;
        b=FZ83BhyQnxpossjhIJmkiaoD0ZLwOsEtFQhW50jInghzxaC56qG7zcaYd7a6zvjaPJ
         u2hvRQsPvre9XRINBLuOQEDygnu8WkvvRr7tS9fSBgdkBJeWNMEpTQ1o5T5pCsSF7trm
         54vH8t9x8fRCpgkPLiWwEDGu6CbhqgaUAWNaeN8rbTCGcUOFuMreoTaZNVmxhqaDKrYD
         xCe20TaBjf/4zyb5GMzfh/hZnxz8nMQU8eyOn5XEfr24jEol4P803ZkwmqlzXVgbaiUu
         Eor6mB20DjBzkMct4P3uUUwr44sdPAo9W8BklJki+DnO5fXXTGQuQuvfglhY2qwhrhxG
         x3Ow==
X-Forwarded-Encrypted: i=1; AJvYcCUfWTZRqti/sq2Nvvi/3FBZVYbHT2OzfNSwUoV9fa3I6JTWIwQ2Bzvmtej0WGYj/9zgW8lJ+UTYFBsQ@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yxj0XlODfnAq0P4PT82JvN+tASKlaFTxDdQfju5aJB9c0Qq4GW5
	hlhHRU4bS7i6/JHqIQHo4DypkT8amj9g91w/uTBJhhnEEA3klbNQtrZ/pbz9xm0=
X-Gm-Gg: ASbGncuK4uqEA8/uP3i4mdhFKshvDI2vn1zon4JjCFlZWtZRrmpQKZVg7+yVGAU6We/
	5AlkSTFRrHi6/l/epHAa7d1uVuq8yuLYY7IlBHagbCP2dVEZRNyMxjJE7lJujqpKVDWOERFmB9i
	eZhWbnapHZbjb0SW8ZlP0TR3D245ckLdEkIja/vySAVGwJSQdfh8DfYKjrpaRYk6gkEARpPrwtE
	jDK63VvH47vthKlZupGEbPeP/V9eXwAL1OeVa9/yHNqX9DUV7i6LOXB+KSaMxYcfd3+
X-Google-Smtp-Source: AGHT+IENsXvhSOkS/QMbySg181yJ5uh/Yt/RGgynZvVEQoc9I7ZJHIIlUGh4nluzeOlxiWDdcIxobw==
X-Received: by 2002:a17:903:2449:b0:216:50fb:5dfc with SMTP id d9443c01a7336-219e6e8c3admr825594315ad.9.1736061297878;
        Sat, 04 Jan 2025 23:14:57 -0800 (PST)
Received: from shiro.work.home.arpa. ([2400:4162:2428:2ffe:e94c:e5d:106e:3582])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-219dc9cdef7sm270007125ad.133.2025.01.04.23.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 23:14:57 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
To: geert@linux-m68k.org,
	fthain@linux-m68k.org,
	linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [RFC PATCH 0/3] m68k goes DT
Date: Sun,  5 Jan 2025 16:14:30 +0900
Message-ID: <20250105071433.3943289-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Short version:
I want to start converting m68k (including nommu) to use DT for booting
so I can add few cool boards I have (e.g. dual 040/060 VME board..).
I need ideas, help etc. Maybe if someone converted an m68k machine they
are using to DT alongside me this would have some hope of actually happening?

All of my WIP in-progress very messy code etc is here:
https://github.com/fifteenhex/m68kjunk

Longer version:

As of today I have:
- Modern (2024.07) u-boot fork that works on 000/030/040 real hardware/QEMU
  that supports booting a Linux ELF image. For nommu a FDT blob address
  is passed via a regiser, for mmu the normal bootinfo is created and
  the FDT is passed via a bootinfo tag. nommu never used bootinfo and doesn't
  need to.

- A Linux branch for nommu that removes most of the current DragonBall
  code, makes it into a devicetree based machine and adds a bunch of
  drivers etc. This works in a fork of QEMU I have and on the real hardware.
  The DragonBall even has a working 1bpp framebuffer. The nommu branch also
  works on 010 and better.

- A Linux branch for mmu that uses the crappy patches in this series and some
  other bits to start moving the MVME147 board over to using DT.

- A buildroot fork that can build a 000 nommu userland etc. A patch to add
  support for building for 030 is already in buildroot, I plan to send one
  for 060 later.

- A bunch of DragonBall machines, an MVME147 030 machine, an Eltec E27 dual
  socket VME board with one 040 at the moment but I have 060s to go in it once
  I work out the need jumper changes, some other 060 VME boards, Amigas...

What I'm thinking:

- We initially add passing of an FDT via bootinfo for mmu
- Add support for a generic machine that can boot almost anything so I can
  bring up my new (to Linux) machines.
- I will migrate MVME147 to device tree.
- Some like minded person migrates a machine they have to device tree. :)
- Maybe embed a FDT for machines that'll never get a bootloader that
  supports this and use the machine type to select the embedded FDT
  and move all of that stuff over without needing to mess with bootloaders.

Issues I have:

- The head.S code is real confusing, I'm not sure how I make this support
  a generic machine right now.
- The head.S code sometimes gets stuck setting up the mmu on my MVME147 when
  the kernel binary layout changes. I thought for a long time my new code was
  wrong but then discovered just making the kernel bigger by adding some printk()s
  also caused it.

Sorry for the wall of text.

Cheers,

Daniel

Daniel Palmer (3):
  m68k: bootinfo: Add tag for FDT address
  m68k: bootinfo: Add generic machine type
  m68k: Add dt support (proof of concept)

 arch/m68k/Kconfig                     |  2 +
 arch/m68k/include/uapi/asm/bootinfo.h |  4 ++
 arch/m68k/kernel/setup_mm.c           | 63 ++++++++++++++++++++++++++-
 3 files changed, 68 insertions(+), 1 deletion(-)

-- 
2.45.2

