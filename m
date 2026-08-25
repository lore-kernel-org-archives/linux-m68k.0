Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAEF3F86EE
	for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Aug 2026 09:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787651737; cv=none; b=R+WShj6GXlWgEuT1eZkc/6Vg8ezJqziFB3BQlWhiNkjo/obw1jpzXGqsNGNxrEA5IlMFWpyFZYPO9TAuqKQISValXprgUz6swheaceXC/81b+uAaxh2yfxEKYbBjOHkwSkfrdNjwvsAwqQjXY84D9rcMvTjA+W0f3JdVxfnS89Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787651737; c=relaxed/simple;
	bh=VQNIKVSkP/d6q2TEsIXAnz4jzolXjWU53VyPob9y6Q8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sBt0+nqG6gQETbgRzoxWUe5nz4zIKOnlo1Ox4LKqUAricwq0AW1+6BMzDdlZdEEZlY8ugTyOE7IHAQC0TisPNQF+HKf34XQWRUbrL+DJ/Q3Ym9v9XRti6AlmnDQIhp0A5Pge0bgE4WKAqTa37XS+Fu4r5ZEhh+K/i/IOEGawbe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-97bf90f4b41so2368481241.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Aug 2026 02:55:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787651735; x=1788256535;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1N+u2cW8WqOV5adenun2vzALvmH/BsdjcCtQthcuE8s=;
        b=mqbUHlJBXhmAWNnoNrsFBOaD5auHl1TuRsNgrMR1xtuWQQ9O2F/NnKkZAJFxGz9OSj
         xISNg1r9FSKZywyteB2C9A8zL7em24d0PZFE0EhRnJQz9hiMjdCA4ofnqadgyUU8BvHH
         hj1YVlcgfl+KGkqQ8/69TgaULzVgCSR0b9IKkflEkqtXB8Bli7waKpEZHkBJxoY86mQV
         cWFmtojyP0QObRLzZprp91wbvu0qVQh8LfPJOFRQeVsGsn9W3kLkd7KfyqGgKDs83PGY
         d1/igZ2/acD1x2RqDEf2ctt/eBxIM0a5U36O5/hhxUmm9e70y1Y1jfbwJrsZNtJvSqOm
         DAEA==
X-Forwarded-Encrypted: i=1; AHgh+RooQY8y0YpZgRG2Bt3MqdsZ4eswmJrNwI0d3MAZTJXP29Cq6K4g2L/UF6YfXJYAMHIx/mQ4yW/u3X3+@lists.linux-m68k.org
X-Gm-Message-State: AFuF++mGuvhSocpquatp0IiVelP5rAYgyjhYDYuT6dKq/4faTI7lSa2K
	kzhcgMmJgmzmFI7FGgSctGYB7uEb2XUYhEE41p+IZ6qd3oOkEMvVCO/yH+UrmUmWG6E=
X-Gm-Gg: AR+sD11BDzcoUwds9cnJyBtOXwxvef56WVsD1ELYHIHuzDHUUDa+9q02sgs//K93ycD
	+aE3PBULZXPMdXh196fZCIa5LVHDQCsaoKGKCs2JieKv05a32N5twNgBmWTbeDl58v2hOFlK9Zj
	yj8ZK/QoQxeFY/r22EOMvhQuL9IgIgiVQxauK/rvXfDh3f9Oa1iPxr6Iz3hsuQX7DqAPaQsc5Bs
	zo6A4oPpN6Cp1BufXiq2uQKQWpXBVY3v6jYQsbiWV4XeIEIYjgFZ7FsEbg2inUy9+x+qOOzw1I1
	cup+zoo3Ox2hcGFXHIj4AvXG1/iBjmzwoPGANEeV9y0SS3ju9BM9qbB6bMYXorCjd50heTTVYKQ
	XpwdBK/pkigG89I1k4+wvk6mwV+PBWB3pPLkxpNIjS3BJP8rx0D41Siy7dgMnvC0fg/CP4S+V2y
	tJpOLvr5ALseTbiAkbSMtpPfSPAR4SGyV4lcItPYbPFmy80/GoxG+iFGEtuXvSmGU+Gx2JfNdZW
	uIfAkUV2aTTycn8yBNGV8kZxg==
X-Received: by 2002:a05:6102:3e83:b0:77d:a614:19c2 with SMTP id ada2fe7eead31-77da61421c8mr6088752137.11.1787651734734;
        Tue, 25 Aug 2026 02:55:34 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97c836fa8bdsm10180698241.9.2026.08.25.02.55.34
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 02:55:34 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-973b676e5f5so2851126241.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Aug 2026 02:55:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoY3kLYkhg6DlSAbXEDqx4TQzdDJ9DftR43GoVyK8k3ZOO7Pz4WzNEKtoCFF60ScQUsb+2R0muw8jXC@lists.linux-m68k.org
X-Received: by 2002:a05:6102:3310:b0:778:f972:3235 with SMTP id
 ada2fe7eead31-77bd1e9b8f4mr9873841137.6.1787651734018; Tue, 25 Aug 2026
 02:55:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824153339.512487-1-p.pisati@gmail.com> <20260824153339.512487-2-p.pisati@gmail.com>
 <CAMuHMdVBjxXNX19k55Yu4D5GD1nkb31TuBJN0uFDqD9Oe5Gtsw@mail.gmail.com>
In-Reply-To: <CAMuHMdVBjxXNX19k55Yu4D5GD1nkb31TuBJN0uFDqD9Oe5Gtsw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 11:55:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWUbAiboKzk4=tM+zP0Ed2gL8uE4t1Qk+UATAhROo8RdA@mail.gmail.com>
X-Gm-Features: AcwNN1UwazRhwxmRVKo6H3UX9N4eSNyMk1PCYraN0L-8HZf4IVCWDlsXuYI1QEk
Message-ID: <CAMuHMdWUbAiboKzk4=tM+zP0Ed2gL8uE4t1Qk+UATAhROo8RdA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] ata: pata_cswarp: Add Amiga cslab ata support
To: Paolo Pisati <p.pisati@gmail.com>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, linux-ide@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Paolo,

On Tue, 25 Aug 2026 at 09:53, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, 24 Aug 2026 at 17:33, Paolo Pisati <p.pisati@gmail.com> wrote:
> > Driver for the on-board IDE interface on CS-Lab Warp Expansion Card
> > (NOTE that idemode=native has to be set in Warp Configuration)
> >
> > Assisted-by: Claude_Code:claude-opus-5
> > Signed-off-by: Paolo Pisati <p.pisati@gmail.com>

> > --- /dev/null
> > +++ b/drivers/ata/pata_cswarp.c

> > +static const struct zorro_device_id pata_cswarp_zorro_tbl[] = {
> > +       { ZORRO_PROD_CSLAB_WARP_1260, 0},

FTR, this doesn't build anymore.
You also should include <linux/device-id/zorro.h>.

> > +       { 0 }
>
> Please use named initializers, and drop unneeded zeroes, like Uwe
> just did in all existing Zorro drivers:
>
>     { .id = ZORRO_PROD_CSLAB_WARP_1260 },
>     { }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
