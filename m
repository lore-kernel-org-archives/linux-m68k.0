Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04B0CC43219
	for <linux-m68k@archiver.kernel.org>; Wed, 20 Apr 2022 17:47:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356959AbiDTRub (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 20 Apr 2022 13:50:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381324AbiDTRu2 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 20 Apr 2022 13:50:28 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA7D046B3E
        for <linux-m68k@lists.linux-m68k.org>; Wed, 20 Apr 2022 10:47:41 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id l127so2638646pfl.6
        for <linux-m68k@lists.linux-m68k.org>; Wed, 20 Apr 2022 10:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SHMsfABGGrvn2lsVsfqgzVLwywQSfxtdJBF+mJ5LZXs=;
        b=ifQm0MVgjtV+BXIaAo3bFkMuhxuVZBnwY0aFGZk1+nVrlhCy5FA9hG9fnZaS/1OTlY
         U72SN6BUq0YrEvFiM/wPkP4INNUU0czy83FarimwkCa8pzM0gwf67bpq4SZcz0RNe9bt
         jNsKDh5xmimNviBlpr5yk0v18LF9HjlZQa6zk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SHMsfABGGrvn2lsVsfqgzVLwywQSfxtdJBF+mJ5LZXs=;
        b=uATfV6z7OvUWlhwXQYtexFKDMiiIrMccHTDu+mx0EkXP3MDiObcMZQoJfH+t8rDuME
         Qj+ymXU6SyoSmqRFrjUdgdE7J+GLhEu7c2gHSSfA7WclPjM5EAlWnaFs+cObCHbm2lGG
         mJauMGphSiyuj0rhlNpiSPQIZf6PeDOFZ1jyJUWqssvp5UVbdDnj9Q0YOHEhcq3lc+th
         heeuNEXyym3ei7fOxtOQt7g+bi7nLo6DkzCT45ZiZvQDPaeYLcrLRdbDjMgoy9wVq55N
         DV0MWtPl9Tb+qKA/BZ4CGxMnjOc/k5TMgL1Sa0pLXNc+G1oEi/7cQtvkLvfu9C8aOUJ+
         gw6Q==
X-Gm-Message-State: AOAM5312RrCH+axBW+mgh2wolywYdqPpsUkC9uooWInPdz8KdI8noULh
        CCzafeXN9Mgw82GYFJ6AOjAWCQ==
X-Google-Smtp-Source: ABdhPJzlyKuQhYm9qanfZk6jXGeHYMGh09tbQmAJbxfwhgdwizKPI1SHKfbvpHUJSUj6EwAypoQ+yA==
X-Received: by 2002:a05:6a00:2284:b0:50a:40b8:28ff with SMTP id f4-20020a056a00228400b0050a40b828ffmr24827405pfe.17.1650476861016;
        Wed, 20 Apr 2022 10:47:41 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id p1-20020a17090a680100b001d28905b214sm22614pjj.39.2022.04.20.10.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 10:47:40 -0700 (PDT)
Date:   Wed, 20 Apr 2022 10:47:39 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Rich Felker <dalias@libc.org>
Cc:     Palmer Dabbelt <palmer@dabbelt.com>, ebiederm@xmission.com,
        damien.lemoal@opensource.wdc.com, Niklas.Cassel@wdc.com,
        viro@zeniv.linux.org.uk, Paul Walmsley <paul.walmsley@sifive.com>,
        aou@eecs.berkeley.edu, vapier@gentoo.org, stable@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
        linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
        geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org,
        gerg@linux-m68k.org, linux-arm-kernel@lists.infradead.org,
        linux-sh@vger.kernel.org, ysato@users.sourceforge.jp
Subject: Re: [PATCH] binfmt_flat: Remove shared library support
Message-ID: <202204201044.ACFEB0C@keescook>
References: <87levzzts4.fsf_-_@email.froward.int.ebiederm.org>
 <mhng-32cab6aa-87a3-4a5c-bf83-836c25432fdd@palmer-ri-x1c9>
 <20220420165935.GA12207@brightrain.aerifal.cx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220420165935.GA12207@brightrain.aerifal.cx>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Apr 20, 2022 at 12:59:37PM -0400, Rich Felker wrote:
> On Wed, Apr 20, 2022 at 09:17:22AM -0700, Palmer Dabbelt wrote:
> > On Wed, 20 Apr 2022 07:58:03 PDT (-0700), ebiederm@xmission.com wrote:
> > >
> > >In a recent discussion[1] it was reported that the binfmt_flat library
> > >support was only ever used on m68k and even on m68k has not been used
> > >in a very long time.
> > >
> > >The structure of binfmt_flat is different from all of the other binfmt
> > >implementations becasue of this shared library support and it made
> > >life and code review more effort when I refactored the code in fs/exec.c.
> > >
> > >Since in practice the code is dead remove the binfmt_flat shared libarary
> > >support and make maintenance of the code easier.
> > >
> > >[1] https://lkml.kernel.org/r/81788b56-5b15-7308-38c7-c7f2502c4e15@linux-m68k.org
> > >Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>
> > >---
> > >
> > >Can the binfmt_flat folks please verify that the shared library support
> > >really isn't used?
> > 
> > I don't actually know follow the RISC-V flat support, last I heard it was still
> > sort of just in limbo (some toolchain/userspace bugs th at needed to be sorted
> > out).  Damien would know better, though, he's already on the thread.  I'll
> > leave it up to him to ack this one, if you were even looking for anything from
> > the RISC-V folks at all (we don't have this in any defconfigs).
> 
> For what it's worth, bimfmt_flat (with or without shared library
> support) should be simple to implement as a binfmt_misc handler if
> anyone needs the old shared library support (or if kernel wanted to
> drop it entirely, which I would be in favor of). That's how I handled
> old aout binaries I wanted to run after aout was removed: trivial
> binfmt_misc loader.

Yeah, I was trying to understand why systems were using binfmt_flat and
not binfmt_elf, given the mention of elf2flat -- is there really such a
large kernel memory footprint savings to be had from removing
binfmt_elf?

But regardless, yes, it seems like if you're doing anything remotely
needing shared libraries with binfmt_flat, such a system could just use
ELF instead.

-- 
Kees Cook
