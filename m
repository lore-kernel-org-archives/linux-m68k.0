From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] net/7990: Make lance_private.name const
Date: Tue, 12 Nov 2013 23:44:06 +0100
Message-ID: <CAMuHMdVn6MFbXgdE_teYW10OfYBjyZsN7v2yTTAsKj0kXao7Hw@mail.gmail.com>
References: <1384283649-10482-1-git-send-email-geert@linux-m68k.org>
	<5282A5E1.9090501@cogentembedded.com>
	<20131112.161253.601617211955537751.davem@davemloft.net>
	<5282BC76.5050701@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f45.google.com ([209.85.160.45]:64758 "EHLO
	mail-pb0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757349Ab3KLWoH (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 12 Nov 2013 17:44:07 -0500
In-Reply-To: <5282BC76.5050701@cogentembedded.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: David Miller <davem@davemloft.net>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Wed, Nov 13, 2013 at 12:40 AM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 11/13/2013 12:12 AM, David Miller wrote:
>
>>>> @@ -100,7 +100,7 @@ struct lance_init_block {
>>>>     */
>>>>    struct lance_private
>>>>    {
>>>> -        char *name;
>>>> +        const char *name;
>
>
>>>     Indent with tab, not spaces, please.
>
>
>> This whole file is %99 space indentation, you really can't blame
>> Geert for this.
>
>
>    It's never late to fix some.

That would be a separate patch. Care to create and send it?

> And remember about checkpatch.pl which was hardly content with the patch.

Only because checkpatch looks at the _new_ lines, and doesn't compare the
styles of the old and new lines.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
