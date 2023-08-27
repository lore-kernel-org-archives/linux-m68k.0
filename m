Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CB7BC83F01
	for <linux-m68k@archiver.kernel.org>; Sun, 27 Aug 2023 11:29:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229594AbjH0L2X (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 27 Aug 2023 07:28:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbjH0L2C (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sun, 27 Aug 2023 07:28:02 -0400
Received: from mr4.vodafonemail.de (mr4.vodafonemail.de [145.253.228.164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DBB9130
        for <linux-m68k@vger.kernel.org>; Sun, 27 Aug 2023 04:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arcor.de;
        s=vfde-mb-mr2-21dec; t=1693135676;
        bh=wtVEvcrCRLMHT1ERRxTZ0a+NDiVkg77VNCixKIm4I9s=;
        h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
         Content-Type:From;
        b=FB1Gd3leD4foAZ4htABXXKBzsLqYsxIx2ZkR39eYb6tmEqnetn2zZaUQdLXbFsPm7
         8dx5DUtlkgbElgpxF1FxIf5Yn2LVmpintyuHMrLsaDaWBjOuQnUdewdWldVqU0Og9w
         pX7dU/5j17WGgdHcDFg5jg5SaYndYA0saKPLaVCo=
Received: from smtp.vodafone.de (unknown [10.0.0.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by mr4.vodafonemail.de (Postfix) with ESMTPS id 4RYWdS2whJz1xx2;
        Sun, 27 Aug 2023 11:27:56 +0000 (UTC)
Received: from [127.0.0.1] (dynamic-046-114-208-102.46.114.pool.telefonica.de [46.114.208.102])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp.vodafone.de (Postfix) with ESMTPSA id 4RYWd30fP3z9s46;
        Sun, 27 Aug 2023 11:27:32 +0000 (UTC)
Date:   Sun, 27 Aug 2023 11:27:29 +0000
From:   Richard <richiezid@arcor.de>
To:     debian-68k@lists.debian.org,
        James Le Cuirot <chewi@aura-online.co.uk>,
        Finn Thain <fthain@linux-m68k.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
CC:     libc-help@sourceware.org, debian-68k <debian-68k@lists.debian.org>,
        linux-m68k <linux-m68k@vger.kernel.org>
Subject: Re: Tuple and changes for m68k with -malign-int
In-Reply-To: <751c83150533b701d66ac24c8fe81863cf5eab98.camel@aura-online.co.uk>
References: <e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk> <10cbcb8a65639f88e7eeb503fd02df172bc46a07.camel@physik.fu-berlin.de> <80a52487-3105-ed5b-a1eb-ec1a0689ef21@linux-m68k.org> <751c83150533b701d66ac24c8fe81863cf5eab98.camel@aura-online.co.uk>
Message-ID: <B2522636-4873-42A3-883E-A73B1F1FBD28@arcor.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-type: clean
X-purgate: clean
X-purgate-size: 844
X-purgate-ID: 155817::1693135672-DAFFA7FF-3570C6F9/0/0
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org



On August 27, 2023 9:20:16 AM UTC, James Le Cuirot <chewi@aura-online=2Eco=
=2Euk> wrote:
>On Sun, 2023-08-27 at 10:46 +1000, Finn Thain wrote:
>> On Sat, 26 Aug 2023, John Paul Adrian Glaubitz wrote:
>>=20
>> > On Sat, 2023-08-26 at 09:53 +0100, James Le Cuirot wrote:
>>=20

>> >
>>=20
>> If the kernel breaks the ABI, that's a bug, not an excuse=2E=20

=2E=2E=2E
=2E=2E=2E

>I do know that m68k Linux has been significantly slower since the transit=
ion
>from linuxthreads to NPTL due to the lack of a spare register, but I gath=
er
>nothing can be done about that=2E

Thanks for saying that=2E Radically redefining "c" after 35 years of exist=
ence for next to zero gain wasn't such a great idea imho=2E

I hope the kernel ABI can remain stable and everything else is the problem=
 of libraries?

Richard=20
