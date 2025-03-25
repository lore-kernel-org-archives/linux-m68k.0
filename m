Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B728B251790
	for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Mar 2025 15:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742918221; cv=none; b=VzTIslDOofE6eS19kpn0zVhBc+78tPzn/xjiTSkDD6fuA0qCq7q6nJRpY395dH98GA3pT6KBjbL8Nxnl5mVvDyZ5zqVUZLGeCjl1geen2KC+2hSRe9v4PvPCtbyyuDijhmKvvNM0mByNk4QL2fOB3FNC207e3RH69z14HIKhPLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742918221; c=relaxed/simple;
	bh=GRDJUa8t2QDqMQ0paHAqwICzDEwF3cTqXjXFQYSXEdo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P/GK7xUOSPiBwtm7+gozVZsMbTVNoTOZKOC0h3G6T5rmHtyUN7MJgpLkP06Ou/Jo94SVn9JnvbRYnYt9bEt7J9Q/wAuJc+JnmW3CKpXPgYA0x909gX0QisCJJQvwEEjF4NAu6q89UkD3DUagKjIle5O0s7uekhbcvlXDWECHTFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-86d3ac0fec0so5236128241.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Mar 2025 08:56:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742918218; x=1743523018;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fPWfxryaZtpRz3wfY9xf6zngWom/Hy2f4zbc4qhu/nM=;
        b=dhc6/o851H5vB9atmWbM9LHF953nyS3Bibrk9kzQtJLiLyGgm4iABPgKv2YtBTy6py
         BZEGc/Gw55dMnaH+T06/E+5v1sOW+qlUAfOxmK8UBLyE0Xq4w6u3KMhBjG8txm/Z80x3
         Cxzfm/yBvvJEWMy8mrovu4fApuzZsBJBgPPYV9KT/9+WsRug0oPVJHmmguy0MOBOJgAT
         WEYiOaiQ5TYnWg+83BHoxcfNMYAZ+hq5UVjuZ0WYtFjVJuV9fpIRGfvlkJgDzlkOizQM
         tx2EN1D7PHPCiLQohsLzWWQpHP41MJmIkkmhlm1Wsb9M9I+b8gAxCTvMc5GlnEHM3+lA
         Lclw==
X-Forwarded-Encrypted: i=1; AJvYcCXUhkadUNsWUq42wEKuk7wC516M+zCIOO0UC6zeHv0NDVYRmsTnxhMmd7GF9x/byR0IQH9WyujSnBJ5@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwocdtUZG9BzBVMYwrC26m7PmVsEPc4UXZjzjuPvQEu7DPfgHAp
	8F+1/GmZyX7LwEgYqQAWk9yyrzi5pjSNNErPGig5auWGiSbBjSaTO2Gtyzd34l0=
X-Gm-Gg: ASbGncv6x0Zz81E2BM62JEH/Pla8CNDXqT30HI4dr1tWHJU77viGcTZjTdv6UuflS6t
	QMqcURc2nQ55kxZ+2TzjtKQNrckiNuKN5ryZ5JPPdKconJoT/IsgzDpv4VYp0l2zPh6at5fdLIp
	0XnN59Whl4P1pm4MUn8MoPmq51GmkkftbKnjfcybGc1Ut1BYNaCkBxacd8NYE0pBDUmIVcbT/Fw
	q5ow1a9sQc8Rzy2a3omuYK+s+6vv4wQzdukA7NPlC2jNbN6UKPC9nPgayzOV2rizBOGOvO7v5IW
	2Tu6wubzugMARGhq9BJFhGIWtI3pvEOoJY4TjXhlJ33W5ncz7eTXmX+xvNi9qhnUhe52VVrmP4C
	oG7vYT+k=
X-Google-Smtp-Source: AGHT+IGwqUKSvBbMJ+SF4S5bPlYccwn31ns5kUdKHMeqzuRyVL4EqgGgQXIuXoVIVffNRzA0uC3b9w==
X-Received: by 2002:a05:6102:2ac9:b0:4c0:3349:cc4 with SMTP id ada2fe7eead31-4c50d47bb7bmr14611087137.3.1742918217579;
        Tue, 25 Mar 2025 08:56:57 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-86f9f3a36a7sm2120971241.9.2025.03.25.08.56.56
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Mar 2025 08:56:56 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-86ba07fe7a4so4913782241.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Mar 2025 08:56:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUjpZA5/X8AzdPWSziyC7LdG1MESE45qrunxpItdws8ABcsE5gI/JRun0Ree0fvrZzglzEcYF/ssjxR@lists.linux-m68k.org
X-Received: by 2002:a05:6102:194c:b0:4c3:6544:c250 with SMTP id
 ada2fe7eead31-4c50d623ce1mr10483365137.23.1742918216398; Tue, 25 Mar 2025
 08:56:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324121645.208368-1-p.pisati@gmail.com> <20250324121645.208368-2-p.pisati@gmail.com>
 <CAMuHMdW8WUyUsjG4FaT4nP82pZYVFsUpYNOg2vsPPOthf-O49A@mail.gmail.com> <Z+LR9Glz5iV4Sjll@amaterasu.local>
In-Reply-To: <Z+LR9Glz5iV4Sjll@amaterasu.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Mar 2025 16:56:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX-yibj3=EJa0xryau7OXiWzF8kvEdw0TAK-=iBHEOJvA@mail.gmail.com>
X-Gm-Features: AQ5f1Jq4qskIIKPZ_ZM7MltaifMkXQb2h_uSNjDf0fgoy4qyTsLWnavh58QU6X4
Message-ID: <CAMuHMdX-yibj3=EJa0xryau7OXiWzF8kvEdw0TAK-=iBHEOJvA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] ata: pata_cswarp: Add Amiga cslab ata support
To: Paolo Pisati <p.pisati@gmail.com>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, linux-ide@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"

Hi Paolo,

On Tue, 25 Mar 2025 at 16:55, Paolo Pisati <p.pisati@gmail.com> wrote:
> On Mon, Mar 24, 2025 at 02:21:57PM +0100, Geert Uytterhoeven wrote:
> > > +
> > > +       ata_port_desc(ap, "  cmd 0x%lx ctl 0x%lx", (unsigned long)base,
> > > +                     (unsigned long)ap->ioaddr.ctl_addr);
> >
> > These two printed addresses are virtual addresses.
> > However, due to the use of a cast instead of ioremap(), they are identical.

... identical to the physical addresses.

> > Still, I think it is better to print board + WARP_OFFSET_ATA and
> > board + WARP_OFFSET_ATA + 0x1000 | (6UL << 2) instead.
>
> Honestly i don't follow you here, but i'll ioremap() and send a v4.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
