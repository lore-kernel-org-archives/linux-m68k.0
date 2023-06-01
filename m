Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27159C77B7A
	for <linux-m68k@archiver.kernel.org>; Thu,  1 Jun 2023 07:30:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231993AbjFAHaz (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 1 Jun 2023 03:30:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231990AbjFAHay (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 1 Jun 2023 03:30:54 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ECF49F
        for <linux-m68k@lists.linux-m68k.org>; Thu,  1 Jun 2023 00:30:53 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4QWyV354nPz4x3s;
        Thu,  1 Jun 2023 17:30:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
        s=201909; t=1685604651;
        bh=3pSew9k6P5Gtc4GC6KdLUot/OsZwv+jd76EFbmDpIk4=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=SA/OoBhnuuIWzUOhL08upnPl4ERBqykcIUj24b33w/hUV01t300CfacaI6RCoVSmo
         uwxDVxHrlaHoAng4/N7sDzVzEGuBTBA5LLG8DjaGI4aKfs/5mAUg8gRnDFm1tVHZ42
         m6pZ6MX2KJCFZ5cXVSOEoUdB6Dx/pFUr+ps2zsnj2/zAGIbV+0MSyvPWvFwJ3UH+dS
         mOJKGTu7vXhI5SUhr7SUro6ttrH0KoBJHGbu6VvcmdTTjNcc9/acF6lzBPFliQCJQA
         l5IJW3rk0lnG2+nZQA8f4iJBfbcwQSstaJRoloINI4Vw8LBN7EQyFokEX8YVr/5pkf
         tpVh92mCDDCLQ==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Finn Thain <fthain@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Joshua Thompson <funaho@jurai.org>, linuxppc-dev@lists.ozlabs.org,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Exclude m68k-only drivers from powerpc entry
In-Reply-To: <f020b46c-f291-ad2f-6c4c-6bc79955e6f2@linux-m68k.org>
References: <20230531125023.1121060-1-mpe@ellerman.id.au>
 <CAMuHMdUbVmjcYyXmparBm6pQwu3q7HpTKsKfi_aAHGOSX97MUw@mail.gmail.com>
 <f020b46c-f291-ad2f-6c4c-6bc79955e6f2@linux-m68k.org>
Date:   Thu, 01 Jun 2023 17:30:51 +1000
Message-ID: <87mt1jhc5w.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Finn Thain <fthain@linux-m68k.org> writes:
> On Wed, 31 May 2023, Geert Uytterhoeven wrote:
>> On Wed, May 31, 2023 at 2:50=E2=80=AFPM Michael Ellerman <mpe@ellerman.i=
d.au> wrote:
>> > The powerpc section has a "F:" entry for drivers/macintosh, matching=20
>> > all files in or below drivers/macintosh. That is correct for the most=
=20
>> > part, but there are a couple of m68k-only drivers in the directory, so=
=20
>> > exclude those.
>> >
>> > Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>>=20
>> Thanks for your patch!
>>=20
>> > --- a/MAINTAINERS
>> > +++ b/MAINTAINERS
>> > @@ -11916,6 +11916,8 @@ L:      linuxppc-dev@lists.ozlabs.org
>> >  S:     Odd Fixes
>> >  F:     arch/powerpc/platforms/powermac/
>> >  F:     drivers/macintosh/
>> > +X:     drivers/macintosh/adb-iop.c
>> > +X:     drivers/macintosh/via-macii.c
>> >
>> >  LINUX FOR POWERPC (32-BIT AND 64-BIT)
>> >  M:     Michael Ellerman <mpe@ellerman.id.au>
>>=20
>> LGTM, as there are already entries for these two files under
>> "M68K ON APPLE MACINTOSH".
>
> Right. I should have addded those "X files" in commit 2ae92e8b9b7.

Or I should have suggested it when I acked that commit :}

cheers
