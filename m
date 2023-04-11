Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0021C77B61
	for <linux-m68k@archiver.kernel.org>; Tue, 11 Apr 2023 00:17:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229776AbjDKARW (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 10 Apr 2023 20:17:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbjDKARV (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 10 Apr 2023 20:17:21 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6C031FF3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 10 Apr 2023 17:17:20 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id A92A05C0162;
        Mon, 10 Apr 2023 20:17:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 10 Apr 2023 20:17:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-id:content-type
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1681172238; x=
        1681258638; bh=9pbKqVPjuniX3EKLsRYkzPRDJ75o3PLXPY3weQmBHLk=; b=H
        loQwPSH+xMdDqsqZJ3kWQMx/Lmy8oTES3mWLQjIKPU7ktIjZrglrY8b/hmCR3Vw4
        QZ2tu0UfMdwuqb0TgNnP8kogz5mPAZlg6k5CXh1BlgYYlyreHsuhK/83mUkCoF2t
        OYInzbiMdjKDwmNPiaWty1TiO0fJuVJthAqOeLF2kOkDvYafpqGAZfCYxnGiH680
        rf5fIGBPlziYoxcKY8WVnTpmklP2WGtC+qMCbsEVew6vaJlZ+rfnxg/7BnvoXwZX
        Llkpdg16j5LgHoPA0gu5KjhGiIP0F3JAXBU7zWil3VN4OzcytFbAgl4UNMuUcIXG
        XVsBICPQurfHU+c+VjNqQ==
X-ME-Sender: <xms:Dqc0ZOrYbG-TM17grFDB8c5WRGICj04ghgN6aCR2iR49tkrYXxQuuw>
    <xme:Dqc0ZMqz6GfSb6iI63oOA9Ws5xDT7C7q5bBDYpmtPrS-ZdF2jS472I209MbsKu_65
    8ylv6l7tO06fyiOkMM>
X-ME-Received: <xmr:Dqc0ZDNhNDHnbMMi3zyzGkPfVmF9SEaIqyPz4SdXH9DtMX0gom6eOVe4xrG9HwMOui45zWEy5eH_PEhJp-ih-yOo05mG7d9V2K8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdekfedgfeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehmtderredttdejnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelfeeklefggfetkedukeevfffgvdeuheetffekledtfeejteelieejteeh
    geelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:Dqc0ZN6giByFt2_Yn_0m_i12Wn90GgLEWFk7CbEFXY66FlzntLZ5eA>
    <xmx:Dqc0ZN62n_OTeBOctAGBuqkckOk0vUwKmG9sgE2aD3S87nkr5-SN3Q>
    <xmx:Dqc0ZNjs2tL5euW-Xi44Doyu-0gqGDr_KnV1kGOTqeTIebjwUjsQIg>
    <xmx:Dqc0ZNGBC6cQDi8klXvNmkNQZByNNYBRvXxnZ6AZGoSbDlHp9q3OzQ>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Apr 2023 20:17:15 -0400 (EDT)
Date:   Tue, 11 Apr 2023 10:20:33 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Andreas Schwab <schwab@linux-m68k.org>,
        debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
Subject: instrumentation, was Re: core dump analysis
In-Reply-To: <79ad6f51-5d02-0104-3b63-024e54a25e3c@gmail.com>
Message-ID: <7106e764-4def-c03a-30d5-e4f810bd85cc@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com> <c47abfdc-31c8-e7ed-1c14-90f68710f25d@gmail.com> <040ad66a-71dd-001b-0446-36cbd6547b37@yahoo.com> <5b9d64bb-2adc-20a2-f596-f99bf255b5cc@linux-m68k.org> <56bd9a33-c58a-58e0-3956-e63c61abe5fe@yahoo.com>
 <1725f7c1-2084-a404-653d-9e9f8bbe961c@linux-m68k.org> <e10b8e06-6a36-5c83-89da-bec8fd7d3ed9@linux-m68k.org> <19d1f2ac-67dd-5415-b64a-1e1b4451f01e@linux-m68k.org> <ef5bcf6f-3541-50c2-9b6a-5e9d2f9c68d5@linux-m68k.org> <87zg7rap45.fsf@igel.home>
 <5a5588ca-81c3-3f4c-fd43-c95e90b27939@linux-m68k.org> <67f6bc5f-e1fc-64b9-cb3c-1698cf4daf51@gmail.com> <9eea635f-c947-eae7-09fa-d39f00d91532@linux-m68k.org> <3dfea52a-b09e-517a-c3ca-4b559a3d9ce4@gmail.com> <23ddfd2a-1123-45ae-866d-158d45e23ba2@linux-m68k.org>
 <8ff53c49-331e-1388-31c5-79cf21a2c201@gmail.com> <CAMuHMdVPayRjadOYxxZb-J7q-YtgZDwtCs93+Rz_ReSk+NHCwg@mail.gmail.com> <79ad6f51-5d02-0104-3b63-024e54a25e3c@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="-1463811774-358700283-1681011941=:2623"
Content-ID: <99331d91-607c-791b-c4b4-251acf05e028@nippy.intranet>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811774-358700283-1681011941=:2623
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <d0da010f-834a-bc21-083d-20ae3835ced1@nippy.intranet>

On Sun, 9 Apr 2023, Michael Schmitz wrote:

> Am 08.04.2023 um 00:06 schrieb Geert Uytterhoeven:
> >
> > On Fri, Apr 7, 2023 at 3:58=E2=80=AFAM Michael Schmitz <wrote:
> >> The easiest way to do that is to log all wait and signal syscalls, as=
=20
> >> well as process exit. That might alter timing if these log messages=20
> >> go to the serial console though. Is that what you have in mind?
> >
> > Store to RAM, retrieve through a new /proc file?
>=20
> Yes, that could be done, though I'd rather avoid duplicating a lot of=20
> the generic message formatting code (printk and friends).
>=20
> I'll have a look around ...
>=20

A better solution might be be to port the existing instrumentation like=20
ftrace, kprobes, uprobes etc. Might be a lot of work though. I wonder=20
how portable that stuff is.

If you use printk, you could probably avoid most of the delays by enabling=
=20
the dummy console. Then the kernel messages would be collected with dmesg,=
=20
given a sufficiently large CONFIG_LOG_BUF_SHIFT. But it would be=20
inconvenient to have no serial console available for the usual purposes.
---1463811774-358700283-1681011941=:2623--
