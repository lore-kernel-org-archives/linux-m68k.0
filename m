Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A486C38142
	for <linux-m68k@archiver.kernel.org>; Wed,  1 Feb 2023 00:00:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231491AbjBAAAu (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 31 Jan 2023 19:00:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231431AbjBAAAt (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 31 Jan 2023 19:00:49 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EFB5FF20
        for <linux-m68k@lists.linux-m68k.org>; Tue, 31 Jan 2023 16:00:42 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id gr7so21932644ejb.5
        for <linux-m68k@lists.linux-m68k.org>; Tue, 31 Jan 2023 16:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lRCOdD9CD/IiFJ43pipYPy+q1tidOpGH1rcqkIGuMSQ=;
        b=fL59Ab7RHJP0bfIYtovRgam/bmLVqgi/HuOZuRtvXpi8XPCKPsz19TVQkwQ/4pcElK
         nbpNee2j9nRk73RFGNcIlDQDDv7dgJ9GC8xvsYkG1wEa43drPEZkLrJIAfsAF0ElYFBV
         ZenNmi1Qr0FBP87JP4qtwax7RH2E68mH3aIp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lRCOdD9CD/IiFJ43pipYPy+q1tidOpGH1rcqkIGuMSQ=;
        b=Gq0V2xFWAeXark57EXtvXyq+wdtLJhYGsqUMV3Zi4ARZzJVcEhmrFyZ+ErXqrpkR5T
         R4o7fSJZczB2NgMjxEV7TxdY80G9/becIWr3LF2xsp7jzdVtXz5FLoIh+xx2/a5xz8Xi
         DsBUUSwqXwAkfZnpHKgOImjJR4O4w/oyUHmkaEwpZefxO0EVwxccnKBFVUEoeL88vBgU
         dal0lnZmyzIFsm02WDodUGx7xbbJX6Z4oPo7yXeDF0eTgadI+CKGppUpi8EHgfhaXNpl
         bxFKEg1TUBd68segs0+EL5lOgoosI5QU6/dNCmgTjQ8HlyoIqqTfpF53RI/NKp3Q6ViA
         Al1w==
X-Gm-Message-State: AO0yUKWokR5z9Iy2yCi8IAwNU3F6ZSnsXgZjDPiv5mIeP12rKyo1BUm7
        ikKOLQmLmVWlLjmbMJTOHAPTzpfJU9shpTikbbM=
X-Google-Smtp-Source: AK7set+CmDZMYnABi5fUP5VmQT46hUPP8OT83xdYUOKoRKAweqRWEoLSw8Baf4qS09SkNG4XwVfNmw==
X-Received: by 2002:a17:906:9bda:b0:888:1c58:ffda with SMTP id de26-20020a1709069bda00b008881c58ffdamr273428ejc.1.1675209640940;
        Tue, 31 Jan 2023 16:00:40 -0800 (PST)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id v22-20020a056402175600b004a2067d6ba4sm7542789edx.52.2023.01.31.16.00.40
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 16:00:40 -0800 (PST)
Received: by mail-ej1-f43.google.com with SMTP id ud5so46563730ejc.4
        for <linux-m68k@lists.linux-m68k.org>; Tue, 31 Jan 2023 16:00:40 -0800 (PST)
X-Received: by 2002:a17:906:184a:b0:878:70c8:14f0 with SMTP id
 w10-20020a170906184a00b0087870c814f0mr84229eje.20.1675209639791; Tue, 31 Jan
 2023 16:00:39 -0800 (PST)
MIME-Version: 1.0
References: <Y9lz6yk113LmC9SI@ZenIV> <CAHk-=whf73Vm2U3jyTva95ihZzefQbThZZxqZuKAF-Xjwq=G4Q@mail.gmail.com>
 <Y9mD1qp/6zm+jOME@ZenIV> <CAHk-=wjiwFzEGd_60H3nbgVB=R_8KTcfUJmXy=hSXCvLrXQRFA@mail.gmail.com>
 <Y9mM5wiEhepjJcN0@ZenIV>
In-Reply-To: <Y9mM5wiEhepjJcN0@ZenIV>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 31 Jan 2023 16:00:22 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjNwwnBckTo8HLSdsd1ndoAR=5RBoZhdOyzhsnDAYWL9g@mail.gmail.com>
Message-ID: <CAHk-=wjNwwnBckTo8HLSdsd1ndoAR=5RBoZhdOyzhsnDAYWL9g@mail.gmail.com>
Subject: Re: [RFC][PATCHSET] VM_FAULT_RETRY fixes
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     Peter Xu <peterx@redhat.com>, linux-arch@vger.kernel.org,
        linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        Michal Simek <monstr@monstr.eu>,
        Dinh Nguyen <dinguyen@kernel.org>,
        openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
        linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Jan 31, 2023 at 1:49 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> Everything else seems to be going with EFAULT.

So I think fo kernel faults it's always basically up to the exception
handler, and sending a signal regardless of that is just wrong.

Of course, an exception handler might choose to send a signal, but it
just shouldn't be the do_page_fault() handler that does it.

For user faults, I think the rule ends up being that "if there's no
mapping, or if there is a protection fault, then we should do
SIGSEGV".

If there's an actual mapping in place, and the mapping has the right
permissions for the access, but fails for some *other* reason, then we
send SIGBUS.

So a shared mmap past the end of the file (but within the area that
was used for mmap) would SIGBUS, while a write to a read-only mapping
would SIGSEGV.

Things like unaligned accesses also might SIGBUS rather than SIGSEGV.

And I'm not surprised that there are exceptions to the rule, because
almost nothing really cares. In most situations, it's a fatal error.
And even when catching them, the end result is generally the same
(either "print out helpful message and die", or "longjump to some safe
code").

So most of the time it's probably not going to matter all that much
which signal gets sent in practice.

            Linus
