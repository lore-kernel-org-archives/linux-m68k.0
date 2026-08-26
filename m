Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7973F37B01E
	for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Aug 2026 08:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787734516; cv=none; b=j8juOMtyuZeYpkTnek0JXMl2Jrmow/ulKHxcKEXhtBxG2JM1VQQ7EsnJ4AkPDNxUoeBDUDEdZ21K9uySJRFfgEfIj/qwYpwWZrlqiLADUPanfDoWiwVlHLkUVPXNBNuNqgeQlxDxPFI+eAaqRjN+MB5benfib61rk4ToJZtp0DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787734516; c=relaxed/simple;
	bh=O8GKQKz28ZNgMu7z5Eem7Zdo5G+exwtTeHN9QNCrjiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qok9Tdkl0V8dzTNexslY0uK62++5MpxzjkxXvJRGzv4tV/h4V6lhLlSZewECBAJxywAj8QXg6G9BVRoxtHH9qaG9089mZSijo5We39xPYdrgahpyKjpOdszwOmVWNyY4vDY9YPK/lSVkPFXVFRilhYMvm1ZaapUOhNPPw60DrVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NlWHyt4q; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NlWHyt4q"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a156627e22so3383859a12.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Aug 2026 01:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787734512; x=1788339312; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2+CsASGyH2xOZDi3fuDOU1Hvcxr+b3Bmf36364fbVag=;
        b=NlWHyt4qS8aXMlAUqW+FrsScRgj2TMI0V1NsbChZKder5WOnxlGP731Z244x3maydf
         MgT7dBXk+IEsRr9DCGkP4OxpfByNr9Yag63sod77KxfZRiCB1kMFRNxYm02Ty0euL97O
         e7SBzPEP5X1RGttY9zo279mjgI4jHXWekLvr1IVzi/aVfgUx0en2GhFTaF8F6118aeFv
         YVa0lSSHEJPNpRHidKnedSZcNfQjdRuiQ0GVQne1JQNoxBBO0MiC2j90XS5uO+/HQkqw
         Xq94zNzk8TMV6N9AQNac8OJMpjkN7UHhnLfp58lpyuuMZC+OXYKwsn4hwvdlUIy8EcCJ
         nXkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787734512; x=1788339312;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2+CsASGyH2xOZDi3fuDOU1Hvcxr+b3Bmf36364fbVag=;
        b=R47soL56JXT8VlFPfavZ2lPcws36H6ysgd8Q6spkDAbHwWWjUBgahgLFo6Er6v92O8
         xy3X6dB+XQt8ZW5RDbWGWv4OtJH5oz8cjooksIgsZaMEEE/46OMIbIcKKfVEqn7gqiuB
         DdjBpyYIFCwasOo9fyY2JCtoVFehGxO2WZW38gbPjCzvnwp6itKMiuTL8rULZkQVcpYV
         MX1icQtmkD1FAivJHnINSsJIyXAsGUeiIo+PNqC/PfG7PYXktR3mZqrQ189Pq8vXYnQ9
         E2dzEFeQ+SzzLDH2EVgk+ZNm2W/X4y/p3s3vMAcLu8UdQsCuC6YnGDzz11rdAcpzO5kg
         JrOg==
X-Forwarded-Encrypted: i=1; AHgh+RoP0v8MaIxiRM7D4gYCifbN5R8obAYtbAu54E853Szw+sTF0mPxr2gHPjfq+ISVu4jHIllGQUWmDnMn@lists.linux-m68k.org
X-Gm-Message-State: AFuF++moWheYAFWxEE/UGqTSGGrV/UonBrxxRyUcSDbCM95DqnUGylW0
	wUWlOCQWisjUxhZd3DkMy9HjPDG8ZSYzq73VkenM1NB+VT4qZ/IQHZz8
X-Gm-Gg: AR+sD13h2yPvWE18SBFXRDCuy6qNrDlj5y2hD6FE+sieiPaKhBs5lrPMxNlgB5M6pMS
	veI3Ffg1kdD+Nu0/X2Z3cYXB5bHXG8sMpDX/vbfzxferJYK3xENCgCfszg6akpBP62tORVuvC4S
	zUNhjBKcO1ZTIB4ZnliaS1nd73aDM4ihQPPc3pEkmILMfDVbmDjkkipLIVyh8kLBPo4CbuCNr1P
	XqK/Xdv/kI789VO46HVnABh72/YM39imTVSTBQC/fYTJHMvb4y0xkZHoqAsg8KOqOVH1im6zklI
	LcjBmr3Cvw23t/5afp3p0A2y6kSQzutMqAjFHsed8s4dWikd+WrblouUrEhv5s+yMY+IKVFpIyl
	m2PakPHCyxy57gOhmHttdRDQka6xh3X5Emh/WR7WKXUw/AaNI7r71yUawmxuAZ3BpgfPnLvelF9
	Br3ZWBAZRk2ejyNG0+yTpyp66S9Qe7FLeZiQaaxOLKlrAWsyqYDwt3iuq5QSYu0AKzlhrmg54bx
	fBOhklIrzeL1LriJArrrLDGUSPqb/ds46TqhFyqUTlfLUE=
X-Received: by 2002:a05:6402:a5d1:10b0:6a5:dfb6:360c with SMTP id 4fb4d7f45d1cf-6a5dfb63743mr3614000a12.2.1787734511805;
        Wed, 26 Aug 2026 01:55:11 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:78ce:12f6:160d:28db])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5de8b641fsm3643120a12.3.2026.08.26.01.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 01:55:11 -0700 (PDT)
Date: Wed, 26 Aug 2026 10:55:10 +0200
From: Paolo Pisati <p.pisati@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paolo Pisati <p.pisati@gmail.com>, Damien Le Moal <dlemoal@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, linux-ide@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] ata: pata_cswarp: Add Amiga cslab ata support
Message-ID: <gsfi4glv5fnwzwdw3sm7r2evfwn7gl6xqzjvslxwghdfxvreeu@i6s3xc65iple>
References: <20260824153339.512487-1-p.pisati@gmail.com>
 <20260824153339.512487-2-p.pisati@gmail.com>
 <CAMuHMdVBjxXNX19k55Yu4D5GD1nkb31TuBJN0uFDqD9Oe5Gtsw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVBjxXNX19k55Yu4D5GD1nkb31TuBJN0uFDqD9Oe5Gtsw@mail.gmail.com>

On Tue, Aug 25, 2026 at 09:53:18AM +0200, Geert Uytterhoeven wrote:
> > +static unsigned int pata_cswarp_data_xfer(struct ata_queued_cmd *qc,
> > +                                         unsigned char *buf,
> > +                                         unsigned int buflen, int rw)
> > +{
> > +       struct ata_device *dev = qc->dev;
> > +       struct ata_port *ap = dev->link->ap;
> > +       void __iomem *data_addr = ap->ioaddr.data_addr;
> > +       unsigned int words = buflen >> 1;
> > +       u16 *buf16 = (u16 *)buf;
> > +
> > +       /* Transfer multiple of 2 bytes */
> > +       if (rw == READ)
> > +               raw_insw(data_addr, buf16, words);
> > +       else
> > +               raw_outsw(data_addr, buf16, words);
> > +
> > +       /* Transfer trailing byte, if any. */
> > +       if (unlikely(buflen & 0x01)) {
> > +               if (rw == READ)
> > +                       buf[buflen - 1] = raw_inw(data_addr) >> 8;
> > +               else
> > +                       raw_outw(buf[buflen - 1] << 8, data_addr);
> > +               words++;
> > +       }
> > +
> > +       return words << 1;
> 
> This may be one less than the actual number of bytes
> Why not buflen?

Cause every other driver (e.g. buddha, falcon, gayle, etc) is actually returning
words << 1: i think we are returning the "whole number of bytes" read
from the bus/ATA register here, or at least that's how i understood it.

Anyhow, thanks for the review, i'll send a V6 addressing all comments.
-- 
bye,
p.
