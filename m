Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79094432FD
	for <linux-m68k@lists.linux-m68k.org>; Mon,  7 Sep 2026 08:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770347; cv=none; b=st5BJt7U2t5Ql2tRnL1j88//AbMWqbCnMhyIq8h1niD2ocgV/ZXcb3Epd80FQ1WEMj+unjYSfA7CiaUdqgDd0CVrVAS7D5iyZK12WIXl2nUB6yhEzsELyVqWaQlC+9tIisDgzJyLiLdFbKdntNsqi2ldt70KJiz6L+rgTRCQgE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770347; c=relaxed/simple;
	bh=Tm/d84wF7MfOvBgEC1xVi9lvNiCMRhmX1lrFGxn/CV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LkxxmQEaHOVewa4QciFm5VjAvzMpd0QpWrM+DuEOAjBh91LM6Jrs9GviK7KtWqwVAaGCdV+8Acg34X6JcaW6FTzqepxTNp2E7lGgXziy+37qZGrhw7XTr8kthsGN4nyMd/L1w8reEqujtG7wlzXpsU9k5iORNWyATWjzelhCOno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-782c22fbb1cso901033137.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 07 Sep 2026 01:39:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770343; x=1789375143;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2br8BvQg9DJFd3H4ITYFtxQrEUyvo1i3TJw/l6L1bw4=;
        b=lox9XYrSbPqUE3nSkKPODb7Ox0jYSL/InpvsJDGY1c3oXnvAJA+vBjvi8YFApguzam
         Ywx2zwTZdQ7DyFT5BWhml7B27XGnzL+ZXa/KMO03LQV0CdzWzm40BNv1xkIi/WescIsd
         gabVaSzmpchuH/Ufu2lSeCJwnIpNpxUMH87mg/EDdH5tp2e7OSkH+PutLU0qbWhpbSZ+
         A0VIuUl0piP14Mg7A5oQ+v4sg5vwRkrAFzcWqlWvbldwh8FTdOqLr3UYLYmd9DiZm2RH
         qFNV9YnjqrNN3WxcwJCpU1c4iZfxzDxfaivBZp0RVlJKXwhe0eQF1kEBcRTaoR+vdvuI
         x9Ng==
X-Forwarded-Encrypted: i=1; AKwUvByrWEtSmjrN7coNz8yw8OF2VU4BRQw9aKyyykIUBRQ649X2ZGPBOFKyAx+U/5iGFpib0X9jNIhpgMgc@lists.linux-m68k.org
X-Gm-Message-State: AFuF++kPax2XgWhGOllriVbzHytXeDhoNl0/xQdCVUUTsn2dAdikXtcp
	3qCugx9BZqtkRnP4Yy1IxkU411I/fYoPTrbSVrbYCWp3uoo5HROUiJHbyPRQWx/Z
X-Gm-Gg: AYBFou2BERKB6qbt9oLkzH8zcDmoMHRTGZJLi9F+8sP+PIKKA/aNoWIVn7j+dt4skd/
	n3scOypDSFWrrLb/aY4ZGtX/upx0Ze4jBEQDDE+jNgZWsLw/plEhnaughbLNLXxlcbzJyMs8Fa7
	aBAO8vlwnrYrLvhWuI46LksmdezXHmRkwpD9fzyXggYKI+0rCMbjXftik/GaT+i8RsxGTte7rHI
	Uweu18QuB/Oz77sHOOFDtXnYZlKaW6Wmk0neb0txGR8rwrWWJcaQnmSmuUd1CFH9YIO74R6WTHv
	7BbUKQejA4ncaWPdHNbtNsl7OgxZ9Z4QcJargpIWKq9slq+fUonqDVQm9h64moThlxqkFP96mw4
	bTf76U0HgZpMjOw5s8wLGQ8jox1e7I9BW9wmnfopEGYObxtwKWD6mFwb5MtvwHB/cTBXxcafvBX
	lGe0dBXNAYAIn5WYBZ59P50dWPrBHwsgPfOxOu5jLZMmlAmrcia6ZdSv8e/HQwMpetBs+ReuKzH
	ueyPQbtVTnvTQuUDmsn1dRNag==
X-Received: by 2002:a05:6102:38c7:b0:777:4e99:6f84 with SMTP id ada2fe7eead31-78a4a727bccmr6806602137.1.1788770343353;
        Mon, 07 Sep 2026 01:39:03 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808ee8039csm6979494241.11.2026.09.07.01.39.00
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 01:39:00 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-74ab6c88052so925996137.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 07 Sep 2026 01:39:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxItPdftRyQ6f6Z00pm4/uMIfwnhbVKZGUdzEMXaqwUautInjq1NL6hubcHVXWQhHW4A8f93erZYqtB@lists.linux-m68k.org
X-Received: by 2002:a05:6102:6d6:b0:737:783d:1916 with SMTP id
 ada2fe7eead31-78a4aa56803mr7111444137.11.1788770340448; Mon, 07 Sep 2026
 01:39:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827093948.2825531-1-lilinmao@kylinos.cn> <e4a2ba2e-c533-04d8-0795-e3d43caf47b9@gmail.com>
In-Reply-To: <e4a2ba2e-c533-04d8-0795-e3d43caf47b9@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Sep 2026 10:38:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVOc-_hgWvu84EW7tyQx6WzPtabnBUJ1T0uoxa1QZA94Q@mail.gmail.com>
X-Gm-Features: AcwNN1Wp_1PImUP-cNgneasiw6HMISUs78c56UfOAI5vNGTS0l_4VrpE9irLY4c
Message-ID: <CAMuHMdVOc-_hgWvu84EW7tyQx6WzPtabnBUJ1T0uoxa1QZA94Q@mail.gmail.com>
Subject: Re: [PATCH] fbdev: atafb: Restrict SuperBlitter to supported formats
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Linmao Li <lilinmao@kylinos.cn>, deller@gmx.de, linux-fbdev@vger.kernel.org, 
	miro.kropacek@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"

Hi Michael,

CC linux-m68k

On Sun, 6 Sept 2026 at 03:49, Michael Schmitz <schmitzmic@gmail.com> wrote:
> Am 27.08.2026 um 21:39 schrieb Linmao Li:
> > The SuperBlitter operations derive an integer byte count per pixel.  The
> > accelerated fill path handles only one-, two- and four-byte pixels.
> > However, the operations are currently installed for every external
> > framebuffer in SuperVidel RAM, including planar 1/2/4/8-bpp and 24-bpp
> > truecolor modes accepted by the external video parser.
> >
> > For 1/2/4-bpp modes, the byte count becomes zero, so accelerated copies do
> > nothing and fills fall through to 32-bit stores.  Planar 8-bpp uses an
> > incompatible memory layout.  For 24-bpp modes, fills also use 32-bit stores
> > despite advancing addresses by three bytes per pixel.  These cases can
> > corrupt the framebuffer beyond the requested rectangle.
>
> I believe 24 bpp mode can be rescued using something like this (entirely
> untested):
>
> --- a/drivers/video/fbdev/atafb.c
> +++ b/drivers/video/fbdev/atafb.c
> @@ -2463,6 +2463,11 @@ static void svblit_fillrect(struct fb_info *info,
>          case 2:
>                  memset16((u16 *)line, pix, rect->width);
>                  break;
> +       case 3:
> +               memset(line, pix, ((rect->width * bytespp) % 4));
> +               line += ((rect->width * bytespp) % 4);
> +               memset32((u32 *)line, pix, (rect->width * bytespp) / 4);

This uses unaligned writes for the largest part.
You can avoid that by doing the memset32() first.

> +               break;
>          default:
>                  memset32((u32 *)line, pix, rect->width);
>                  break;
>
> Can't test this on hardware, and would need Miro to confirm it works as
> intended.
>
> >
> > Enable the SuperBlitter operations only for the layouts they implement:
> > 8-bpp packed pixels and 16/32-bpp truecolor.  Keep the existing software
> > operations for all other external formats.
> >
> > Fixes: d463633d63e6 ("fbdev: atafb: Add support for SuperVidel's SuperBlitter")
> > Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
> > ---
> >  drivers/video/fbdev/atafb.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/video/fbdev/atafb.c b/drivers/video/fbdev/atafb.c
> > index 5bca34c45cef3..c3011b61a94b9 100644
> > --- a/drivers/video/fbdev/atafb.c
> > +++ b/drivers/video/fbdev/atafb.c
> > @@ -3360,7 +3360,11 @@ static int __init atafb_probe(struct platform_device *pdev)
> >               memset (screen_base, 0, external_len);
> >
> >               /* framebuffer in SV RAM: enable the SuperBlitter */
> > -             if (external_addr >= 0xa0000000) {
> > +             if (external_addr >= 0xa0000000 &&
> > +                 ((external_pmode == FB_TYPE_PACKED_PIXELS &&
> > +                   external_depth == 8) ||
> > +                  (external_pmode == -1 &&
> > +                   (external_depth == 16 || external_depth == 32)))) {
> >                       svblit_regs = ioremap(SVBLIT_REGS_PHYS, 0x100);
> >                       if (svblit_regs) {
> >                               svblit_fw = svblit_rd(SVBLIT_VERSION) & 0x1ff;
> >
>
> Otherwise, LGTM.
>
> @Geert: can you remember if pixel format or bit depth of an external
> framebuffer can be changed at runtime using fbset??

I am no Atari expert, but IIRC all external framebuffers rely on
being fully set-up before Linux boots?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
