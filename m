Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11150C83F01
	for <linux-m68k@archiver.kernel.org>; Sat, 26 Aug 2023 20:44:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229755AbjHZUne (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 26 Aug 2023 16:43:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229885AbjHZUna (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sat, 26 Aug 2023 16:43:30 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ADE6BA
        for <linux-m68k@vger.kernel.org>; Sat, 26 Aug 2023 13:43:27 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id EF02C32007F9;
        Sat, 26 Aug 2023 16:43:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sat, 26 Aug 2023 16:43:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        aura-online.co.uk; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1693082604; x=1693169004; bh=GB
        zgj5pBb0Bvg3O/cZcMXAjGqaOfSUyPccPlHs511ks=; b=L2yFKCA//uZ/P/zNGM
        99GDBiUDEdLIydg1RoDUWeMrz5yJW/qXbWbirAf67NqHYDgjfio45Cui3Yaovx0J
        hipb4BDE0Ykh+aaJZdw2912obTKG+xkvQctT7KUS3tMLs4hPHiVc2IOEitHCUkBk
        spGNRfmeKF58PqUAvZyhgIEnV2y7WV3Qum/7n3kN0xz3HmdaMCUtSW/AhDkERE4f
        tJuPRdG0r2SWyC8WGrcCjRNxNS6auYLawt6LlE0wop8ivHu1iVwcoMDPjvkZa8BY
        ZwfM+4Lt/ubjbBsEA7qqk96g4cvWJajLytssP1KxCSqoAuDy0TOG2NFHpidlrKwD
        UPtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1693082604; x=1693169004; bh=GBzgj5pBb0Bvg3O/cZcMXAjGqaOfSUyPccP
        lHs511ks=; b=xXWbgC9Vt5MlYFcYwNtmQQN2wF7MUShzA7a5DCGjLglq2CcOYFc
        vhAt1TdJDhU8V6aac17u3fzcw4CjynTTvmF3khBumEZt3ohwNwhHkPcZSwG/Mwye
        x7pYTUrgsTvsqbsflXxr8xUo6J1Mz6ikE88hRGPi92+UclVVpyikHSG7BCmuDySi
        55MhqPUXXJxahtDRzjUaZHBnzHs8sa3XgEw7sEV0ytdldwpmQCCjmrW+iNPg2jCz
        5FTJBsAc0ocx88XnbGeDcr3Ly7xiz6+gOGgrwGDM8ovpsy+sXAFuaCTSEJNCh+Rm
        fIYmPSFC4/4WanO75Xe390zXVPVLByESqJQ==
X-ME-Sender: <xms:62PqZIq33HGx1NvEzYqG1fs_0-gk94cB6f3a6LJhwpKrxseGwz6Gsw>
    <xme:62PqZOo9Du_7YOye3ws0mD47pxQa2VM1KNCZfUjH40TLl5GTYa1f-Ips5wcEV2DOD
    ad1hWWDKNMt8g>
X-ME-Received: <xmr:62PqZNPwyIurmksC37_TyGrZk0Fi9XfOvnLv7piqUwrDFAUXRdEXXoQ2Vt8MSll2miFjnMRpQjV9EtlFhJUZlvzDwhwNoQGFSfkYoZms>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudeftddgudehudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefkuffhvfevffgjfhgtgfgfggesthhqredttderjeenucfhrhhomheplfgr
    mhgvshcunfgvucevuhhirhhothcuoegthhgvfihisegruhhrrgdqohhnlhhinhgvrdgtoh
    druhhkqeenucggtffrrghtthgvrhhnpeejieefveduledtkeeivdfhtdffueefieetfeei
    hedtgfefleefgefffeelveevteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegthhgvfihisegruhhrrgdqohhnlhhinhgvrdgtohdruhhk
X-ME-Proxy: <xmx:62PqZP6HU07ZtaXf1Q8FkEIlpKFgvfIedfCcdp2AxyW4igwCxP2gdA>
    <xmx:62PqZH7fKkR5uDLr7YAZUxSm4rPBHfOzMGDdHf6ZruLZgyU822GTqg>
    <xmx:62PqZPj4Glji0ZvorqP3bfZTmUlSqOjxLXTZ7aqhnWn0lZVfz05Ifw>
    <xmx:7GPqZK33S7PYjfI7xbAZVJj9rIo1ssbA36kcE8G8IBCSgfeL05TIAw>
Feedback-ID: i51cd41ac:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 26 Aug 2023 16:43:22 -0400 (EDT)
Message-ID: <e323fa5f72e65ade8369e58c7dae39b682c3a6fc.camel@aura-online.co.uk>
Subject: Re: Tuple and changes for m68k with -malign-int
From:   James Le Cuirot <chewi@aura-online.co.uk>
To:     Richard <richiezid@arcor.de>, debian-68k@lists.debian.org,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     libc-help@sourceware.org, linux-m68k <linux-m68k@vger.kernel.org>
Date:   Sat, 26 Aug 2023 21:43:19 +0100
In-Reply-To: <5F114C03-5320-485F-86E3-946A334F16D1@arcor.de>
References: <e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
         <10cbcb8a65639f88e7eeb503fd02df172bc46a07.camel@physik.fu-berlin.de>
         <5F114C03-5320-485F-86E3-946A334F16D1@arcor.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sat, 2023-08-26 at 19:24 +0000, Richard wrote:
>=20
> On August 26, 2023 10:51:39 AM UTC, John Paul Adrian Glaubitz <glaubitz@p=
hysik.fu-berlin.de> wrote:
> > Hi James!
> >=20
> > On Sat, 2023-08-26 at 09:53 +0100, James Le Cuirot wrote:
> > > I wasn't sure whether to send this to libc-alpha or here. This feels =
more like
> > > a request for help, so I decided to play it safe. :)
> >=20
> > I am CC'ing Debian's m68k mailing list and the Linux m68k kernel mailin=
g list
> > to make sure we're getting enough exposure.
> >=20
> > > The Debian m68k maintainers proposed building their packages with -ma=
lign-int
> > > last year, aligning to 32-bit instead of 16-bit, which improves compa=
tibility
> > > with some projects and should give better performance on 68020+, at t=
he cost
> > > of slightly increased memory usage. The mold linker is at least one p=
roject
> > > that has been shown to work after making this change where it previou=
sly
> > > didn't.
> >=20
> > Not only mold but also most notably the following projects:
>=20
> a linker that is broken by a slightly unusual alignment isn't exactly a p=
rime example.. if any project I would expect linkers and binary tools to pa=
y attention to portability.

Not the best example, I grant you, but it was the only one where I'd
personally witnessed it making a difference so far.

> > It's a regular occurrence that a package doesn't build on m68k due to i=
t's unusual
> > default alignment.=20
>=20
> Unfortunately. Some time ago m68k was not the only one with this problem?

Possibly, but I wouldn't know. I suspect it may be the only one still in us=
e
with Linux. Gentoo supports most of the architectures to some degree, and I=
'm
not aware of any those having this issue.

>=20
> > > We need to
> > > break the ABI anyway with time_t going 64-bit, so it makes sense to d=
o these
> > > two things at the same time.
>=20
>=20
> What exactly will be broken? Afaics kernel ABIs have been since long pret=
ty carefully designed to avoid this problems and noone of the mentioned exa=
mples should touch them anyway.=20
>=20
> Thus.. is there any need to change the kernel ABI?

I mentioned the kernel, but I'm not sure whether that's actually affected.
This is more about userland compatibility in the same way that arm-*-gnu,
arm-*-gnueabi, and arm-*gnueabihf are incompatible with each other. I did t=
ry
mixing the latter two once. This was swiftly met with a segfault.

Of course, a tuple doesn't stop users from mixing these binaries, but it is=
 a
good way to ensure that GCC enables the flag when appropriate. This is too
important to rely on CFLAGS.

As for time_t, I hadn't realised a different tuple was being proposed for
that, but a fellow Gentoo dev confirms. The breakage here is less severe bu=
t
still significant. I witnessed it first-hand on 32-bit ARM when GnuTLS star=
ted
using 64-bit time_t while curl was still expecting 32-bit, which lead to HT=
TPS
requests failing because the certificate start/end dates were completely
wrong. At that point, we realised this is something that needs to be applie=
d
system-wide.

I believe we're still waiting on consensus for that too. gnu64time anyone?
It's 2023, how about gnu=F0=9F=95=9B64? ;)
