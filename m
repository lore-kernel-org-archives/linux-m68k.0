Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0210BC83F01
	for <linux-m68k@archiver.kernel.org>; Sat, 26 Aug 2023 10:53:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232174AbjHZKwb convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 26 Aug 2023 06:52:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232119AbjHZKv6 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sat, 26 Aug 2023 06:51:58 -0400
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BA02210D
        for <linux-m68k@vger.kernel.org>; Sat, 26 Aug 2023 03:51:56 -0700 (PDT)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1qZqtQ-000jVt-Qt; Sat, 26 Aug 2023 12:51:48 +0200
Received: from dynamic-077-183-184-001.77.183.pool.telefonica.de ([77.183.184.1] helo=[192.168.1.11])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1qZqtQ-0018Rp-D2; Sat, 26 Aug 2023 12:51:48 +0200
Message-ID: <10cbcb8a65639f88e7eeb503fd02df172bc46a07.camel@physik.fu-berlin.de>
Subject: Re: Tuple and changes for m68k with -malign-int
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To:     James Le Cuirot <chewi@aura-online.co.uk>
Cc:     libc-help@sourceware.org, debian-68k <debian-68k@lists.debian.org>,
        linux-m68k <linux-m68k@vger.kernel.org>
Date:   Sat, 26 Aug 2023 12:51:39 +0200
In-Reply-To: <e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
References: <e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 77.183.184.1
X-ZEDAT-Hint: PO
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi James!

On Sat, 2023-08-26 at 09:53 +0100, James Le Cuirot wrote:
> I wasn't sure whether to send this to libc-alpha or here. This feels more like
> a request for help, so I decided to play it safe. :)

I am CC'ing Debian's m68k mailing list and the Linux m68k kernel mailing list
to make sure we're getting enough exposure.

> The Debian m68k maintainers proposed building their packages with -malign-int
> last year, aligning to 32-bit instead of 16-bit, which improves compatibility
> with some projects and should give better performance on 68020+, at the cost
> of slightly increased memory usage. The mold linker is at least one project
> that has been shown to work after making this change where it previously
> didn't.

Not only mold but also most notably the following projects:

- LLVM
- Firebird Database
- OpenJDK
- Various Qt packages

It's a regular occurrence that a package doesn't build on m68k due to it's unusual
default alignment. Thus, in order to keep the port alive in the future, I think
switching to 32-bit alignment by default is inevitable.

> It goes against the traditional ABIs, but practically no m68k Linux binaries
> are published outside of distributions, so this not a concern. We need to
> break the ABI anyway with time_t going 64-bit, so it makes sense to do these
> two things at the same time.

Fully agreed.

> We in Gentoo fully support this idea. We had hoped that Debian would take the
> initiative, but we're not aware of any movement yet, and we're keen to make
> this transition, so I'm here to get the ball rolling.

We haven't had a larger discussion yet and I didn't want to impose any changes
before we have agreed on how to move forward. Thanks a lot for finally starting
the discussion.

> We think this warrants a new tuple, and we'd like to ensure that everyone gets
> behind the same one. It is currently m68k-*-gnu. Perhaps it could be
> m68k-*-gnu32 or m68k-*-gnu32a? I considered gnu32i (for int), but the flag
> actually affects floats and doubles too. I don't really care what it is
> though, so feel free to suggest something totally different.

I think -gnu32 sounds very reasonable. I'm actually also wondering what is being
used for other ports that are going to be rebuilt with 64-bit time_t. Maybe we
could use that naming scheme. I guess using "gnu32" for any 32-bit port with
64-bit time_t might not be the obvious choice.

So, while I like the gnu32 suffix, I would suggest we do some research first to find
out what the commonly used triplet change will be used for 32-bit ports switching
to 64-bit time_t.

> Once that is agreed, I'm happy to put together the patch to automatically
> enable the flag for this tuple in GCC. The part I do need help with is
> necessary changes to glibc, if any. Assembly is not my area at all, so what I
> came up with here was a total guess.

Thanks for already looking into the implementation details!

> --- a/sysdeps/m68k/crti.S       2022-07-29 23:03:09.000000000 +0100
> +++ b/sysdeps/m68k/crti.S       2022-11-30 21:41:52.710135230 +0000
> @@ -56,7 +56,7 @@
>  #endif
>  
>         .section .init,"ax",@progbits
> -       .align  2
> +       .p2align        2
>         .globl  _init
>         .hidden _init
>         .type   _init, @function
> @@ -74,7 +74,7 @@
>  #endif
>  
>         .section .fini,"ax",@progbits
> -       .align  2
> +       .p2align        2
>         .globl  _fini
>         .hidden _fini
>         .type   _fini, @function
> 
> 
> I did try this out, and it largely seemed to work, although processes
> occasionally hung. Perhaps this was unrelated.
> 
> It was a while back now and I can't remember if I also built the Linux kernel
> with -malign-int. Does it need to match? Presumably it would at least give the
> same kind of performance benefit?

I cannot comment on this at the moment, so let's wait for the more experienced
m68k kernel and toolchain folks to chime in.

> Thanks for helping to keep m68k alive.

Thank you, too, and thanks for getting this rolling!

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
