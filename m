Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FD214A0B8
	for <linux-m68k@lists.linux-m68k.org>; Tue,  5 Nov 2024 16:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730822658; cv=none; b=gpEF8j7uf2g55KKawGRXHmJXamyfWncjOZbFr8PAI/MxY0VAjMS6AlYoDwg5BtEoRkx/JK3aNG8UK41YyFIkI+enA/EuoI7u2BNCarBMFB5qCABpXjUYLgdzBRX97yUkA1bvt0z1YoYp8zdLiZIngMk5Wx2PefLzR0xyM+/n9dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730822658; c=relaxed/simple;
	bh=W3eKg/9kBhtLGmidWjliShMRjQiv/FMq0JCLac9x3y4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GmiLOkrXVvze77CuoLcLOD9CLIQ9YP5Hrtoa47Y7iaEyvsedk8QNW9irzISCOIiWUdgEYFJvCDDlzsi9Tp1KX7wsyIl1Eoyeu0E82f3vXn8LtsFeOSMZQe0JLoQey/NrQQ+6Gr1UDBpVHWyLMvzxRk1uftdR0dBG9r5e7zkK2TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e30d821c3e0so5700661276.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 05 Nov 2024 08:04:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730822655; x=1731427455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nNyXOIVPBlmU0stxaqtQLJR2lM5cPjTKiHulmutb7ZY=;
        b=IVBQ1WuApkSWkwItu3jzX/T88C//GdJ1nebHd64+jK5EnG5Bns5rbm4W9r9tqJnjNP
         KIqzw1LH233gfJLaiwIcjgCqW62eFjq1jX/E8Yny4+hey0pVKiKZeNfHzGW/+Bx1tBHh
         6g/GrYfUJO9ha8n2cDheHsOz+Vd2EKRin+5rNPfYwXOOlEZbiS9j/PaLlQUWMMiGEuRd
         I/n+eF6k9WzAhiJw18vFLg1INN2s4eTk5EC2T0XNbfqGRbC7w53VIEd+S+vQfXqAeg/N
         OWTWcbdVWUKO/W8w0rnwubS4Q+nuUiPJPUK7KVHkeYSBD7HF38XtNtFXpPGHXflaCcQc
         8GDA==
X-Gm-Message-State: AOJu0Yy6qCnApSlXtTRPMsI4eLnmzYN/cTQVZYP5t8+AEyDVojvMYTI6
	5ebRsrtkN1c5ioYRXsTTQ6G1Onh+W8D/bZuMTrwv5Qvr0jLWrkD0duho2iB3
X-Google-Smtp-Source: AGHT+IGHfm2WueMAWJgCEQOBLAG3z1yiHbIcCG2HfL2DjSXfDDbM31ifv51Zc0Ai4bpRWtF9nVid5Q==
X-Received: by 2002:a05:690c:610e:b0:6e3:3275:8e5e with SMTP id 00721157ae682-6ea64bb2408mr174059477b3.33.1730822654802;
        Tue, 05 Nov 2024 08:04:14 -0800 (PST)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55b1710dsm23188177b3.35.2024.11.05.08.04.13
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 08:04:13 -0800 (PST)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e28fe07e97dso5752182276.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 05 Nov 2024 08:04:13 -0800 (PST)
X-Received: by 2002:a05:690c:6201:b0:6e3:28af:730d with SMTP id
 00721157ae682-6ea64be79a7mr171494157b3.43.1730822653623; Tue, 05 Nov 2024
 08:04:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241016-fix-jump-label-v1-1-eb74c5f68405@yoseli.org>
 <CAMuHMdULfk-_VGXBsnD+Gc7h4c5PRAYDdgx1zEeW=4+1fA0N_Q@mail.gmail.com> <d8d99f60-7a51-4b5f-b281-11fe6322a01e@yoseli.org>
In-Reply-To: <d8d99f60-7a51-4b5f-b281-11fe6322a01e@yoseli.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Nov 2024 17:04:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWV9aAV89gB-57e9cmFYax=BUbg0k2m7R1+t9E5YSySvw@mail.gmail.com>
Message-ID: <CAMuHMdWV9aAV89gB-57e9cmFYax=BUbg0k2m7R1+t9E5YSySvw@mail.gmail.com>
Subject: Re: [PATCH] m68k: Initialize jump labels early during setup_arch()
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jean-Michel,

On Tue, Nov 5, 2024 at 3:56=E2=80=AFPM Jean-Michel Hautbois
<jeanmichel.hautbois@yoseli.org> wrote:
> On 11/5/24 15:03, Geert Uytterhoeven wrote:
> > On Wed, Oct 16, 2024 at 6:18=E2=80=AFPM Jean-Michel Hautbois
> > <jeanmichel.hautbois@yoseli.org> wrote:
> >> The jump_label_init() should be called from setup_arch() very
> >> early for proper functioning of jump label support.
> >>
> >> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> >
> > Thanks for your patch!
> >
> >> --- a/arch/m68k/kernel/setup_mm.c
> >> +++ b/arch/m68k/kernel/setup_mm.c
> >> @@ -249,7 +249,11 @@ void __init setup_arch(char **cmdline_p)
> >>          process_uboot_commandline(&m68k_command_line[0], CL_SIZE);
> >>          *cmdline_p =3D m68k_command_line;
> >>          memcpy(boot_command_line, *cmdline_p, CL_SIZE);
> >> -
> >> +       /*
> >> +        * Initialise the static keys early as they may be enabled by =
the
> >> +        * cpufeature code and early parameters.
> >> +        */
> >> +       jump_label_init();
> >>          parse_early_param();
> >>
> >>          switch (m68k_machtype) {
> >
> > This is indeed what some (but not all) other architectures are doing, s=
o
> > Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> >
> > I assume you saw some "static key used before call to jump_label_init()=
"
> > warning[1]? Since I never saw such a message, can you please elaborate
> > and explain your use case, so I can add that to the patch description
> > when applying?
>
> Indeed ! I saw this when I was passing the "threadirqs" parameter to the
> kernel commandline and the "select IRQ_FORCED_THREADING" line to the
> Kconfig.

Thanks, I can reproduce it using that method.

> I suspect this might be true for other keys.

Indeed. But m68k and its configs don't enable much code that uses keys.
The only one I found was "thread_backlog_napi". Adding that to the
kernel command line gives:

    WARNING: CPU: 0 PID: 0 at include/linux/jump_label.h:322
setup_backlog_napi_threads+0x40/0xa0
    static_key_enable(): static key '0x5ceec0' used before call to
jump_label_init()

so I'll add that to the patch description.

> BTW, threaded IRQs work fine ;-).

On Atari (ARAnyM), they blow up spectacularly:

    Unable to handle kernel NULL pointer dereference at virtual address 000=
00000
    Oops: 00000000
    Modules linked in:
    PC: [<00040baa>] try_to_wake_up+0x90/0x1b8
    SR: 2701  SP: (ptrval)  a2: 0055b660
    d0: 00000003    d1: 00000003    d2: 00000000    d3: 00002700
    d4: 00000008    d5: 00000000    a0: 00558000    a1: 00558000
    Process swapper (pid: 0, task=3D(ptrval))
    Frame format=3D7 eff addr=3D00000000 ssw=3D0505 faddr=3D00000000
    wb 1 stat/addr/data: 0000 00000000 00000000
    wb 2 stat/addr/data: 0000 00000000 00000000
    wb 3 stat/addr/data: 0000 00000000 00000000
    push data: 00000000 00000000 00000000 00000000
    Stack from 00559ea8:
    00000000 0000000f 00007874 01006140 00559ef0 00050ec6 0000000f 00559ed8
    00040ce6 00000000 00000003 00000000 00559f14 0003b9b6 00000000 00000000
    00592710 010040c0 00000000 00559ef4 00559ef4 0003ba26 00051cd2 010040c0
    ffffffff 004fc9a1 00559f2c 00559ff8 00050ef8 00051cd2 010040c0 ffffffff
    004fc9a1 0000000f 004f9268 00000000 00592710 010040c0 00051566 010040c0
    0000000f 00000000 00000000 0000000f 00007874 00000000 010040c0 00592710
    Call Trace: [<00007874>] stdma_int+0x0/0x1c
     [<00050ec6>] setup_irq_thread+0x0/0x98
     [<00040ce6>] wake_up_process+0x14/0x18
     [<0003b9b6>] __kthread_create_on_node+0xca/0x11e
     [<0003ba26>] kthread_create_on_node+0x1c/0x26
     [<00051cd2>] irq_thread+0x0/0x184
     [<00050ef8>] setup_irq_thread+0x32/0x98
     [<00051cd2>] irq_thread+0x0/0x184
     [<00051566>] __setup_irq+0x172/0x582
     [<00007874>] stdma_int+0x0/0x1c
     [<00051a34>] request_threaded_irq+0xbe/0x14e
     [<0003ab86>] parse_args+0x0/0x202
     [<0000556e>] m68k_setup_irq_controller+0x0/0x48
     [<00255bda>] __is_suppressed_warning+0x0/0x42
     [<005da080>] stdma_init+0x2a/0x42
     [<00007874>] stdma_int+0x0/0x1c
     [<00200080>] ksys_shmctl+0x420/0x5f8
     [<00007874>] stdma_int+0x0/0x1c
     [<005d9f82>] atari_init_IRQ+0xc0/0x194
     [<00412cc8>] _printk+0x0/0x18
     [<00255bda>] __is_suppressed_warning+0x0/0x42
     [<005d62b0>] start_kernel+0x40e/0x618
     [<005d5344>] _sinittext+0x344/0x9e8

    Code: 0008 5281 2341 0008 b6fc fc3c 6700 011e <2213> c280 6700
0108 202b 0018 4bf9 0004 05a6 6700 0096 486e fffc 2f0b 4eb9 0004
    Disabling lock debugging due to kernel taint
    Kernel panic - not syncing: Attempted to kill the idle task!
    ---[ end Kernel panic - not syncing: Attempted to kill the idle task! ]=
---

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
