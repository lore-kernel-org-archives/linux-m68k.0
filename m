Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A23A16F0EB
	for <linux-m68k@vger.kernel.org>; Sat,  2 Nov 2024 10:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730542365; cv=none; b=mcp1Ohw1p21wtjusaFG99oX6lDpbI9MNX46Qhzc/ga9A3KCFaAnWnoEhim93BQHHZ313T7WL5gZyczGgZVrJ3J415hWbpphENgLTxCSkTLqSu4JptCa4q8aEPtTvifgkYQVz5i6lw6CmQOKfJ4XfEzKuhwRl+zK/8XfuR8WQJME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730542365; c=relaxed/simple;
	bh=b1nVI/M1XinPIEKSyADD7nlrvSyMLPbS8dCI/6HBiHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h6k+oBygM3pPK+KmxEjDAq1/72OzYU7xzeUX/4meYuA3wPnqbhPvFh74q31UcnwnoPg8318cRLziSvwkJFfmjEvDCQwba2GSc+THygtivGGm6j0brdYu0vv/926M4kkmX6juNN47U/yidO6YAgTM7pjRIYd+HeRRQXXOgEZagRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BOiiP6w+; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BOiiP6w+"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4315eac969aso15588195e9.1
        for <linux-m68k@vger.kernel.org>; Sat, 02 Nov 2024 03:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730542362; x=1731147162; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=64Uhhx4uBIFprGIPvoh/AHrI/pCRugaZUsAAABKPaq4=;
        b=BOiiP6w+C6ui6l5Os6AttQQZzIMfKXyBRaa+sBZvIMchx2/4XI2ialrm6Z1IY1hPik
         Xy/tf5fRwAorMe7PYBuYCyZQ0ZrLtMEhJ+4vtdRg374/NAAghdeZq9vMImejRXHdNH+g
         7i8zQICR0cRAoHr8Ej51yZl7HWP2Ew/aqDomLz8dHLy1ryh8Fc81k9+IxcjM/mW71THO
         SnYabgxglfa2XpyY/83/EVs1VffWsJ3iYuR7d/U9dq3KH+ouOpCoPYJnrzN6u6Zl0pD2
         aiayx89mYcNtftqD14aB8WFvrEIzsu5P99JRDnMca+dpjSVCdulEKEGR1ARNITwo9WyJ
         q+Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730542362; x=1731147162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=64Uhhx4uBIFprGIPvoh/AHrI/pCRugaZUsAAABKPaq4=;
        b=VfqK3kBoTAc5EXLtYD20CUwqbPuRXLQTho8GTh2atI9CzQwDGtqWK7tMj3EBMe8E5Y
         tPATqu7cfgzpypu3/pr2H1Mm0iUATtgOokz0UeN2ZoL6U4HVLkxTrRlaawyVLuT1AyF4
         vSuNxhosUcMDKqgfWUadmUAaOmcovCBDcLSoc8FPq1N9czmKShzyYSbDe4ygFJYvq792
         KhsBnlDN9ANidQvVAUDedNPthsvWIqpzWeAMeL3lQLrUwR0x3fZiTvs3sgngpdJ5XoGv
         VIMpQIg8lOop0vC9Xe3j5Dvg6R01l87FOY9pXJs1/g8fhr3p4a5ngByWISHJ6k9uhFaU
         SQog==
X-Forwarded-Encrypted: i=1; AJvYcCXayYANII6xx+xZeWDUM7cF8rMqIfv1CUSM+sU4pKysKvdSk7gXf1GMGNdcBrcUKBKbMqrejZl7qSXW@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpv5kG5dTONGc49qpjL0iDUuYnG0Jzu/Cn0WDk6dqZ2SPelnHm
	365Ojq50b0jxBovZJ/ppXr+5swzN8mRo+wtvJO+iNJsVGoqZJ7Y2YLzOWw==
X-Google-Smtp-Source: AGHT+IHKD9IoSR7lAYZhXJKHHVMCynhpBT3PxANCt+UJC4cbDfKrW9NZd52ktNcoSNd1aWa2hBC4Mg==
X-Received: by 2002:a05:600c:512a:b0:431:5226:1633 with SMTP id 5b1f17b1804b1-4327daa349emr75494775e9.6.1730542362136;
        Sat, 02 Nov 2024 03:12:42 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:404b:db39:5ac6:5b20])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5ac002sm89477175e9.5.2024.11.02.03.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2024 03:12:40 -0700 (PDT)
Date: Sat, 2 Nov 2024 11:12:39 +0100
From: Paolo Pisati <p.pisati@gmail.com>
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Paolo Pisati <p.pisati@gmail.com>,
	linux-m68k <linux-m68k@vger.kernel.org>
Subject: Re: [PATCH 0/1] [RFC][NOT WORKING] amiga: pcmcia: inb()/inw() on
 GAYLE_IO space
Message-ID: <ZyX7FwacwYrOn1kz@amaterasu.local>
References: <20241026154233.351261-1-p.pisati@gmail.com>
 <062d8287-60aa-f1ac-0133-02a8ac4a9a60@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <062d8287-60aa-f1ac-0133-02a8ac4a9a60@gmail.com>

On Sat, Nov 02, 2024 at 03:02:16PM +1300, Michael Schmitz wrote:
> AFAIK the Gayle MMIO region is already mapped in head.S, and
> does not need ioremap() at all.

Uhm, ok.
 
> > 1) ioreamp() sock->phys_io, and subtract the GAYLE_IO offset (see
> > sock->socket.io_offset).
> > 
> > or
> > 
> > 2) set Amiga base IO port to 0x0 and patch
> > drivers/pcmcia/rsrc_mgr.c::static_find_io() (see https://dpaste.com//B75LTFF3V)
> > 
> > In both case the 3c589_cs driver request an I/O aperture at 0x0300, large
> > 0x0010, receives it, but all read operations return 0xff or 0xffff.
> 
> Can you post your .config? I wonder whether the
> CONFIG_ATARI_ROM_ISA option is set, because that would mess
> up inb()/outb() for ports < 0x400.

I cleaned up and made some progress, and now the first network card works: a
Corega ethernet PCMCIA supported by pcnet_cs - the same card is already
supported in the apne driver, though with the PCMCIA bridge, you get hot
plugging too.

Unfortunately, other PCMCIA cards I tested still don't work (an Etherlink
ethernet card, a CF adapter, a Ratoc serial card, and an 802.11 wifi card - all
of them with varying degrees of "not working").

I should probably repost the cleaned up driver.
-- 
bye,
p.
