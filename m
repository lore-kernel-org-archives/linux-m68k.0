Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6752561DF
	for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Mar 2025 15:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742918137; cv=none; b=fPg0xm0a5DIHmlHM6XG08edzJsIAdMam5mYgz4TW52nMJcJQr6vHIPLtm20dQQMv9NPcVVHTpZlnukdhLiugihbXeNrhb31UOohl0HgZ7rqGGYlL6DbhVKelfZK1KrpHdRSi5EtGTFM0bbfGZ2Cpi+Gzq217PGayKA0ieCnQxS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742918137; c=relaxed/simple;
	bh=CMWVz33lT6p1f+17izyO+br6W04HIXsYhjFMmrBViqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KpGbe2UmhrF8jFKkQdbvssPGMYvf+yAZYQaj8kEAxGePffW2RheLiPvoJHVB8ceMFnlMC4vdYBqXIiioI8aoi5H2klfdb+vvHN7NBc3MimDsLEdtZMF7RdZWFkR31HcWMIiIvuotl1Zno2A1YxgN82uu8hp+6YiIZrpUhMW7w7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hoiBTgra; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hoiBTgra"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39129fc51f8so4726779f8f.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Mar 2025 08:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742918134; x=1743522934; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JssoJbGxAXlBbUyT3ON3KKR9aBT8d77H2v38bI0fixI=;
        b=hoiBTgraDI9c9nLU4a9uP2uFjw6QowKx9XlsAIghzeW+iWnk/dTeyxTA3S2n2b03+4
         l3uGpVD5YOeVz7xxT+NE6IiZZPc6JnQPnKWKFGU3XOlnYiayf4bsvwCdkGXXBh1NIuV4
         FT6CoMwKeF1E1Jl4vZo5Xc2jtNlmX/7di33R9p11ZbElImKT5ys5VLTkNxvcbPX6HUOs
         0b0Z7GXegZgWt/Wx2Xv4Rjb2NnE6wO7aOjmSNMzbgNZPu2Xl6j3YzEBrxrOn2Zf3FJAP
         qALWfjEvFS+fST/LZiw5BMaVGP+MfLNcuW05eIffrgQ0AF1two6h0snBKKDfbj5bZYbY
         Nv8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742918134; x=1743522934;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JssoJbGxAXlBbUyT3ON3KKR9aBT8d77H2v38bI0fixI=;
        b=Tkk519TII995mMo/cbWxTTrI52DcHZInD362oXVTmO/8Sz3jof+SrXlmbrWb2sBCBS
         Ui4ZU0/BYDo1YCw4HjUiUGnXfc7JZyq6OXiFa62XfQu8fHyZq2QXv8eynoV61t3jccWK
         agbfW+N8gqW/QZag7or7NwTl6DiCoTcD/FZAROpdCpJJjVV6f9U+ebBgpOeP0k70QNmn
         Fi01oTWtD4rrrzTXv8VwLu66AcZabI6b7CoFRdW9xyfrPCVJQUxWlyf5Rk+u21wr9ZZB
         RE3ApEXPuVX63MP2CiDXwpEk1FJf7HJ2xP1AU4NmTZK6SSIyO1UoHvMJ/LV0FIVwqDMX
         PDaw==
X-Forwarded-Encrypted: i=1; AJvYcCUmfPzi+tR0xcZpXJER9WRYdK5AdIvkBl8C3RCVRAzGqMgi1kSaaMA/MeIXrOWD9jjQeGPIZED1rKRf@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzWX9LKnBF/xDZnpbQZP5Rc7ZcWU0FX/e0wguaZxPKGhh5rYKmb
	iMmOf0W8T0/WV+wU032frZc0ktnt2f+LJpN079dRu243yRPJu6JN
X-Gm-Gg: ASbGncsF1N6m1GRPTqfsphcfDR3k+Iu86Cw8YMfOHNlheIIZX/z6fNFsHc8xGtnzJAr
	Fjyr+DYGDqIb76AI9Mv4Rhz0zePxpZ7XsjvszKVujiPUiU7smafa1CFNydMF3hc5DKU5t7xFYaL
	dqcq5P4+BQut82z0Kp+6JW02+8wIdZln2PLYg1K83DCDh6opXk+WllbOCr0EsLrnlJPxIuTkxmr
	V2fE4Tp7Z+iN6C46LCVctyKue0+fw0+vrfgiUPfzh0VN0E1pCilNEzfey+LNfojIXC4aAqOkJjh
	tZAfTqI2zKgODntMigHqgFbTLjOGLajWRpRS/X4sTNA=
X-Google-Smtp-Source: AGHT+IHRAGJsg97H8EY2q5KgKnz9QjXZ8OYPFvCYzPH9NT6jqf2GHi/kUEYr1z8cYh42PzDyvNoS8w==
X-Received: by 2002:a5d:6c6b:0:b0:390:e535:8758 with SMTP id ffacd0b85a97d-3997f8f78b5mr17067536f8f.9.1742918133500;
        Tue, 25 Mar 2025 08:55:33 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:eead:4845:67bf:e110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9a31a7sm13861603f8f.23.2025.03.25.08.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 08:55:32 -0700 (PDT)
Date: Tue, 25 Mar 2025 16:55:32 +0100
From: Paolo Pisati <p.pisati@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paolo Pisati <p.pisati@gmail.com>, Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>, linux-ide@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH v3 1/2] ata: pata_cswarp: Add Amiga cslab ata support
Message-ID: <Z+LR9Glz5iV4Sjll@amaterasu.local>
References: <20250324121645.208368-1-p.pisati@gmail.com>
 <20250324121645.208368-2-p.pisati@gmail.com>
 <CAMuHMdW8WUyUsjG4FaT4nP82pZYVFsUpYNOg2vsPPOthf-O49A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdW8WUyUsjG4FaT4nP82pZYVFsUpYNOg2vsPPOthf-O49A@mail.gmail.com>

On Mon, Mar 24, 2025 at 02:21:57PM +0100, Geert Uytterhoeven wrote:
> >
> > +               }
> > +               words++;
> > +       }
> > +
> > +       return words << 1;
> 
> This can be one more than buflen, when the latter is odd.
> Why not just return buflen instead?

I think "every" m68k pata driver is buggy in this regard, e.g. pata_buddha,
pata_gayle, pata_falcon, etc
And words++ can go too.

> > +
> > +       ata_port_desc(ap, "  cmd 0x%lx ctl 0x%lx", (unsigned long)base,
> > +                     (unsigned long)ap->ioaddr.ctl_addr);
> 
> These two printed addresses are virtual addresses.
> However, due to the use of a cast instead of ioremap(), they are identical.
> Still, I think it is better to print board + WARP_OFFSET_ATA and
> board + WARP_OFFSET_ATA + 0x1000 | (6UL << 2) instead.

Honestly i don't follow you here, but i'll ioremap() and send a v4.
-- 
bye,
p.
