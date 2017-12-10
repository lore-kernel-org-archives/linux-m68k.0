From: Philippe Ombredanne <pombredanne@nexb.com>
Subject: Re: [PATCH v3 14/14] nubus: Add support for the driver model
Date: Sun, 10 Dec 2017 13:08:11 +0100
Message-ID: <CAOFm3uGAqHpc0YmZiCUeSiMSmOE06b026P4NPM5iwBKTEYtNkQ@mail.gmail.com>
References: <cover.1512454057.git.fthain@telegraphics.com.au>
 <5c71aa72f8c6192ca472b103555cad7441974f71.1512454057.git.fthain@telegraphics.com.au>
 <CAOFm3uGWw0_Dvt0k533g8ovVyz0ehHZi6fSXC4jSpq3JjQCyAg@mail.gmail.com> <alpine.LNX.2.21.1712102042340.3@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:38467 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751765AbdLJMIx (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sun, 10 Dec 2017 07:08:53 -0500
Received: by mail-wr0-f194.google.com with SMTP id o2so14815351wro.5
        for <linux-m68k@vger.kernel.org>; Sun, 10 Dec 2017 04:08:52 -0800 (PST)
In-Reply-To: <alpine.LNX.2.21.1712102042340.3@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Finn,

On Sun, Dec 10, 2017 at 11:03 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
> On Thu, 7 Dec 2017, Philippe Ombredanne wrote:
>
>> > diff --git a/drivers/nubus/bus.c b/drivers/nubus/bus.c
>> > new file mode 100644
>> > index 000000000000..b5045e639b4d
>> > --- /dev/null
>> > +++ b/drivers/nubus/bus.c
>> > @@ -0,0 +1,119 @@
>> > +/*
>> > + * Bus implementation for the NuBus subsystem.
>> > + *
>> > + * Copyright (C) 2017 Finn Thain
>> > + *
>> > + * SPDX-License-Identifier: GPL-2.0
>> > + */
>>
>> I think the SPDX id should be on the first line using C++-style // comments.
>
> Sure, why not.
>
> Since Linus has explicitly allowed conversion of the entire block comment
> to C++ style, I think I may prefer that as being less ugly than the
> mixture of styles (though fwiw this will always read like top posting to
> me).
>
>> See tglx's doc patches
>
> I didn't find any mention of SPDX under Documentation...
>
>> and Linus posts explaining why he wants it this way!
>>
>
> I suspect that you are referring to his posts in this thread (?)
> https://lkml.org/lkml/2017/11/2/728

Actually this is patch series: https://lkml.org/lkml/2017/12/4/934
And possibly some minor fixes pending, based on Heiko eagle eye review
and some of my nits.

-- 
Cordially
Philippe Ombredanne

+1 650 799 0949 | pombredanne@nexB.com
DejaCode - What's in your code?! - http://www.dejacode.com
AboutCode - Open source for open source - https://www.aboutcode.org
nexB Inc. - http://www.nexb.com
