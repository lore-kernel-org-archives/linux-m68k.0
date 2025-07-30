Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B2F2253EB
	for <linux-m68k@lists.linux-m68k.org>; Wed, 30 Jul 2025 10:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753869922; cv=none; b=kPAsQjxfto7gHsiZWyQIhbNSxckjYhXBR1j4KAHwDraFVF0gxq52eFpWNj7M/mQ/bR3gNKqlB0eWSVg6Bw+YVAaYC3L3pbUlJD7KfFcWrsScvGFkNeTYVif+XQvNYn3s1rM1tIFBVv4WiSGtXFMSWYNcG5BFC0lUzD34YA6DQU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753869922; c=relaxed/simple;
	bh=3sUA/KOgsfzhmthv63Ee3iRgy6n2DJjRUUokISVQg74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nOyw7u5QuIS0IqDHbLkddjEOx6Te4JeZFOgQdwIoi5gnHAANW3yjMZ0iXnCmy64LxE7xZxoD6f1+nJX8u0Ye4Yvk5EBlPL9K2XXIqHfy+uaA1UXK01ppH0SkTHTm1y9IThrUhE1eW1+gXkUVzi+NQdVKLh+DkLHzu6GvyaaufE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-87f32826f22so459836241.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 30 Jul 2025 03:05:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753869918; x=1754474718;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hvFOMtlzmgf57aIdk7rzIqnMh7+rkPSLEpyIZ7Q84yo=;
        b=JXdCtJuJFq65Ouu/xffqMFt1OvFYP59pr04Ag1hMcUaTvem8FDLnf2DGMdeeGrWNGz
         4M8jdMW2VVKVnJrMZyFHnKy9lmfX7rdANsHD9NWddp70jT4rQRwX46LN2+Ijx8KYB+vw
         pc18lFKDRmdy3ucbdhIWa1GUtTw576JWKp2dYx9i0rJ6jFvOEciVaEiosa7o9y4I13/h
         ojwSbuViILK08E2GmnpAVTMFKzDvcht0LwYfX6mkAM61oKrHhbJFBt46o+PuE0aIu19P
         OxuoPV7sCWeQd/Zne+2oc1d96ivba44iOWdVPB0XWnjQON8FgudQxrWFvg5Ja4gbeTlA
         1Jaw==
X-Forwarded-Encrypted: i=1; AJvYcCVuhU9GrEbuDMXg/ztCenSwoqOhJ21MX5ucQjBCKNV9cJKw0Gy9LIYiSO3a5Opq3dnkSWFPgP8s5XFy@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxVI7kVxu3oM64vCYMTPOo/yjwJJa4KNJ6Wvy3ZbMdg5GVTAROs
	JOhNwipNMYlHSrBU/vH/gHeUU5mBPIMn9X9a8lcYT8q6zn5YprGfvKQVEf7DpyAn
X-Gm-Gg: ASbGncspVz2hf+aQ+akHk4wA9BkAs+GCchJKrUjviZ5Y0KLjhnc3rmfkDykNy6RvO6o
	OmcZvetzcplCeceJ2/mHjaTOcrSh+DWCBMS/LAot5hz5jGMjA3ni1q99G2xuK55zRpQ7d13c+Fe
	3D5gV3Xok/PDqQBAVeropALgKwakcl8v4man+HBIX6MkuT9XiXOHIDRiGkDNSp3QfW9D0i9Nk9y
	49qSWtcqLl64d+OG/P38JCom741eFdkEXSZWkcWFUZkAjZBxjmiA2iJ3aHvw9eUjyRAr3gSxghI
	jlAfA+atInX+62XviIolHG9Mz20wTtQQoO+saJdOeyATfq3mkbvmRStRJZHtsYXs115QECeD7Rh
	ARjjwEs+D9llwdi1Gv+VChxXK+y+UixFzp1QeYaCG1NWkCCemfYTp63T/GFt88/PTLeKZ+o8=
X-Google-Smtp-Source: AGHT+IEqGdSGidnYdwxlovWsUJeo5rV8YS1g82xTdB1nO8Kh1ZeHsy24P272iGn31Ngm4ajmM3O7xw==
X-Received: by 2002:a05:6102:36d:b0:4fb:fbdb:283c with SMTP id ada2fe7eead31-4fbfbdb2a26mr148428137.13.1753869917878;
        Wed, 30 Jul 2025 03:05:17 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-88b8dcd2199sm2331891241.17.2025.07.30.03.05.16
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 03:05:17 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4f2f2f22c1aso499032137.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 30 Jul 2025 03:05:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV0VAbl8oM0mv+efyOfA3gQr/D6ErrSTRvU6LGYf63sIyAR8bSA/hsA40TUtnsNCBJ4fmBbBlFn82D/@lists.linux-m68k.org
X-Received: by 2002:a05:6102:3249:10b0:4fa:3f49:a3b4 with SMTP id
 ada2fe7eead31-4fa778c5582mr2504514137.3.1753869916655; Wed, 30 Jul 2025
 03:05:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702114924.091581796@infradead.org> <20250702121158.465086194@infradead.org>
 <CAMuHMdXn4z1pioTtBGMfQM0jsLviqS2jwysaWXpoLxWYoGa82w@mail.gmail.com> <aInp78zC_WwVW6yd@jlelli-thinkpadt14gen4.remote.csb>
In-Reply-To: <aInp78zC_WwVW6yd@jlelli-thinkpadt14gen4.remote.csb>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Jul 2025 12:05:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVPR7Q7pvn+QqGcq2pJ00apDgUcaCmAgq6nnM1uHySMcw@mail.gmail.com>
X-Gm-Features: Ac12FXzT6dorMp5Cef-PIa_OaBJW01JDox25_62CFaduLwIvUCuQGOZNFREweac
Message-ID: <CAMuHMdVPR7Q7pvn+QqGcq2pJ00apDgUcaCmAgq6nnM1uHySMcw@mail.gmail.com>
Subject: Re: [PATCH v2 02/12] sched/deadline: Less agressive dl_server handling
To: Juri Lelli <juri.lelli@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>, mingo@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, clm@meta.com, 
	linux-kernel@vger.kernel.org, linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"

Hi Juri,

On Wed, 30 Jul 2025 at 11:46, Juri Lelli <juri.lelli@redhat.com> wrote:
> On 30/07/25 11:34, Geert Uytterhoeven wrote:
> Apologies for interjecting.

No apologies needed, much appreciated!

> > On Wed, 2 Jul 2025 at 14:19, Peter Zijlstra <peterz@infradead.org> wrote:
> > > Chris reported that commit 5f6bd380c7bd ("sched/rt: Remove default
> > > bandwidth control") caused a significant dip in his favourite
> > > benchmark of the day. Simply disabling dl_server cured things.
> > >
> > > His workload hammers the 0->1, 1->0 transitions, and the
> > > dl_server_{start,stop}() overhead kills it -- fairly obviously a bad
> > > idea in hind sight and all that.
> > >
> > > Change things around to only disable the dl_server when there has not
> > > been a fair task around for a whole period. Since the default period
> > > is 1 second, this ensures the benchmark never trips this, overhead
> > > gone.
> > >
> > > Fixes: 557a6bfc662c ("sched/fair: Add trivial fair server")
> > > Reported-by: Chris Mason <clm@meta.com>
> > > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > > Link: https://lkml.kernel.org/r/20250520101727.507378961@infradead.org
> >
> > Thanks for your patch, which is now commit cccb45d7c4295bbf
> > ("sched/deadline: Less agressive dl_server handling") upstream.
> >
> > This commit causes
> >
> >     sched: DL replenish lagged too much
> >
> > to be printed after full user-space (Debian) start-up on m68k
> > (atari_defconfig running on ARAnyM).  Reverting this commit and fixing
> > the small conflict gets rid of the message.
>
> Does
> https://lore.kernel.org/lkml/20250615131129.954975-1-kuyo.chang@mediatek.com/
> help already (w/o the revert)?

Thanks, it does!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
