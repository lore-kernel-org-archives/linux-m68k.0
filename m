Received: from mail-ed2-f32.google.com (mail-ed2-f32.google.com [74.125.228.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8CE4E0B65
	for <linux-m68k@lists.linux-m68k.org>; Fri,  2 Oct 2026 16:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790958499; cv=none; b=hdRFI5xe2n55mbCuajEvTIAnEC+kVfuk7aeP0lkGZ/tb5CTccHA6+nL/Bnke38BT0xWEYd3GGY5EIJ+SFurPda6dBH3lPJ6YhdATgYKK2ppP8ROB6lDeFQ5TF8KOqRPCXtwfjGB5J+v4CgGxpGu4rAcqlojB8bNR/oPAYAhNJ4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790958499; c=relaxed/simple;
	bh=ILq64lcljnuZ04hVMkyRhIoJhCs9LpMs00deIhwdPTY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sZ5QJNPxlOr/bb1mX8kj/OuIo4TQaabV9wc0OZgZKjNtjgKYf6Fop8t+Y3yA063rhJnktCaxSqqifUUu180AMuBKq7NKvUJ3bc82Iurb73kf0i5sn0v9nNEqHZ/J1rsAuDpLH/mapwIIvodegAymw6y4lvT4xsLWUKPvEnh6fSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.228.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed2-f32.google.com with SMTP id 4fb4d7f45d1cf-6acbd4b7194so80155a12.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 02 Oct 2026 09:28:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790958496; x=1791563296;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FacLLzE02J65RIUl3zrfOLyPerjqcD8qYDubJwqNoDs=;
        b=NIp5GH9/Q2NPOxBJfs+KEX81MW+0yLSMb9/WQB4AwdOHMMfNATp3Rob2RTrgEe/mo+
         R7oMqac3H5kXq927fl/3NJK/D6MlNaA7Wt9XIsbrPgL8cBls7irpIeBNtPz98+DfyBwf
         S5YNwt/3oVohB0DIlnRUOIy8fRDGsOhs/QNc0yMOyaojdBhyyaCiq9/5dpVI9MxwyHGB
         dW6kyTFMESYefD+84zk8frSgnWiwKsvZcOL8E8vCJzT0iGsdSGadebXvfq8h7joAp6Oz
         BwLWyU+mFWcSmo6dVBRwxPIZzKuyVBTNwVtUlUtUdmRCG729DJf/Difd3EgHQoItc+wZ
         Nvjg==
X-Gm-Message-State: AFq9FYLt52tARrRDMNnXbYrA+YH3ep0lDvSKsAghM+2w56x0bM2Ck0lu
	90I3e5+9qAAE4Kmo1cdrRjGGls2Cdy61I6hBvc/vAYyQ006vumysp3T3N3Pfb3rIA6s=
X-Gm-Gg: AYBFou3f3jOzBWzJBNxnMeH/ZqmKX9LtjhxBWdacn+fz+bMmK8m91gt0sHTOl4CqPw1
	sbvjEBCCtIJm3zv4vlcpJ3BbI0IpnjV3xqJnofRCKM/VF3nidCTWR1TLxOtHwOMFM3HnIBPYANT
	sXToQk0+jo0ftpdQdD8xPs9u80CuL/g18/Pb0H5P1bkm2v15VElIp7O+uP2Ec/cENnz1FE0Ahvf
	i45Skk8l6Gl+aM335DUtG3ZnAgLXb7OXZOtbCw8+ffw1KgA8x/xq63B5IhiC4zufBS7o3cSeUoE
	jo3dNiCtIu69t7/i8Xz0h9YCOmc138g/TTwhvCTZWqhEpdfrnypJIWlV9kkFXZ7G8zuSlRV8rt6
	zWWh9QMfSOPqPt2HCu0touXiNglUHghxUZYwz+ZVYBR+8iPHicCpYzzeyK8JwDGGvT8z9O5pkfz
	gmdd0lyrH+PaIMu/0CcNk5xwPhN6Cn81ueWsIdPZxFU7eCGHh0uB0rlZ0IeTQL5ba7yT7KzyQKL
	1I0XiGLD71r8WgihrL4jci4idHrUE9uzm8/
X-Received: by 2002:a05:6402:4018:b0:6ac:6d97:c5f7 with SMTP id 4fb4d7f45d1cf-6af9e320df9mr2305393a12.17.1790958495564;
        Fri, 02 Oct 2026 09:28:15 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6af9daaa27asm1045688a12.29.2026.10.02.09.28.14
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 09:28:15 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c294ad260fdso7881166b.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 02 Oct 2026 09:28:14 -0700 (PDT)
X-Received: by 2002:a17:906:8d89:b0:c2d:c0ce:8465 with SMTP id
 a640c23a62f3a-c2e337c9b10mr589700566b.0.1790958494239; Fri, 02 Oct 2026
 09:28:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <88e752e0bca92c7b65533cc1b334052dd272f8ef.1790842086.git.fthain@linux-m68k.org>
 <02c53c37-d2ee-4c03-a8f9-0a757c3af59e@gmail.com>
In-Reply-To: <02c53c37-d2ee-4c03-a8f9-0a757c3af59e@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 Oct 2026 18:28:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVbfUH1ZoFcS64t=gyE_cskMWv6gGvL8pjGirSGvAKu2w@mail.gmail.com>
X-Gm-Features: AclHuK8E4OgvQq-AV9E3-ABw9WPWWsAQAUpuZiL_IUUrJh_sBeHzdW-yfYgGkpU
Message-ID: <CAMuHMdVbfUH1ZoFcS64t=gyE_cskMWv6gGvL8pjGirSGvAKu2w@mail.gmail.com>
Subject: Re: [PATCH RESEND] m68k: Handle put_user faults more carefully
To: Michael Schmitz <schmitzmic@gmail.com>, Finn Thain <fthain@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Michael, Finn,

On Thu, 1 Oct 2026 at 20:57, Michael Schmitz <schmitzmic@gmail.com> wrote:
> On 1/10/26 22:08, Finn Thain wrote:
> > Running 'stress-ng --sysbadaddr -1' on my MC68040 system immediately
> > produces an oops:
> >
> >      Unable to handle kernel access at virtual address f1c422fb
> >      Oops: 00000000
> >      Modules linked in:
> >      PC: [<00005a1a>] do_040writeback1+0xae/0x160
> >      SR: 2010  SP: 96087dc2  a2: 01500000
> >      d0: 00000000    d1: 014e8000    d2: 00000081    d3: 00000000
> >      d4: 00000481    d5: c043dfff    a0: 014e8000    a1: 00632fd5
> >      Process stress-ng (pid: 221, task=1b729d30)
> >      Frame format=7 eff addr=014e9eb8 ssw=0c81 faddr=c043dfff
> >      wb 1 stat/addr/data: 0001 00000481 c043dfff
> >      wb 2 stat/addr/data: 0081 c043dfff 2f746d70
> >      wb 3 stat/addr/data: 0005 014e9ed4 2f746d70
> >      push data: c043dfff 800daa70 00000000 014e9f1c
> >      Stack from 014e9ed4:
> >        2f740000 8017c000 014e9f10 00006830 00000081 c043dfff 2f746d70 2f746d70
> >        0081a000 00000400 c043dfff 800daa70 c043dfff 80016a20 00000003 014e9f88
> >        000026c8 014e9f1c 00000001 2f746d70 0081a000 00000400 c043dfff 0081afff
> >        c043dfff 01500000 00000001 ffffffff 00000000 20000046 41d67008 014e9f58
> >        04810005 00810045 c043dfff 014e9f84 2f746d70 c043dfff 2f746d70 c043dfff
> >        80016a20 8017c000 00000000 0081affb 00000005 014e9fc4 00128bc6 c043dfff
> >      Call Trace: [<00006830>] buserr_c+0x510/0x698
> >        [<000026c8>] buserr+0x20/0x28
> >        [<00128bc6>] sys_getcwd+0xc8/0x15a
> >        [<000027a2>] syscall+0x8/0xc
> >        [<0008800d>] sanity_check_segment_list+0x17/0x11e
> >
> >      Code: 000c 0e90 1800 220f 0281 ffff e000 2041 <2228> 0008 0281 00ff
> >            ff00 67a4 6026 4280 122e 0013 206e 000c 0e10 1800 220f 0281
> >
> > 0000596c <do_040writeback1>:
> >      596c:       4e56 fffc       linkw %fp,#-4
> >      5970:       2f02            movel %d2,%sp@-
> >      5972:       202e 0008       movel %fp@(8),%d0
> >      5976:       4282            clrl %d2
> >      5978:       3400            movew %d0,%d2
> >      597a:       220f            movel %sp,%d1
> >      597c:       0281 ffff e000  andil #-8192,%d1
> >      5982:       2041            moveal %d1,%a0
> >      5984:       2228 0008       movel %a0@(8),%d1
> >      5988:       0281 00ff ff00  andil #16776960,%d1
> >      598e:       6600 0104       bnew 5a94 <do_040writeback1+0x128>
> >      5992:       4e7b 2000       movec %d2,%sfc
> >      5996:       4e7b 2001       movec %d2,%dfc
> >      599a:       0240 0060       andiw #96,%d0
> >      599e:       0c40 0020       cmpiw #32,%d0
> >      59a2:       6700 0084       beqw 5a28 <do_040writeback1+0xbc>
> >      59a6:       0c40 0040       cmpiw #64,%d0
> >      59aa:       6730            beqs 59dc <do_040writeback1+0x70>
> >      59ac:       4a40            tstw %d0
> >      59ae:       6752            beqs 5a02 <do_040writeback1+0x96>
> >      59b0:       4280            clrl %d0
> >      59b2:       220f            movel %sp,%d1
> >      59b4:       0281 ffff e000  andil #-8192,%d1
> >      59ba:       2041            moveal %d1,%a0
> >      59bc:       2228 0008       movel %a0@(8),%d1
> >      59c0:       0281 00ff ff00  andil #16776960,%d1
> >      59c6:       6600 0086       bnew 5a4e <do_040writeback1+0xe2>
> >      59ca:       7201            moveq #1,%d1
> >      59cc:       4e7b 1000       movec %d1,%sfc
> >      59d0:       4e7b 1001       movec %d1,%dfc
> >      59d4:       242e fff8       movel %fp@(-8),%d2
> >      59d8:       4e5e            unlk %fp
> >      59da:       4e75            rts
> >      59dc:       4280            clrl %d0
> >      59de:       322e 0012       movew %fp@(18),%d1
> >      59e2:       206e 000c       moveal %fp@(12),%a0
> >      59e6:       0e50 1800       movesw %d1,%a0@
> >      59ea:       220f            movel %sp,%d1
> >      59ec:       0281 ffff e000  andil #-8192,%d1
> >      59f2:       2041            moveal %d1,%a0
> >      59f4:       2228 0008       movel %a0@(8),%d1
> >      59f8:       0281 00ff ff00  andil #16776960,%d1
> >      59fe:       67ca            beqs 59ca <do_040writeback1+0x5e>
> >      5a00:       604c            bras 5a4e <do_040writeback1+0xe2>
> >      5a02:       4280            clrl %d0
> >      5a04:       222e 0010       movel %fp@(16),%d1
> >      5a08:       206e 000c       moveal %fp@(12),%a0
> >      5a0c:       0e90 1800       movesl %d1,%a0@
> >      5a10:       220f            movel %sp,%d1
> >      5a12:       0281 ffff e000  andil #-8192,%d1
> >      5a18:       2041            moveal %d1,%a0
> >      5a1a:       2228 0008       movel %a0@(8),%d1
> >      5a1e:       0281 00ff ff00  andil #16776960,%d1
> >      5a24:       67a4            beqs 59ca <do_040writeback1+0x5e>
> >      5a26:       6026            bras 5a4e <do_040writeback1+0xe2>
> >      ...
> >
> > The cause is a deliberately misaligned access in the 'bad_end_addr' test
> > case in the 'sysbadaddr' stressor. The location being accessed here,
> > 0xc043dfff, was contrived to span the boundary between a r/w anonymous page
> > and an unmapped page. The address was then passed to the getcwd syscall
> > which faulted in copy_to_user().
> >
> > The fault for the mapped page appears to be handled okay -- up until
> > do_040writeback1() called put_user() which produced a second fault due to
> > the unmapped page.
> >
> > Michael Schmitz helpfully deciphered the oops and explained the exception
> > processing leading up to it.
> >
> >      "regs->pc does point to the PC in the format 7 frame which is the PC
> >      the fault was detected at, but not (in case of a writeback fault)
> >      the PC of the faulting instruction [that is, MOVES.L].
> >
> >      "The writeback would still cross the page boundary, and fault if the
> >      unmapped page still isn't present. We would not see the PC of the
> >      movesl in that case, and fail to find the PC in the exception
> >      table."
> >
> > One solution is to add a NOP instruction after the MOVES.L to flush the
> > pipeline and take the fault. That way, the PC value in the exception frame
> > becomes dependable so the exception table works.
> >
> > Theoretically, there seems to be another bug in the existing code. If
> > the instruction following the MOVES faulted, then after the fixup,
> > execution would resume at the instruction which caused the fault. This
> > appears to be a loop. After this patch, that cannot happen.
> >
> > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> > Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> > ---
> >   arch/m68k/include/asm/uaccess.h | 10 ++++++----
> >   1 file changed, 6 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/m68k/include/asm/uaccess.h b/arch/m68k/include/asm/uaccess.h
> > index 31d133faa45e..728a6dfb7414 100644
> > --- a/arch/m68k/include/asm/uaccess.h
> > +++ b/arch/m68k/include/asm/uaccess.h
> > @@ -31,11 +31,12 @@
> >   #define __put_user_asm(inst, res, x, ptr, bwl, reg, err) \
> >   asm volatile ("\n"                                  \
> >       "1:     "inst"."#bwl"   %2,%1\n"                \
> > -     "2:\n"                                          \
> > +     "2:     nop\n"                                  \
> > +     "3:\n"                                          \
> >       "       .section .fixup,\"ax\"\n"               \
> >       "       .even\n"                                \
> >       "10:    moveq.l %3,%0\n"                        \
> > -     "       jra 2b\n"                               \
> > +     "       jra 3b\n"                               \
> >       "       .previous\n"                            \
> >       "\n"                                            \
> >       "       .section __ex_table,\"a\"\n"            \
> > @@ -53,11 +54,12 @@ do {                                                              \
> >       asm volatile ("\n"                                      \
> >               "1:     "inst".l %2,(%1)+\n"                    \
> >               "2:     "inst".l %R2,(%1)\n"                    \
> > -             "3:\n"                                          \
> > +             "3:     nop\n"                                  \
> > +             "4:\n"                                          \
> >               "       .section .fixup,\"ax\"\n"               \
> >               "       .even\n"                                \
> >               "10:    movel %3,%0\n"                          \
> > -             "       jra 3b\n"                               \
> > +             "       jra 4b\n"                               \
> >               "       .previous\n"                            \
> >               "\n"                                            \
> >               "       .section __ex_table,\"a\"\n"            \
> >
> Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>
>
> in case it helps.
>
> Anecdotally, I've seen similar uaccess faults causing kernel oops on 030
> as well, so this may not merely be an artificial unaligned access issue.

Shouldn't this include
https://lore.kernel.org/20240429030945.22451-3-schmitzmic@gmail.com
?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
