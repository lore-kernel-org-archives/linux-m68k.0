From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC v5 00/26] Re-use nvram module
Date: Mon, 17 Aug 2015 10:20:21 +0200
Message-ID: <CAMuHMdWXgeA5ts+O2tJ+dqcXfeGkVuP7oxBuGTcZw3-dQqzfRA@mail.gmail.com>
References: <20150725074559.543547894@telegraphics.com.au>
	<CAMuHMdWUQsSG8cZmKX8tHMN1=87Og-xboAFzhP1vWyQF+A3_eg@mail.gmail.com>
	<alpine.LNX.2.00.1508171756180.626@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:33380 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751673AbbHQIUV (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 17 Aug 2015 04:20:21 -0400
In-Reply-To: <alpine.LNX.2.00.1508171756180.626@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, linux-m68k <linux-m68k@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>

Hi Finn,

On Mon, Aug 17, 2015 at 10:04 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
>> BTW, checkpatch reported a few newly-introduced whitespace errors in
>> patches 03, 05, 16, 24, and 25.
>
> I will check again, but I'm sure those are all deliberate. I examined all
> the "errors" and "warnings" before submitting.
>
> checkpatch doesn't really understand the difference between whitespace
> used for indentation of statements (according to scope) and whitespace
> used for alignment of terms or parameters (when line-wrapped). Any tool
> that fails to make that distinction can't be depended upon to correctly
> validate the elisp in Documentation/CodingStyle, for example.

Checkpatch complains because you don't replace a sequence of 8 spaces
by a TAB in continuation lines.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
