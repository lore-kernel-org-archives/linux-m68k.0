Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529892AD0C
	for <linux-m68k@vger.kernel.org>; Sat, 26 Oct 2024 15:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729957362; cv=none; b=iJykFBnirdB/yFDpwCWHYV+hY0RxWPZsYkOUIRcMX5Sywm0/ZzrsBuakL5y66qZl87bQqRVt69FO3DjowT5AaTuP10Pnh4zcL2zC5ajtN9wUSRu37WcjiXFCsVu/AevGhm2S0SFJy4Z/XIZqb51gkvQBcJVehloaBzp6JiXGWTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729957362; c=relaxed/simple;
	bh=D04PMvOE3mDoeSJtzdrIJ1CY/PXtYyYc5M+dBT4nKzE=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=ux8/XqTuf3QZHqUDXeImnUNc9SZaiwWsjE5Q8FY3xplG7iJz5KI0LPebinIYixbY2V5XoZnl9Zz0xFqdmdmY2UbatjNQhcBxHEw/sZh38ytvNHGN1QWJWtzW7iG54GzX6tuKSz03vwN/QH55eehJcu2/a42jmkFMAIoCTBBD5QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tqn3TRND; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tqn3TRND"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a99f629a7aaso475471766b.1
        for <linux-m68k@vger.kernel.org>; Sat, 26 Oct 2024 08:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729957358; x=1730562158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3uRK/egINE72ZsJZb3+P6JG9YhGV5Rq0ygMTeMbIUdY=;
        b=Tqn3TRNDIl4+MeYVQO6jajq0SWRuss6j8+Z5D8anxGWOrFc8nPBii4IKviKuXCOVJ6
         1DeRJRSke4QBLMrYz4LKTCNjVys6p+M0oki+yxAeOJXN357eLnoLvEibAQCAqkqyWZLJ
         2tNeHvL4cHoaOAKe6KsTQ4/kCUH4XOv3rMJMyF4cFZ+tAPm+t0e1wzlcJRY69XuV5z0v
         IcDNEbheRyTmTVHo+NfuLI2G8D76tZWKGMZXsxItkefkSme7Z7sEly3n4iYpb8L3Aztj
         zHd+QREkfoXItaEPFyqahtu1hVkHV06Pa6GnJPu4T2dLjnMMw/8WwiKd95sso4jKEz4K
         U2Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729957358; x=1730562158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3uRK/egINE72ZsJZb3+P6JG9YhGV5Rq0ygMTeMbIUdY=;
        b=hmaNBt5VqzwMLjlMHTBlUWwQDfR3//qYgWRMJCIxpCT9OhjTk2ciqBmlWcIqrWU6GY
         9XdRooa7a1BrKRr3Du3iAOEIWqJTP2JC9l5ai0y4YYLAJTmjYXlXCEOoqAcbtISSnSee
         1fSgAdDuvHCnjIgihw8e188cv/FCxMlEFFEmuwlNEekLl7K5SpbXWLfFoTUajpRpsPH9
         NSlb+0qKp2ABjBCpjleR8/DS1qdfwU+cLIM+NcOcE4qYxPaepEglv5tZHyUl88y8wRj4
         lujRM1NCha180PIHn2BImy4s/shxk8n2gWjs2cZTTNf/Te44sYUCO8jjIdb7SXB2marq
         2QZQ==
X-Gm-Message-State: AOJu0YxOA+dHa3HletOmWImKGIRwhQ2/pKcRMPIC6sBmMw1PKVoDGU13
	rUeBxQEXAOJgz3DK/orjKJQB7z1Nxh7lhGY/4qUH4f+WOWSr+WpzAnnuew==
X-Google-Smtp-Source: AGHT+IEvDfxJpREfma3l+p1uhntTRg8XDDW1JxKLXwWwn6OphMb5OUUw+rYsmBrvzVWJi0TR3uEJlA==
X-Received: by 2002:a17:907:60cb:b0:a9a:a666:4c7 with SMTP id a640c23a62f3a-a9de38e3fd7mr244844666b.24.1729957357789;
        Sat, 26 Oct 2024 08:42:37 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:e191:6b6d:340e:d5c5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f2971ddsm184567466b.100.2024.10.26.08.42.34
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 08:42:36 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: linux-m68k <linux-m68k@vger.kernel.org>
Subject: [PATCH 0/1] [RFC][NOT WORKING] amiga: pcmcia: inb()/inw() on GAYLE_IO space
Date: Sat, 26 Oct 2024 17:42:32 +0200
Message-Id: <20241026154233.351261-1-p.pisati@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi there,

attached is a driver for the pcmcia side of C='s gayle - it's a WIP, as such
there are many dev_dbg()/pr_err()/pr_dbg() scattered around, you've been warned.

It recognize all pcmcia cards i tried (IOW gayle's attribute space is read and
parsed correctly), socket's interrupt work (IOW you can plug & unplug cards),
but *it seems* any I/O read operation return bogus data (e.g. 0xff or 0xfff).

Here's a dmesg dealing with with a 3Com 3c589 ethernet card:
http://dpaste.com//84TPTPLNV - notice the "hw_addr ff:ff:ff:ff:ff:ff" or
"exiting interrupt, status ffff".

AFAIK inb()/inw() already add the GAYLE_IO offset (
AG_ISA_IO_B and AG_ISA_IO_W in arch/m68k/include/asm/io_mm.h), and i didn't know
if i could read directly (without an ioremap() first), so i tried both cases:

1) ioreamp() sock->phys_io, and subtract the GAYLE_IO offset (see
sock->socket.io_offset).

or 

2) set Amiga base IO port to 0x0 and patch
drivers/pcmcia/rsrc_mgr.c::static_find_io() (see https://dpaste.com//B75LTFF3V)

In both case the 3c589_cs driver request an I/O aperture at 0x0300, large
0x0010, receives it, but all read operations return 0xff or 0xffff.

Any idea? Any guess is welcome since i'm running out of ideas ATM.

Paolo Pisati (1):
  pcmcia: gayle: initial support

 arch/m68k/amiga/pcmcia.c          |   5 +
 arch/m68k/amiga/platform.c        |  29 +++
 arch/m68k/include/asm/amipcmcia.h |  11 ++
 drivers/pcmcia/Kconfig            |   8 +
 drivers/pcmcia/Makefile           |   1 +
 drivers/pcmcia/gayle.c            | 307 ++++++++++++++++++++++++++++++
 6 files changed, 361 insertions(+)
 create mode 100644 drivers/pcmcia/gayle.c

-- 
2.34.1

