Received: from mail-vs2-f38.google.com (mail-vs2-f38.google.com [74.125.227.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCF33DDDAF
	for <linux-m68k@vger.kernel.org>; Tue, 29 Sep 2026 06:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790665095; cv=none; b=HCj5OieczwdB1qllRAuMxJ92gFrdv7NP1PNEx7uldBi14oAWuPk2DNP9YNt7HMj/yZyZzHuqwV/MDY2vf+OIVXQO/whZOoY8GNKLMUG8sbjzkaRz+tBxmNZ8D+ywJELT0iGj5HmhLLlJogAM86D8WqBeMxaRaclePyEyF1IkxBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790665095; c=relaxed/simple;
	bh=F/T7t7qSmK+GXitMSA7BLlhbCtT9VtAA7SAIzkQ/EMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X9DSt5KEv7ae7yn8l8LvaM3O0mWdJtTV1Yn47FSHlIB4h4dHxLmD9iKkCu4DqKhwGMQ4dVl7WdoWQGKmI5DUcpLKdN8ow8EWObNxVcrof+JT8nu0VeHd2gfaGNEscSS7y0/Y7UWRB6Xq0nXxjBDDSR5lDclOG/PEDfUsLMPJ5QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f38.google.com with SMTP id ada2fe7eead31-7b3a6aa10c2so895364137.2
        for <linux-m68k@vger.kernel.org>; Mon, 28 Sep 2026 23:58:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790665092; x=1791269892;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WOMI2hvRlpBUR+jfgUNfUFOEKzipIMIZarv00xrnPTE=;
        b=qzdBUluhOgN9dX1y9oZ9pHNnPc8Q0bXDtWk30Nlqgz0wYOUiC93NJEi6DASWj7twj5
         GNc/0xwgoLGmrBAFDm6NSCURc7/tQg/omnhBRQEJhPmCo2VtSiigyVxzUo7A3d6sBFK/
         5E6/6jA+zD0HSueUsanrCXojPaGvt6aW9tKr3OcP/rcJ3mpjJO2m+v9JFlRwHgGYA3lw
         e5+QaIOoowccNVwPyIxPAmG4YUVXxEOluJNwX0Lmm9x/Gd6Res//LvxSyyzWQiGPG8G4
         fDkbRdclfU7h1GHAS4QIYxW9woU6kGydzUKcKbnDVHkg1isdCKqBp2mUhpQ5l9c2e3UL
         PtYA==
X-Forwarded-Encrypted: i=1; AKwUvBwHka2K5a+gbb6j8ojC3Eg3UL6r90QW4zHdhR/cN13qg0Dsg1LkfPCxRIphsELQpWJ8seF2BfUfbu/4@vger.kernel.org
X-Gm-Message-State: AFq9FYK2ZwXpUXHdSBRM94rfA2IfnNqd45UU4sCywbI68BFbTocrjwZp
	qEq4lLvZMSaMmiD1LUnXqkvbIVcgvlrTH52q6C6Yb9Gjc+d6NmdmxcUipc2OCkpM9r0=
X-Gm-Gg: AYBFou0UULsz/IKyQ6TDHwOivyRrEPOvPo+eNu3PR2eueavW1zKC7bKBLUP4T2gKVgA
	YEKYd0MeX2XO45HG3ZmIiZnKE2YHXebrHJPI6ZSp+mAI54CqS73QFSSdrLhCVqcShMzv+qUBwRl
	n6BYpS2bB6uTwgGJ080xrSWfF3Ke1fCIZ+9kUSaFiwGKzWZyIsfkmFYOS2DoxImRjqYrsMxICFt
	mBonrpBOZL7HgXLh9s43i0DvSP7O5Fr8sJ+zZguHhQZHeurFWxKaX5cFEMGlDbqMux2cK+ZwWUc
	ElI8e6UNVHWNV0Y3RRrmNxXCbQQpgFGNdW3ubmdtaSPgs+lZiC0xbDQZtjVndKcG2Ww88GDMT56
	fJEIOqEBnn0OPBSsHQU/OW4JFv/c3GlWCz64Yh5uMIP36A0q2KJf1cjS3ar2iwV8ig+07CRCo++
	3xCAG6APejkTA29eNjPFq/Rr2QuStqfUH6tMP8IBdi5pKsGaEuNKV8Z1gXrv3sWGBCY6btXvSRE
	VY6pAVFt/JrrQq6GWXlYxaBMRkoBbVntIxmxA==
X-Received: by 2002:a05:6102:38ce:b0:7a1:f7d2:e80c with SMTP id ada2fe7eead31-7af1eae9f87mr4320467137.20.1790665091833;
        Mon, 28 Sep 2026 23:58:11 -0700 (PDT)
Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com. [74.125.226.235])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7b398ee8b75sm12688761137.2.2026.09.28.23.58.11
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 23:58:11 -0700 (PDT)
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-97eaa1155fdso929627241.2
        for <linux-m68k@vger.kernel.org>; Mon, 28 Sep 2026 23:58:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByQCNLH86+itwCbGJUwjRlFfsQK+4cweohFLBzKsXz3dEQQT4JtFdS9df7QBHGv8G7n33XVAnR2yuZR@vger.kernel.org
X-Received: by 2002:a05:6102:4422:b0:7a1:f7d2:e80f with SMTP id
 ada2fe7eead31-7af1e9f4234mr4711697137.23.1790665091194; Mon, 28 Sep 2026
 23:58:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260814031745.17140-1-schmitzmic@gmail.com> <20260814031745.17140-2-schmitzmic@gmail.com>
 <CAMuHMdUDvsqT5t93-ZO413pwS3rPYPB1_uy+5iRHsii8CYTdgA@mail.gmail.com>
 <ef9e0128-6309-546a-715a-3e7eb476910e@gmail.com> <8c7863da-299f-8c77-0727-fb438467a7ba@gmail.com>
 <CAN5rfbQMTtcvmcgbDwhTQ-D9AGxP5yGqHc=JWbN7PPJXXKPGHg@mail.gmail.com> <CAN5rfbTSiRqo9V1yscb04yckJxQ2z=4VP+G__4+kbTDXeGbj-Q@mail.gmail.com>
In-Reply-To: <CAN5rfbTSiRqo9V1yscb04yckJxQ2z=4VP+G__4+kbTDXeGbj-Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 29 Sep 2026 08:58:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXJUmEPiJ9+Op2J=Ztu+QLJ1xhMN+w5hNRzQOEYPXkeKg@mail.gmail.com>
X-Gm-Features: AclHuK8EpOJHD-yywKe_NeGfbRXmk7lvKGhNR-kl6OXZ4KLcR_ECuskix93sSx4
Message-ID: <CAMuHMdXJUmEPiJ9+Op2J=Ztu+QLJ1xhMN+w5hNRzQOEYPXkeKg@mail.gmail.com>
Subject: Re: [PATCH 1/5] m68k: Fix atari mouse movement
To: =?UTF-8?B?TWlybyBLcm9ww6HEjWVr?= <miro.kropacek@gmail.com>
Cc: Michael Schmitz <schmitzmic@gmail.com>, linux-m68k@vger.kernel.org, 
	linux-input <linux-input@vger.kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Miro,

CC Dmitry

On Tue, 29 Sept 2026 at 01:45, Miro Krop=C3=A1=C4=8Dek <miro.kropacek@gmail=
.com> wrote:
> this patch still seems to be pending, i.e. I can't see it included in
> any of the trees. If there is something more you'd like to know from
> me, I'm happy to help.

I had expected v2[1] to go in through the input tree, hence I provided
my Ab.

Dmitry: if you want me to take it through the m68k tree, please ack v2.
Thanks!

[1] https://lore.kernel.org/all/20260816073752.16656-2-schmitzmic@gmail.com

> On Mon, 7 Sept 2026 at 19:39, Miro Krop=C3=A1=C4=8Dek <miro.kropacek@gmai=
l.com> wrote:
> > On Sun, 16 Aug 2026 at 15:04, Michael Schmitz <schmitzmic@gmail.com> wr=
ote:
> > > Am 15.08.2026 um 11:15 schrieb Michael Schmitz:
> > > >>> --- a/drivers/input/mouse/atarimouse.c
> > > >>> +++ b/drivers/input/mouse/atarimouse.c
> > > >>> @@ -70,9 +70,12 @@ static void atamouse_interrupt(char *buf)
> > > >>
> > > >> Alternative, you could change/restore the function's signature to =
take a
> > > >> "signed char *".
> > > >
> > > > Agreed, but without a way to test this, I'd rather wait for Miro
> > > > confirming that change also fixed the issue.
> > I have just tested it. The new version works equally well,
> >
> > I have just noticed that if I enable the pointer signedness warnings, I=
 get:
> >
> > make ARCH=3Dm68k CROSS_COMPILE=3Dm68k-linux-gnu- KCFLAGS=3D-Wpointer-si=
gn
> > arch/m68k/atari/atakeyb.o
> >
> > arch/m68k/atari/atakeyb.c: In function 'atari_keyboard_interrupt':
> > arch/m68k/atari/atakeyb.c:263:82: warning: pointer targets in
> > passing argument 1 of 'atari_input_mouse_interrupt_hook' differ in
> > signedness [-Wpointer-sign]
> >
> > atari_input_mouse_interrupt_hook(kb_state.buf);
> > arch/m68k/atari/atakeyb.c:263:82: note: expected 'signed char *' but
> > argument is of type 'unsigned char *'
> >
> > I guess this is expected but wanted to mention it just to be on the saf=
e side.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
