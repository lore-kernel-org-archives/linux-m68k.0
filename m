Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC0FFC76196
	for <linux-m68k@archiver.kernel.org>; Tue, 11 Apr 2023 05:51:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbjDKFvD (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 11 Apr 2023 01:51:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229771AbjDKFvC (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 11 Apr 2023 01:51:02 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A72889C
        for <linux-m68k@lists.linux-m68k.org>; Mon, 10 Apr 2023 22:51:01 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 527465C01DA;
        Tue, 11 Apr 2023 01:50:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 11 Apr 2023 01:50:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1681192259; x=1681278659; bh=6U59wi/ceGrTp
        kLeKuI642l84xOXN2eKrrC3Kvw4WyE=; b=RZ5reLaa7TRCKhkFOdfZUYqIfwnJ8
        KzuEKhbkt5qrIVsehoOf0ObvJgrgUG2EHY7g+dFxSinuOOdoyNvSO9gelhBEfsR6
        t+tebBS1lH8dXSgmM70ae4337bDonvz2TqV9MY/WcYWeHnghse+mhozhxlYhXwtw
        h5ShYILO3NIfxlUnckunQAUG0MOc1sfo5sdCMg10HJfoW5DBC3yWdjI2vF7Vx4sV
        iiitlAdRMddf6aLVFKyYMume5/dMhKqP9Htq4Knhx8rQpFys/I8ie2ckaNAulBym
        v2iOSXsAZRFMYQne5mp89QoeGgNDJSiD+9pgoxon5Pi2P4NE/fIadoEdw==
X-ME-Sender: <xms:QvU0ZOYlvVgVU13H3ot9wMhsXRu3fEMIAlgdt3o7B2nfBmgB0aVDtw>
    <xme:QvU0ZBbjk2QWF9scqJOrselhbPRrthZISLSYD1zS4FCghoI5ooc6QRSIQCMyDfSbj
    -vmnAzRVkoju3Se0DQ>
X-ME-Received: <xmr:QvU0ZI_MpRQ1GTTEuD7aMUWeB3S23t3wArWA35_TVv-thYoM6vmMbFSqNLpqzKnh5mGh2jJ53oFzZEbStYw5atFofxRx3cB7vtQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdekfedguddtvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefujgfkfhggtgesmhdtreertddtjeenucfhrhhomhephfhinhhn
    ucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrf
    grthhtvghrnhepleefkeelgffgteekudekveffgfdvueehteffkeeltdefjeetleeijeet
    heegleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:QvU0ZAr_F5vrEUj3eRk3q5dRSEEtsclDrL5QpVy81yS-eiOYQ3Su6g>
    <xmx:QvU0ZJpX1p0RoF3SOO4suOjGAW8qNBqpQ2EWwHn9vHvY1QXu7emaOg>
    <xmx:QvU0ZORE1pVwTIMftTWewSM_zGkPKpRk-w_fGQwlqEtNmCu4QcDOKQ>
    <xmx:Q_U0ZA3-FoXO4VMu_Fn9Cioi2pcPJZx__ThnJL61fY7skvm1CFk1sw>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Apr 2023 01:50:56 -0400 (EDT)
Date:   Tue, 11 Apr 2023 15:54:16 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Andreas Schwab <schwab@linux-m68k.org>,
        debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
Subject: Re: instrumentation, was Re: core dump analysis
In-Reply-To: <912d690c-c43c-8a72-ec8e-14cfb26785f1@gmail.com>
Message-ID: <3118b1f6-f108-975f-d727-6b3976b49245@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com> <5b9d64bb-2adc-20a2-f596-f99bf255b5cc@linux-m68k.org> <56bd9a33-c58a-58e0-3956-e63c61abe5fe@yahoo.com> <1725f7c1-2084-a404-653d-9e9f8bbe961c@linux-m68k.org> <e10b8e06-6a36-5c83-89da-bec8fd7d3ed9@linux-m68k.org>
 <19d1f2ac-67dd-5415-b64a-1e1b4451f01e@linux-m68k.org> <ef5bcf6f-3541-50c2-9b6a-5e9d2f9c68d5@linux-m68k.org> <87zg7rap45.fsf@igel.home> <5a5588ca-81c3-3f4c-fd43-c95e90b27939@linux-m68k.org> <67f6bc5f-e1fc-64b9-cb3c-1698cf4daf51@gmail.com>
 <9eea635f-c947-eae7-09fa-d39f00d91532@linux-m68k.org> <3dfea52a-b09e-517a-c3ca-4b559a3d9ce4@gmail.com> <23ddfd2a-1123-45ae-866d-158d45e23ba2@linux-m68k.org> <8ff53c49-331e-1388-31c5-79cf21a2c201@gmail.com> <CAMuHMdVPayRjadOYxxZb-J7q-YtgZDwtCs93+Rz_ReSk+NHCwg@mail.gmail.com>
 <79ad6f51-5d02-0104-3b63-024e54a25e3c@gmail.com> <7106e764-4def-c03a-30d5-e4f810bd85cc@linux-m68k.org> <912d690c-c43c-8a72-ec8e-14cfb26785f1@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463811774-1810258002-1681192456=:25192"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811774-1810258002-1681192456=:25192
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 11 Apr 2023, Michael Schmitz wrote:

> Am 11.04.2023 um 12:20 schrieb Finn Thain:
> > On Sun, 9 Apr 2023, Michael Schmitz wrote:
> >> Am 08.04.2023 um 00:06 schrieb Geert Uytterhoeven:
> >>> On Fri, Apr 7, 2023 at 3:58=E2=80=AFAM Michael Schmitz <wrote:
> >>>> The easiest way to do that is to log all wait and signal syscalls,=
=20
> >>>> as well as process exit. That might alter timing if these log=20
> >>>> messages go to the serial console though. Is that what you have in=
=20
> >>>> mind?
> >>>
> >>> Store to RAM, retrieve through a new /proc file?
> >>
> >> Yes, that could be done, though I'd rather avoid duplicating a lot of=
=20
> >> the generic message formatting code (printk and friends).
> >>
> >> I'll have a look around ...
> >>
> >
> > A better solution might be be to port the existing instrumentation=20
> > like ftrace, kprobes, uprobes etc. Might be a lot of work though. I=20
> > wonder how portable that stuff is.
> >
> > If you use printk, you could probably avoid most of the delays by=20
> > enabling the dummy console. Then the kernel messages would be=20
> > collected with dmesg, given a sufficiently large CONFIG_LOG_BUF_SHIFT.=
=20
> > But it would be inconvenient to have no serial console available for=20
> > the usual purposes.
>=20
> Can we disable the serial console after boot, by registering the dummy=20
> console? Or will that just log messages to both?
>=20

I don't know. I'd have to experiment in QEMU or Aranym.
---1463811774-1810258002-1681192456=:25192--
