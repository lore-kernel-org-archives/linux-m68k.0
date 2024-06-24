Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F941135A69
	for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Jun 2024 10:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719223925; cv=none; b=swfV0PdzgqItf8C2TmqXuXzr4enoZ6zy92y1Xf0NXcA+P+8G2/D8E9cr5bu09sWdKthyeqiv66Ixf90UmtpqPt0BKcEMD31EAK722wQFwDpWxtwMfZcLZKA64cnTrFs6KHc2URZuAWda7CzsmbxsmPa7KRv+KpnVLllLLdxF9FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719223925; c=relaxed/simple;
	bh=IBvZyxdbo97T0/Tgj7l4fyQGXy0qXDZWL3VU4l7Hxnk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=krWaA+Bux3vR1hWnVw/NavFSyfdWleHWNGQ3oalqaQal94/onL3PBef85sdWeBIZfFKv26iY6hilrYIfWonWVg52X/l89Q2anP6+eENp2KstwiEiQCXve/picWzzxLyfwfVzaw0oQlvWGGikSzmu7vU9F1o+CIjfgrHsxf/4EFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dfa7fafa0c0so4112569276.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Jun 2024 03:12:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719223922; x=1719828722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ElYVxUQdlVxuSMCsySI9p98sI8g3FQfvxxo+f8vrW3A=;
        b=gDQmPB304N5dTnFFHHM86goxcLozDEEK8vfrRKHHvSCcIBnejFKqDR6OnR82n3SvJ5
         pYdwBG0/8GC2hA5lzDPLcpzeHBzEnalb+UVRDUmsqFY0Lvd2/zYEVOQ7XWrogvo4gx5V
         msQasyYWOqXumC9RLbmmE9NxOEKdKsoDdDjPNA0kulh45Pq2IpzJNxTYjtxxNwwqyPxU
         uaxpxk3Tzu+x/Oaugrun0DCh8sbuv7ys355p2VZ/hsFPIdhs710cG9ly41VexB03RvZs
         Uexstx8aOdao6ZztBpDwMO3kSl/s+vl9o9JcV/bj6jfMt6BnTuMEimw4ny85WYBypXZ2
         TOSQ==
X-Gm-Message-State: AOJu0YyIaRkhdbNuBDdbTOk2o/uEJJWQUKWJ8fetGUM5j3wonEK6KnN4
	fPquLnQC9zkH8kcc5bLaLZshUEy/AZbCUwpJZDKUuV9Fde5VEeZkef4wDP5e
X-Google-Smtp-Source: AGHT+IGmkKYlNXojfuYBG3/M0ZV5HQYZ6LpOKGm7EDHPQhJV0KZvmdNbZ1+ykuriIzRSdP+Du2DE+A==
X-Received: by 2002:a25:6b48:0:b0:e02:bc74:522f with SMTP id 3f1490d57ef6-e02f9ff4c46mr2380820276.30.1719223922040;
        Mon, 24 Jun 2024 03:12:02 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e02e626b4b3sm3128324276.37.2024.06.24.03.12.01
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 03:12:01 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dfa71ded97bso3181318276.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Jun 2024 03:12:01 -0700 (PDT)
X-Received: by 2002:a25:3607:0:b0:e02:d13b:5e19 with SMTP id
 3f1490d57ef6-e02f9f44593mr2748225276.9.1719223921597; Mon, 24 Jun 2024
 03:12:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240617-md-m68k-arch-m68k-v1-1-57d38beaeb13@quicinc.com>
 <CAMuHMdWD0Je3HZ+RJyfdxKxKcBp7nt6ooP_YUpiju77Zf1QzVw@mail.gmail.com> <a9a90666-5b3f-478d-8c88-002e23aee48b@quicinc.com>
In-Reply-To: <a9a90666-5b3f-478d-8c88-002e23aee48b@quicinc.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Jun 2024 12:11:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX1GEuWz-SfhuRvofgryzHApNTrWkvmyJuQ4Av8TZY=1w@mail.gmail.com>
Message-ID: <CAMuHMdX1GEuWz-SfhuRvofgryzHApNTrWkvmyJuQ4Av8TZY=1w@mail.gmail.com>
Subject: Re: [PATCH] m68k: add missing MODULE_DESCRIPTION() macros
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jeff,

On Tue, Jun 18, 2024 at 4:46=E2=80=AFPM Jeff Johnson <quic_jjohnson@quicinc=
.com> wrote:
> On 6/18/2024 12:36 AM, Geert Uytterhoeven wrote:
> > On Tue, Jun 18, 2024 at 1:47=E2=80=AFAM Jeff Johnson <quic_jjohnson@qui=
cinc.com> wrote:
> >> With ARCH=3Dm68k, make allmodconfig && make W=3D1 C=3D1 reports:
> >> WARNING: modpost: missing MODULE_DESCRIPTION() in arch/m68k/emu/nfbloc=
k.o
> >> WARNING: modpost: missing MODULE_DESCRIPTION() in arch/m68k/emu/nfcon.=
o
> >>
> >> Add the missing invocations of the MODULE_DESCRIPTION() macro.
> >>
> >> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> >
> > Thanks for your patch!
> >
> >> --- a/arch/m68k/emu/nfblock.c
> >> +++ b/arch/m68k/emu/nfblock.c
> >> @@ -193,4 +193,5 @@ static void __exit nfhd_exit(void)
> >>  module_init(nfhd_init);
> >>  module_exit(nfhd_exit);
> >>
> >> +MODULE_DESCRIPTION("ARAnyM block device driver");
> >
> > I think that should be s/ARAnyM/Atari NatFeat/, as I believe NatFeat
> > is also available on other Atari emulators. See also nfeth.c
> >
> >>  MODULE_LICENSE("GPL");
> >> diff --git a/arch/m68k/emu/nfcon.c b/arch/m68k/emu/nfcon.c
> >> index 17b2987c2bf5..0ab2e4d08871 100644
> >> --- a/arch/m68k/emu/nfcon.c
> >> +++ b/arch/m68k/emu/nfcon.c
> >> @@ -173,4 +173,5 @@ static void __exit nfcon_exit(void)
> >>  module_init(nfcon_init);
> >>  module_exit(nfcon_exit);
> >>
> >> +MODULE_DESCRIPTION("ARAnyM console driver");
> >
> > Likewise.
> >
> >>  MODULE_LICENSE("GPL");
> >
> > If you agree, I can make these changes while queuing in the m68k tree
> > for v6.11.
>
> You are the domain expert here. I'd be very happy for you to make the cha=
nges :)

I made these changes while applying your patch. No need to resend.

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
