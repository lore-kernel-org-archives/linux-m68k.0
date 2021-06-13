Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95CF9C49360
	for <linux-m68k@archiver.kernel.org>; Sun, 13 Jun 2021 19:59:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7282F6120E
	for <linux-m68k@archiver.kernel.org>; Sun, 13 Jun 2021 19:59:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231906AbhFMUBl (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 13 Jun 2021 16:01:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231788AbhFMUBi (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 13 Jun 2021 16:01:38 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E474C061574
        for <linux-m68k@lists.linux-m68k.org>; Sun, 13 Jun 2021 12:59:24 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id f30so17478027lfj.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 13 Jun 2021 12:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XmFk46LbfcB3tAW54oV0NNBNWVA8tw96uj/nEJbZX8c=;
        b=a8Ut4B9E3xQKleA2HYV5SURYsoc9doZ0SmKgf7wFF5ZvDPBJRRSuLis0laAkUgqZm3
         0p9iNre0QjG8xFiWbULLQ4CrdXfHRBnqL8pDuUWAfL03X4Xd4pGGJfJ8UbTXwVoK1cz3
         tA6ONd50v/3mnPhHfr2vLOGXKEJxcJxOUlWR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XmFk46LbfcB3tAW54oV0NNBNWVA8tw96uj/nEJbZX8c=;
        b=cWgQ9j1hrmaWvEWqBdw7gKGrKHtq+93a3F+3whleuTNjiAR8zg0+jVsG/pM6wWKOur
         RlXyWyU7PWJ+xFnl0qAy1cWrzHtTJNTFOCuarrbb6Cu0pigUtP+iBAlqbE1S0ovQB2Md
         hKrgzaWGubNMeAhrGDryGIY5WHirdCd0v2povBWen+93TrqSixlh146PRfMUacdS0skx
         PSPegAq+JLi12okVUZK5spBN6we+MJ0JBtPhxonU/njiImQuz45b7aA+C2iXl7vJl4sl
         dVZf0vogt5lBj2X7NE9/hw4kySXvSh5Rs8VXwkJ42WAy6FErYt9iv4XFgOdk/dmFPnYg
         rIMw==
X-Gm-Message-State: AOAM531ofhqN4WI/FKqyNwAUY0eqwmIuPuSSJf+AAq4ukIGNqDaBFiYl
        ycYg+QItEm0gxOJRausUaVP5I+AINqwF2ufE
X-Google-Smtp-Source: ABdhPJxqCUQSnwL4rvupBCU75r+DqbJSLvoxcrAVyyiuuql7DN2QlapUNBH3w1zfIJPoLzkO8FG80A==
X-Received: by 2002:a19:f11e:: with SMTP id p30mr10038998lfh.496.1623614361208;
        Sun, 13 Jun 2021 12:59:21 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id h4sm1268304lft.184.2021.06.13.12.59.20
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Jun 2021 12:59:20 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id r14so17042247ljd.10
        for <linux-m68k@lists.linux-m68k.org>; Sun, 13 Jun 2021 12:59:20 -0700 (PDT)
X-Received: by 2002:a2e:b618:: with SMTP id r24mr5955872ljn.48.1623614360273;
 Sun, 13 Jun 2021 12:59:20 -0700 (PDT)
MIME-Version: 1.0
References: <87sg1p30a1.fsf@disp2133> <1623541098-6532-1-git-send-email-schmitzmic@gmail.com>
In-Reply-To: <1623541098-6532-1-git-send-email-schmitzmic@gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 13 Jun 2021 12:59:04 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi2KnsPbv2BOKHa+hb3CmyxsWRQBmSrzqzNezZ=vxH6bg@mail.gmail.com>
Message-ID: <CAHk-=wi2KnsPbv2BOKHa+hb3CmyxsWRQBmSrzqzNezZ=vxH6bg@mail.gmail.com>
Subject: Re: [PATCH v1] m68k: save extra registers on sys_exit and
 sys_exit_group syscall entry
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Andreas Schwab <schwab@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sat, Jun 12, 2021 at 4:38 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
>
> do_exit() calls prace_stop() which may require access to all saved
> registers. We only save those registers not preserved by C code
> currently.
>
> Provide a special syscall entry for exit and exit_group syscalls
> similar to that used by clone and clone3, which have the same
> requirements.

ACK, this looks correct to me.

It might be a good idea to generate a test-case for this - some
"ptrace child, catch exit of it, show registers" kind of thing - just
to show what the effects of the bug was (and to show it's fixed). But
maybe it's not worth the effort.

                  Linus
