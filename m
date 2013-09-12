From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Kernel size increase of +256 KiB (was: Re: RPCSEC_GSS: Share all
 credential caches on a per-transport basis)
Date: Thu, 12 Sep 2013 21:20:15 +0200
Message-ID: <CAMuHMdV+gVwKbk=RS0CNdiMuom-1j-8FAu+aVMLMDeOm3EXb1A@mail.gmail.com>
References: <CAMuHMdViO7yNJ5rxvRkv5NhmW6PQY1N+HW75NwokFnGQp+nxxw@mail.gmail.com>
	<1378995227.3117.9.camel@leira.trondhjem.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f176.google.com ([209.85.192.176]:38528 "EHLO
	mail-pd0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754085Ab3ILTUQ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 12 Sep 2013 15:20:16 -0400
In-Reply-To: <1378995227.3117.9.camel@leira.trondhjem.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: "Myklebust, Trond" <Trond.Myklebust@netapp.com>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Sep 12, 2013 at 4:13 PM, Myklebust, Trond
<Trond.Myklebust@netapp.com> wrote:
>> > --- a/net/sunrpc/auth_gss/auth_gss.c
>> > +++ b/net/sunrpc/auth_gss/auth_gss.c
>> > @@ -51,6 +51,7 @@
>> >  #include <linux/sunrpc/rpc_pipe_fs.h>
>> >  #include <linux/sunrpc/gss_api.h>
>> >  #include <asm/uaccess.h>
>> > +#include <linux/hashtable.h>
>> >
>> >  #include "../netns.h"
>> >
>> > @@ -71,6 +72,9 @@ static unsigned int gss_expired_cred_retry_delay = GSS_RETRY_EXPIRED;
>> >   * using integrity (two 4-byte integers): */
>> >  #define GSS_VERF_SLACK         100
>> >
>> > +static DEFINE_HASHTABLE(gss_auth_hash_table, 16);
>> > +static DEFINE_SPINLOCK(gss_auth_hash_lock);
>>
>> Today's m68k/atari-defconfig kernel no longer boots, as it became larger than
>> 4 MiB.
>>
>> bloat-o-meter tells me:
>>
>> function                                     old     new   delta
>> gss_auth_hash_table                            -  262144 +262144
>>
>> Woops...
>
> Whoops indeed. The above should have declared 16 buckets, and not 1<<16.
> I fell for Sasha's subtle trap...
>
>> Are you trying to game Tim's survey? ;-)
>> (question 13 at http://www.embeddedlinuxconference.com/cgi-bin/survey.cgi)
>>
>> Can this memory be allocated dynamically / only when it's used?
>
> :-) It's declared inside a module, so that should already be the case,

Only for the modular case. What about builtin, e.g. for nfsroot?

Or is it better to not build in NFS_V4 support in that case?

config NFS_V4
          If unsure, say Y.

config NFSD_V4
          If unsure, say N.

So that's why my defconfig has NFS_V4 but not NFSD_V4.

> however I'll send in a patch to change the above to the intended:
>
> DEFINE_HASHTABLE(gss_auth_hash_table, 4);

Thanks, that's better! Booting again ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
