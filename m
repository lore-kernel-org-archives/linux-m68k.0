Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945092F56
	for <linux-m68k@vger.kernel.org>; Sun, 12 Jan 2025 15:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736694349; cv=none; b=XOKztYhp2PYIS4QoZoLR35SuOLzoqwCZtvfiExzSf1E4UfdkP9QlPg/uSzso4YtTK2sB3MplvYgzv1dX2cRfAiU8GHWZTUtNdL1LMrwBi8alrYC2zAqgk9Ghc8EoAe0GMHC5gfxBInUq5/QGhF6+ewoY+bDnWNpel717lcy6MXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736694349; c=relaxed/simple;
	bh=4qFx+PT+uwIqXbqqlpyPLD1ec9NgtsystJY46f4lSzc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=o3TTtE/cC4RFL6HY13HMDef5Gjo1ahOwCWNOnKd+t0oC7BA+s+4mbcuSBtLGbcDXLlg7pxFZ20uH/6/Y/hg/QdkYxPmsCfuI5Q/7mBLm4c7jwCGBPQVT7md8S0GACY0NDZp/T4lEwADA3/WoY5kBR4PdTay3+0nY6/jbXlabTMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kOxvNM49; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kOxvNM49"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38a8b17d7a7so1777845f8f.2
        for <linux-m68k@vger.kernel.org>; Sun, 12 Jan 2025 07:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736694345; x=1737299145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iGjGbp2MUqfGX7dS+7ymByJTNt/Lmt04s6MXmjCbD3E=;
        b=kOxvNM49GqsV5kLKmhONY58kX+KwCo1jQs/rnTGnMZj0Rh5EOvEVvYEcyaxklrgTrs
         2vuVmhGg/aXdv3OXDtPy83ixrcS/5D4vUxohKQAE5LGg7ELwhedlDSLQLR/6d9bqsOOb
         twnKW71e2xxEWEkOUPKdZh+6StFDhNL04UAZaemm1LsMihdtA+6ufg4u3fhpanQMqF2h
         kciUQ87xf2wIl8ruy06sFdNzMSQbP0IrGXG1jgSWtNpwk89VBrEZ6LCCGB7p/Wy9IFLt
         uqgvr3kLwvSXUs0cVDK48uTUt/pC5m+0NE3q/+c/83nWThG0EW2CKQlimhv/pewNviUb
         R/6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736694345; x=1737299145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iGjGbp2MUqfGX7dS+7ymByJTNt/Lmt04s6MXmjCbD3E=;
        b=oKxSnxvd23tvPTg5JrV1mqEwPZOWjVAnoiC6GBeXXAUOkGaXRpWkbn8WSDwadp34zA
         1EqnAVgw6hISCNkzthdXyZsKXtjNxhuDX2A8AyxYkjsvnTNBh9nq1Rg3R3cLWQRz0rlT
         JY8Wkmc1RK7UnRCFNZDd2ZzVReG6tM21bYbkWrXiq3mzju6kPgNxxykc3IIyFU5E50+G
         oeet1ubaKdFJi+R0Bj/3X+3KqOSf450sZ9lZZ0juSUk/v5g/KfJSrtSFxuSzUwHaOFtF
         sby39HgG8mLlnh1GexFr73YFxtyEOoQXp9azkSskDCtYlgVVnqpUe5Ib/h/oRUXVcM7M
         cZPQ==
X-Gm-Message-State: AOJu0YyvytHeW2Vy1TiikYyivBoojHH2M2rCFmh6KH2BxAuhjWQi6whN
	NxgkB+QKG4v5MGFGmdfpF0gJ6wyM9mCp5qzx3jb87J3gmKxQypuAz31EFncy
X-Gm-Gg: ASbGncuYG3yLdIrFKPjgjnxOBjVgt/FuM/XO846cgN25eoPmIFw3LE38JMfbWLU4kUR
	pFXDbv1aRzO8jZ3nH+RGUcSaDQ1oMBONWwCSYpW5Aa9AFMLYxMxCGOOk52U4g13mSvErbTaPhGr
	q4ICtsgw9AKnzvbm8wwoXJ91JV9+tIxjEVxUFmKhZSym8mLcofhU2c2mZ0nOko9mrZiyryKuRfJ
	8QHg03HJtnJqAX4aubP7UqUJY8VZ10ye13UAb3hU+cJvBmbCs1PIVk=
X-Google-Smtp-Source: AGHT+IEudwQxXX7jaqgdt9pE971qeTk5IYuviEm1eULY6kSAEWJCrJl22DJAuxN2/qi/TPWOy4wY0Q==
X-Received: by 2002:a05:6000:4024:b0:385:f220:f788 with SMTP id ffacd0b85a97d-38a873556c6mr17569907f8f.48.1736694345264;
        Sun, 12 Jan 2025 07:05:45 -0800 (PST)
Received: from gmail.com ([2a01:e11:1403:8620:bb2d:c803:9e9d:5dfe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e37e375sm9625611f8f.22.2025.01.12.07.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 07:05:43 -0800 (PST)
From: Paolo Pisati <p.pisati@gmail.com>
To: linux-m68k <linux-m68k@vger.kernel.org>
Cc: Kars de Jong <jongk@linux-m68k.org>
Subject: [PATCH 0/1] [RFC] Commodore's Gayle pcmcia driver
Date: Sun, 12 Jan 2025 16:05:41 +0100
Message-Id: <20250112150542.413179-1-p.pisati@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here is a second attempt to get the PCMCIA side of Gayle's to work: it merges my
previous attempt[1], some historical (e.g. v2.6.10 era) work from Kars de
Jong[2](the set_io_map() and set_mem_map() are a blatant cut&paste), and it
follows the NetBSD code[3] (when it made sense) - credit goes where credit is due.

The good news first:

if you have a pcnet_cs or fmvj18x_cs PCMCIA eth card, chances are
it will work (i've 3 of them working here).

And now the bad one:

1) 3c589_cs (3COM Etherlink III): card is detected, it receives incoming packets
(eth0 counter increases) but TX fails

2) axnet_cs: card is detected, but as soon as i try to up it, it errors out
("axnet_cs 0.0 eth0: Hw. address read/write mismap X")

3) pata_pcmcia (no name CF to PCMCIA adapter): it's recognized, but fails to
attach ("pata_pcmcia 0.0: probe with driver pata_pcmcia failed with error
-12") - looking a bit closer, it fails in pcmcia_init_one() when:

 io_addr = devm_ioport_map(&pdev->dev, io_base, 8);

just notice that devm_ioport_unmap() is not implemented if CONFIG_HAS_IOPORT_MAP
is not set (and M68K doesn't implement it).

And, finally, the extremly sad part:

1) i've forced the word and long I/O helpers to be little endian, and this is
clearly a big no (see io_mm.h).

2) for the love of me, i couldn't figure out the proper way of acking an incoming
interrupt on IRQ_AMIGA_PORTS at Gayle's level (and subsequenlty call all
PCMCIA's card handlers registered), so i resorted to an ugly hack: i registered
a dummy hanlder on IRQ_AMIGA_PORTS, checked for GAYLE_IRQ_IRQ, cleared the
interrupt at Gayle's level, and then returned IRQ_NONE so the remaining handlers
registered on IRQ_AMIGA_PORTS could be invoked - see gayle_irq_dummy().

3) the get_status() and set_socket() are pretty barebone, but that is
intentional since, so far, i couldn't find a case where implementing all SS
states made any difference.

If you want to see what's going on under the hood, stick a:

ccflags-y += -DDEBUG

in drivers/pcmcia/Makefile and rebuild your kernel.

Let me know what you think.

1: https://www.spinics.net/lists/linux-m68k/msg25982.html
2: https://dpaste.com//GYSLEKLLM and https://dpaste.com//EQE56PPSU
3: https://github.com/NetBSD/src/blob/trunk/sys/arch/amiga/dev/gayle_pcmcia.c

Paolo Pisati (1):
  pcmcia: socket driver for Commodore's Gayle

 arch/m68k/amiga/pcmcia.c          |  59 ++++++
 arch/m68k/amiga/platform.c        |  29 +++
 arch/m68k/include/asm/amipcmcia.h |  20 ++
 arch/m68k/include/asm/io_mm.h     |  20 +-
 drivers/pcmcia/Kconfig            |   9 +
 drivers/pcmcia/Makefile           |   1 +
 drivers/pcmcia/gayle.c            | 303 ++++++++++++++++++++++++++++++
 7 files changed, 437 insertions(+), 4 deletions(-)
 create mode 100644 drivers/pcmcia/gayle.c

-- 
2.34.1

