Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 247FFEE49A0
	for <linux-m68k@archiver.kernel.org>; Mon, 21 Aug 2023 23:18:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231637AbjHUXSr (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 21 Aug 2023 19:18:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231476AbjHUXSr (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 21 Aug 2023 19:18:47 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65970180
        for <linux-m68k@vger.kernel.org>; Mon, 21 Aug 2023 16:18:45 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 1FFA55C250C;
        Mon, 21 Aug 2023 19:18:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 21 Aug 2023 19:18:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1692659922; x=1692746322; bh=EFD29iYuKfuD8
        9lBLYnHLa0XD2POEZNm6DrR5scOje4=; b=jEuTOZ3dXQAxam2lecL+MLnG4jAjw
        7X1/tr2rlFtDl3JAxuL1PYyf7vy/uHljYmjZxnP1CwSImg+1wOeBtB1yxLYUpKv5
        d9dozMa17lT3awYDxBCshUTo2/hgno0/kuq9YkvShhQuVR6etZm4dilt8pEYfneC
        K2xjm2rLTZjoZnpHfvf35rR+S9wC+uJ2g0I7UY8n9oBlUThv3R9MIZnLLzJn5M3H
        YaIn+j/wIWOqVmgsLERBqdl9GGYD+2VhBW71YShpT8mGnXIN+XQuY3X3ZvYD5C+k
        hBFGL/mCn8hqKkpeUNcwwpSj8yU8afr/gkr9Xjhudhs07soXiGcQlBj2Q==
X-ME-Sender: <xms:0fDjZHZQfrBIsYiLkUzkqktEzPV8IlWTSNly6POm4OIS70jJXaWU9w>
    <xme:0fDjZGZi0GqHMaFcdg5X1WM5O27PUO1-qjBmskDWzBhW4LfAMlYWMPYBgV0EXJitc
    Mi5_8G9dhx-na5OqIk>
X-ME-Received: <xmr:0fDjZJ_hidR4HOC5dmx0CIktvskbXP8pm6u66MwDo3IHQ8mXBa6zHVbdUNZxHZwweRBbc91VADP9ce9JkLC3f8OWGstsxDAuHLM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedruddvtddgvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehmtderredttdejnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelfeeklefggfetkedukeevfffgvdeuheetffekledtfeejteelieejteeh
    geelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:0fDjZNpW4YTdkbvZgsUKAxCRowZFojSG3Az60Ot--HfEe9x4t7MPKA>
    <xmx:0fDjZCqbNWGq6lKJeVTDnDTBfP9ndyTrUOzl9j045r5TRdLg5mKvaQ>
    <xmx:0fDjZDRp2YRm9tfvCY1q4zEfLVpbYHasnlpD5izVkgIwDMa-nJpPHQ>
    <xmx:0vDjZFVBio4TlFD-Qc2lAFBLgJRRQfKSPNk6z_5BhV1YUt5SUnuifQ>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Aug 2023 19:18:37 -0400 (EDT)
Date:   Tue, 22 Aug 2023 09:18:54 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     Geert Uytterhoeven <geert@linux-m68k.org>, will@sowerbutts.com,
        linux-m68k@vger.kernel.org, rz@linux-m68k.org,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [PATCH RFC v3 2/2] m68k/q40: add data_swab option for pata_falcon
 to byte-swap disk data
In-Reply-To: <7fc5e704-d4ba-67d2-88cd-38d8dd2b1dfb@gmail.com>
Message-ID: <3530e493-1cc6-8913-fb97-3abb0c83c76c@linux-m68k.org>
References: <20230817035001.8400-1-schmitzmic@gmail.com> <20230817035001.8400-3-schmitzmic@gmail.com> <f604a8f6-6203-84c5-82b9-570348d416ec@linux-m68k.org> <CAMuHMdV6NWRKL8DAD2e4HPz=fbcAUqi6ww-8_9Mjg0t8eiZCGQ@mail.gmail.com> <8bf4980e-f269-48d2-5b77-3fd6c7270bef@gmail.com>
 <fd7cd3b9-3f86-feb4-e9ce-aafaea272840@gmail.com> <CAMuHMdXcz0koHQXAaWCoGXPJVva2a43C9CuwQf3mZeWhPaSiWw@mail.gmail.com> <00d475d4-76c1-0ae8-1723-a0fc08a57de4@linux-m68k.org> <CAMuHMdUAA1rEVowURsTaTyH8o3acKyfL3Hpz75ZE1Qrb6AdG5w@mail.gmail.com>
 <c193a0b9-efff-d0d5-c462-5853e104cf7f@linux-m68k.org> <7fc5e704-d4ba-67d2-88cd-38d8dd2b1dfb@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463811774-169193315-1692659934=:5730"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811774-169193315-1692659934=:5730
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE


On Tue, 22 Aug 2023, Michael Schmitz wrote:

> CC Adrian for comment...
>=20

My comments in the messages quoted below should not be interpreted as an=20
objection to the patches Michael submitted.

I've already done too much bikeshedding there and while it's always=20
tempting to do more I will desist.

This was just a look askance at the design of the driver model. So it's=20
really only of academic interest.

> Does anything in the Debian installer rely on a specific device name suff=
ix in
> /sys/bus/platform/devices/ ?
>=20
> On Atari, atari-falcon-ide does not have a suffix, but on Q40, it would g=
et
> suffix .0 or .1 depending on what IO base the ISA IDE adapter uses.
>=20
> Seeing as Q40 support in the atari-falcon-ide has been broken since it wa=
s
> introduced, this is rather about future installer support than about
> inadvertently breaking current code.
>=20
> Cheers,
>=20
> =C2=A0=C2=A0=C2=A0 Michael
>=20
> On 21/08/23 23:08, Finn Thain wrote:
> > On Mon, 21 Aug 2023, Geert Uytterhoeven wrote:
> >
> >> On Sat, Aug 19, 2023 at 1:53=E2=80=AFAM Finn Thain <fthain@linux-m68k.=
org> wrote:
> >>> On Fri, 18 Aug 2023, Geert Uytterhoeven wrote:
> >>>> Of course 0 also works, but causes ".0" to be appended to the platfo=
rm
> >>>> device's name, visible in e.g. /sys/bus/platform/devices/.
> >>> That seems desirable to me.
> >> Why would it be desirable?
> >> IMHO this is an unneeded change which is visible in userspace.
> >>
> > Only so what's visible in userspace would be consistent across atari an=
d
> > q40 (and anything else that happens to instantiate the device in future=
).
> >
> > Basically, I don't really understand why id -1 is better than id 0. I'v=
e
> > searched Documentation/device-tree and I still don't understand why a
> > singleton would need a special bus id.
>=20

---1463811774-169193315-1692659934=:5730--
