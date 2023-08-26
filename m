Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F4D9C83F15
	for <linux-m68k@archiver.kernel.org>; Sat, 26 Aug 2023 19:36:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbjHZTfi (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 26 Aug 2023 15:35:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbjHZTfN (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sat, 26 Aug 2023 15:35:13 -0400
X-Greylist: delayed 591 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 26 Aug 2023 12:35:09 PDT
Received: from mr3.vodafonemail.de (mr3.vodafonemail.de [145.253.228.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E60F10FF
        for <linux-m68k@vger.kernel.org>; Sat, 26 Aug 2023 12:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arcor.de;
        s=vfde-mb-mr2-21dec; t=1693077910;
        bh=zYJgFI5vnbU+fVouWS+uHFQC1cM/6BpLmt+Mnczx3Jo=;
        h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
         Content-Type:From;
        b=O8Pbfqjf5qI2kBJ0v1WBBzENwDR86HZHEgZnRzVCvh0RuzVThCpRoN5LHGGom7mln
         KaxdmOpFX9tyvUNdmIWilKcMZ93ADiMXJjljm5GqBXuwwHSX5OiaUHzj9Nb25Z2rb1
         IkT+tQ8Z5dmwjMSzoJVlMHwunb2DPNstcdnxhX5A=
Received: from smtp.vodafone.de (unknown [10.0.0.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by mr3.vodafonemail.de (Postfix) with ESMTPS id 4RY6GZ4XzHz1yPy;
        Sat, 26 Aug 2023 19:25:10 +0000 (UTC)
Received: from [127.0.0.1] (dynamic-046-114-215-064.46.114.pool.telefonica.de [46.114.215.64])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp.vodafone.de (Postfix) with ESMTPSA id 4RY6GG03PCzHnHf;
        Sat, 26 Aug 2023 19:24:50 +0000 (UTC)
Date:   Sat, 26 Aug 2023 19:24:43 +0000
From:   Richard <richiezid@arcor.de>
To:     debian-68k@lists.debian.org,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        James Le Cuirot <chewi@aura-online.co.uk>
CC:     libc-help@sourceware.org, debian-68k <debian-68k@lists.debian.org>,
        linux-m68k <linux-m68k@vger.kernel.org>
Subject: Re: Tuple and changes for m68k with -malign-int
In-Reply-To: <10cbcb8a65639f88e7eeb503fd02df172bc46a07.camel@physik.fu-berlin.de>
References: <e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk> <10cbcb8a65639f88e7eeb503fd02df172bc46a07.camel@physik.fu-berlin.de>
Message-ID: <5F114C03-5320-485F-86E3-946A334F16D1@arcor.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-type: clean
X-purgate: clean
X-purgate-size: 2035
X-purgate-ID: 155817::1693077906-5DFFE94E-A0AAB8C4/0/0
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org



On August 26, 2023 10:51:39 AM UTC, John Paul Adrian Glaubitz <glaubitz@ph=
ysik=2Efu-berlin=2Ede> wrote:
>Hi James!
>
>On Sat, 2023-08-26 at 09:53 +0100, James Le Cuirot wrote:
>> I wasn't sure whether to send this to libc-alpha or here=2E This feels =
more like
>> a request for help, so I decided to play it safe=2E :)
>
>I am CC'ing Debian's m68k mailing list and the Linux m68k kernel mailing =
list
>to make sure we're getting enough exposure=2E
>
>> The Debian m68k maintainers proposed building their packages with -mali=
gn-int
>> last year, aligning to 32-bit instead of 16-bit, which improves compati=
bility
>> with some projects and should give better performance on 68020+, at the=
 cost
>> of slightly increased memory usage=2E The mold linker is at least one p=
roject
>> that has been shown to work after making this change where it previousl=
y
>> didn't=2E
>
>Not only mold but also most notably the following projects:

a linker that is broken by a slightly unusual alignment isn't exactly a pr=
ime example=2E=2E if any project I would expect linkers and binary tools to=
 pay attention to portability=2E

>- LLVM

Ok =2E=2E too big to complain about=2E=2E and see above=2E

>- OpenJDK

OpenJDK has not only that one problem=2E

>It's a regular occurrence that a package doesn't build on m68k due to it'=
s unusual
>default alignment=2E=20

Unfortunately=2E Some time ago m68k was not the only one with this problem=
?


>Thus, in order to keep the port alive in the future, I think
>switching to 32-bit alignment by default is inevitable=2E
>

Ok=2E=20


>> We need to
>> break the ABI anyway with time_t going 64-bit, so it makes sense to do =
these
>> two things at the same time=2E


What exactly will be broken? Afaics kernel ABIs have been since long prett=
y carefully designed to avoid this problems and noone of the mentioned exam=
ples should touch them anyway=2E=20

Thus=2E=2E is there any need to change the kernel ABI?

Richard 
