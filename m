Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 295B6C83F12
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Aug 2023 20:19:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229876AbjH1UTH (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 28 Aug 2023 16:19:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230192AbjH1USi (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 28 Aug 2023 16:18:38 -0400
Received: from mr4.vodafonemail.de (mr4.vodafonemail.de [145.253.228.164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68E5DCC0
        for <linux-m68k@vger.kernel.org>; Mon, 28 Aug 2023 13:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arcor.de;
        s=vfde-mb-mr2-21dec; t=1693253824;
        bh=z98RgkpZWqK/n223Da7cdqWcq/l8/Q3KqjtM1Wah9Hw=;
        h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
         Content-Type:From;
        b=q+H9M7PmEXQ9FS9/i7JDYWX6+yg7T5QXg+KyQQ00xkAN+DBSxqioygP5bgBal5QDp
         8nGwAERefYWuGmqJ9EcNP9ybBXASPkrUp1fAAz5JuPZV/m3t3iMUs1qmHSXVNlqt8d
         rheNNgy175C/ngW3l9ldnySAfsMCcON+pxSWDsAI=
Received: from smtp.vodafone.de (unknown [10.0.0.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by mr4.vodafonemail.de (Postfix) with ESMTPS id 4RZMKW6Bwyz1y3S;
        Mon, 28 Aug 2023 20:17:03 +0000 (UTC)
Received: from [127.0.0.1] (dynamic-046-114-210-002.46.114.pool.telefonica.de [46.114.210.2])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp.vodafone.de (Postfix) with ESMTPSA id 4RZMK43W40zHpxb;
        Mon, 28 Aug 2023 20:16:37 +0000 (UTC)
Date:   Mon, 28 Aug 2023 20:16:31 +0000
From:   Richard <richiezid@arcor.de>
To:     debian-68k@lists.debian.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        James Le Cuirot <chewi@aura-online.co.uk>
CC:     Finn Thain <fthain@linux-m68k.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        libc-help@sourceware.org, debian-68k <debian-68k@lists.debian.org>,
        linux-m68k <linux-m68k@vger.kernel.org>
Subject: Re: Tuple and changes for m68k with -malign-int
In-Reply-To: <BEE12C98-6C32-4ECE-888F-EC01D4E5BCFD@arcor.de>
References: <e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk> <10cbcb8a65639f88e7eeb503fd02df172bc46a07.camel@physik.fu-berlin.de> <80a52487-3105-ed5b-a1eb-ec1a0689ef21@linux-m68k.org> <751c83150533b701d66ac24c8fe81863cf5eab98.camel@aura-online.co.uk> <CAMuHMdUV0oM=zp6dG0KNbPJz2m7KBhynHa=ENUJmfh=u3gisbg@mail.gmail.com> <BEE12C98-6C32-4ECE-888F-EC01D4E5BCFD@arcor.de>
Message-ID: <67BE11AC-6C14-441B-BA9C-B405C3783886@arcor.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-type: clean
X-purgate: clean
X-purgate-size: 908
X-purgate-ID: 155817::1693253819-A2FF818D-9419BD14/0/0
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org



On August 28, 2023 11:26:58 AM UTC, Richard <richiezid@arcor=2Ede> wrote:
>
>
>
>On August 28, 2023 7:00:07 AM UTC, Geert Uytterhoeven <geert@linux-m68k=
=2Eorg> wrote:
>>On Sun, Aug 27, 2023 at 11:36=E2=80=AFAM James Le Cuirot
>><chewi@aura-online=2Eco=2Euk> wrote:
>>> On Sun, 2023-08-27 at 10:46 +1000, Finn Thain wrote:

>>
>>Perhaps we need a new compiler warning: "hole in structure due to
>>non-natural alignment, please consider adding explicit padding"?
>
>Sounds reasonable but I am afraid in 99% of cases this would be completel=
y irrelevant and not break anything so the acceptance would be pretty low=
=2E=20

On a second thought, that warning might get some acceptance if it is formu=
lated slightly differently=2E=2E making it more clear that the way the stru=
ct is arranged will waste memory in addition to creating potential portabil=
ity problems?


Richard 
