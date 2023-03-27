Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC7EBC76195
	for <linux-m68k@archiver.kernel.org>; Mon, 27 Mar 2023 08:38:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233057AbjC0IiZ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 27 Mar 2023 04:38:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233046AbjC0Ihh (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 27 Mar 2023 04:37:37 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 483D6A27B
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Mar 2023 01:32:20 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id B35B732007E8;
        Mon, 27 Mar 2023 04:32:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 27 Mar 2023 04:32:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1679905922; x=1679992322; bh=gfkfvU97A7/Qa
        TPhcpXEtEywtsbFi7d5l4ecD/F+XaU=; b=Pnasce1W37qRINuI1viavZIQ6U3HH
        lX4bBSDZw0vBiXKThiePK+W0DrgxX3mHPN8z6P9Pbit83j7K93OKM9CB1gS1TIee
        Jvp80jfq4ImOkbRudRYutAub053e7EhRN+qGjU9legjvERy1wzeqtBvXg10Rj1+5
        gTReHyz8COnBCm3sTQszCqna4jjuXjxODHIC/z7sJ0mRrEqLEh23xMvqWXEYDeF3
        HpipJXPYmlJvE558kiITMfO6G6u7giKIPlt/spoaK+0MVxPpi+k6u/i8VOSArP7H
        i8z56a3Y/EoiQDOn7xFHF3mH/ONSelA9RLYL8dGGPh2Jrzy5du6rMdPuQ==
X-ME-Sender: <xms:glQhZLM0DGSxiHM9j-6ZVQH0SW6u-uv4DUC_rmIEN-2vcK5fWlgSZw>
    <xme:glQhZF9ehacPKwcO3U0mL2UkPcUlpEN-FQUyHqBcIyib15otoBYqQBvEzALhrPk1c
    PaIRw0RfQv1ooLtzxE>
X-ME-Received: <xmr:glQhZKTghn-cU1benQlGw7gnSqH-mfTIfyPW1r0sHa2ydIfHgHdg_EwN8syoqD7dPR63NBpJESVzh6PSg2kwIXl8SixiDqss-pg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehvddgtdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehmtderredttdejnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpedvheelueeludelteehkeetveffgeeivdehgfejudelhfdtudelkeevtddv
    hedtudenucffohhmrghinhepshhouhhrtggvfigrrhgvrdhorhhgnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhthhgrihhnsehlihhnuhig
    qdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:glQhZPtpVA4x4GhFUieu_KQu2KwGWePYFBc39X9BCN47lax4MdK-Ew>
    <xmx:glQhZDdm0Irfzlf-P8rAtxOKtaLAi0BsNW0hoLYWO9WXebkibYIqdw>
    <xmx:glQhZL2LK8QQ4uqoE7aSpRBcUYzNVy0j8tC7MDWl2mP212rJVS42Xg>
    <xmx:glQhZDnu6bFfCbXs5_lVPXJ1Wn6kgTo96zzJ1ZXV4cnHjVPV93hy3g>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Mar 2023 04:31:56 -0400 (EDT)
Date:   Mon, 27 Mar 2023 19:34:58 +1100 (AEDT)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
cc:     linux-m68k@lists.linux-m68k.org, debian-68k@lists.debian.org
Subject: Re: gdb failure: "core file format not supported"
In-Reply-To: <CAMuHMdV+m5er5twbKX6cE6FQ35sypSmaRFAJ+Npi8venS9gJDw@mail.gmail.com>
Message-ID: <258a78f3-6f2c-1ea6-ffee-2970501db7d2@linux-m68k.org>
References: <fa0774b8-3ed2-8b87-defd-17fbb492922f@linux-m68k.org> <ca000c1c-899a-fa5a-90f5-d44682e54740@linux-m68k.org> <1fe7014b-84c5-2229-9b26-d57a3e4e3ddb@linux-m68k.org> <CAMuHMdV+m5er5twbKX6cE6FQ35sypSmaRFAJ+Npi8venS9gJDw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463811774-290702871-1679906098=:11000"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811774-290702871-1679906098=:11000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 27 Mar 2023, Geert Uytterhoeven wrote:

> On Mon, Mar 27, 2023 at 2:47=E2=80=AFAM Finn Thain <fthain@linux-m68k.org=
> wrote:
> > I wasn't able to add the linux-m68k list to the bug report Cc list.
> >
> > I'm forwarding this as I don't know the answer to Tom's question...
> >
> > On Sat, 25 Mar 2023, tromey at sourceware dot org wrote:
> >
> > > https://sourceware.org/bugzilla/show_bug.cgi?id=3D30273
> > >
> > > Tom Tromey <tromey at sourceware dot org> changed:
> > >
> > >            What    |Removed                     |Added
> > > ---------------------------------------------------------------------=
-------
> > >                  CC|                            |tromey at sourceware=
 dot org
> > >
> > > --- Comment #1 from Tom Tromey <tromey at sourceware dot org> ---
> > > This is probably a regression due to this patch:
> > >
> > > commit 3eba3a011a89c75c10bd1860eee4589e65697165
> > > Author: Tom Tromey <tromey@adacore.com>
> > > Date:   Mon Sep 14 08:30:10 2020 -0600
> > >
> > >     Various m68k fixes for gdb
> > >
> > >
> > > When I debug gdb I see it decides this core file is
> > > GDB_OSABI_SVR4, not GDB_OSABI_LINUX.  This happens
> > > because m68k_osabi_sniffer takes this branch:
> > >
> > >   if (elfosabi =3D=3D ELFOSABI_NONE)
> > >     return GDB_OSABI_SVR4;
> > >
> > > From elf/common.h:
> > >
> > > #define ELFOSABI_NONE         0 /* UNIX System V ABI */
> > > #define ELFOSABI_HPUX         1 /* HP-UX operating system */
> > > #define ELFOSABI_NETBSD       2 /* NetBSD */
> > > #define ELFOSABI_GNU          3 /* GNU */
> > > #define ELFOSABI_LINUX        3 /* Alias for ELFOSABI_GNU */
> > >
> > >
> > > So I guess one question is why this core file isn't marked
> > > as ELFOSABI_LINUX.
>=20
> Only PA-RISC and the remoteproc core dumper seem to use
> ELFOSABI_LINUX?
>=20
>     arch/parisc/include/asm/elf.h:#define ELF_OSABI         ELFOSABI_LINU=
X
>     arch/parisc/kernel/ptrace.c:    .name =3D "parisc", .e_machine =3D
> ELF_ARCH, .ei_osabi =3D ELFOSABI_LINUX,
>     arch/parisc/kernel/ptrace.c:    .name =3D "parisc", .e_machine =3D
> EM_PARISC, .ei_osabi =3D ELFOSABI_LINUX,
>=20
>     include/uapi/linux/elf.h:#ifndef ELF_OSABI
>     include/uapi/linux/elf.h:#define ELF_OSABI ELFOSABI_NONE
>     include/uapi/linux/elf.h-#endif
>=20
>     fs/proc/kcore.c:                                [EI_OSABI] =3D ELF_OS=
ABI,
>=20
>     drivers/remoteproc/remoteproc_elf_helpers.h:
> hdr->e_ident[EI_OSABI] =3D ELFOSABI_NONE;
>=20
> Or perhaps it's set originally somewhere else, but overwritten on
> m68k (and a few others)?
>=20
>     arch/arm/kernel/ptrace.c:       .name =3D "arm", .e_machine =3D
> ELF_ARCH, .ei_osabi =3D ELF_OSABI,
>     arch/hexagon/kernel/ptrace.c:   .ei_osabi =3D ELF_OSABI,
>     arch/m68k/kernel/ptrace.c:      .ei_osabi =3D ELF_OSABI,
>     arch/mips/kernel/ptrace.c:      .ei_osabi       =3D ELF_OSABI,
>     arch/mips/kernel/ptrace.c:      .ei_osabi       =3D ELF_OSABI,
>     arch/mips/kernel/ptrace.c:      .ei_osabi       =3D ELF_OSABI,
>     arch/nios2/kernel/ptrace.c:     .ei_osabi =3D ELF_OSABI,
>=20
> Does this work on other architectures?
>=20

I'm not sure that it matters. If Tom is right that the regression was=20
caused by his commit 3eba3a011a89 then the issue would be confined to m68k=
=20
and it's ABIs, and how to tell them apart given ELFOSABI_NONE:
https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommitdiff;h=3D3eba3a0=
11a89=20

BTW, I suspect that the best place to discuss this would be bugzilla
otherwise we'll need to Cc Tom.
---1463811774-290702871-1679906098=:11000--
