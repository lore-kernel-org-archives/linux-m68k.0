Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC6026A0F6
	for <linux-m68k@vger.kernel.org>; Tue, 20 May 2025 10:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747735797; cv=none; b=aopuFihYafMOZyuO2r24mrZd0tgpi55mbDE0yXrjJvzHOK/S47rprqYrFoILa3tT/Qy+OENToKKWIz3g94lf7XEHhyB/JSAWQvDCHXIwtIja+lwIuGVYs+IZb5HyGweD6dsMB9rFyMJW2dt1C6u1VLMhy/5rjRCO/20d1+voF1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747735797; c=relaxed/simple;
	bh=P6wAemrbmxRlLxoqUZL65cRxMmjxVwofapOjLNxeuAE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sJNSCrXAhDwKV3NJgHAIIrAD5BhuPphkBIpdmKUuccXBaZazfjxKuf2XKz7SYBG1HOvPtUM1xJezgmuGsdldsc8kduFvyokEZ2r4Smsmil3pL46B22BY0deLyX7HfK3UWqlMXxfLMKTwhS3By/6Tf2XjkBe8rS+zXa49m658Wvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-86d6fd581f4so4027646241.1
        for <linux-m68k@vger.kernel.org>; Tue, 20 May 2025 03:09:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747735793; x=1748340593;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7RqrEhY762EqzHULWi5N0U2Krr+HHKrL75MleSBzGx0=;
        b=VX/4rxChwEXOrqUSdeZHFY0GNqkJCcg/Bi6dqfQ6wXk8xVPjaDT+rqrx/IRQNY9PsI
         FQzxiL9ILoPml+Fxw1HhlBZ+08rP8FpUJFHlHeX3Kf0vdKCAL8GrjVX182+8WkNRAug9
         YTR4ZU+KCHWFZIC7FUxghdsZCdvMw4DPRitmIVXbgm1kgzG4tx6CloO9vlry8VBXkAzv
         zAG9vsFjPX4dCda2Ri5i3NYYeVLVv6qN/+48qnVL/lxlOrbEaCxBDTztoF3HJw+0ocRj
         cBMyRwDnMf7U7NAIcBuSoXn1dKvKVN6+RYKRdhlVA+z3RUQ32ajx9t/U+hgthR3Q3bvB
         /mYg==
X-Forwarded-Encrypted: i=1; AJvYcCV/eFk3ZEfvMjYL/y4zNKgIkG7F6QzH8bTt1c3Mx2CTY2v7w2xuV1rQnLgSNmw3THYD3lWqA93bR4B3@vger.kernel.org
X-Gm-Message-State: AOJu0YzIl5D78rqHW8BaXb5xfykjadsjw/4eUkulONPGLTKyB1/OAx1s
	u2r7y8Dns8RmUdtqdj5uyjEBS+m+z2uz/zhqULcTenifkQ0ecit3UnnWqMrPdvpY
X-Gm-Gg: ASbGncusM0Boxdon3/7+FxgKtomrcWqxNa5n/cyfAOXso7vYOaYJURu2Xz8tO/9pzUQ
	GLp5QYnhxeguKGo3KmYJOkpCsn5un26Q2+CKVonPnGiIozRZkv7Vc3Y4QO70ucwybBCF2ctijDn
	J97gSSxuBZrDNBxvIHB92179CQXzrCeiZNW0ZWtH8eDXNDYWuRyqPb8+UhbptFALDcU4KT7xQuQ
	EzgD3q85XlLZhJx8KWAfIp6DBHwmw1LZNHAwpGsp4CMfr9u6Ns1iGRlUZq0RNWAwMCgZ6azT2hl
	2FGYT4TvgyOuwIFhk1C2ztbRiNWZ9+exQXHFM/SyUh4xG5WiNjIGuCXa7ztMOMT0HcTv0ha27eE
	8T4kR4FRgKHDQaw==
X-Google-Smtp-Source: AGHT+IEl+7sbwPOWZndsfmBpWbsyMmjuOmzGWErx+Qy6CJbdk52vGX3S2tB5cQmmMaFn+voWU2Xg/Q==
X-Received: by 2002:a05:6122:4d04:b0:520:4806:a422 with SMTP id 71dfb90a1353d-52dbb5c322bmr12877119e0c.3.1747735792856;
        Tue, 20 May 2025 03:09:52 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dba910a60sm8279956e0c.9.2025.05.20.03.09.52
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 03:09:52 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4e2adabc828so269549137.0
        for <linux-m68k@vger.kernel.org>; Tue, 20 May 2025 03:09:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVPVZ4PDb4W72QIivMkK013u9jL754FpFDHKDJ83EtosiUs003Jq3Wi6O5Myk3yesKZWQsnH/HDsDjG@vger.kernel.org
X-Received: by 2002:a05:6102:3052:b0:4e1:ec70:536 with SMTP id
 ada2fe7eead31-4e1ec700665mr7135960137.4.1747735791778; Tue, 20 May 2025
 03:09:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
 <08ce465732a0eb0dce550978c98ef822abba5f96.camel@physik.fu-berlin.de>
 <8734d1kofn.fsf@oldenburg.str.redhat.com> <f1f9bcd9fe3823935e747748f09bcf88cfc4d947.camel@physik.fu-berlin.de>
 <3388daa5-8129-e78d-d4bc-d7696cd3a30f@linux-m68k.org> <1ceb208498c53cf8db2acf746a4649f1eaea1457.camel@physik.fu-berlin.de>
 <CAMuHMdWMJKbd-Nfe6yWc_XE56KFmffnJ3T9AhNgUZ4=m9UGSeA@mail.gmail.com>
 <224e0eddab2deb8579e023e5bfc739e7151115d4.camel@physik.fu-berlin.de>
 <CAMuHMdWVjDGYW2SerNV5ov6jX1pPNw_j1=qpawBCJph18_SE2w@mail.gmail.com> <5c9c0b3487a84f5409ea2a83cecaf06c601b51d5.camel@physik.fu-berlin.de>
In-Reply-To: <5c9c0b3487a84f5409ea2a83cecaf06c601b51d5.camel@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 May 2025 12:09:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWL_VpjR-fL6+iSPET420cUiud-st9mr5TJFB5kB4VieA@mail.gmail.com>
X-Gm-Features: AX0GCFvg3DpJ67Jz5DYAVwj5PraafLpThok9deK5l9rZPtzlBnmwJGpKuilrD5U
Message-ID: <CAMuHMdWL_VpjR-fL6+iSPET420cUiud-st9mr5TJFB5kB4VieA@mail.gmail.com>
Subject: Re: Tuple and changes for m68k with -malign-int
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Finn Thain <fthain@linux-m68k.org>, Florian Weimer <fweimer@redhat.com>, 
	James Le Cuirot <chewi@aura-online.co.uk>, debian-68k <debian-68k@lists.debian.org>, 
	linux-m68k <linux-m68k@vger.kernel.org>, Libc-help <libc-help@sourceware.org>
Content-Type: text/plain; charset="UTF-8"

Hi Adrian,

On Tue, 20 May 2025 at 12:05, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On Tue, 2025-05-20 at 11:58 +0200, Geert Uytterhoeven wrote:
> > On Tue, 20 May 2025 at 10:38, John Paul Adrian Glaubitz
> > <glaubitz@physik.fu-berlin.de> wrote:
> > > And I also don't understand why this is even an issue. If someone insists
> > > on using 2 bytes alignment, just stick to your old chroot. If you're not
> >
> > What about kernel/userland compatibility?
>
> What about it? This is about userland.

So you don't change the syscall/ioctl/... ABI?

> > > interested in new, "fancy" packages, just don't upgrade or install Debian
> > > Etch or similar. Changing the default alignment does not affect existing
> > > software.
> >
> > What about existing software that is aware the minimum alignment is
> > 2-bytes on m68k?
>
> Can you name some cases? I would love to add these to my list.

Unfortunately not.
Grepping for __mc68000__ may find some.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
