Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A38C4C7EE30
	for <linux-m68k@archiver.kernel.org>; Thu, 11 May 2023 09:31:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237470AbjEKJbL (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 11 May 2023 05:31:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236538AbjEKJbH (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 11 May 2023 05:31:07 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A189955B3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 11 May 2023 02:31:06 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-61b6a4233a1so73892366d6.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 11 May 2023 02:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683797466; x=1686389466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=44LgLHJDIULJkMBem069KICIq3uxO214CaUgM8dXQT8=;
        b=BDA3XAW6HVHBBCTylbjq0CrSvwep3z/RKHIin6eHkOxIgxSvF9oCpp4JdMxjhKCg8a
         t6De61RAZB8nwhqVhhnd+GwGOl5A9f6x8ta1mhnXQNHIA8XVVWTsZ3z2sLNVKJGzzpnv
         pVJ84YIgNXNe3zzg0Bt2DTwq5JDGQGStI/fGod4pqnCGfyQ7QKofa8hYUqI7j01kYIh5
         pdBpovGUxFwqp+4kZG7VlWddqhNwbB9KXu5x5m7XiaxjuDvLIgeFm1gLHxbutaTsEe0t
         4R0BYZnEDMzRXc8veBcbo5PxiVrNC+0sZriJIWCU7Z1JN7IWfsEaHn66MIjE5tmEuP4w
         GExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683797466; x=1686389466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=44LgLHJDIULJkMBem069KICIq3uxO214CaUgM8dXQT8=;
        b=kC+JRzSIdnmT2qbD5aW1MBtWZ8lofdt0lL+nHaT/qwo5aSv1V9SCZmMlPwvuQPSBFt
         1R0fhT1Z6+N59FeUJDT8/GWqSDIbCpEXCyvFHILVN0JoR8wDiJxYg8krqX6z6X9WwKqi
         28auuU7+U/O2q1QypZyev9ZT8h42nHvKZmBE6ot85PBqTYJexJRkP0ON6oojVMlsPg78
         VUzdZbYSWG0/+iYdiTQdRk4RLtLO1mUt7o+RQdCkaF0skcTyitrobWQ4JRLK62QRyUMS
         C8yPHoIOVY8K4F5ngoCainPZlNDC8c+Wd9C/CXKehPCoPhk7tMWET/zUSlIp6he6BWBe
         85vQ==
X-Gm-Message-State: AC+VfDxHM/SkwoASzjp9oL0MEbvusJ53+HoHh0uWne1Iz9dKJRrWI996
        iFPVrgJXU2LUXhHpHttWw3DQVX+ysnr19etR/zE=
X-Google-Smtp-Source: ACHHUZ4gCIyUNhd/+bbAhcP9wNcKpLhKmfok0Ws6ilq/cfwGVAdfDhZw6m7PSHSI2kufFJi8oJq2AHQm2PPca7W1ngo=
X-Received: by 2002:ad4:5961:0:b0:621:4551:c6dc with SMTP id
 eq1-20020ad45961000000b006214551c6dcmr7378789qvb.39.1683797465598; Thu, 11
 May 2023 02:31:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230510195806.2902878-1-nphamcs@gmail.com> <0d8e2503-5d4f-4b60-84ff-01a23bcf557f@app.fastmail.com>
In-Reply-To: <0d8e2503-5d4f-4b60-84ff-01a23bcf557f@app.fastmail.com>
From:   Nhat Pham <nphamcs@gmail.com>
Date:   Thu, 11 May 2023 02:30:54 -0700
Message-ID: <CAKEwX=OFVkc2GL3jmoC-qAuwZvzxfs7v__aWY=8bLY3MeMq9hA@mail.gmail.com>
Subject: Re: [PATCH] cachestat: wire up cachestat for other architectures
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        linux-api@vger.kernel.org, kernel-team@meta.com,
        Linux-Arch <linux-arch@vger.kernel.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Richard Henderson <richard.henderson@linaro.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Heiko Carstens <hca@linux.ibm.com>, gor@linux.ibm.com,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        borntraeger@linux.ibm.com, Sven Schnelle <svens@linux.ibm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        "David S . Miller" <davem@davemloft.net>, chris@zankel.net,
        Max Filippov <jcmvbkbc@gmail.com>, linux-alpha@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, May 11, 2023 at 12:05=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrot=
e:
>
> On Wed, May 10, 2023, at 21:58, Nhat Pham wrote:
> > cachestat is previously only wired in for x86 (and architectures using
> > the generic unistd.h table):
> >
> > https://lore.kernel.org/lkml/20230503013608.2431726-1-nphamcs@gmail.com=
/
> >
> > This patch wires cachestat in for all the other architectures.
> >
> > Signed-off-by: Nhat Pham <nphamcs@gmail.com>
>
> The changes you did here look good, but you missed one
> file that has never been converted to the syscall.tbl format:
> arch/arm64/include/asm/unistd32.h along with the __NR_compat_syscalls
> definition in arch/arm64/include/asm/unistd.h, please add those
> as well, and then
>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>

Just sent a follow-up fixlet for this:

https://lore.kernel.org/linux-mm/20230511092843.3896327-1-nphamcs@gmail.com=
/T/#u

Thanks for the suggestion!
