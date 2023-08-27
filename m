Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD2C7C83F10
	for <linux-m68k@archiver.kernel.org>; Sun, 27 Aug 2023 09:22:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230443AbjH0JUv (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 27 Aug 2023 05:20:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230460AbjH0JU0 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sun, 27 Aug 2023 05:20:26 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC0DDD8
        for <linux-m68k@vger.kernel.org>; Sun, 27 Aug 2023 02:20:23 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id E9385320079B;
        Sun, 27 Aug 2023 05:20:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sun, 27 Aug 2023 05:20:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        aura-online.co.uk; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1693128022; x=1693214422; bh=Fe
        oKv4B05Dd7trlv9iI2ch3jdiT31lHDhbafdbgijj4=; b=HGmml0+b/DNvIQrdZq
        16QGtVH4esB9YfitRB7DthnV5UvUd62amSWaJWEMtDeXDRXmtJpAFf+G9IlYaKeA
        QdxkMu/Xe+96oKnI4Tqmwatvedx9Es6hskWzfpc4MGpndOjSv7wW03AA2aEFKOOt
        AtNvUaF+kvyMRnmtqB3nbtu/zFStbaKqu+Hg65d3LesL9f0AKuCAHXLt7ZW6xeRX
        UeEDuM7R5zSOxD/2tL6piObfEhnCadPCD4FeWIiyDzswU5585DzOp8sfsSTASJF+
        cH10eEyWuLkPkCdDhihZxfGbwDO4YAQkJm6+UTT9+akVEHL5us5mDt8HmhUdn9Qb
        DePg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1693128022; x=1693214422; bh=FeoKv4B05Dd7trlv9iI2ch3jdiT31lHDhba
        fdbgijj4=; b=K4HnztQ2tRL1X24VfezWSUyvo7ezdq7FmbOc+8+/vET2t9a8nSt
        FmivdNozk7hYaZxs5hjvrHBJ5AF6+nbzns0imeq8ZckUhsqD/j/DumLLx9RpjFCe
        /QHXUi2vd0xmBD5tib0oLfzVsIdtDFAeIDqDkg8DraJY+9gfZzz41dLMxO8UgiJ4
        zI4RRF5i0AWsjh++2XacAZXTAraw/KGHbZ2dIrmcHbw0vFwqe41AHGHde3xw3tv6
        dOqrSb28JoObrjFMGVeJPL2Rj+YrsMfgH7ZF31ptLpfWIcpqVvZ/THf8J3sQxETI
        FQJbwmzX8snW1AzuaTgKOYmZuzA7xyNACWg==
X-ME-Sender: <xms:VBXrZFqbblrgMqGUZ5Uvg6psbxtpxI2jFCUrhpegTPb0ucZCGBT-5g>
    <xme:VBXrZHodmWuONoV5RqEkgL827JgB8zWQ6QvQeBogpOzLwoX1bzCL77uJtzRHtv7-g
    mcrhCTkOtX77g>
X-ME-Received: <xmr:VBXrZCOBhVDkvzCq3QAtkhaYfv_4lJ8dCl65nsGUpDd2bO5p01S-5RrhRTPc0R6v7-oLY86SHW1xVc0FpnFgMIbBbume8zJXUnWO6Nt5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudefvddgudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvveffjghftgfgfgggsehtqhertddtreejnecuhfhrohhmpeflrghm
    vghsucfnvgcuvehuihhrohhtuceotghhvgifihesrghurhgrqdhonhhlihhnvgdrtghord
    hukheqnecuggftrfgrthhtvghrnhepjeeifeevudeltdekiedvhfdtffeufeeiteefieeh
    tdfgfeelfeegffefleevveetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheptghhvgifihesrghurhgrqdhonhhlihhnvgdrtghordhukh
X-ME-Proxy: <xmx:VBXrZA7aBObLoGV-_MXLAInrR-fTzMU2gb0HEHDu0lGSpsNfwy8tow>
    <xmx:VBXrZE4wJbHNbBXqG1GfPsbTxmqHEkggwDpw6uezmOhVMZnookttQg>
    <xmx:VBXrZIhBCoOpZDXnUDXM8AgnKVQTAD_t7SsLnbS3dCpG9UCvsfI7sw>
    <xmx:VhXrZP2WJKIS5xhMS7lLn2jOwNIXUAzCbCZgqL3o02E1nPfXdnQjUQ>
Feedback-ID: i51cd41ac:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 27 Aug 2023 05:20:20 -0400 (EDT)
Message-ID: <751c83150533b701d66ac24c8fe81863cf5eab98.camel@aura-online.co.uk>
Subject: Re: Tuple and changes for m68k with -malign-int
From:   James Le Cuirot <chewi@aura-online.co.uk>
To:     Finn Thain <fthain@linux-m68k.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     libc-help@sourceware.org, debian-68k <debian-68k@lists.debian.org>,
        linux-m68k <linux-m68k@vger.kernel.org>
Date:   Sun, 27 Aug 2023 10:20:16 +0100
In-Reply-To: <80a52487-3105-ed5b-a1eb-ec1a0689ef21@linux-m68k.org>
References: <e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
         <10cbcb8a65639f88e7eeb503fd02df172bc46a07.camel@physik.fu-berlin.de>
         <80a52487-3105-ed5b-a1eb-ec1a0689ef21@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, 2023-08-27 at 10:46 +1000, Finn Thain wrote:
> On Sat, 26 Aug 2023, John Paul Adrian Glaubitz wrote:
>=20
> > On Sat, 2023-08-26 at 09:53 +0100, James Le Cuirot wrote:
>=20
> > ...
>=20
> >=20
> > Not only mold but also most notably the following projects:
> >=20
> > - LLVM
> > - Firebird Database
> > - OpenJDK
> > - Various Qt packages
> >=20
>=20
> And potentially more in the future, which may be anticipated on the basis=
=20
> that "those users don't need a stable ABI any more, so let's just ignore=
=20
> the portability issues in our code and leave the problem to the distros=
=20
> and toolchain developers".
>=20
> That is the precedent you would set.
>=20
> Moreover, why is it that only a few developers have a problem with making=
=20
> explicit their decisions regarding alignment of shorts? What actual pain=
=20
> does it cause them to accept a patch to make their struct layouts plain?

Some projects do accept patches. Yann Collet was even kind enough to fix th=
is
in zstd themselves. On the other hand, we have had to fight to stop Python
from dropping m68k support entirely. The real problem is the effort require=
d
to produce these patches. I haven't been able to wrap my head around this s=
o
far, but I would still like to learn. I could see myself eventually fixing
mold, but LLVM feels like a very tall order.

> > > We need to break the ABI anyway with time_t going 64-bit, so it makes=
=20
> > > sense to do these two things at the same time.
> >=20
> > Fully agreed.
> >=20
>=20
> If the kernel breaks the ABI, that's a bug, not an excuse. Either you're=
=20
> okay with proliferation of incompatible binaries and tools or there are=
=20
> some criteria (yet to be identified AFAIK) which permit this bug.

If you're referring to time_t, the kernel is not breaking the ABI. New
syscalls were added to 32-bit architectures for 64-bit time_t. The
incompatibility is within userland, such as in the curl vs GnuTLS example I
mentioned.

> It's not difficult to foresee fragmentation because it follows from the=
=20
> manpower shortage. There will always be sufficient manpower to produce a=
=20
> break that pleases a few. There may never be enough manpower to produce a=
=20
> stable ABI that pleases everyone for the foreseeable future.
>=20

Since this is about userland, are you suggesting that all userland ABIs sho=
uld
simultaneously support both 32-bit and 64-bit time_t? That would never happ=
en,
especially when 32-bit time_t will naturally become useless.

> > I think -gnu32 sounds very reasonable.
>=20
> You do? I think 32 is misleading in the absence of 16-bit or 64-bit=20
> variants, and -gnu is misleading if other tooling like LLVM already=20
> supports malign-int. Moreover, it's impossible to align to a bit count in=
=20
> general. Not that you'd want to -- it's actually the natural alignment of=
=20
> shorts that is at issue, AIUI.

I picked -gnu because this is a variation on what we have already and I've
never heard of glibc using anything other than -gnu*. You still use -gnu wh=
en
building with Clang, so I'm not sure what Clang supporting -malign-int has =
to
do with it. Of course, glibc is not the only libc, but the others are not
compatible anyway and have their own tuples. They will presumably follow su=
it
though, as they have done in the past, e.g. -gnueabihf -> -musleabihf.

> So, for naming purposes, the proposal might be described as either the AB=
I=20
> du jour (leading to -abi23 for 2023) or the new ABI for ever (leading to=
=20
> -abin as in -gnuabin32 on MIPS).
>=20
> If it's the former, perhaps you should not push it upstream. If it's the=
=20
> latter, perhaps this redesign should seek to address real shortcomings=
=20
> with the existing ABI, including problems which (for all I know) may have=
=20
> entirely prevented some people from using it thus far. That is, it should=
=20
> consider silicon beyond 680x0.

I'm not sure what you mean here. I don't think anyone has been prevented fr=
om
using the existing ABI when it is the only m68k ABI on Linux. We *are*
considering other architectures with the time_t issue. I haven't heard anyo=
ne
shouting about any other common issues. They should really be shouting abou=
t
time_t, as it is somewhat pressing, but surprisingly little has been said
about it.

I do know that m68k Linux has been significantly slower since the transitio=
n
from linuxthreads to NPTL due to the lack of a spare register, but I gather
nothing can be done about that.
