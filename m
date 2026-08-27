Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C11D35CB81
	for <linux-m68k@lists.linux-m68k.org>; Thu, 27 Aug 2026 07:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787815769; cv=none; b=GLaQRa64zC+wTPiilYjKjcxXgtOM7muzFa3OumckfRTj3JrJp53GUsGS0YzYlGnusj4YWMurC8bPA+PagbC5Zd61PwwoiyCktv8gIm2qgq4hyDCTZT6r1Eum321C0rwJojqXwAN6jKxViAiPlBcRZ6/sV3h6inIp8SOnaQq++o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787815769; c=relaxed/simple;
	bh=mP+PND9MZnfOzg3J+drMZ/8E/kF9YudaTPVbTh6JzI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=esyf6BU1tROufjNrZepQ5bHOxd/mU58/GJdCoaQJZiEL8FgGiIIbU8x3ILieyTj9lCz8caieUp9/Q31kFRqz1arDQa6Icv8IDF1EsG3xEWiZYvNvZ7JA8dV7ujrcgSxUFCWiF4Gv45BqrYgJ1nlGXtrs5YDhryGtWIEtln3P028=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5bfc54558d5so697268e0c.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 27 Aug 2026 00:29:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787815767; x=1788420567;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=A0FUFGzTaYR2pVts5J1GWb7YxO4YjT4Q+LUng3iGalw=;
        b=AI+e8rvJsslN8kKgjIqHDyBNOOmR0OI6vxjObcKjPY85oGj2yJnoOjWG4PqQmY/jAH
         nrjh/Ocjan0u7954vdWIyqhqxZs8zEsFxOFd831t1DV04+afWJlggi8YWHFV6J9jrKsK
         tP2IQUPs5rPQ5O2oPhwd7kfDXb+SNEz8Q7abTz7iefte+FXPZ9VhPLoIetBLyom1WlKo
         itoaXnfC77DjJZs2jlg1asS9zYG0SMriEk/D0+3HMPtPciVJ9fA1wROpqIC5u6ZnhoWB
         wIhmWcrNUT2TiML+8mI6NcOhUGnw7za1UjHzWjkh6XP+Tq8Hp9TpcdB5ntBPsz7Zejz4
         j01Q==
X-Forwarded-Encrypted: i=1; AHgh+RqQImo8lgCruTImkwUo6cxcIvRnOyyTd5ewsW953kWCEJOFGYu1mJviV1g7HhOfux9RDLnOLXbudxvy@lists.linux-m68k.org
X-Gm-Message-State: AFuF++lqWjLtCR+Hd9oN2H9hBtcOsMeXkRxjq46JGmVqfnsDR54Ijy9w
	REd64uwjiKeEDa2P1cYr0FxEjZBOVnPKDV0VLnnPsLVEIDcI0pXKAQcRWiHgaOE+
X-Gm-Gg: AR+sD12Ph6M2CUyMVcTFgRYAaOfG8hg2vevJ5GEX1uMOX7PYherI/jHMCMWqwTtCRFs
	KlqbeTeGHO7q9++kn2F9WiQlwRCaH7Z2gNLDDRTEevuSXikh3mfkADOPLBBZhXf9DMaGdLZNtII
	zj0DLJs78jMLdxz57MPTnfPdJPDDyMKIxcZMjPckhAJnyoRM3J540+En69SSzt8EO4S3DEWe25N
	kXDAYWuu1WI4/Kr/U1+0wSaiuX7XDKQvwu1dhs97jVCRLO58crKIr2Kl4XWkt0ldssrYGvwzpl+
	oeDsLo+byzc3/26xEwSgTMNs0dFD4yvH5mmU0RxCS3b3OVXm7pxdHxb43jiTxH4TwBH+PoA6y5Y
	ql6fEWfFcOwPBnGQqroh6iHOVlBG2mdPc+T8cjaBM8a4FzyD1sOazelz4tnUw3763THfrCBKCLN
	vVGOqUBXZjWyOXtbDUhs8zUamKCX2t7SOIG6jjbZr3sI1aFgpivG3m7U0D43XPW1JrZMUia+wOd
	c96ihBQrJfbg9oESaQ5vYnlFA==
X-Received: by 2002:a05:6122:d22:b0:5c6:65e5:99a8 with SMTP id 71dfb90a1353d-5c66e70fbcamr1373932e0c.3.1787815766779;
        Thu, 27 Aug 2026 00:29:26 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97cbe084292sm4025456241.3.2026.08.27.00.29.26
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 00:29:26 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-97cc700fcf5so521135241.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 27 Aug 2026 00:29:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqf1dtQQK0ptSdEVcRdbe/HHskUJSUlDRl5bO7QT/Z5+NbDzii4XNOAbDFhprc2ytHb3r8B48aEnyMy@lists.linux-m68k.org
X-Received: by 2002:a05:6102:2253:b0:783:c17c:e7de with SMTP id
 ada2fe7eead31-7841d55ca7bmr886817137.9.1787815766141; Thu, 27 Aug 2026
 00:29:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824153339.512487-1-p.pisati@gmail.com> <20260824153339.512487-2-p.pisati@gmail.com>
 <CAMuHMdVBjxXNX19k55Yu4D5GD1nkb31TuBJN0uFDqD9Oe5Gtsw@mail.gmail.com> <b010c98c-ecd5-439c-b07d-3efad26de7f2@gmail.com>
In-Reply-To: <b010c98c-ecd5-439c-b07d-3efad26de7f2@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Aug 2026 09:29:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVqu-ayQYeJTsA8LoAX-=hP1nVJRJDv0ovOM+D3eLxhnA@mail.gmail.com>
X-Gm-Features: AcwNN1WfBH6kKUpC9SplHRabqGM1MYPdaAcm9zslNQlogkHifqiVLaGwh4s0nUM
Message-ID: <CAMuHMdVqu-ayQYeJTsA8LoAX-=hP1nVJRJDv0ovOM+D3eLxhnA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] ata: pata_cswarp: Add Amiga cslab ata support
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Paolo Pisati <p.pisati@gmail.com>, Damien Le Moal <dlemoal@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, linux-ide@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Michael,

On Wed, 26 Aug 2026 at 21:31, Michael Schmitz <schmitzmic@gmail.com> wrote:
> On 25/08/26 19:53, Geert Uytterhoeven wrote:
> >> +static unsigned int pata_cswarp_data_xfer(struct ata_queued_cmd *qc,
> >> +                                         unsigned char *buf,
> >> +                                         unsigned int buflen, int rw)
> >> +{
> >> +       struct ata_device *dev = qc->dev;
> >> +       struct ata_port *ap = dev->link->ap;
> >> +       void __iomem *data_addr = ap->ioaddr.data_addr;
> >> +       unsigned int words = buflen >> 1;
> >> +       u16 *buf16 = (u16 *)buf;
> >> +
> >> +       /* Transfer multiple of 2 bytes */
> >> +       if (rw == READ)
> >> +               raw_insw(data_addr, buf16, words);
> >> +       else
> >> +               raw_outsw(data_addr, buf16, words);
> >> +
> >> +       /* Transfer trailing byte, if any. */
> >> +       if (unlikely(buflen & 0x01)) {
> >> +               if (rw == READ)
> >> +                       buf[buflen - 1] = raw_inw(data_addr) >> 8;
> >> +               else
> >> +                       raw_outw(buf[buflen - 1] << 8, data_addr);
> >> +               words++;
> >> +       }
> >> +
> >> +       return words << 1;
> > This may be one less than the actual number of bytes
> > Why not buflen?
> >
> words = buflen >> 1;
>
> followed by
>
> if (buflen & 0x01) words++;
>
> makes 'words' the correct (i.e. rounded upwards if buflen was odd)
> number of words transferred.

Thanks, I had completely missed that increment.

> The return value is then either correct, or one larger than the actual
> number of bytes?
>
> I believe the template for these functions was
> drivers/ata/libata-sff.c:ata_sff_data_xfer() which follows the exact
> same logic.

Then Life's Good ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
