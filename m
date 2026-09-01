Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50CE4766BC
	for <linux-m68k@lists.linux-m68k.org>; Tue,  1 Sep 2026 09:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788253835; cv=none; b=UR9umMYvpSwXE75/ZonQPZq7CBIrUD9v1xTzvjOjz5+hqnvbixayAKF9eK2PJn2ZqMFFxqnCzhnGKJIeIPKtaNxl0Cp10jF9Vmpx7moWEIMyhFl2rsIDAkhU0T4DheqOiJEmTb6Xqc9+ddSRj7K52zQ26khvt5Llh1heOIJ3DT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788253835; c=relaxed/simple;
	bh=MbIyWVV1fDEvUhmmiJrRl8bgUScodrVy2todr24b9xg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YzdmU8xUAMZVFOwIxH3auGCujsKz6MAyz5aehdKxHMzx+RbfbgekPoHG4M8lDr8h7DLd6Hqi1XwZo3ggFDWxi32BkxgS7I1cbudASo/Pj/5q+X0hhBNRKGxTlIXJtPxSAzO9EX1HxAqAKMNF0KQq5kBNAIo45vWvi/lSmYQqH0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-977258a75d9so2734843241.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 01 Sep 2026 02:10:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788253825; x=1788858625;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FAHBVIqCMd7JP6CfhiZjkc1474N3IhXqUrk37KgzKlc=;
        b=Gj/qf5vHZpJroldw5MbLtCZxOL8lDcrLPGFsDzsvuEMl2sPYoMlsB9VqUSzQ27ll2P
         y2GfxfXV9KCBrcPZGxq7C4kzNUz9tRGsJilJDao1euu1joOV1o4ZsgqSK4Cn5ZbAehgT
         71dXzyiYwUf0OTjdug/6Q5ct6dK6hykW0jSihmvHTdo7k12WeLO7ECFOUjOiC9oXPNux
         rNjPFepOGQpJlLKLjBniixbF8952MUMx+MTflM40PgOHOgzzsWz2cRcNKrdOoxGumqCA
         PCjymBNTDWP/IEAdWyJtfRJHxXuXdRc8wI0ckziK6+1YYwlZImW9rpGTsjpjzcU//j1H
         53rQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr8BZPj0Anjc7b7ECbb5Q2rfKn7tgJ66cb2Qv24ciOC6EXjJTPlC01SJZUSt8566lUssdUdu9aa44U5@lists.linux-m68k.org
X-Gm-Message-State: AFuF++nfwmK8CP6p/D5euYyposBsn086iK+CCh+JZa5zDKPbU8Gtc/ti
	dGgjpA9bcnkF5tJlUd/reuwMs/HffvnFhWlRN/wxp8uLH4tirDAliPQcbfBweAQ+
X-Gm-Gg: AR+sD11d6pD7RowVXSkqUj1Ql7wY3xthkYDwmI8GTQGXKbim+rj5MAaDqF0Bt8h7O0Q
	2cOj7VBuszOP0gZT5FaK2bT00zLr2dyzpILhUZVeDO0YcZnZ0jEMixiBi18mEXG4O+7v+Fcq0FR
	AB1YAOu0v9ZziYPY2+nHllJd6gRye1sBWWaxYgWkf42FvUcgWOlbOUmATvTflMQiGODsM5g/1A9
	geS2ZbMQdoEVEDIlxwGeFy4xvMrafWn0QYNkwJs8fjmB1TVpz2kYL7gc+ZRxJ7rpbwjjv9TUKUo
	smdztlLSqn8nZLXHPQ/ummvhc3um+sb+Akuvh75Tdq39XgYnB6G7JNheSx3WsZyCwWdTWL0S6Gd
	WoSKQgdK0kQcFgXiS54AiS+ZDuuxo5+F2Arph86Apxb6RpPWKHrfCMoPAzOhKKGyP7DOU98RT06
	0stoAw3v7E4YoPh3cDI5fFwAmIaUoQ9L5FeUz7QfHcfEyAW3UzYhClRtYXrK/pEO/POrvpIsbDn
	DZ0RfLqltcdeIk+4ubg5o5q/BzjhA==
X-Received: by 2002:a05:6102:5123:b0:786:c86c:8fe4 with SMTP id ada2fe7eead31-786c86c9122mr10225734137.13.1788253825242;
        Tue, 01 Sep 2026 02:10:25 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97e84b6d320sm9620088241.9.2026.09.01.02.10.25
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 02:10:25 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5bfa6766cf6so2579404e0c.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 01 Sep 2026 02:10:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoWexOxZUgQpT7gljZeCYoDWZLjJnXuESWqebz7+3rrAubqNBOghdklLzPo0BBgtzMivS9HsY5fetK2@lists.linux-m68k.org
X-Received: by 2002:a05:6102:3e83:b0:779:c38e:de53 with SMTP id
 ada2fe7eead31-7859956a1cdmr13463869137.10.1788253824841; Tue, 01 Sep 2026
 02:10:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1786929430.git.fthain@linux-m68k.org> <1e349506a7cc6aa574aacbd4c69c240b5a1e3eb8.1786929430.git.fthain@linux-m68k.org>
 <CAMuHMdXgtstGtcbRkrtKtQ+d1c=mCe5zgYZCx4dyUQ_YnVhbbw@mail.gmail.com> <b0f20a10-78d4-e8e6-4001-99f076b99a8a@linux-m68k.org>
In-Reply-To: <b0f20a10-78d4-e8e6-4001-99f076b99a8a@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Sep 2026 11:10:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXGBT+Xbm+zftBzQEaCgAY2CNUxqE9Swz03se4tVisENg@mail.gmail.com>
X-Gm-Features: AcwNN1Vv8ix3n1nJubUXaePLSvTFNecD0g75FaaL-e1OfJQWQPFwaJuEm50wUr4
Message-ID: <CAMuHMdXGBT+Xbm+zftBzQEaCgAY2CNUxqE9Swz03se4tVisENg@mail.gmail.com>
Subject: Re: [PATCH v2 07/32] swim: Enable clock divider only where appropriate
To: Finn Thain <fthain@linux-m68k.org>
Cc: Jens Axboe <axboe@kernel.dk>, Laurent Vivier <laurent@vivier.eu>, 
	Joshua Thompson <funaho@jurai.org>, linux-block@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Finn,

On Tue, 1 Sept 2026 at 09:56, Finn Thain <fthain@linux-m68k.org> wrote:
> On Mon, 31 Aug 2026, Geert Uytterhoeven wrote:
> > On Mon, 17 Aug 2026 at 03:55, Finn Thain <fthain@linux-m68k.org> wrote:
> > > Some models have a 16 MHz FCLK oscillator and others 32 MHz. Put this
> > > information into the swim device platform_data so that the driver can
> > > correctly enable the clock divider. When this is enabled incorrectly,
> > > nothing can be read and failures from the Error Correction Machine are
> > > flagged in the error register.
> > >
> > > This is chip initialization, so do this in swim_floppy_init() rather
> > > than floppy_open(). Drop the udelay() which was apparently copied and
> > > pasted from swim3.c, where it relates to interrupts (of which this chip
> > > has none).
> >
> > > Cc: Joshua Thompson <funaho@jurai.org>
> > > Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> > > Fixes: 8852ecd97488 ("m68k: mac - Add SWIM floppy support")
> > > Signed-off-by: Finn Thain <fthain@linux-m68k.org>

> > > --- a/arch/m68k/mac/config.c
> > > +++ b/arch/m68k/mac/config.c
> > > @@ -984,8 +984,37 @@ static int __init mac_platform_init(void)
> > >                         .start = swim_base,
> > >                         .end   = swim_base + 0x1FFF,
> > >                 };
> > > +               unsigned int data = 0;
> >
> > Nit: in the absence of a real platform_data structure, please use a
> > more explanatory name.
> >
> > Perhaps s/data/s_fclk/, and store S_FCLK_DIV2 or zero?
> > Or s/data/setup/, and store the full register value?
>
> I looked again at this but I still can't see any uses for the other bits.
> So perhaps I should change it to:
>
> +               bool fast_fclk = false;

That's another option.

> > > --- a/drivers/block/swim.c
> > > +++ b/drivers/block/swim.c
> >
> > > @@ -807,8 +806,10 @@ static void swim_set_parameters(struct swim __iomem *base)
> > >                 swim_write(base, parameter, mem[i]);
> > >  }
> > >
> > > -static int swim_floppy_init(struct swim_priv *swd)
> > > +static int swim_floppy_init(struct platform_device *pdev)
> > >  {
> > > +       struct swim_priv *swd = platform_get_drvdata(pdev);
> > > +       unsigned int *data = pdev->dev.platform_data;
> >
> > Likewise.
> >
>
> ... and change that to:
>
>         bool *data = pdev->dev.platform_data;
>         bool fast_fclk = data && *data;
>
> I am unsure whether a NULL check is desirable here (?)

In theory it cannot happen on a sane system. But recently people started
hardening drivers against misuse through sysfs' driver_override and
bind attributes, in which case the pointer would be NULL.

> Interestingly, that NULL check itself is sufficient and so we don't really
> need the flag at all. Allocating memory for this bool is a completely
> pointless kmalloc.

Sure, but readability and maintainability also matter.  In the absence
of a proper driver-specific platform data structure, having a boolean
variable with an explanatory name is better than an obscure NULL
pointer check.
And what if you need to add more data later? At least the bool can be
safely replaced by a larger structure with a bool as its first member,
without the need for a single atomic patch.

> > >         struct queue_limits lim = {
> > >                 .features               = BLK_FEAT_ROTATIONAL,
> > >         };
> > > @@ -816,6 +817,8 @@ static int swim_floppy_init(struct swim_priv *swd)
> > >         int drive;
> > >         struct swim __iomem *base = swd->base;
> > >
> > > +       swim_write(base, setup, S_IBM_DRIVE | (*data ? S_FCLK_DIV2 : 0));
> > > +
>
>         swim_write(base, setup, S_IBM_DRIVE | (fast_fclk ? S_FCLK_DIV2 : 0));
>
> Would the bool be more acceptable? TBH, I'm not sure it's an improvement.
>
> Thanks for your review.
>
> > >         swim_set_parameters(base);
> > >
> > >         /* scan floppy drives */

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
