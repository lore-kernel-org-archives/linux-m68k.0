From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/2] pmac-zilog: add platform driver
Date: Fri, 8 Jan 2010 20:17:43 +0100
Message-ID: <10f740e81001081117s54c5dd9by4cc0490e0c57d67b@mail.gmail.com>
References: <alpine.OSX.2.00.0911171657290.371@silk.local>
	 <10f740e81001020443h78c615d2l206b99c386600108@mail.gmail.com>
	 <alpine.OSX.2.00.1001030255060.414@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ew0-f219.google.com ([209.85.219.219]:41051 "EHLO
	mail-ew0-f219.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751379Ab0AHTRt (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 8 Jan 2010 14:17:49 -0500
Received: by ewy19 with SMTP id 19so12283031ewy.21
        for <linux-m68k@vger.kernel.org>; Fri, 08 Jan 2010 11:17:44 -0800 (PST)
In-Reply-To: <alpine.OSX.2.00.1001030255060.414@localhost>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@ozlabs.org, linux-m68k@vger.kernel.org

On Sat, Jan 2, 2010 at 17:39, Finn Thain <fthain@telegraphics.com.au> wrote:
> On Sat, 2 Jan 2010, Geert Uytterhoeven wrote:
>> On Tue, Nov 17, 2009 at 10:04, Finn Thain <fthain@telegraphics.com.au> wrote:
>> BTW, there are a few other minor checkpatch issues with some of the
>> other patches in the series, too.
>
> I ran checkpatch on all those patches before I submitted them. I ignored
> some of the complaints about whitespace where I felt that checkpatch got
> it wrong (space character following tab character, IIRC).
>
> checkpatch found lots of mistakes that I did fix, but it can't determine
> the most human readable style in all cases, especially where consistency
> with the surrounding code is actually more conducive to readability than
> strict but sporadic conformance to simple rules would be.

It seems your editor adds spaces to lines that are continuations of
the previous statement.
I fixes them up and applied all your patches to linux-m68k.git.

The other warnings were indeed false positives or complains about
keeping consistency
with the surrounding code.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
