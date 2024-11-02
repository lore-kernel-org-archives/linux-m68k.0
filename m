Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B4B4174A
	for <linux-m68k@vger.kernel.org>; Sat,  2 Nov 2024 02:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730512945; cv=none; b=KMu1x7ZSExZNyropDgYg2GDmqT51gShU7hQHypysy8vHzcc/f2bnCIPcPziryFjnSMeDfdWQtmeWU/WGULxpweuO8LA1BhSC/p0aMmCTYzkBCstPswUQcfd1nu789p4v/8yi9Zv9+AnfNB2HZOR8IPoxudc/iq8bM660xS87J5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730512945; c=relaxed/simple;
	bh=DFSevWqmFCJ2kjWXAnhrJQrFk6YAUAKEX1KY53SqwkA=;
	h=Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=FHqYl4y+V7Da9Ks6WI/lEHc4JUxbByx6Ht+QqCCdFimP7do10OB1oJEB3YXiw5hv0rwSMMfVCuc/GB+yodIv9vShScKcu0VWFDkRgjPhm0f+dCOJYFwWY2o9XDwoEpZPL/riYmUW7buKkg0nGafmmt/BYpjkPhCkHoxvsEhvgsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MtvEe4sK; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MtvEe4sK"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2e2ed2230d8so1978718a91.0
        for <linux-m68k@vger.kernel.org>; Fri, 01 Nov 2024 19:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730512941; x=1731117741; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AmBgFqNqGsTSpoWbXQUx5KDozHwpLvqFlA1N34yL8PA=;
        b=MtvEe4sKyCcORiHc698N/DJKTBxWklmIIXPYi6d0SbDbdGAAI7FVGeZshG+u877bW1
         fA14vjKByqBnZoGTyQo+EeF7geoFjJj43sgEb7hUaBUUTIp711OFXyzLaxS17fxvN5Sc
         4Qg+Q/wQ64awAjNfkjMJ635u6NoLJrUgishTHhbxoTicjnt9NOWswdR2bPSNCs7IFWk2
         ZchBrmD56m9V2HzOtzYUtilj5a2v8aO1k2M+dKxVIE0qQ/0RqHWxblMzX9WSpBB1Uv+8
         DSCPAg67uSE4bzoeg/11cqxCAi5wHx7dRH/LzUHaii6dpa+MOUwqMvq/BDcM4/2TsOeI
         KYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730512941; x=1731117741;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AmBgFqNqGsTSpoWbXQUx5KDozHwpLvqFlA1N34yL8PA=;
        b=Aat6HF2bVtkcng1x9wwYcp7G/wjmecaVKMRwF+rMcjsCyO7yr7HLr5ZgK+1ssQ30O9
         vG91l20WH//7bJ2qNuQQz8a7Jok+9ZiqPI1FQte+VBKsH1biKMaN0FDqTo5x/wysXZct
         DU97jOj0t5NDacyyL5O3/v3Ijdcifxng62DatL6mOPKBJlbkoTcTbiBEwwXcrDuMA9fa
         Jns6EkqLQsDsoJIw1UJeHDHQMuqOiIQKafcVdB5MTR5/obkeQprG/PDZaCzBHQRqqbLS
         ea7LFbAU5COFX4hCJW0ajbMJC81zt0/rSCLvVjONLYp+YjSl93rTAsiPbcru+KuUIgwo
         qNQg==
X-Forwarded-Encrypted: i=1; AJvYcCVW5noJtPkhwdlFSO9cFeSIYl3SUbo50eLCI0c6O00NDrmZFL/44D1Mtkhz2K4o9IflFyTooaHK3aUk@vger.kernel.org
X-Gm-Message-State: AOJu0YwYHuLWpXYXDZsIPIcxjU9TQEPmhfuZUCbx8cHZ3wanejd9CGcu
	SCcmXLgW+x9JOmX1wDAK+ZgGuqGxp9vCMqS+i68XBfZZ0LyLji9zQ4AtNA==
X-Google-Smtp-Source: AGHT+IGPwQEgIlET2HsZcUgTfj/9JkEuWymmbtjLZpCZQFRR3z9o+NDcrsdjwqNf0DVf4mKG6KRpiA==
X-Received: by 2002:a17:90b:1803:b0:2e2:cd5e:7eef with SMTP id 98e67ed59e1d1-2e94c513e33mr7398309a91.27.1730512941330;
        Fri, 01 Nov 2024 19:02:21 -0700 (PDT)
Received: from [10.1.1.24] (222-154-151-220-fibre.sparkbb.co.nz. [222.154.151.220])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ee455a4fe4sm3023520a12.51.2024.11.01.19.02.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 01 Nov 2024 19:02:20 -0700 (PDT)
Subject: Re: [PATCH 0/1] [RFC][NOT WORKING] amiga: pcmcia: inb()/inw() on
 GAYLE_IO space
To: Paolo Pisati <p.pisati@gmail.com>, linux-m68k <linux-m68k@vger.kernel.org>
References: <20241026154233.351261-1-p.pisati@gmail.com>
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <062d8287-60aa-f1ac-0133-02a8ac4a9a60@gmail.com>
Date: Sat, 2 Nov 2024 15:02:16 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241026154233.351261-1-p.pisati@gmail.com>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Paolo,

Am 27.10.2024 um 04:42 schrieb Paolo Pisati:
> Hi there,
>
> attached is a driver for the pcmcia side of C='s gayle - it's a WIP, as such
> there are many dev_dbg()/pr_err()/pr_dbg() scattered around, you've been warned.
>
> It recognize all pcmcia cards i tried (IOW gayle's attribute space is read and
> parsed correctly), socket's interrupt work (IOW you can plug & unplug cards),
> but *it seems* any I/O read operation return bogus data (e.g. 0xff or 0xfff).
>
> Here's a dmesg dealing with with a 3Com 3c589 ethernet card:
> http://dpaste.com//84TPTPLNV - notice the "hw_addr ff:ff:ff:ff:ff:ff" or
> "exiting interrupt, status ffff".
>
> AFAIK inb()/inw() already add the GAYLE_IO offset (

Correct.

> AG_ISA_IO_B and AG_ISA_IO_W in arch/m68k/include/asm/io_mm.h), and i didn't know
> if i could read directly (without an ioremap() first), so i tried both cases:

AFAIK the Gayle MMIO region is already mapped in head.S, and does not 
need ioremap() at all.

> 1) ioreamp() sock->phys_io, and subtract the GAYLE_IO offset (see
> sock->socket.io_offset).
>
> or
>
> 2) set Amiga base IO port to 0x0 and patch
> drivers/pcmcia/rsrc_mgr.c::static_find_io() (see https://dpaste.com//B75LTFF3V)
>
> In both case the 3c589_cs driver request an I/O aperture at 0x0300, large
> 0x0010, receives it, but all read operations return 0xff or 0xffff.

Can you post your .config? I wonder whether the CONFIG_ATARI_ROM_ISA 
option is set, because that would mess up inb()/outb() for ports < 0x400.

Cheers,

	Michael


> Any idea? Any guess is welcome since i'm running out of ideas ATM.
>
> Paolo Pisati (1):
>   pcmcia: gayle: initial support
>
>  arch/m68k/amiga/pcmcia.c          |   5 +
>  arch/m68k/amiga/platform.c        |  29 +++
>  arch/m68k/include/asm/amipcmcia.h |  11 ++
>  drivers/pcmcia/Kconfig            |   8 +
>  drivers/pcmcia/Makefile           |   1 +
>  drivers/pcmcia/gayle.c            | 307 ++++++++++++++++++++++++++++++
>  6 files changed, 361 insertions(+)
>  create mode 100644 drivers/pcmcia/gayle.c
>
