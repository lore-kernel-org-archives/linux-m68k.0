Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E932556E
	for <linux-m68k@vger.kernel.org>; Wed, 18 Jun 2025 12:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750251267; cv=none; b=DB5Md8X63/ewjHw/8JuAx3C+K7ODpFog2/9KDMfthuYHNNYI8V0EHIO/zXEbcXhm1QxT47RCxOq6sEUrSFvn9H3ddupxYzWPWLjVsDaxFjdp8iavP30LbR8nko4PF62LH1fgfSFyX1+uWToESGA7m60LLdQTO3dQ6Vill05IlAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750251267; c=relaxed/simple;
	bh=qbHwiCoyLrmWizVPMxNJFDoLHCUT6RtDmSbLz2OyNRo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dNMxRMFOayj/OmCXQa1YEFC/XG1OrSLgw5KHTVF8oF/GmnZiqOHxWpOoeP9KtWash/hvnwuv9K45OvmJ40w//ddf0Qop/2m4qilr6ujy+iO5Llq6BY9o6tsBySXkbiy8Cexx3BKXlDXMwXu0CQR1zh2+nuFlcwxCi+2dRNygs0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-53159d11cecso2316003e0c.2
        for <linux-m68k@vger.kernel.org>; Wed, 18 Jun 2025 05:54:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750251263; x=1750856063;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5a2OXVV30FaGmcYioV6V2Pi5OsXOUc8B6DiAhsNDhWM=;
        b=pE397T7Y2xSpHe5dcz6c6D6CVGZlww9l1bYdMqGt9gQgABr24YPtYSOMm+jcVBv8gx
         7I3jSYYjHvnchkHS4N2Y56z3DLWLpCoLWlCG2eBY0ilYuCjIGvJ/25a5FSjemsaOZSMN
         fzSZetXutvyj7Us0dMpN8MomLX1lUs6WWKXsh1HvkQpaTEWYI6zD5Fh2UIyRyEd6rjg8
         Jmgw6Z2O/FfEEmMBd50hPuHT7JTQeyiu0z4DtZaLXO6/cwx7iHG9n2ePlcQkRWDn//IF
         lFBGq5eyrsnhiZovyErcRAh3gNYRTH3gHkPm5vpJj6CG7J/vv3lxQ5BBhBCiB/rw7qGT
         l5ww==
X-Forwarded-Encrypted: i=1; AJvYcCUNkU6aBHuMFOesZGtnzQ+ky70SHDpHPf0rzZ+0Hb8rTBRbYGD7o6HBhQ4+7fY5rr3UZqalNyDQY2ZL@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1joLtHC8IShivOzsGPQTIVZZgnw65oYPlqzna2v3eqKq8oInp
	xFwW3cL3Pqzagq34NkuoRSgkyR5wCG8QgtV1zxoRDqLbxDcNg+mtERJ1FgDEbnWC
X-Gm-Gg: ASbGncuUK9MiI+s3B83cwr8ZKIknvW8cVRGD1JDSSaageraxXch7vdgLgnP6YCBmUtl
	bCh6if9i7mnFC5PDoXGHMKaRGhNMX90aJJRXXM1fF0LCzC/KRSWYy5zSwGTgl+ckwPKrJvRUSIB
	Lx8H+o7uaXR6Qf0Nh/c35k7QonSjwyapGcK83iFVyQhQHYay2lCRIrIBC6RFvBcIsqqa7OqltIz
	oh+AS/B48+n+EbEODCwgdhXQAhurvjbSfap5hHsMbk2zy9QPrP/x0RpoI40kzFYPtzLYTfCLyuW
	x8mgHDJTh0jPAlnfRfW5PQnbqoqgxRq0EhrUGcFo62A4HJ1qk6c8WNq6sQCn2SSi+KF3X7by1K7
	WWOTszjZehkTLHcvEVKqHh/nm
X-Google-Smtp-Source: AGHT+IG2Civpmi9n05C/v0dF0Z+pKSkywWJGxY6PkF73JtHYmBSSznt7zEvn2d3z8VPa9zWukfosHQ==
X-Received: by 2002:a05:6122:4f87:b0:531:2906:752d with SMTP id 71dfb90a1353d-53149914bb1mr14091526e0c.11.1750251263474;
        Wed, 18 Jun 2025 05:54:23 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5319910042esm25457e0c.38.2025.06.18.05.54.22
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 05:54:22 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4c6cf5e4cd5so4847818137.2
        for <linux-m68k@vger.kernel.org>; Wed, 18 Jun 2025 05:54:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVhF3UASGorbhkgTVILGP3WXOMp/fp7+89y+8+2BcNr0GwErh8dhu//djBXhiNxuDqVJ/3XGk/WNd6J@vger.kernel.org
X-Received: by 2002:a05:6102:549e:b0:4e7:3e76:cd21 with SMTP id
 ada2fe7eead31-4e7f611aee7mr13007691137.9.1750251262267; Wed, 18 Jun 2025
 05:54:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
 <569d73fb-8ad5-46f0-bf4c-568919f319e7@helsinkinet.fi> <b2f74ffcd4c4a8aef248c21cd6deafcb92d86d37.camel@physik.fu-berlin.de>
 <022ab204-7be9-4f6a-a92f-2601fae1f146@vivier.eu> <5d8619dfe4134319b558684209f2b89c5c1447cf.camel@physik.fu-berlin.de>
 <889f54af-2317-ee51-cea5-47d813683944@linux-m68k.org> <5de0835e46f8c2479668fe5fe98f8e0d230cbfce.camel@physik.fu-berlin.de>
 <d3c2060c-f2ea-f80d-2462-d3dba29950c2@linux-m68k.org> <0b09dcea10c9bab4a50b2599ef8ac59b89f09b3e.camel@physik.fu-berlin.de>
 <8eb87c55-95c2-0c73-4941-6e8732266220@linux-m68k.org> <4c0581c5baccf73e96e53d755e70b57b23ba1da4.camel@physik.fu-berlin.de>
 <CAMuHMdWdDdoO9w9PvULL6+vVZs1Fn1boobgV9fO9OqpyhOsznQ@mail.gmail.com>
 <cebbe80cb85e004176ae2b566132d6d8e92e73db.camel@physik.fu-berlin.de>
 <CAMuHMdVuU1bsoUwXNkuUvxjb-F-YS325dEX+KPtY4FJPbtMUXw@mail.gmail.com>
 <29677f1e81b42c87926875109907485e41587883.camel@physik.fu-berlin.de>
 <38c670cc-6169-4720-a883-c34df26e1a4f@kernel.org> <6e0e0cf97b77d881b67916889d4b172c5bbdda00.camel@physik.fu-berlin.de>
In-Reply-To: <6e0e0cf97b77d881b67916889d4b172c5bbdda00.camel@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Jun 2025 14:54:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX7TS=ApEnQrcpGjyWY-mHrmE6zHYQLNh3CEdYS6c2UhA@mail.gmail.com>
X-Gm-Features: Ac12FXyAPEX-xE8ZdXh81qGS7mL063s3ksYWDm_5mV-cO-mrfHxICBoM3v93PXA
Message-ID: <CAMuHMdX7TS=ApEnQrcpGjyWY-mHrmE6zHYQLNh3CEdYS6c2UhA@mail.gmail.com>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Greg Ungerer <gerg@kernel.org>, port-m68k <port-m68k@netbsd.org>, 
	debian-68k <debian-68k@lists.debian.org>, linux-m68k <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Adrian,

On Wed, 18 Jun 2025 at 14:27, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On Wed, 2025-06-18 at 22:21 +1000, Greg Ungerer wrote:
> > > Could you please elaborate this a bit more, please?
> > >
> > > Coldfire is handled as a separate target via TARGET_COLDFIRE in GCC, so we
> > > would certainly be able to toggle the alignment settings independent of
> > > what's done on classic m68k.
> >
> > The net out is that it is the same gcc compiler, m68k-linux-gcc.
> > ColdFire just needs specific code generation via command line switches,
> > like -m5200 (or -m5206e or -m5307 or -mcfv4e, etc). This is the same way
> > you would specify 680x0 level - m68020, -m68030, etc.
>
> Yes, but there is a TARGET_COLDFIRE macro as I mentioned above which could
> be used to trigger which alignment to use by default. I don't see how that
> would complicate things.
>
> > The bulk of the instruction set is the same. Asm code will look totally
> > familiar to anyone who knows m68k :-)   One notable difference is that
> > there is a more limited set addressing modes for some instructions.
>
> True, but you won't be able to run any classic m68k binaries on ColdFire
> and the other way around, are you?

IIIRC if you use a proper subset of the user mode instructions, you
can create binaries that run on both.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
