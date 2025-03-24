Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57592143895
	for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Mar 2025 09:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742809112; cv=none; b=qgBjPkFKbyw45GF4WbeC7d7hhxZ8hc7zl6HoK1LWwWWCT/6BqfjQUaRlZe/C9ooUnyc960FBGAVK1HFJDyh+oH8rD+UocpBfncjQvteyxwJ1ZI+dS+i3zyGto/kuAzZNFD8HDTrLLkQHtPEkKFLJ9mxBEEL+Q8OsaCQFbdoCd6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742809112; c=relaxed/simple;
	bh=GZfYjgArTwLHiXMxmTbvbBnzIUjnBDmSxDdBhz1O0LQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oeVHmjKuSa0e6lM9lJ5yHdyLNM/maHGKMkDXBf+i8fJdNrT1FO5zq1Uq0PvFhv2426uF5Yhp6ZRkUT91hi9mjPFeEMu2Z0fnsfsKsTTEtecpsHJdD2HTr9yHLPdlzkzYhqcoBu+w1mRZ4YFKMPWrmITU2L/BGUQw4NaGVf/jGEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-523f721bc63so5007750e0c.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Mar 2025 02:38:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742809108; x=1743413908;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o0RslLkejdkJKrapLaXeQbXyfA2C7em+zDrHpM/wF4k=;
        b=Umph6H13l/NFw5Zh6Qq/5+3QM/1elvJS4V07SVXXs5VU8zqV5N6wp1JVvp4Xefbsta
         aVfcmoiy8KtTllhF1CdiM3ug4207sVO6p9GWjP0xJ/AAmtSqs/kjPYv73VZaKcILBGUQ
         trx0GIIpYzkyGtGoH9/LYJTBZV1BmFa3Nq744hN97ib1RdlVsr66DR2cqvD5I7sbDRbj
         idGFVSO9ULDVBadsZMTM0+lQIO2rhnAYgvtVmrJCHY8aGH+z2l8lgzpOQRMjXQ90tuJI
         E/zKsOFi2WSc8JMRy7FX3jdWPF1+an9FkYb0Xv5xB0RMgtBIEP0VeHykjwAHak22BzVZ
         qaiw==
X-Forwarded-Encrypted: i=1; AJvYcCXyb7o+3XcYbBYfnxTx7L6n9i9gOwogM3EKj7QXi2dn07OREcqIZg+w9Ykb4/pFIO9vXkCcCwLMiNbY@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yx0sWLw8bXwvuU2tygQiCDXopZZ663s9C9ziqnwUJyZIB2fTDsX
	h0+mk242w23b9V9XMwLqwuF6IogMa4bW6CIcGK5yGBkiR8mEROUy/z+KZiSe
X-Gm-Gg: ASbGncvTxbFqtkNzzlMp1OuJqZ5IXbJ+OtdTtV7yYfNsejKObYLAxt1d5Ie3gyd9xUz
	j11XsyqmF4Oa+r8hjEWI6e36sd2bhnMQM9hAo+odLvewPwXk6u+LLgEDY9fcjBS8LT48P3dNHVd
	Q2d6fZb5xWYJnXvzNsF9f1Eq+yWKqxpBMqgjIsnZMNephwP7/JJR64bnHzrB4PKMV+/ttBm1zm+
	dEeyPpU0exb/J0b8VqTktIZuQjE2+QQ7KhTg0sY5mHrTTFLGuz463sS2wUCSKznIE52g4orcEXE
	E8UJttrp2wFhwygyz3kHeNMufc3Ywzaj/bdKVkgHwob9zOfItEOZxzEc0oLUa7j2bj/vS6zruji
	fnbjlr0FhHnc=
X-Google-Smtp-Source: AGHT+IHikCt93N2w992L0ao26Fl1sw94Qtp8of4WDy25x9Kc3jEdV/yVBbktuXllvMEf8oUobA7i0w==
X-Received: by 2002:a05:6102:dcd:b0:4c1:492a:d75b with SMTP id ada2fe7eead31-4c4fbf6cce2mr12397461137.2.1742809108246;
        Mon, 24 Mar 2025 02:38:28 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-86f9f3a3f6esm1524812241.11.2025.03.24.02.38.27
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 02:38:28 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-524038ba657so4149089e0c.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Mar 2025 02:38:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXS+DSYO73G2wG3A6hPq+I/ubvacI3R+lYsNaWC862pJe06e9Xf993MPc1xSZKMaplyFmgt0e6eUWlO@lists.linux-m68k.org
X-Received: by 2002:a05:6122:231c:b0:523:dbd5:4e7f with SMTP id
 71dfb90a1353d-52595e58d98mr8791082e0c.3.1742809107784; Mon, 24 Mar 2025
 02:38:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250321151416.338756-1-p.pisati@gmail.com> <20250321151416.338756-3-p.pisati@gmail.com>
 <CAMuHMdU0yDSXoeDoK0yUrJ-cD_4BChEXcvteJW5Ra6afKzciMQ@mail.gmail.com> <Z+EhmiMWIMGqlXXP@amaterasu.local>
In-Reply-To: <Z+EhmiMWIMGqlXXP@amaterasu.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Mar 2025 10:38:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXCxah0V7p1oHjOXvFK6jPCYitThZw=+s7Rx9BpVgoyMw@mail.gmail.com>
X-Gm-Features: AQ5f1JpcG8V9ZaJ37A7knShxmtSUzoxxncWIhSlLSRQu-qn_T9qr6gkWZrl4hEY
Message-ID: <CAMuHMdXCxah0V7p1oHjOXvFK6jPCYitThZw=+s7Rx9BpVgoyMw@mail.gmail.com>
Subject: Re: [PATCH 2/3] amiga: cslab ata support
To: Paolo Pisati <p.pisati@gmail.com>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, linux-ide@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"

Hi Paolo,

On Mon, 24 Mar 2025 at 10:10, Paolo Pisati <p.pisati@gmail.com> wrote:
> On Mon, Mar 24, 2025 at 09:17:57AM +0100, Geert Uytterhoeven wrote:
> > I started working on Zorro MFD a long time ago, but never finished...
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git/log/?h=zorro-mfd
>
> Uhm, that could be useful for this multi-device board, thanks!

As I still keep up-to-date patches in my current tree, I have rebased
the zorro-mfd branch.

> > > +       /* Manually bind to all boards */
> > > +       while ((z = zorro_find_device(ZORRO_PROD_CSLAB_WARP_CTRL, z))) {
> > > +               static struct zorro_device_id cswarp_ent = {
> > > +                       ZORRO_PROD_CSLAB_WARP_CTRL, 0
> > > +               };
> > > +
> > > +               pata_cswarp_probe(z, &cswarp_ent);
> >
> > This looks very hackish to me...
> > I guess it blows up when trying to unbind either the zorro8390 or
> > cswarp driver?
>
> Yes, this was clearly wrong.

Oh, this was copied from drivers/ata/pata_buddha.c, which does the
same thing.  How could I have missed that? Ah, Summer holidays...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
