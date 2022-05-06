Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B2FFC433F5
	for <linux-m68k@archiver.kernel.org>; Fri,  6 May 2022 15:02:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344485AbiEFPGg (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 6 May 2022 11:06:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344351AbiEFPGf (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 6 May 2022 11:06:35 -0400
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58CBC396B6
        for <linux-m68k@lists.linux-m68k.org>; Fri,  6 May 2022 08:02:52 -0700 (PDT)
Received: by mail-oo1-f53.google.com with SMTP id f6-20020a4ace86000000b0035f083d2216so1286883oos.4
        for <linux-m68k@lists.linux-m68k.org>; Fri, 06 May 2022 08:02:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TFKDqxAl8kAhgchSspFlV1jC/a94gKje1e9uHi6vXps=;
        b=WuzQ9xyPNQu7YZ6n+X41BOWb2WLZNFX7oCLq9mHgVLsgK5mDjZ/2ouhFQ5KpIefztQ
         SptptRCJ5YktdEgY3n1LKOaKn23bSPl6mq7ZrMlDKiA9wyyNFM54W23Xo5wvZ/yl9OhM
         cz/b8V/vXTeakzSOPgKkZvPT67vq0O4peXMm9iVDaY8CH3sx1aM+M+ov3W7e4HTx6EoF
         1YlwlhP3OIeo8NPHNcpzpQv2tfyOH21CdB4G1ZgIgUmf7e+Apu1j2MYm9pp0TT59REvd
         6sAtfW8n9XGB3+jwx+b20GoLE9U/fWpROVLO7diOlWlO2S7vK4nkXXeWa0BIM62MCL4H
         pagQ==
X-Gm-Message-State: AOAM533zhdQMB9DAG44+ywkL45LpqKDJXE16QT11ZUNG4MV/SLVAohW1
        nOHKHn9/oBAdzLsrpbP+6leUtBIBtpvr1A==
X-Google-Smtp-Source: ABdhPJw/sShNYg3gAAF4hzPeKtlQ13dHQvfUorECM+/Vu1equwi7vyrGJo2BH6Y/wNtIYM3oT+xmbQ==
X-Received: by 2002:a4a:b48d:0:b0:338:da9e:87b5 with SMTP id b13-20020a4ab48d000000b00338da9e87b5mr1208715ooo.59.1651849370945;
        Fri, 06 May 2022 08:02:50 -0700 (PDT)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com. [209.85.210.53])
        by smtp.gmail.com with ESMTPSA id z5-20020a9d2485000000b0060603221239sm1685418ota.9.2022.05.06.08.02.50
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 May 2022 08:02:50 -0700 (PDT)
Received: by mail-ot1-f53.google.com with SMTP id s18-20020a056830149200b006063fef3e17so5071504otq.12
        for <linux-m68k@lists.linux-m68k.org>; Fri, 06 May 2022 08:02:50 -0700 (PDT)
X-Received: by 2002:a05:6902:352:b0:63e:94c:883c with SMTP id
 e18-20020a056902035200b0063e094c883cmr2500583ybs.365.1651849027963; Fri, 06
 May 2022 07:57:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a0sJgMSpZB_Butx2gO0hapYZy-Dm_QH-hG5rOaq_ZgsXg@mail.gmail.com>
 <20220505161028.GA492600@bhelgaas> <CAK8P3a3fmPExr70+fVb564hZdGAuPtYa-QxgMMe5KLpnY_sTrQ@mail.gmail.com>
 <alpine.DEB.2.21.2205061058540.52331@angie.orcam.me.uk> <CAK8P3a0NzG=3tDLCdPj2=A__2r_+xiiUTW=WJCBNp29x_A63Og@mail.gmail.com>
 <alpine.DEB.2.21.2205061314110.52331@angie.orcam.me.uk> <5239892986c94239a122ab2f7a18a7a5@AcuMS.aculab.com>
 <alpine.DEB.2.21.2205061412080.52331@angie.orcam.me.uk> <3669a28a055344a792b51439c953fd30@AcuMS.aculab.com>
 <alpine.DEB.2.21.2205061440260.52331@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2205061440260.52331@angie.orcam.me.uk>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 6 May 2022 16:56:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVsjRUKYqS0nkKsT08A4a4ipuhn7AG+ZqcHBqZvVX02OQ@mail.gmail.com>
Message-ID: <CAMuHMdVsjRUKYqS0nkKsT08A4a4ipuhn7AG+ZqcHBqZvVX02OQ@mail.gmail.com>
Subject: Re: [RFC v2 01/39] Kconfig: introduce HAS_IOPORT option and select it
 as necessary
To:     "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc:     David Laight <David.Laight@aculab.com>,
        Arnd Bergmann <arnd@kernel.org>, Rich Felker <dalias@libc.org>,
        "open list:IA64 (Itanium) PLATFORM" <linux-ia64@vger.kernel.org>,
        "open list:SUPERH" <linux-sh@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "open list:SPARC + UltraSPARC (sparc/sparc64)" 
        <sparclinux@vger.kernel.org>,
        "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
        Will Deacon <will@kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Helge Deller <deller@gmx.de>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Ingo Molnar <mingo@redhat.com>,
        linux-pci <linux-pci@vger.kernel.org>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Matt Turner <mattst88@gmail.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Arnd Bergmann <arnd@arndb.de>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        "open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
        Richard Henderson <rth@twiddle.net>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        "open list:ALPHA PORT" <linux-alpha@vger.kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        "open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)" 
        <linuxppc-dev@lists.ozlabs.org>,
        "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Maciej,

On Fri, May 6, 2022 at 4:44 PM Maciej W. Rozycki <macro@orcam.me.uk> wrote:
> On Fri, 6 May 2022, David Laight wrote:
> > >  It was retrofitted in that x86 systems already existed for ~15 years when
> > > PCI came into picture.  Therefore the makers of the CPU ISA couldn't have
> > > envisaged the need for config access instructions like they did for memory
> > > and port access.
> >
> > Rev 2.0 of the PCI spec (1993) defines two mechanisms for config cycles.
> > #2 is probably the first one and maps all of PCI config space into
> > 4k of IO space (PCI bridges aren't supported).
>
>  This one is even more horrid than #1 in that it requires two separate
> preparatory I/O writes rather than just one, one to the Forward Register
> (at 0xcfa) to set the bus number, and another to the Configuration Space
> Enable Register (at 0xcf8) to set the function number, before you can
> issue a configuration read or write to a device.  So you need MP locking
> too.
>
>  NB only peer bridges aren't supported with this mechanism, normal PCI-PCI
> bridges are, via the Forward Register.
>
> > #1 requires a pair of accesses (and SMP locking).
> >
> > Neither is really horrid.
>
>  Both are.  First neither is MP-safe and second both are indirect in that
> you need to poke at some chipset registers before you can issue the actual
> read or write.
>
>  Sane access would require a single CPU instruction to read or write from
> the configuration space.  To access the conventional PCI configuration
> space in a direct linear manner you need 256 * 21 * 8 * 256 = 10.5MiB of
> address space.  Such amount of address space seems affordable even with
> 32-bit systems.

Won't have fit in the legacy 1 MiB space ("640 KiB...").

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
