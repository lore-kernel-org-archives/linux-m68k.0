Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ECE3C83F11
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Aug 2023 11:28:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231356AbjH1L14 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 28 Aug 2023 07:27:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232448AbjH1L1h (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 28 Aug 2023 07:27:37 -0400
Received: from mr6.vodafonemail.de (mr6.vodafonemail.de [145.253.228.166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0532DC4
        for <linux-m68k@vger.kernel.org>; Mon, 28 Aug 2023 04:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arcor.de;
        s=vfde-mb-mr2-21dec; t=1693222051;
        bh=FdjLizokGrfeTIP+a+JcIaSeTce/8pZc8s+sNX86ybw=;
        h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
         Content-Type:From;
        b=G9pD0HiOWDl/teIf2U1/L3cFsCy93vzYU1H3nALK0Vt3li433oVHSw6R43haQz6cr
         BYtRmtaW/T3wAsQ9e03P6l3fMESZCIvRmQDjuHMPqP6benlz5ZtcC6cCr6f40HP/pN
         J2vaSLzaAruAlaDgwgA374P3QLvTupu4yzzvtfyU=
Received: from smtp.vodafone.de (unknown [10.0.0.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by mr6.vodafonemail.de (Postfix) with ESMTPS id 4RZ7ZW4VrBz1y4K;
        Mon, 28 Aug 2023 11:27:31 +0000 (UTC)
Received: from [127.0.0.1] (dynamic-046-114-167-030.46.114.pool.telefonica.de [46.114.167.30])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp.vodafone.de (Postfix) with ESMTPSA id 4RZ7Z46Z4hz9s3v;
        Mon, 28 Aug 2023 11:27:05 +0000 (UTC)
Date:   Mon, 28 Aug 2023 11:26:58 +0000
From:   Richard <richiezid@arcor.de>
To:     debian-68k@lists.debian.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        James Le Cuirot <chewi@aura-online.co.uk>
CC:     Finn Thain <fthain@linux-m68k.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        libc-help@sourceware.org, debian-68k <debian-68k@lists.debian.org>,
        linux-m68k <linux-m68k@vger.kernel.org>
Subject: Re: Tuple and changes for m68k with -malign-int
In-Reply-To: <CAMuHMdUV0oM=zp6dG0KNbPJz2m7KBhynHa=ENUJmfh=u3gisbg@mail.gmail.com>
References: <e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk> <10cbcb8a65639f88e7eeb503fd02df172bc46a07.camel@physik.fu-berlin.de> <80a52487-3105-ed5b-a1eb-ec1a0689ef21@linux-m68k.org> <751c83150533b701d66ac24c8fe81863cf5eab98.camel@aura-online.co.uk> <CAMuHMdUV0oM=zp6dG0KNbPJz2m7KBhynHa=ENUJmfh=u3gisbg@mail.gmail.com>
Message-ID: <BEE12C98-6C32-4ECE-888F-EC01D4E5BCFD@arcor.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-type: clean
X-purgate: clean
X-purgate-size: 1609
X-purgate-ID: 155817::1693222047-4BFF8816-F4D88D58/0/0
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org




On August 28, 2023 7:00:07 AM UTC, Geert Uytterhoeven <geert@linux-m68k=2E=
org> wrote:
>On Sun, Aug 27, 2023 at 11:36=E2=80=AFAM James Le Cuirot
><chewi@aura-online=2Eco=2Euk> wrote:
>> On Sun, 2023-08-27 at 10:46 +1000, Finn Thain wrote:
>> > Moreover, why is it that only a few developers have a problem with ma=
king
>> > explicit their decisions regarding alignment of shorts? What actual p=
ain
>> > does it cause them to accept a patch to make their struct layouts pla=
in?
>>
>> Some projects do accept patches=2E Yann Collet was even kind enough to =
fix this
>> in zstd themselves=2E On the other hand, we have had to fight to stop P=
ython
>> from dropping m68k support entirely=2E The real problem is the effort r=
equired
>> to produce these patches=2E I haven't been able to wrap my head around =
this so
>> far, but I would still like to learn=2E I could see myself eventually f=
ixing
>> mold, but LLVM feels like a very tall order=2E
>
>Perhaps we need a new compiler warning: "hole in structure due to
>non-natural alignment, please consider adding explicit padding"?

Sounds reasonable but I am afraid in 99% of cases this would be completely=
 irrelevant and not break anything so the acceptance would be pretty low=2E=
=20

The problem arises only when people start doing "strange" things with such=
 structs=2E Can we define strange things in a better way? It appears to me =
all modern c standards somewhat lack an attribute to mark a struct as being=
 "special use" and thus emit more warnings and avoid some kinds of trickery=
=2E

Richard
