Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB0D6C83F12
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Aug 2023 12:13:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbjH1MMf (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 28 Aug 2023 08:12:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232638AbjH1MMX (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 28 Aug 2023 08:12:23 -0400
Received: from mr3.vodafonemail.de (mr3.vodafonemail.de [145.253.228.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACAE8123
        for <linux-m68k@vger.kernel.org>; Mon, 28 Aug 2023 05:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arcor.de;
        s=vfde-mb-mr2-21dec; t=1693224735;
        bh=wP+PsIrGcce204b3tUS5KhFoZgG0ebFMGZnLrmYvCz0=;
        h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
         Content-Type:From;
        b=qPJjKpTtqvKzfox6n8HsQbTeRbzG1lRQeXIqHtISc2txNCxQS2OoWFWAQcxzm+1LK
         eYoDF5WJDQ4PDc203DMNLC5mWqyv/SJeIpZKZ+O4l4+dUxAEBqV7LUt42XRHGvzP4o
         pgtORZViEhrohzg/ysEiYl8EFCBtZSkh4AAHBqUk=
Received: from smtp.vodafone.de (unknown [10.0.0.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by mr3.vodafonemail.de (Postfix) with ESMTPS id 4RZ8Z74ssVz1ysV;
        Mon, 28 Aug 2023 12:12:15 +0000 (UTC)
Received: from [127.0.0.1] (dynamic-046-114-167-030.46.114.pool.telefonica.de [46.114.167.30])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp.vodafone.de (Postfix) with ESMTPSA id 4RZ8Yp43cpzHnfy;
        Mon, 28 Aug 2023 12:11:55 +0000 (UTC)
Date:   Mon, 28 Aug 2023 12:11:49 +0000
From:   Richard <richiezid@arcor.de>
To:     debian-68k@lists.debian.org,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        James Le Cuirot <chewi@aura-online.co.uk>
CC:     libc-help@sourceware.org, linux-m68k <linux-m68k@vger.kernel.org>
Subject: Re: Tuple and changes for m68k with -malign-int
In-Reply-To: <99aacdf62e82c8c4244e47052d5661df7417a47a.camel@physik.fu-berlin.de>
References: <e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk> <10cbcb8a65639f88e7eeb503fd02df172bc46a07.camel@physik.fu-berlin.de> <5F114C03-5320-485F-86E3-946A334F16D1@arcor.de> <99aacdf62e82c8c4244e47052d5661df7417a47a.camel@physik.fu-berlin.de>
Message-ID: <D3BF1EA1-1675-42EB-AF10-592F4C3D5C83@arcor.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-type: clean
X-purgate: clean
X-purgate-size: 1433
X-purgate-ID: 155817::1693224731-DCFF094E-8CF42DD9/0/0
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org



On August 28, 2023 10:57:25 AM UTC, John Paul Adrian Glaubitz <glaubitz@ph=
ysik=2Efu-berlin=2Ede> wrote:
>On Sat, 2023-08-26 at 19:24 +0000, Richard wrote:
>> > Not only mold but also most notably the following projects:
>>=20
>> a linker that is broken by a slightly unusual alignment isn't exactly a
>> prime example=2E=2E if any project I would expect linkers and binary to=
ols
>> to pay attention to portability=2E
>
>Portable shouldn't mean having to accommodate for unreasonable design dec=
isions
>of other developers=2E It's perfectly fine to assume 32-bit natural align=
ment on
>a 32-bit platform and I don't think it's fair to put the burden of adopti=
ng for
>unusual design decisions on to upstream projects=2E

Assuming anything that is not declared by the c standard is not good imho=
=2E The C lang is well known for its pitfalls and the basic binary tools ou=
ght not to set bad precedents ignoring those=2E=20

 It is also reasonable to assume that on modern hw cache is filled in bloc=
ks of perhaps 1k or more and thus "unnatural" alignment might actually help=
 performance because more fits into that one data burst=2E

>> Thus=2E=2E is there any need to change the kernel ABI?
>
>I don't think this mandates changes to the kernel ABI=2E

That would be really good, anything else could be handled by library versi=
oning in a mostly backwards compatible way?

Richard=20
