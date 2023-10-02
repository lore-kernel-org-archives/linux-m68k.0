Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B14B7E784BA
	for <linux-m68k@archiver.kernel.org>; Mon,  2 Oct 2023 19:42:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbjJBTmr (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 2 Oct 2023 15:42:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238941AbjJBTmp (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 2 Oct 2023 15:42:45 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03BA291
        for <linux-m68k@lists.linux-m68k.org>; Mon,  2 Oct 2023 12:42:42 -0700 (PDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
        by ams.source.kernel.org (Postfix) with ESMTP id 46E85B81658;
        Mon,  2 Oct 2023 19:42:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70430C433CA;
        Mon,  2 Oct 2023 19:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696275760;
        bh=hub9jctWu9D1FsgfFGloNeuVrD9nxiOWZcxoX8/pNEY=;
        h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
        b=XH9xBab5FRDSSExMVXnRHhMOHn/MFLpBg7+WmEGQdxiVZ2Yp15ZqPTjJlr3o7U9Gj
         89hUUOwFNHy10aYrnQnBFctzCeNwPhvlJnV6KLdxSeLO8cdH7tVT6f515+eD0CXQgW
         eIBJ7BYhFVP9M69gnYj7bD2CvPdIQCuCcuq85D1tWMCCHydgcTrDieq42aDUSabkTU
         W5l+JWhCiuecRSkaCK/lCpOtCdRTfocMTeLoaPQvI4WVQG8h1/a59O0hsSndYr0maH
         NihCWjCq1zkokLkggPvXmypfQH6e0KSXGefa9WM1GIZVjfHoBKjHlacbOkrg7ylByf
         8KziE+UPCxR9g==
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailauth.nyi.internal (Postfix) with ESMTP id 4F9C727C0054;
        Mon,  2 Oct 2023 15:42:39 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Mon, 02 Oct 2023 15:42:39 -0400
X-ME-Sender: <xms:Lh0bZaSpkrJ9mh2udTx3-pXdeDEUTT9qU4ROPpEX7n5ddbcHBPg1fA>
    <xme:Lh0bZfyuAbCwXPRw6Ex1AfPN39oTWIw3vbe65sf-KuKHpeOxqqpYtiAbES5Lx_JE1
    G4CDOvFmUj4Oex2vqg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrfedtgddutdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusehkvghrnhgvlhdrohhrgheqnecuggftrf
    grthhtvghrnhepvddttdffjeefgeeggfelfefggefhheeffefftefggfelgeduveevtefh
    feejveeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghrnhguodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduvdekhedujedt
    vdegqddvkeejtddtvdeigedqrghrnhgupeepkhgvrhhnvghlrdhorhhgsegrrhhnuggsrd
    guvg
X-ME-Proxy: <xmx:Lh0bZX1BnkMPlhPOGUuhBaFwi4XMi73M0dlcoh60qhntYku9Iu1S3w>
    <xmx:Lh0bZWCcVwMM9UqBGsqYQO6GM6xfBcu-jfDofXS84ZdZP6N7GT9Z4A>
    <xmx:Lh0bZTiZj8dV_J_B0Yw8us2QOuV--92RScpiRSzzTUihVEJ2Y_QC3g>
    <xmx:Lx0bZbbToS1y64_K-wVEEP8QgXSiMwEMKojjNBgVSzqBr5u9q-J61g>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id C4FC7B6008D; Mon,  2 Oct 2023 15:42:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-958-g1b1b911df8-fm-20230927.002-g1b1b911d
MIME-Version: 1.0
Message-Id: <d5836a46-c614-4270-8473-05c98bbab41f@app.fastmail.com>
In-Reply-To: <CAMuHMdWFCSQgsf_0qwdkkAif3zDXM2N-WEymJBa1eeT4N6Ezcw@mail.gmail.com>
References: <20230925155328.443664-1-arnd@kernel.org>
 <CAMuHMdWFCSQgsf_0qwdkkAif3zDXM2N-WEymJBa1eeT4N6Ezcw@mail.gmail.com>
Date:   Mon, 02 Oct 2023 21:42:18 +0200
From:   "Arnd Bergmann" <arnd@kernel.org>
To:     "Geert Uytterhoeven" <geert@linux-m68k.org>
Cc:     "kernel test robot" <lkp@intel.com>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] m68k: asm/io.h: mark mmio read addresses as const
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Oct 2, 2023, at 15:12, Geert Uytterhoeven wrote:
> On Mon, Sep 25, 2023 at 5:53=E2=80=AFPM Arnd Bergmann <arnd@kernel.org=
> wrote:
>>  #define out_8(addr,b) (void)((*(__force volatile u8 *) (unsigned lon=
g)(addr)) =3D (b))
>>  #define out_be16(addr,w) (void)((*(__force volatile u16 *) (unsigned=
 long)(addr)) =3D (w))
>
> Shouldn't a similar change be made to rom_in_{8,be16,le16}()?

Right, these seem to have escaped my regex searches.

> I can do that while applying...

Ok, thanks!

     Arnd
