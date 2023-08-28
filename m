Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AA71C83F12
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Aug 2023 13:30:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230176AbjH1NaI (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 28 Aug 2023 09:30:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230271AbjH1N3x (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 28 Aug 2023 09:29:53 -0400
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38A38A7
        for <linux-m68k@vger.kernel.org>; Mon, 28 Aug 2023 06:29:50 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id E341B5C013F;
        Mon, 28 Aug 2023 09:29:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 28 Aug 2023 09:29:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        aura-online.co.uk; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1693229387; x=1693315787; bh=Hu
        N58FoUyDKECq9gMjHjBiomI+0+zuD12tWG9HWhkKs=; b=kDsrhZIkIOcOU5jVC4
        G0P3HfRU+K5spO/Itx+5AF9lSb1Atwv/FsSdhZxdRyefb05H5xauK/AqCq6SvMor
        TnHlgAkeWdOm6qVb73a3rCrugoFE4TMugSaLQtOwuIrJrFMlMWo26oBYRhF/JU+F
        4b+lQeJQJSa/I4jh25qfkdwfeKUOQdLVXqqnHrESWGIsWkPXfzqhn3mxlCSEUWIY
        utQ1e/nb7XMHeiTwGquvuGShKzPFmWVTBVuQb0Z/VYVIGr4VWH6+Pr8Ha9zoek/a
        nhLP+IyEBqKNK3RZDWPw2U/UqQR26GyioOMaj+Ti89OjheA992PePYqviP0u1zFt
        Hv0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1693229387; x=1693315787; bh=HuN58FoUyDKECq9gMjHjBiomI+0+zuD12tW
        G9HWhkKs=; b=FHjW2/kc6XcM/GnoSHQU9+VSimHAZtRCrzG27xi72Zxss0D5QuR
        0YEjPv55QDwMnY5xKS/sy0oJ8/53UEXMeB1g1q2qWoFYLYpoYnwxiBBJNTJV/FUT
        Ye9L12N6TjG4WfusWkSXYrpRbM/SkBqNa7oSiobxz2+AHIjaqiPozX2xviOUVDK1
        lki2XxtfniMl39kiHdtZ9Jvr8Muj92Nuxa0pfN50LYyUWmArzkvrqHxDHFp58lWx
        2l1RBsx9oGerwD3eRtMiRrf3xDM3LDMvUfka2Cu1Z/7N8OuIGmniZsRz5a9HZXuW
        cGwz6HjtuGDtnm3wxWWnFbZHhxslz1TWTWA==
X-ME-Sender: <xms:S6HsZCZNT9ewwyuvuP7v1RLg_evWLXsB95atD9SC4O6Q9-g656NsTQ>
    <xme:S6HsZFYZEkckRMIO0lFoUU5MEdz6jivQTUJClEgK4EzkW4P069MDJMmEVd7oBuM3o
    OAHXiySgxmPBg>
X-ME-Received: <xmr:S6HsZM9lIGyhTb1XoibRvasoJu37eoXo7jX52MAv1Y6UNfMm4DgjjqsRiAa340KDRjmLloDltZ2jQWdeB-VgbXbVfG-xBOQBs0H-HC5i>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudefgedgieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvveffjghftgfgfgggsehtqhertddtreejnecuhfhrohhmpeflrghm
    vghsucfnvgcuvehuihhrohhtuceotghhvgifihesrghurhgrqdhonhhlihhnvgdrtghord
    hukheqnecuggftrfgrthhtvghrnhepjeeifeevudeltdekiedvhfdtffeufeeiteefieeh
    tdfgfeelfeegffefleevveetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheptghhvgifihesrghurhgrqdhonhhlihhnvgdrtghordhukh
X-ME-Proxy: <xmx:S6HsZEq_-sZy4iQumCI7t4Oev9pb6sY52p54ntoXT8BSPPMMpZWnbg>
    <xmx:S6HsZNqyG8HPTve-9hTz39EEVMblBdXM51DSq_oRS9vqICkYDZS34A>
    <xmx:S6HsZCSfWYnsDkJySff8naUNrmypB748aMTqrzB-YO3_vRU79eFk7g>
    <xmx:S6HsZGAuMtOyz6B8cpILpIcO8dWgJWlo_SQf3a9TZ9N7sSWCG1_YTA>
Feedback-ID: i51cd41ac:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Aug 2023 09:29:46 -0400 (EDT)
Message-ID: <95a4dd47f25addc0408a1016ecbe1ed18d9dab6d.camel@aura-online.co.uk>
Subject: Re: Tuple and changes for m68k with -malign-int
From:   James Le Cuirot <chewi@aura-online.co.uk>
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>,
        Finn Thain <fthain@linux-m68k.org>
Cc:     libc-help@sourceware.org, debian-68k <debian-68k@lists.debian.org>,
        linux-m68k <linux-m68k@vger.kernel.org>
Date:   Mon, 28 Aug 2023 14:29:43 +0100
In-Reply-To: <87134fda9b761e3f81588d440242b9a4e986ddbf.camel@physik.fu-berlin.de>
References: <e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
         <10cbcb8a65639f88e7eeb503fd02df172bc46a07.camel@physik.fu-berlin.de>
         <80a52487-3105-ed5b-a1eb-ec1a0689ef21@linux-m68k.org>
         <4b4fe9c56dfdb8ec74150413cfc211d70243eb7e.camel@physik.fu-berlin.de>
         <dba7fd40-00ee-0ac1-19fd-5ec146aca972@linaro.org>
         <87134fda9b761e3f81588d440242b9a4e986ddbf.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, 2023-08-28 at 14:50 +0200, John Paul Adrian Glaubitz wrote:
> Hi Adhemerval!
>=20
> On Mon, 2023-08-28 at 09:44 -0300, Adhemerval Zanella Netto wrote:
> > If the idea is really to endeavor on a new ABI for m68k, it means a dif=
ferent
> > loader and the question: will it be interoperable with current m68k ABI=
 in the=20
> > sense that i686 is interoperable with x86_64? It would allow to keep ol=
d binaries
> > running, similar to what old ABI did for 32 to 64 bits transition.
>=20
> OK.

To that, I would add: what old binaries? Linux on m68k is very obscure thes=
e
days, with Gentoo, Debian, and NixOS being the only major distributions sti=
ll
supporting it. As the Gentoo m68k maintainer, I would not expect users to b=
e
pulling binaries from elsewhere, and I imagine Adrian would say the same.
Where would you even get them from? I thought there might be a handful on
Aminet, but I cannot even find any there.

Upgrading an existing system might be awkward, but time_t alone will probab=
ly
warrant a reinstall. Having said that, I just tried a somewhat unscientific
experiment of running a bunch of random binaries from my 32-bit aligned sys=
tem
on my 16-bit aligned one and nothing broke. I then tried the reverse and sa=
w
stash smashing detection kicking in on anything more complex than ls.

> > I am bringing the later because I fixed some recent m68k build issues [=
1], that
> > seems to be from gcc changes over the years (as hinted by Andreas Schwa=
b) where
> > compiler changed some internal defined flags and it was not reflected o=
n glibc
> > (for a short, it seems that -mcpu=3D680X0 does not already define __mc6=
8020__).
> > The build fix is straightforward, but it raised question whether someth=
ing
> > else is not broken and has not been caught yet.

I had been aware of that issue for a while, but I wasn't able to figure it =
out
in a few minutes, and I never got around to looking deeper. Sorry for not
reporting it sooner.

> > Waldemar Brodkorb has posted his results on running glibc 2.38 on qemu =
and
> > it shows a lot of regression:
> >=20
> >     949 FAIL
> >    3344 PASS
> >      99 UNSUPPORTED
> >      16 XFAIL
> >       2 XPASS
> >=20
> > I guess the math failures are from the extra rounding and exception tes=
ting, which=20
> > requires a fully compliant IEEE 754 fp unit (which I guess m68k does no=
t provide).
> > The last m68k testsuite report where from 2.26 release [1] running unde=
r ARAnyM,
> > which shows the port is a better shape.
>=20
> The FP failures are most likely the result of the limitations of the FPU =
emulation
> in QEMU for m68k. ARAnyM is known to have much better FPU emulation suppo=
rt than
> QEMU, so if you want to have more accurate results, you should test on AR=
AnyM.

This is fairly typical of the math-related test failures I have seen from
other projects. I hadn't realised that QEMU's FPU emulation was lacking and
had just chalked it up to m68k's FP hardware having different capabilities.
Either way, I have never noticed any issues here when using software in
practise. Not that I've done any heavy number crunching on m68k, but who
would?

> > I also noted that gcc on mc68060 changed the __DEC_EVAL_METHOD__ to 2, =
which makes=20
> > glibc tests to fail to build (since it assumes __DEC_EVAL_METHOD__ equa=
l 0). This
> > again raised questions on how the math library would behave depending o=
f the target
> > chip.
> >=20
> > All of this issues and potentially work required for a new ABI makes me=
 wonder
> > if is really worth to keep *2* distinct ABIs for m68k.  Yes, m68k can f=
ollow the
> > MIPS mess and have 28 different ABIs that fails to be fully interoperab=
le; but
> > I think that if you really want to on this 'gnu32' journey, I think it =
will be
> > better to just deprecate the m68k current ABI, remove it from glibc; an=
d move
> > everything to new ABI.
>=20
> I actually wouldn't have a problem with that. I don't plan on supporting =
the old
> ABI with 16-bit alignment. After all, we had to change the ABI for TLS su=
pport
> as well, didn't we?

I don't want to force anyone here, but I'd also be fine with that. The only
downside, apart from compatibility, appears to be slightly increased memory
usage, and you're not exactly going to run modern Linux with 8MB RAM anyway=
.
