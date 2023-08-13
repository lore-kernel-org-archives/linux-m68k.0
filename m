Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13DA6EB64DD
	for <linux-m68k@archiver.kernel.org>; Sun, 13 Aug 2023 23:37:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbjHMXhV (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 13 Aug 2023 19:37:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229826AbjHMXhI (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 13 Aug 2023 19:37:08 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 113AFAC
        for <linux-m68k@lists.linux-m68k.org>; Sun, 13 Aug 2023 16:37:06 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 84B1D5C00F0;
        Sun, 13 Aug 2023 19:37:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sun, 13 Aug 2023 19:37:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1691969823; x=1692056223; bh=V7CNOISm8WHH7
        3BFnqnT9NrKYIg14kymWw6WeBIhG7k=; b=WKztYj9jw15ldqheKbNRv2kFm2/wP
        RdTwiJY7gIIFNOULCPHnd/pVq8uDXoRdETnme0G19+TI+BjrFTij3+b4kmgAk0Sb
        nHYZV7DbkfwN+eYRYdki7raM2yWDzTH7I3rwJzMXeBTvZq7wgHNhr7gXh7Jxjabv
        KOl0CCnVIQ2LXk4PblQ8fbLwwWVvv9YV4FRQR5ubqEB5r7V0clnjk5vQ3ep7egdb
        n9qE+1m700Wq5FU0n+EW/OkGezouVx2G5iaHGyp8hHgLJW5owxtAm64fWrql/dAZ
        q6xUefUfM7eB8mwzXTYfr9/0/YS9ZM/dM1Rjv/+95T+sJDIQX6xKBrh6Q==
X-ME-Sender: <xms:HmnZZMhN7K9TdZ3rebTL2TZwd2f893AT2uemmzwFtcbOxmQwfTQQdw>
    <xme:HmnZZFDq1KHuOrtZ741lAcTDqL6m6jtxQaTG6nDBJPhcyAgF5ukl5ek22rsSkg_3T
    yVfPjMs-uuBDSGNR2E>
X-ME-Received: <xmr:HmnZZEH8S4sRVwuN4qPrpbFZqLirzc5GeSGD-FXoVKqRuSygdud9sNYQOWVxAE5UFOyWkMNsH4U8SWAGqVX2gNhCdJ3wM93AcBU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedruddtfedgvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehmtderredttdejnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelfeeklefggfetkedukeevfffgvdeuheetffekledtfeejteelieejteeh
    geelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:HmnZZNQ5zMIY2KTpsE-ixUP_huRI0nxPFw9MTFMA83Or8nFzUSUSrQ>
    <xmx:HmnZZJzbnNAmHnG7T6z0d1FdLQ_qWGtcHs2yMuvyxfEp1Tbm4hhtMA>
    <xmx:HmnZZL5FzvxI1DZIEymWA4-onkdz4JvIcK37zYGsCn3JRIHk2rVP_g>
    <xmx:H2nZZE9A9a59lUldDIRZu_UgPVC3npr_M1IWYx1tmAWqH7Sx-xZtmw>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 13 Aug 2023 19:36:59 -0400 (EDT)
Date:   Mon, 14 Aug 2023 09:37:03 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     William R Sowerbutts <will@sowerbutts.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Richard Zidlicky <rz@linux-m68k.org>
Subject: Re: Linux 6.4.4 on m68k - Q40 - pata_falcon causes oops at boot
 time
In-Reply-To: <c8fd631b-226c-4c60-884b-2ffa6437d03f@gmail.com>
Message-ID: <a1ffc79b-eb37-5ed6-6984-a0a3674662b1@linux-m68k.org>
References: <c47f07a9-d302-b8ce-c630-988e08cc8254@gmail.com> <ZL5jwoXAU5t8S+E6@sowerbutts.com> <d01db1e6-a0ae-559c-ab64-b3a2f5b60324@gmail.com> <997f0ff1-865d-29fb-ef65-2bb693549da8@linux-m68k.org> <288847c5-46bd-fcd4-11a7-829685a02c79@gmail.com>
 <521776cc-a11e-0a3a-b44d-fc051f6ee2ea@linux-m68k.org> <624c5629-e337-46ba-c8ac-411fe19f2f46@gmail.com> <81706cdc-2a7a-f383-881a-7313fefbb938@linux-m68k.org> <68187ca1-1d4f-92f9-f6c7-476caaa24df0@gmail.com> <275c3e98-a8e3-5d2a-13fa-db79ab9d6719@linux-m68k.org>
 <ZNlYFCVubNgzmUfc@sowerbutts.com> <c8fd631b-226c-4c60-884b-2ffa6437d03f@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463811774-695902106-1691969614=:31098"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811774-695902106-1691969614=:31098
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 14 Aug 2023, Michael Schmitz wrote:

> > On Fri, Jul 28, 2023 at 9:52=E2=80=AFAM Michael Schmitz <schmitzmic@gma=
il.com>=20
> > wrote:
> >> Yes, but Q40 and Falcon are impossible to support any other way, and=
=20
> >> byte swapping the IDE interface in hardware was never repeated=20
> >> anywhere else, fortunately. We will have to keep pata_falcon around=20
> >> for that cause in any event.
> > I wonder if this is a misunderstanding about Q40 IDE.
> >
> > The Q40 does not have an on-board IDE controller.  IDE is accessed via=
=20
> > a common ISA PC Super-IO card.  When you do a 16-bit transfer from the=
=20
> > ISA I/O address the data comes out backwards and the CPU needs to=20
> > byteswap it.
> >
> > I found it interesting and quite unexpected that 5.13 read data from=20
> > the IDE drive byte-swapped.  I had prepared a drive for the machine=20
> > with an MBR partition table and an ext4 filesystem but the kernel did=
=20
> > not recognise either.  After a while I realised I had to byte swap the=
=20
> > entire drive with 'dd conv=3Dswab', and then it worked.
> >
> > For my 6.4 patch I enabled byte swapping in the=20
> > pata_falcon_data_xfer() function -- this allows me to use an IDE drive=
=20
> > with everything in the normal/compatible byte ordering, which makes=20
> > life much easier. I assume this is the intended behaviour.
> That would be the sane behaviour, but the designers of both the Falcon=20
> and apparently the TiVo decided otherwise, wired up the IDE data bus=20
> byte-swapped and saved the byteswap operations in the driver. I'm unsure=
=20
> how this was intended to work on Q40.

Why did Atari do that? Was it because they wanted to interoperate with=20
exotic filesystems (i.e. Microsoft) without paying a byte swapping tax in=
=20
software? (Despite the 68000 instructions for that purpose.)

> > I wonder if any existing Q40 users are actually storing all the data=20
> > on their drives byte-swapped just to avoid the overhead of=20
> > byte-swapping on every read/write. I suppose this would work just fine=
=20
> > until you need to connect that drive to another machine.
>=20
> Yes, it does work just fine with that little inconvenience. (When I had=
=20
> to fix a corrupted partition table an FAT, I had to hook the Falcon disk=
=20
> up to a PC and run ARAnyM on it to get byte-swapped access to the data.)
>=20
> Now the question is how data on legacy Q40 IDE disks have been stored.=20
> If it's byte-swapped, we'd better keep that byte order in the current=20
> driver (meaning your changes to pata_falcon_data_xfer() won't be needed,=
=20
> but you would have to swap back data on your disk). If it's always been=
=20
> in PC compatible byte order, all data (not just the identify data) must=
=20
> be swapped.
>=20
> I'd like to have Richard's opinion on this (or hear from any other=20
> former Q40 user).
>=20

Yes.

If the Linux port for Q40 could use pata_legacy unmodified, that has to be=
=20
more maintainable. However, I could imagine a scenario where the standard=
=20
Q40 firmware, bootloader and/or vendor operating system would cease to=20
interoperate with Linux if Linux has no byteswapping IDE driver. If true,=
=20
would it matter?

Unix has a long tradition of pushing the byteswapping problem onto=20
userland for those who need to migrate data. Hence tools like cpio and dd=
=20
which are able to do byteswapping. One has to wonder whether drivers and=20
peripherals are the wrong places for that.
---1463811774-695902106-1691969614=:31098--
